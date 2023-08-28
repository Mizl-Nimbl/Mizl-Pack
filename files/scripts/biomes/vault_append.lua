dofile_once("data/scripts/biome_scripts.lua")
table.insert(g_big_enemies,
{
    prob         = 0.4,
    min_count    = 1,
    max_count    = 3,
    entity   = "data/entities/animals/tentaclebeast.xml"
})
table.insert(g_pixel_scene_wide,
{
		prob   			= 0.5,
		material_file 	= "data/biome_impl/vault/testtubes.png",
		visual_file		= "",
		background_file	= "",
		is_unique		= 0,
})
g_tentacler =
{
	total_prob = 0,
	-- add skullflys after this step
	{
		prob   		= 1.0,
		min_count	= 1,
		max_count	= 1,    
		entity 	= "data/entities/animals/tentaclebeast.xml"
	},
}
RegisterSpawnFunction( 0xffADADAD, "spawntentacler")
function spawntentacler(x, y)
	spawn(g_tentacler,x,y)
end