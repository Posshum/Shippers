/datum/map_generator/planet_generator/ship_debri
	mountain_height = 0.5
	perlin_zoom = 5 //5 seems to be a good mix of chunky debri

	initial_closed_chance = 15
	smoothing_iterations = 15 //Chunky debris.
	birth_limit = 3
	death_limit = 4

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
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri
		),
		BIOME_TEMPERATE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri
		),
		BIOME_HOT = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
			BIOME_LOW_HUMIDITY = /datum/biome/debri,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/debri,
			BIOME_HIGH_HUMIDITY = /datum/biome/debri/carp,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/debri/carp
		),
		BIOME_HOTTEST = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/debri,
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
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_HIGHEST_HUMIDITY = /datum/biome/cave/ship_debri/carp_den
		),
		BIOME_HOT_CAVE = list(
			BIOME_LOWEST_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_LOW_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_MEDIUM_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
			BIOME_HIGH_HUMIDITY = /datum/biome/cave/ship_debri/vanilla,
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
		/turf/closed/wall = 3,
		/turf/closed/wall/rust = 3,
		/turf/closed/wall/r_wall = 1,
		/turf/closed/wall/r_wall/rust = 1
	)
	open_turf_types = list(
		/turf/open/floor/plating/rust/airless = 3,
		/turf/open/floor/plating/catwalk_floor = 2,
		/turf/open/floor/plating/airless = 1
	)

//Tons of random shit. Keep adding to this. Debri fields should be full of a random cesspool of whatever the fuck out there to encourage exploration.
/datum/biome/cave/ship_debri/vanilla
	flora_spawn_list = list(
		/obj/item/stack/cable_coil/cut/red = 5,
		/obj/effect/spawner/random/waste/grille_or_trash = 20,
		/obj/effect/spawner/random/salvage/half = 20,
		/obj/effect/spawner/random/waste/girder = 10,
		/obj/effect/spawner/random/salvage = 10,
		/obj/item/stack/cable_coil/cut/yellow = 7,
		/obj/item/stack/rods/random = 10,
		/obj/effect/spawner/random/trash/caution_sign = 2,
		/obj/effect/spawner/random/trash/mopbucket = 2,
		/obj/effect/spawner/random/trash/moisture = 1,
		/obj/effect/spawner/random/trash/food_packaging =1,
		/obj/effect/spawner/random/trash/grime = 3,
		/obj/effect/spawner/random/maintenance = 3,
		/obj/effect/spawner/random/waste/salvageable = 3,
		/obj/effect/spawner/random/salvage/machine = 5,
		/obj/effect/spawner/random/stockparts = 2,
		/obj/effect/spawner/random/waste/atmos_can = 2,
		/obj/effect/spawner/random/waste/hivebot/part = 3,
		/obj/effect/spawner/random/waste/hivebot/part/heavy = 2,
		/obj/effect/spawner/random/waste/hivebot/part/superheavy =1,
		/obj/effect/spawner/random/waste/hivebot/beacon =1,
		/obj/effect/spawner/random/waste/mechwreck = 1,
		/obj/effect/spawner/random/waste/mechwreck/rare = 1,
		/obj/effect/spawner/random/waste/radiation/more_rads = 1
	)

	feature_spawn_list = list(
		/obj/effect/spawner/random/structure/girder = 1,
		/obj/effect/spawner/random/structure/grille = 5
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 10
	)

	flora_spawn_chance = 44
	feature_spawn_chance = 33
	mob_spawn_chance = 7

/datum/biome/cave/ship_debri/empty
	open_turf_types = list(
		/turf/open/floor/plating/rust/airless = 2,
		/turf/open/floor/plating/catwalk_floor = 1,
		/turf/open/floor/plating/airless = 1
	)

	feature_spawn_list = list(
		/obj/structure/lattice = 15,
		/obj/effect/spawner/random/structure/girder = 10,
		/obj/effect/spawner/random/structure/grille = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 10
	)

	feature_spawn_chance = 25
	mob_spawn_chance = 1

/datum/biome/cave/ship_debri/carp_den
	closed_turf_types =  list(
		/turf/closed/mineral/random = 25,
		/turf/closed/wall = 3,
		/turf/closed/wall/rust = 3,
		/turf/closed/wall/r_wall = 1,
		/turf/closed/wall/r_wall/rust = 1
	)

	open_turf_types = list(
		/turf/open/floor/plating/asteroid/smoothed/airless = 25,
		/turf/open/floor/plating/rust/airless = 2,
		/turf/open/floor/plating/catwalk_floor = 1,
		/turf/open/floor/plating/airless = 1
	)

	flora_spawn_list = list(
		/obj/item/stack/cable_coil/cut/red = 3,
		/obj/item/stack/cable_coil/cut/yellow = 7,
		/obj/effect/spawner/random/trash/grime = 3
	)

	feature_spawn_list = list(
		/obj/effect/spawner/random/stockparts = 1,
		/obj/structure/spawner/carp = 5,
		/obj/effect/spawner/random/engineering/tool = 1,
		/obj/effect/spawner/random/structure/girder = 10,
		/obj/effect/spawner/random/structure/grille = 1,
	)

	mob_spawn_list = list(
		/mob/living/simple_animal/hostile/carp = 25,
		/mob/living/simple_animal/hostile/carp/megacarp = 30
	)

	flora_spawn_chance = 30
	feature_spawn_chance = 20
	mob_spawn_chance = 18
