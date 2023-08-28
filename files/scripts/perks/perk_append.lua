table.insert(perk_list,
{
	id = "CONCENTRATED_TELEKINESIS",
	ui_name = "Concentrated Telekinesis",
	ui_description = "Grab smaller items and throw them fast!",
	ui_icon = "data/ui_gfx/perk_icons/concentrated_telekinesis.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/concentrated_telekinesis.png",
	stackable = STACKABLE_NO,
	
	func = function( entity_perk_item, entity_who_picked, item_name )
		EntityLoadToEntity( "data/entities/misc/perk_concentrated_telekinesis.xml", entity_who_picked )
		-- component_write( EntityGetFirstComponent( entity_who_picked, "KickComponent" ), { can_kick = false } )
		
		local throw_speed = 50
		local models = EntityGetComponent( entity_who_picked, "KickComponent" )
		if( models ~= nil ) then
			for i,model in ipairs(models) do
				ComponentSetValue2( model, "can_kick", false )
				local ts = tonumber( ComponentGetValue2( model, "telekinesis_throw_speed" ) )
				if( ts > throw_speed ) then throw_speed = ts end
			end
		end
		-- component_write( EntityGetFirstComponent( entity_who_picked, "TelekinesisComponent" ), { throw_speed = throw_speed } )
		local tks = EntityGetFirstComponent( entity_who_picked, "TelekinesisComponent" )
		if( tks ~= nil ) then ComponentSetValue2( tks, "throw_speed", throw_speed ) end
	end,
	func_remove = function( entity_who_picked )
		local models = EntityGetComponent( entity_who_picked, "KickComponent" )
		if( models ~= nil ) then
			for i,model in ipairs(models) do
				ComponentSetValue2( model, "can_kick", true )
			end
		end
	end,
	
})
table.insert(perk_list,
{
	id = "TENTACLE_KICK",
	ui_name = "tentacle legs",
	ui_description = "your legs become stretchy and writhe around",
	ui_icon = "data/ui_gfx/perk_icons/tentacle_kick.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/tentacle_kick.png",
	stackable = STACKABLE_NO,
	func = function( entity_perk_item, entity_who_picked, item_name )
		EntityAddComponent( entity_who_picked, "LuaComponent", 
		{
			_tags="perk_component",
			script_source_file="data/scripts/perks/tentacle_kick.lua",
			execute_every_n_frame="1"
		} )
	end,
})
table.insert(perk_list,
{
	id = "NECRO",
	ui_name = "Necromancy",
	ui_description = "the corpses rise.... slime man",
	ui_icon = "data/ui_gfx/perk_icons/necromancy.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/necromancy.png",
	stackable = STACKABLE_NO,
	func = function( entity_perk_item, entity_who_picked, item_name )
		EntityAddComponent( entity_who_picked, "ShotEffectComponent", 
		{
			_tags="perk_component",
			extra_modifier = "necro",
		} )
	end,
})
table.insert(perk_list,
{
	id = "CLEAR_CUT",
	ui_name = "Clear Cut",
	ui_description = "grants brief invisibility upon taking damage",
	ui_icon = "data/ui_gfx/perk_icons/clear_cut.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/clear_cut.png",
	stackable = STACKABLE_NO,
	func = function( entity_perk_item, entity_who_picked, item_name )
        EntityAddComponent( entity_who_picked, "LuaComponent", 
		{
			_tags="perk_component",
			script_source_file="data/scripts/perks/clear_cut.lua",
			execute_every_n_frame="-1"
		} )
	end,
})
table.insert(perk_list,
{
	id = "VERDIGRIS",
	ui_name = "Verdigris",
	ui_description = "you rust...",
	ui_icon = "data/ui_gfx/perk_icons/verdigris.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/verdigris.png",
	stackable = STACKABLE_NO,
    func = function( entity_perk_item, entity_who_picked, item_name )
        local dmc_id = EntityGetFirstComponent( entity_who_picked, "DamageModelComponent" ) --[[@cast dmc_id number]]
        -- Sets the blood material
        ComponentSetValue2( dmc_id, "blood_material", "copper" )
        ComponentSetValue2( dmc_id, "blood_spray_material", "copper" )
        -- Sets the multiplier to -1, so fire heals instead
        ComponentObjectSetValue2( dmc_id, "damage_multipliers", "fire", -1)
        -- Sets water to damage player
        ComponentSetValue2( dmc_id, "wet_status_effect_damage", 0.2)
	end,
})
table.insert(perk_list,
{
	id = "MAGIC_MIND",
	ui_name = "Magic Mind",
	ui_description = "kick to clear projectiles with your mind",
	ui_icon = "data/ui_gfx/perk_icons/magic_mind.png",
	perk_icon = "data/materials_gfx/items_gfx/perks/magic_mind.png",
	stackable = STACKABLE_NO,
	func = function( entity_perk_item, entity_who_picked, item_name )
		EntityAddComponent( entity_who_picked, "LuaComponent", 
		{
			_tags="perk_component",
			script_source_file="data/scripts/perks/magic_mind.lua",
			execute_every_n_frame="1"
		} )
	end,
})