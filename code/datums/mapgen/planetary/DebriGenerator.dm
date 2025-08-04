/datum/map_generator/planet_generator/ship_debri
	mountain_height = 0.7
	perlin_zoom = 20

	initial_closed_chance = 45
	smoothing_iterations = 20
	birth_limit = 4
	death_limit = 3

	primary_area_type = /area/overmap_encounter/planetoid/debrifield

	biome_table = list(
		BIOME_COLDEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri
		),
		BIOME_COLD = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri
		),
		BIOME_WARM = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri/carp,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri/carp
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri/carp,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri/carp
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri/carp,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri/carp //gee what a diverse place
		)
	)

	cave_biome_table = list(
		BIOME_COLDEST_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/ship_debri/empty,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/ship_debri/empty,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/empty,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/ship_debri/empty
		),
		BIOME_COLD_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/ship_debri/empty
		),
		BIOME_WARM_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/carp_den,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/ship_debri/carp_den
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/ship_debri/carp_den,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/carp_den,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/ship_debri/carp_den
		)
	)

/datum/map_generator/planet_generator/ship_debri/pre_generation(datum/overmap/our_planet)
	var/datum/overmap/dynamic/dynamic_planet = our_planet
	var/datum/overmap/event/nearby_event
	if(!istype(dynamic_planet))
		return
	nearby_event = locate(/datum/overmap/event) in dynamic_planet.get_nearby_overmap_objects()
	if(!nearby_event || !nearby_event.mountain_height_override)
		return

	mountain_height = nearby_event.mountain_height_override
	return TRUE

/datum/biome/debri
	open_turf_types = list(
		/turf/open/space = 1
	)

/datum/biome/debri/carp
	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 1
	)

/datum/biome/cave/ship_debri
	closed_turf_types =  list(
		/turf/closed/wall/material/yesdiag = 1
	)
	open_turf_types = list(
		/turf/open/floor/plating/airless = 1
	)

/datum/biome/cave/ship_debri/vanilla
	flora_spawn_list = list(
		/obj/item/stack/cable_coil/cut/red = 1,
		/obj/item/stack/cable_coil/cut/yellow = 1,
		/obj/item/stack/rods/random = 1,
		/obj/effect/spawner/random/trash/grime = 1
	)

	feature_spawn_list = list(
		/obj/effect/spawner/random/stockparts = 3,
		/obj/effect/spawner/random/engineering/tool = 1,
		/obj/effect/spawner/random/structure/girder = 10,
		/obj/effect/spawner/random/structure/grille = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 10
	)

	flora_spawn_chance = 2
	feature_spawn_chance = 1
	mob_spawn_chance = 6

/datum/biome/cave/ship_debri/empty
	open_turf_types = list(
		/turf/open/floor/plating/airless = 1
	)

	feature_spawn_list = list(
		/obj/effect/spawner/random/stockparts = 3,
		/obj/effect/spawner/random/engineering/tool = 1,
		/obj/effect/spawner/random/structure/girder = 10,
		/obj/effect/spawner/random/structure/grille = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 10
	)

	feature_spawn_chance = 1
	mob_spawn_chance = 2

/datum/biome/cave/ship_debri/carp_den
	closed_turf_types =  list(
		/turf/closed/wall/material/yesdiag = 1
	)
	open_turf_types = list(
		/turf/open/floor/plating/airless = 1
	)

	flora_spawn_list = list(
		/obj/item/stack/cable_coil/cut/red = 1,
		/obj/item/stack/cable_coil/cut/yellow = 1,
		/obj/item/stack/rods/random = 1,
		/obj/effect/spawner/random/trash/grime = 1
	)

	feature_spawn_list = list(
		/obj/effect/spawner/random/stockparts = 3,
		/obj/structure/spawner/carp = 5,
		/obj/effect/spawner/random/engineering/tool = 1,
		/obj/effect/spawner/random/structure/girder = 10,
		/obj/effect/spawner/random/structure/grille = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 30
	)

	flora_spawn_chance = 15
	feature_spawn_chance = 10
	mob_spawn_chance = 18
