dofile_once( "data/scripts/game_helpers.lua" )
dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

GamePlaySound( "data/audio/Desktop/animals.bank", "animals/worm/attack_bite", pos_x, pos_y )
GameScreenshake( 200 )

EntityKill( entity_id )