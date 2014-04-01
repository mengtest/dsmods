require "prefabutil"

local assets=
{
	Asset("ANIM", "anim/eyeball_turret.zip"),
    Asset("ANIM", "anim/eyeball_turret_object.zip"),

}

local prefabs = 
{
    "eye_charge",
    "eyeturret_base",
}

local RJK_HEALTH=800
local RJK_DAMAGE=50

local slotpos = {   Vector3(0,64+32+8+4,0), 
                    Vector3(0,32+4,0),
                    Vector3(0,-(32+4),0), 
                    Vector3(0,-(64+32+8+4),0)}



local onloadfn = function(inst, data)
    inst.canattack=data.canattack
end

local onsavefn = function(inst, data)
    data.canattack=inst.components.combat.canattack
end

local function itemtest(inst, item, slot)
    if item.prefab=="rabbit"  then
        return true
    end
end

local function ammotest(inst)
    local item=inst.components.container:FindItem(function(item)
            if(item.prefab=="rabbit")then
                return true
            else
                return false
            end
        end)
    if(item)then
        inst.components.combat.canattack=true
    else
        inst.components.combat.canattack=false
    end
end


local function onhitother(inst)
    local item=inst.components.container:FindItem(function(item)
            if(item.prefab=="rabbit")then
                return true
            else
                return false
            end
        end)
    if(item)then
        inst.components.container:RemoveItem(item,false):Remove()
    end
end

local function retargetfn(inst)
    local newtarget = FindEntity(inst, 20, function(guy)
            return  guy.components.combat and 
                    inst.components.combat:CanTarget(guy) and
                    (guy.components.combat.target == GetPlayer() or GetPlayer().components.combat.target == guy)
    end)

    return newtarget
end


local function shouldKeepTarget(inst, target)
    if target and target:IsValid() and
        (target.components.health and not target.components.health:IsDead()) then
        local distsq = target:GetDistanceSqToInst(inst)
        return distsq < 20*20
    else
        return false
    end
end

local function OnAttacked(inst, data)
    local attacker = data and data.attacker
    if attacker == GetPlayer() then
        return
    end
    inst.components.combat:SetTarget(attacker)
    inst.components.combat:ShareTarget(attacker, 15, function(dude) return dude:HasTag("rjk1100") end, 10)
end

local function WeaponDropped(inst)
    inst:Remove()
end

local function EquipWeapon(inst)
    if inst.components.inventory and not inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) then
        local weapon = CreateEntity()
        weapon.entity:AddTransform()
        weapon:AddComponent("weapon")
        weapon.components.weapon:SetDamage(inst.components.combat.defaultdamage)
        weapon.components.weapon:SetRange(inst.components.combat.attackrange, inst.components.combat.attackrange+4)
        weapon.components.weapon:SetProjectile("eye_charge")
        weapon:AddComponent("inventoryitem")
        weapon.persists = false
        weapon.components.inventoryitem:SetOnDroppedFn(WeaponDropped)
        weapon:AddComponent("equippable")
        
        inst.components.inventory:Equip(weapon)
    end
end

local function ondeploy(inst, pt, deployer)
    local turret = SpawnPrefab("rjk1100") 
    if turret then 
        pt = Vector3(pt.x, 0, pt.z)
        turret.Physics:SetCollides(false)
        turret.Physics:Teleport(pt.x, pt.y, pt.z) 
        turret.Physics:SetCollides(true)
        turret.syncanim("place")
        turret.syncanimpush("idle_loop", true)
        turret.SoundEmitter:PlaySound("dontstarve/common/place_structure_stone")
        inst:Remove()
    end         
end

local function dotweenin(inst, l)
    inst.components.lighttweener:StartTween(nil, 0, .65, .7, nil, 0.15, 
        function(i, light) if light then light:Enable(false) end end)
end

local function syncanim(inst, animname, loop)
    inst.AnimState:PlayAnimation(animname, loop)
    inst.base.AnimState:PlayAnimation(animname, loop)
end

local function syncanimpush(inst, animname, loop)
    inst.AnimState:PushAnimation(animname, loop)
    inst.base.AnimState:PushAnimation(animname, loop)
end

