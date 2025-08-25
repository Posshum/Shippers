/datum/map_generator/planet_generator/moon
	mountain_height = 0.8
	perlin_zoom = 65

	primary_area_type = /area/overmap_encounter/planetoid/moon

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_LOW_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGH_HUMIDITY = /datum/biome/lunar_surface,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface,
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/rocky,
			BIOME_LOW_HUMIDITY = /datum/biome/rocky,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/rocky,
			BIOME_HIGH_HUMIDITY = /datum/biome/rocky,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/lunar_surface
		)
	)
	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/moon,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/moon,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/moon,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/moon
		)
	)

//biomes

/datum/biome/lunar_surface
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon/lit/surface_craters = 1)
	flora_spawn_chance = 3
	mob_spawn_chance = 0

	feature_spawn_chance = 1
	feature_spawn_list = list(
		/obj/effect/spawner/random/greeble/random_ruin_greeble = 15,
		/obj/structure/vein/moon = 2,
		/obj/structure/vein/moon/classtwo = 4,
		/obj/structure/vein/moon/classthree = 1,

	)

/datum/biome/rocky
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon_coarse/lit/surface_craters = 1)

	feature_spawn_chance = 0.3
	feature_spawn_list = list(
		/obj/effect/spawner/random/greeble/random_ruin_greeble = 1
	)

/datum/biome/cave/moon
	open_turf_types = list(/turf/open/floor/plating/asteroid/moon = 1)
	closed_turf_types = list(/turf/closed/mineral/random/moon = 1)

	feature_spawn_chance = 0.1
	feature_spawn_list = list(
		/obj/structure/vein/moon = 6,
		/obj/structure/vein/moon/classtwo = 4,
		/obj/structure/vein/moon/classthree = 1,
	)
