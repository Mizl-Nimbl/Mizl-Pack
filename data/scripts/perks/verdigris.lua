dofile_once("data/scripts/lib/utilities.lua")
local dmc_id = EntityGetComponent( getPlayerEntity(), "DamageModelComponent" )
local var_name = ComponentGetValue2( dmc_id, "damage_multipliers" )
if( var_name == "fire") then
	ComponentSetValue2( dmc_id, "fire", 0 )
end
ComponentSetValue2( dmc_id, "blood_material", "copper" )
ComponentSetValue2( dmc_id, "blood_spray_material", "copper" )
local onFire = ComponentGetValue2( dmc_id, "is_on_fire" )
if( onFire == true ) then
    local hmc_id = EntityGetFirstComponent( getPlayerEntity(), "GameEffectComponent" )
    ComponentSetValue2( hmc_id, "effect", "HEALING")
end