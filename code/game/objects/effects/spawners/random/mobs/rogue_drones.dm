/obj/effect/spawner/random/mobs/rogue_drone
	name = "generic rogue drone spawner"
	icon = 'icons/effects/mapping/random_mobs.dmi'
	icon_state = "rogue_drone_100"
	spawn_loot_split = FALSE
	spawn_all_loot = FALSE
	spawn_loot_count = 1
	spawn_loot_chance = 100

/obj/effect/spawner/random/mobs/rogue_drone/melee
	name = "rogue drone spawner"
	loot = list(
		/mob/living/basic/rogue_drone
	)

/obj/effect/spawner/random/mobs/rogue_drone/melee/chance_50
	icon_state = "rogue_drone_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/rogue_drone/melee/chance_25
	icon_state = "rogue_drone_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/rogue_drone/ranged
	name = "rogue drone spawner"
	icon_state = "rogue_drone_ranged_100"
	loot = list(
		/mob/living/basic/rogue_drone/ranged
	)

/obj/effect/spawner/random/mobs/rogue_drone/ranged/chance_50
	icon_state = "rogue_drone_ranged_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/rogue_drone/ranged/chance_25
	icon_state = "rogue_drone_ranged_25"
	spawn_loot_chance = 25
