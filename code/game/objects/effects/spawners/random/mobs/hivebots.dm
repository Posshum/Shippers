/obj/effect/spawner/random/mobs/hivebot
	name = "generic hivebot spawner"
	icon = 'icons/effects/mapping/random_mobs.dmi'
	icon_state = "hivebot_100" //Garunteed to spawn...
	spawn_loot_split = FALSE
	spawn_all_loot = FALSE
	spawn_loot_count = 1
	spawn_loot_chance = 100

/obj/effect/spawner/random/mobs/hivebot/basic
	name = "hivebot spawner"
	loot = list(
		/mob/living/basic/hivebot
	)

/obj/effect/spawner/random/mobs/hivebot/basic/chance_50
	icon_state = "hivebot_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/hivebot/basic/chance_25
	icon_state = "hivebot_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/hivebot/advanced
	name = "hivebot spawner"
	icon_state = "hivebot_advanced_100"
	loot = list(
		/mob/living/basic/hivebot/mechanic,
		/mob/living/basic/hivebot/ranged
	)

/obj/effect/spawner/random/mobs/hivebot/advanced/chance_50
	icon_state = "hivebot_advanced_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/hivebot/advanced/chance_25
	icon_state = "hivebot_advanced_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/hivebot/streamlined
	name = "hivebot spawner"
	icon_state = "hivebot_streamlined_100"
	loot = list(
		/mob/living/basic/hivebot/rapid,
		/mob/living/basic/hivebot/strong,
		/mob/living/basic/hivebot/mechanic //Both advanced and Streamlined, the engineer is a good supportive enemy.
	)

/obj/effect/spawner/random/mobs/hivebot/streamlined/chance_50
	icon_state = "hivebot_streamlined_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/hivebot/streamlined/chance_25
	icon_state = "hivebot_streamlined_25"
	spawn_loot_chance = 25

/obj/effect/spawner/random/mobs/hivebot/core
	name = "hivebot spawner"
	icon_state = "hivebot_core_100"
	loot = list(
		/mob/living/basic/hivebot/core
	)

/obj/effect/spawner/random/mobs/hivebot/core/chance_50
	icon_state = "hivebot_core_50"
	spawn_loot_chance = 50

/obj/effect/spawner/random/mobs/hivebot/core/chance_25
	icon_state = "hivebot_core_25"
	spawn_loot_chance = 25
