// Think of this file as a way to implement random ruins without defining them as major locations, greebles allow us to place new maps around the place during
// Map generation already within constraints, it can also generate new turfs/objects as well! This allows us to create for example,
// Boulders, Ponds, Patches of Grass, Fields of Flowers, Random Vines, a herd of animals, old buildings gone to ruins, a small den for an animal,
// so on, and so forth...

//***********//
//PONDS BEGIN//
//***********//
/obj/effect/spawner/random/greeble/pond
	name = "random pond greeble"
	loot = list(
			/obj/effect/greeble_spawner/pond_1 = 5,
			/obj/effect/greeble_spawner/pond_2 = 5,
			/obj/effect/greeble_spawner/pond_3 = 5,
		)

/obj/effect/greeble_spawner/pond_1
	name = "Pond Greeble"
	template = /datum/map_template/greeble/planet/pond_1

/obj/effect/greeble_spawner/pond_2
	name = "Pond Greeble"
	template = /datum/map_template/greeble/planet/pond_2

/obj/effect/greeble_spawner/pond_3
	name = "Pond Greeble"
	template = /datum/map_template/greeble/planet/pond_3

/datum/map_template/greeble/planet/pond_1
	name = "Pond 1"
	mappath = "_maps/templates/greebles/ponds/pond_1.dmm"

/datum/map_template/greeble/planet/pond_2
	name = "Pond 1"
	mappath = "_maps/templates/greebles/ponds/pond_2.dmm"

/datum/map_template/greeble/planet/pond_3
	name = "Pond 1"
	mappath = "_maps/templates/greebles/ponds/pond_3.dmm"
//*********//
//PONDS END//
//*********//

//*************//
//CRATERS BEGIN//
//*************//
/obj/effect/spawner/random/greeble/random_ruin_greeble
	name = "random planet greeble chance"
	loot = list(
			/obj/effect/greeble_spawner/moon/crater1 = 5,
			/obj/effect/greeble_spawner/moon/crater2 = 5,
			/obj/effect/greeble_spawner/moon/crater3 = 5,
			/obj/effect/greeble_spawner/moon/crater4 = 5,
			/obj/effect/greeble_spawner/moon/crater5 = 5,
			/obj/effect/greeble_spawner/moon/crater6 = 5,
		)

/obj/effect/greeble_spawner/moon
	name = "moon greeble spawner"

/obj/effect/greeble_spawner/moon/crater1
	template = /datum/map_template/greeble/moon/crater1

/obj/effect/greeble_spawner/moon/crater2
	template = /datum/map_template/greeble/moon/crater2

/obj/effect/greeble_spawner/moon/crater3
	template = /datum/map_template/greeble/moon/crater3

/obj/effect/greeble_spawner/moon/crater4
	template = /datum/map_template/greeble/moon/crater4

/obj/effect/greeble_spawner/moon/crater5
	template = /datum/map_template/greeble/moon/crater5

/obj/effect/greeble_spawner/moon/crater6
	template = /datum/map_template/greeble/moon/crater6

/datum/map_template/greeble/moon/crater1
	name = "Crater 1"
	mappath = "_maps/templates/greebles/moon_crater1.dmm"

/datum/map_template/greeble/moon/crater2
	name = "Crater 2"
	mappath = "_maps/templates/greebles/moon_crater2.dmm"

/datum/map_template/greeble/moon/crater3
	name = "Crater 3"
	mappath = "_maps/templates/greebles/moon_crater3.dmm"

/datum/map_template/greeble/moon/crater4
	name = "Crater 4"
	mappath = "_maps/templates/greebles/moon_crater4.dmm"

/datum/map_template/greeble/moon/crater5
	name = "Crater 5"
	mappath = "_maps/templates/greebles/moon_crater5.dmm"

/datum/map_template/greeble/moon/crater6
	name = "Crater 6"
	mappath = "_maps/templates/greebles/moon_crater6.dmm"

//***********//
//CRATERS END//
//***********//
