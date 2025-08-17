/obj/effect/spawner/random/mobs/rodent
	name = "generic rodent spawner"
	icon = 'icons/effects/mapping/random_mobs.dmi'
	icon_state = "rodent_rat_100"
	spawn_loot_split = FALSE
	spawn_all_loot = FALSE
	spawn_loot_count = 1
	spawn_loot_chance = 100

/obj/effect/spawner/random/mobs/rodent/rat
	name = "rat spawner"
	loot = list(
		/mob/living/basic/mouse/rat
	)

/obj/effect/spawner/random/mobs/rodent/rat/chance_50
	icon_state = "rodent_rat_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/rodent/rat/chance_25
	icon_state = "rodent_rat_25"
	spawn_loot_chance = 25


/obj/effect/spawner/random/mobs/rodent/rat/multiple
	name = "multiple rat spawner"
	icon_state = "rodent_rat_multiple_33_each" //The special icon next to the 33% signifies that each mouse has a 33% chance to spawn.
	spawn_loot_count = 4
	spawn_loot_chance = 33
	spawn_scatter_radius = 1 //Spread across a distance around the spawner so they aren't just piling up on top of eachother by default.

/obj/effect/spawner/random/mobs/rodent/cockroach
	name = "cockroach spawner"
	icon_state = "rodent_cockroach_100"
	loot = list(
		/mob/living/basic/cockroach = 99.9,
		/mob/living/basic/cockroach/glockroach = 0.1 //0.1% chance to spawn a Glockroach... Mayhem... MAYHEM!!!
	)

/obj/effect/spawner/random/mobs/rodent/cockroach/chance_50
	icon_state = "rodent_cockroach_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/rodent/cockroach/chance_25
	icon_state = "rodent_cockroach_25"
	spawn_loot_chance = 25
