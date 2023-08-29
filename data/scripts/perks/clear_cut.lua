dofile_once("data/scripts/lib/utilities.lua")
function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local dmc_id = EntityGetFirstComponent( entity_id, "GameEffectComponent" )
    if ( damage < 0 ) then return end
    if ( entity_who_caused == entity_id ) or ( ( EntityGetParent( entity_id ) ~= NULL_ENTITY ) and ( entity_who_caused == EntityGetParent( entity_id ) ) ) then return end
	if ( damage > 0) then
		ComponentSetValue2( dmc_id, "effect", "INVISIBILITY" )
		EntityKill( entity_id )
	end
end