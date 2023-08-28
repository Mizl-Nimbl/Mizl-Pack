dofile_once("data/scripts/lib/utilities.lua")
function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local gmc_id = EntityGetFirstComponent( entity_id, "SpriteComponent" )
    if ( damage < 0 ) then return end
    if ( entity_who_caused == entity_id ) or ( ( EntityGetParent( entity_id ) ~= NULL_ENTITY ) and ( entity_who_caused == EntityGetParent( entity_id ) ) ) then return end
    if script_wait_frames( entity_id, 5 ) then  return  end
	if ( gmc_id ~= nil ) then
		for a,b in ipairs( gmc_id ) do
			ComponentSetValue2( b, "alpha", 1.0 )
		end
	end
end