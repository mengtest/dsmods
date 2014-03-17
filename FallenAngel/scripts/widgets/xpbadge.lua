local UIAnim = require "widgets/uianim"
local Text = require "widgets/text"
local easing = require "easing"
local Widget = require "widgets/widget"
local Image = require "widgets/image"

local XPBadge = Class(Widget, function(self, anim, owner)
    
    Widget._ctor(self, "XPBadge")
	self.owner = owner
    
    --self:SetHAnchor(ANCHOR_RIGHT)
    --self:SetVAnchor(ANCHOR_TOP)
    self.xp = 0
    self:SetScale(1,1,1)
    
    
	self.statusbg = self:AddChild(Image("images/xp_background.xml", "xp_background.tex"))
--	self.statusbg:SetScale(.55,.43,0)
--    self.statusbg:SetPosition(0,15,0)
    
	self.bg = self:AddChild(Image("images/xp_fill.xml", "xp_fill.tex"))
	self.bg:SetPosition(-490,0,0)
--	self.bg:SetPosition(-(150)*scale,.2,0)
	self.bg:SetHRegPoint(ANCHOR_LEFT)
	self.bg:SetScale(1,1,0)

    self.level = self:AddChild(Text(NUMBERFONT, 28))
--    self.level:SetHAlign(ANCHOR_LEFT)
    self.level:SetPosition(-520,0,0)
	self.level:SetScale(1.5,1.5,1)
    

	self.num = self:AddChild(Text(NUMBERFONT, 28))
    self.level:SetHAlign(ANCHOR_MIDDLE)
	self.num:SetPosition(6,0,0)
	self.num:SetScale(1.5,1.2,0)


--    self.num:Hide()
    
end)

function XPBadge:OnGainFocus()
    XPBadge._base.OnGainFocus(self)
end

function XPBadge:OnLoseFocus()
    XPBadge._base.OnLoseFocus(self)
end

function XPBadge:SetLevel(level)
	self.level:SetString(tostring(level))
    self.lv = level
end

function XPBadge:SetValue(val, max)

	local scale = 1000
	self.bg:SetScale(val/max*scale,1,0)	
	self.num:SetString(tostring(math.ceil(val)).."/"..tostring(math.ceil(max)))
    self.xp = val
end

function XPBadge:PulseGreen()
end

function XPBadge:PulseRed()
end


return XPBadge