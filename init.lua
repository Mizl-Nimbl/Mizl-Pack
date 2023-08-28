-- all functions below are optional and can be left out

--[[

function OnModPreInit()
	print("Mod - OnModPreInit()") -- First this is called for all mods
end

function OnModInit()
	print("Mod - OnModInit()") -- After that this is called for all mods
end

function OnModPostInit()
	print("Mod - OnModPostInit()") -- Then this is called for all mods
end

function OnPlayerSpawned( player_entity ) -- This runs when player entity has been created
	GamePrint( "OnPlayerSpawned() - Player entity id: " .. tostring(player_entity) )
end

function OnWorldInitialized() -- This is called once the game world is initialized. Doesn't ensure any world chunks actually exist. Use OnPlayerSpawned to ensure the chunks around player have been loaded or created.
	GamePrint( "OnWorldInitialized() " .. tostring(GameGetFrameNum()) )
end

function OnWorldPreUpdate() -- This is called every time the game is about to start updating the world
	GamePrint( "Pre-update hook " .. tostring(GameGetFrameNum()) )
end

function OnWorldPostUpdate() -- This is called every time the game has finished updating the world
	GamePrint( "Post-update hook " .. tostring(GameGetFrameNum()) )
end

]]--

function OnMagicNumbersAndWorldSeedInitialized() -- this is the last point where the Mod* API is available. after this materials.xml will be loaded.
	local x = ProceduralRandom(0,0)
	print( "===================================== random " .. tostring(x) )
end

ModLuaFileAppend( "data/scripts/biomes/wizardcave.lua", "mods/magepack/files/scripts/biomes/wizardcave_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/crypt.lua", "mods/magepack/files/scripts/biomes/crypt_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/coalmine.lua", "mods/magepack/files/scripts/biomes/mines_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/vault.lua", "mods/magepack/files/scripts/biomes/vault_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/coalmine_alt.lua", "mods/magepack/files/scripts/biomes/mines_append.lua" )
ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/magepack/files/scripts/perks/perk_append.lua" )
ModLuaFileAppend( "data/scripts/gun/gun_extra_modifiers.lua", "mods/magepack/files/scripts/gun/gun_mods_append.lua" )
ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/magepack/files/scripts/gun/spellappend.lua" )
ModLuaFileAppend( "data/scripts/biomes/mountain/mountain_hall.lua", "mods/magepack/files/scripts/biomes/mountain/mountainspawnappend.lua" )
ModLuaFileAppend( "data/scripts/biomes/lake_statue.lua", "mods/magepack/files/scripts/biomes/lake_statue_append.lua" )
ModLuaFileAppend( "data/scripts/biomes/snowcave.lua", "mods/magepack/files/scripts/biomes/snowcave_append.lua" )

--ModMaterialsFileAdd("mods/magepack/files/materials_append.xml")

-- This code runs when all mods' filesystems are registered
ModRegisterAudioEventMappings( "mods/example/files/audio_events.txt" ) -- Use this to register custom fmod events. Event mapping files can be generated via File -> Export GUIDs in FMOD Studio. -- Adds a new 'rainbow' material to materials

print("Mizl Pack init done")