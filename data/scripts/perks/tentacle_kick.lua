dofile_once("data/scripts/lib/utilities.lua")
local root_id = EntityGetRootEntity(GetUpdatedEntityID())
local controls = EntityGetFirstComponentIncludingDisabled(root_id, "ControlsComponent")
local cooldownframes = 30
if controls then
    if ComponentGetValue2(controls, "mButtonFrameKick") == GameGetFrameNum() then
        local entity_id = GetUpdatedEntityID()
        local player_id = EntityGetRootEntity(entity_id)
        local x, y = EntityGetTransform(player_id)
        local angle_random = math.rad(math.random(-5, 5))
        local length = 900
        local aim_x, aim_y = ComponentGetValueVector2(controls, "mAimingVectorNormalized")
        local angle = math.atan2( aim_y, aim_x )
        local vel_x = math.cos(angle + angle_random) * length
        local vel_y = math.sin(angle + angle_random) * length
        shoot_projectile(entity_id, "data/entities/misc/perks/revenge_tentacle_tentacle.xml", x, y, vel_x, vel_y)
    end
end