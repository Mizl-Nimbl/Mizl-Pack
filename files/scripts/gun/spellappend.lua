table.insert(actions,
{
	id          = "GODS_RAGE",
	name 		= "The Wrath of God",
	description = "GG EZ",
	sprite 		= "data/ui_gfx/gun_actions/godsrage.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sea_lava_unidentified.png",
	related_projectiles	= {"data/entities/projectiles/deck/godsrage.xml"},
	type 		= ACTION_TYPE_STATIC_PROJECTILE,
	spawn_level                       = "0,4,5,6",
	spawn_probability                 = "0.2,0.2,0.2,0.2",
	price = 500,
	mana = 300,
	max_uses = 1,
	action 		= function()
	add_projectile("data/entities/projectiles/deck/godsrage.xml")
		c.fire_rate_wait = c.fire_rate_wait + 15
	end,
})
table.insert(actions,
{
	id          = "SMART",
	name 		= "Smart Bolt",
	description = "a magic projectile of immense intelligence",
	sprite 		= "data/ui_gfx/gun_actions/smart.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sea_lava_unidentified.png",
	related_projectiles	= {"data/entities/projectiles/deck/smart.xml"},
	type 		= ACTION_TYPE_ROJECTILE,
	spawn_level                       = "0,4,5,6",
	spawn_probability                 = "0.2,0.2,0.2,0.2",
	price = 100,
	mana = 60,
	max_uses = 6,
	action 		= function()
	add_projectile("data/entities/projectiles/deck/smart.xml")
		c.fire_rate_wait = c.fire_rate_wait + 0
		c.spread_degrees = c.spread_degrees + 10
	end,
})
table.insert(actions,
{
	id          = "TARGET",
	name 		= "Target Bolt",
	description = "lock on",
	sprite 		= "data/ui_gfx/gun_actions/targetbolt.png",
	sprite_unidentified = "data/ui_gfx/gun_actions/sea_lava_unidentified.png",
	related_projectiles	= {"data/entities/projectiles/deck/targetbolt.xml"},
	type 		= ACTION_TYPE_PROJECTILE,
	spawn_level                       = "1,2,3,4,5,6",
	spawn_probability                 = "0.2,0.2,0.2,0.2,0.2,0.2",
	price = 100,
	mana = 15,
	action 		= function()
	add_projectile("data/entities/projectiles/deck/targetbolt.xml")
		c.fire_rate_wait = c.fire_rate_wait + 1
	end,
})