require("map/level")
local Levels=require("map/levels")
require("fa_constants")
FA_LEVELDATA={}

-- Cave levels
----------------------------------


FA_LEVELDATA["DUNGEON_LEVEL_1"]={
		id="DUNGEON_LEVEL_1",
		name="DUNGEON_LEVEL_1",
		overrides={
			{"world_size", 		"medium"},
			-- {"day", 			"onlynight"}, 
			{"season", 			"autumn"}, 
			{"season_start", 	"autumn"},
			{"weather", 	"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"CaveStart"},
			{"start_node",		"BGSinkholeRoom"},
		},
		tasks={
			"CavesStart",
			"CavesAlternateStart",
			"FungalBatCave",
			"BatCaves",
			"TentacledCave",
			"SingleBatCaveTask",
			"RabbitsAndFungs",
			"FungalPlain",
			"Cavern",
		},
		numoptionaltasks = math.random(2,3),
		optionaltasks = {
			"CaveBase",
			"MushBase",
			"SinkBase",
			"RabbitTown",
			"RedFungalComplex",
			"GreenFungalComplex",
			"BlueFungalComplex",
		},
	}

FA_LEVELDATA["GOBLIN_CAVE"]={
		id="GOBLIN_CAVE",
		name="Goblins lv1",
		overrides={
			{"world_size", 		"medium"},
			-- {"day", 			"onlynight"}, 
			{"branching",		"most"},
--			{"islands", 		"never"},	
--			{"loop",			"always"},
			{"season", 			"autumn"}, 
--			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FAGoblinDungeonStart"},
			{"start_node",		"FA_GoblinRoomEntry"},
		},
		tasks={
			"FAGoblinDungeon1",
			"FAGoblinDungeon2",
			"FAGoblinDungeon3",
			"FAGoblinDungeon4",
			"FAGoblinDungeon5",
			"FAGoblinDungeon6",
			"FAGoblinDungeon7",
			"FAGoblinDungeon8",
			"FAGoblinDungeonMaze1"
--			"TheLabyrinth",
--			"Residential",
--			"Military"
--			"Sacred"
		},
		--[[
		numoptionaltasks = math.random(1,2),
		optionaltasks = {
			"MoreAltars",
			"SacredDanger"
		},]]
		required_prefabs = {
		"fa_dungeon_exit",
		"fa_dungeon_entrance",
		},

	}

FA_LEVELDATA["GOBLIN_CAVE_2"]={
		id="GOBLIN_CAVE_2",
		name="Goblins lv2",
		overrides={
			{"world_size", 		"medium"},
			-- {"day", 			"onlynight"}, 
			{"branching",		"most"},
--			{"islands", 		"always"},	
--			{"loop",			"always"},
			{"season", 			"autumn"}, 
--			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FAGoblinDungeonStart2"},
--			{"start_setpeice", 	"FAGoblinRoom_1"},
			{"start_node",		"FA_GoblinRoomEntry"},
		},
		tasks={
			
			"FAGoblinDungeon1",
			"FAGoblinDungeon2",
			"FAGoblinDungeon3",
			"FAGoblinDungeon4",
			"FAGoblinDungeon5",
			"FAGoblinDungeon6",
			"FAGoblinDungeon7",
			"FAGoblinDungeon8",
			"FAGoblinDungeonMaze2"
		},
		required_prefabs = {
		"fa_dungeon_exit",
		"fa_dungeon_entrance",
		},

	}

FA_LEVELDATA["GOBLIN_CAVE_3"]={
		id="GOBLIN_CAVE_3",
		name="Goblins lv3",
		overrides={
			{"world_size", 		"medium"},
			-- {"day", 			"onlynight"}, 
			{"branching",		"most"},
--			{"islands", 		"always"},	
--			{"loop",			"always"},
			{"season", 			"autumn"}, 
--			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FAGoblinDungeonStart3"},
--			{"start_setpeice", 	"FAGoblinRoom_1"},
			{"start_node",		"FA_GoblinRoomEntry"},
		},
		tasks={
			
			"FAGoblinDungeon1",
			"FAGoblinDungeon2",
			"FAGoblinDungeon3",
			"FAGoblinDungeon4",
			"FAGoblinDungeon5",
			"FAGoblinDungeon6",
			"FAGoblinDungeon7",
			"FAGoblinDungeon8",
			"FAGoblinDungeonMaze3"
		},
		required_prefabs = {
		"fa_dungeon_exit",
		"fa_dungeon_entrance",
		},

	}

FA_LEVELDATA["GOBLIN_CAVE_BOSSLEVEL"]={
		id="GOBLIN_CAVE_BOSSLEVEL",
		name="Goblins boss",
		overrides={
--			{"world_size", 		"huge"},
			-- {"day", 			"onlynight"}, 
--			{"branching",		"never"},
--			{"islands", 		"always"},	
--			{"loop",			"always"},
			{"season", 			"autumn"}, 
--			{"season_start", 	"summer"},
			{"weather", 		"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"start_setpeice", 	"FAGoblinBossroom1"},
--			{"start_setpeice", 	"FAGoblinDungeonStart3"},
			{"start_node",		"FA_BGEmpty"},
		},
		tasks={
--			"FAEmpty1",
			"FAEmpty",
			"FAGoblinBossroom2",
			"FAGoblinBossroom3",
--			"FAEmpty2",
--			"FAEmpty",
--			"FAGoblinBossroom",
--			"MaxHome"
		},
		ordered_story_setpieces = {
			"FAGoblinBossroom1",
			"FAGoblinBossroom2",
			"FAGoblinBossroom3",
		},
		required_prefabs = {
		"fa_dungeon_exit",
		"fa_goblin_king_1",
		},

	}



FA_LEVELDATA["ORC_MINES"]={
		id="ORC_MINES",
		nomaxwell=true,
		name="Orc Mines",
		overrides={
			{"world_size", 		"tiny"},
			{"day", 			"onlydusk"}, 
			{"season", 			"onlysummer"}, 
			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"on"},
--			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FADungeonStart"},
			{"start_node",		"FA_BGLava"},
		},
		tasks={
			"FA_RuinsStart",
			"FA_GreaterPlains",
			"DFEntrance",
			"ORCFEntrance"
		},

	}

FA_LEVELDATA["DWARF_FORTRESS"]={
		id="DWARF_FORTRESS",
		name="Dwarf Fortress",
		overrides={
			{"world_size", 		"tiny"},
			{"day", 			"onlydusk"}, 
			{"season", 			"onlysummer"}, 
			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"on"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FADungeonStart"},
			{"start_node",		"BGWilds"},
		},
		tasks={
			"RuinsStart",
			"TheLabyrinth",
			"Residential",
			"Military",
			"Sacred",
		},
		numoptionaltasks = math.random(1,2),
		optionaltasks = {
			"MoreAltars",
			"SacredDanger",
			"FailedCamp",
			"Residential2",
			"Residential3",
			"Military2",
			"Sacred2",
		},

	}

FA_LEVELDATA["ORC_FORTRESS"]={
		id="ORC_FORTRESS",
		name="Orc Fortress",
		overrides={
			{"world_size", 		"tiny"},
			{"day", 			"onlydusk"}, 
			{"season", 			"onlysummer"}, 
			{"season_start", 	"summer"},
			{"weather", 	"never"},
			{"waves", 			"on"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"FADungeonStart"},
			{"start_node",		"BGWilds"},
		},
		tasks={
			"RuinsStart",
			"TheLabyrinth",
			"Residential",
			"Military",
			"Sacred",
		},
		numoptionaltasks = math.random(1,2),
		optionaltasks = {
			"MoreAltars",
			"SacredDanger",
			"FailedCamp",
			"Residential2",
			"Residential3",
			"Military2",
			"Sacred2",
		},

	}
FA_LEVELDATA["CRYPT_LEVEL_1"]={
		id="CRYPT_LEVEL_1",
		name="CRYPT_LEVEL_1",
		overrides={
			{"world_size", 		"tiny"},
--			{"day", 			"onlynight"}, 
			{"season", 			"autumn"}, 
			{"season_start", 	"autumn"},
			{"weather", 	"never"},
			{"waves", 			"off"},
			{"location",		"cave"},
			{"boons", 			"never"},
			{"poi", 			"never"},
			{"traps", 			"never"},
			{"protected", 		"never"},
			{"start_setpeice", 	"RuinsStart"},
			{"start_node",		"BGWilds"},
		},
		tasks={
			"RuinsStart",
			"TheLabyrinth",
			"Residential",
			"Military",
			"Sacred",
		},
		numoptionaltasks = math.random(1,2),
		optionaltasks = {
			"MoreAltars",
			"SacredDanger",
			"FailedCamp",
			"Residential2",
			"Residential3",
			"Military2",
			"Sacred2",
		},

	}


function AddNewCaveLevel(cavename)
	local data=FA_LEVELDATA[cavename]
	if(not FA_LEVELS[cavename]) then FA_LEVELS[cavename]={} end
	local existing_levels=FA_LEVELS[cavename]
	--the above should be using 'default' array mode so # should hopefully work
	local lvl=nil
	local index=3 --we know first 3 are in use
	if(#existing_levels>0)then
		--just use old handle, they should all be same anyway? DO NOT destroy elements after created (there should never be a reason to anyway)
		--apparently not working... 
--		lvl=existing_levels[1]
		index=index+(#existing_levels)
		AddLevel(LEVELTYPE.CAVE, data)
		lvl=table.remove(Levels.cave_levels)
	else
		AddLevel(LEVELTYPE.CAVE, data)
		--is there a saner way of doing this? table.insert returns nil so does addlevel
		lvl=table.remove(Levels.cave_levels)
	end
	--ok, now, if someone fucks up ordering?
	--local index=#Levels.cave_levels
	while Levels.cave_levels[index] do
		index=index+1
	end
	Levels.cave_levels[index]=lvl
	table.insert(FA_LEVELS[cavename],index)
	return index
end

AddNewCaveLevel("DUNGEON_LEVEL_1")
AddNewCaveLevel("GOBLIN_CAVE")
AddNewCaveLevel("GOBLIN_CAVE_2")
AddNewCaveLevel("GOBLIN_CAVE_3")
AddNewCaveLevel("GOBLIN_CAVE_BOSSLEVEL")
AddNewCaveLevel("ORC_MINES")
AddNewCaveLevel("DWARF_FORTRESS")
AddNewCaveLevel("ORC_FORTRESS")
AddNewCaveLevel("CRYPT_LEVEL_1")