local function itemfn(Sim)
    local inst = CreateEntity()
   
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)
    
    inst.AnimState:SetBank("eyeball_turret_object")
    inst.AnimState:SetBuild("eyeball_turret_object")
    inst.AnimState:PlayAnimation("idle")

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    
    inst:AddTag("rjk1100")

    --Tag to make proper sound effects play on hit.
    inst:AddTag("largecreature")

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    inst.components.deployable.test = function() return true end
    inst.components.deployable.min_spacing = 0
    inst.components.deployable.placer = "eyeturret_placer"
    
    return inst
end


local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
 	inst.entity:AddSoundEmitter()
    inst.Transform:SetFourFaced()

    inst.OnLoad=onloadfn
    inst.OnSave=onsavefn

    MakeObstaclePhysics(inst, 1)
        
    local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("eyeball_turret.png")

    inst.base = SpawnPrefab("eyeturret_base")
    inst.base.entity:SetParent( inst.entity )

    inst:AddTag("rjk1100")
    inst:AddTag("companion")
    inst:AddTag("pet")

    inst.syncanim = function(name, loop) syncanim(inst, name, loop) end
    inst.syncanimpush = function(name, loop) syncanimpush(inst, name, loop) end

    inst.AnimState:SetBank("eyeball_turret")
    inst.AnimState:SetBuild("eyeball_turret")
    
    inst.syncanim("idle_loop")

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(RJK_HEALTH) 
    inst.components.health:StartRegen(5, 5)
    
    inst:AddComponent("combat")
    inst.components.combat:SetRange(TUNING.EYETURRET_RANGE)
    inst.components.combat:SetDefaultDamage(RJK_DAMAGE)
    inst.components.combat:SetAttackPeriod(TUNING.EYETURRET_ATTACK_PERIOD)
    inst.components.combat:SetRetargetFunction(1, retargetfn)
    inst.components.combat:SetKeepTargetFunction(shouldKeepTarget)
    inst.components.combat.canattack=inst.canattack    

    inst:AddComponent("lighttweener")
    local light = inst.entity:AddLight()
    inst.components.lighttweener:StartTween(light, 0, .65, .7, {251/255, 234/255, 234/255}, 0, 
        function(inst, light) if light then light:Enable(false) end end)

    inst.dotweenin = dotweenin

    MakeLargeFreezableCharacter(inst)
    
    inst:AddComponent("inventory")
    inst:DoTaskInTime(1, EquipWeapon)

    inst:AddComponent("container")
    inst.components.container:SetNumSlots(#slotpos)
    
--    inst.components.container.onopenfn = OnOpen
--    inst.components.container.onclosefn = OnClose
    

    inst.components.container.itemtestfn = itemtest
    inst.components.container:SetNumSlots(4)
    inst.components.container.widgetslotpos = slotpos
    inst.components.container.widgetanimbank = "ui_cookpot_1x4"
    inst.components.container.widgetanimbuild = "ui_cookpot_1x4"
    inst.components.container.widgetpos = Vector3(200,0,0)
    inst.components.container.side_align_tip = 100
--    inst.components.container.widgetbuttoninfo = widgetbuttoninfo


    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    
    inst:ListenForEvent("attacked", OnAttacked)
    inst:ListenForEvent("itemget",ammotest)
    inst:ListenForEvent("itemlose",ammotest)
    inst:ListenForEvent("onhitother",onhitother)

    inst:SetStateGraph("SGeyeturret")
    local brain = require "brains/eyeturretbrain"
    inst:SetBrain(brain)

    return inst
end

local baseassets=
{
    Asset("ANIM", "anim/eyeball_turret_base.zip"),
}

local function basefn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst.AnimState:SetBank("eyeball_turret_base")
    inst.AnimState:SetBuild("eyeball_turret_base")
    inst.AnimState:PlayAnimation("idle_loop")
    return inst
end


return Prefab( "common/rjk1100", fn, assets, prefabs),
Prefab("common/rjk1100_item", itemfn, assets, prefabs),
MakePlacer("common/rjk1100_placer", "eyeball_turret", "eyeball_turret", "idle_place"),
Prefab( "common/rjk1100_base", basefn, baseassets)