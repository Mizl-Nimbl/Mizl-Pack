dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/lib/coroutines.lua")
local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform(entity_id)
local targets = EntityGetInRadiusWithTag( pos_x, pos_y, 20, "mortal" ) or {}
local targetfound = false

for k=1,#targets
do local v = targets[k]
    if ( v ~= entity_id ) and (EntityGetHerdRelation(entity_id, v) < 40) then
        targetfound = true
        break
    end
end

if targetfound == true then
    EntitySetComponentsWithTagEnabled(entity_id, "disabled_by_liquid", true)
    local sprite_comps = EntityGetComponent(entity_id, "SpriteComponent") or {}
    for i, comp in ipairs(sprite_comps) do
        ComponentSetValue2(comp, "rect_animation", "attack")
    end
    EntityInflictDamage( targets[1], 1, "DAMAGE_OVEREATING", "overeating", "BLOOD_SPRAY", 1, 1)
else
    EntitySetComponentsWithTagEnabled(entity_id, "disabled_by_liquid", false)
    local sprite_comps = EntityGetComponent(entity_id, "SpriteComponent") or {}
    for i, comp in ipairs(sprite_comps) do
        ComponentSetValue2(comp, "rect_animation", "stand")
    end
end

-- EntityInflictDamage( entity:int, amount:number, damage_type:string, description:string, ragdoll_fx:string, impulse_x:number, impulse_y:number, entity_who_is_responsible:int = 0, world_pos_x:number = entity_x, world_pos_y:number = entity_y, knockback_force:number = 0 )