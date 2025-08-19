/obj/effect/spawner/random/mobs/frontiersman
	name = "generic frontiersman spawner"
	icon = 'icons/effects/mapping/random_mobs.dmi'
	icon_state = "frontiersman_100" //Garunteed to spawn...
	spawn_loot_split = FALSE
	spawn_all_loot = FALSE
	spawn_loot_count = 1
	spawn_loot_chance = 100

/obj/effect/spawner/random/mobs/frontiersman/basic
	name = "frontiersman basic spawner"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier,
		/mob/living/simple_animal/hostile/human/frontier/ranged
	)

/obj/effect/spawner/random/mobs/frontiersman/basic/chance_50
	icon_state = "frontiersman_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/basic/chance_25
	icon_state = "frontiersman_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/basic/internals
	name = "frontiersman basic internals spawner"
	icon_state = "frontiersman_internals_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/internals
	)

/obj/effect/spawner/random/mobs/frontiersman/basic/internals/chance_50
	icon_state = "frontiersman_internals_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/basic/internals/chance_25
	icon_state = "frontiersman_internals_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/strong
	name = "frontiersman strong spawner"
	icon_state = "frontiersman_strong_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/wasp,
		/mob/living/simple_animal/hostile/human/frontier/ranged/pounder,
		/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon,
		/mob/living/simple_animal/hostile/human/frontier/ranged/mosin
	)

/obj/effect/spawner/random/mobs/frontiersman/strong/chance_50
	icon_state = "frontiersman_strong_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/strong/chance_25
	icon_state = "frontiersman_strong_25"
	spawn_loot_chance = 25


/obj/effect/spawner/random/mobs/frontiersman/strong/internals
	name = "frontiersman strong internals spawner"
	icon_state = "frontiersman_strong_internals_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/wasp/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/pounder/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/mosin/internals
	)

/obj/effect/spawner/random/mobs/frontiersman/strong/internals/chance_50
	icon_state = "frontiersman_strong_internals_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/strong/internals/chance_25
	icon_state = "frontiersman_strong_internals_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/very_strong
	name = "frontiersman very strong spawner"
	icon_state = "frontiersman_verystrong_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/wasp,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/flame,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle,
	)

/obj/effect/spawner/random/mobs/frontiersman/very_strong/chance_50
	icon_state = "frontiersman_verystrong_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/very_strong/chance_25
	icon_state = "frontiersman_verystrong_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/very_strong/internals
	name = "frontiersman very strong internals spawner"
	icon_state = "frontiersman_verystrong_internals_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/wasp/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/flame, //Already comes with internals.
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle/internals
	)

/obj/effect/spawner/random/mobs/frontiersman/very_strong/internals/chance_50
	icon_state = "frontiersman_verystrong_internals_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/very_strong/internals/chance_25
	icon_state = "frontiersman_verystrong_internals_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/impossible
	name = "frontiersman impossible spawner"
	icon_state = "frontiersman_impossible_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy,
		/mob/living/simple_animal/hostile/human/frontier/ranged/officer,
		/mob/living/simple_animal/hostile/human/frontier/ranged/officer/rifle
	)

/obj/effect/spawner/random/mobs/frontiersman/impossible/chance_50
	icon_state = "frontiersman_impossible_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/impossible/chance_25
	icon_state = "frontiersman_impossible_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/frontiersman/impossible/internals
	name = "frontiersman impossible internals spawner"
	icon_state = "frontiersman_impossible_internals_100"
	loot = list(
		/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/officer/internals,
		/mob/living/simple_animal/hostile/human/frontier/ranged/officer/rifle
	)

/obj/effect/spawner/random/mobs/frontiersman/impossible/internals/chance_50
	icon_state = "frontiersman_impossible_internals_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/frontiersman/impossible/internals/chance_25
	icon_state = "frontiersman_impossible_internals_25"
	spawn_loot_chance = 25
