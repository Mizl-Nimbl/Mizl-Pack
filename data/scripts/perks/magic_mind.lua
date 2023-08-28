dofile_once("data/scripts/lib/utilities.lua")
local root_id = EntityGetRootEntity(GetUpdatedEntityID())
local controls = EntityGetFirstComponentIncludingDisabled(root_id, "ControlsComponent")
if controls then
    if ComponentGetValue2(controls, "mButtonFrameKick") == GameGetFrameNum() then
        local targets = EntityGetWithTag( "projectile" )
        for i,v in ipairs( targets ) do
            if ( EntityHasTag( v, "player_unit" ) == false ) then
                EntityKill( v )
            end
        end
    end
end