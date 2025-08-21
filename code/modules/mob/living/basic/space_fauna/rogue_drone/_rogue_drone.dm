/mob/living/basic/rogue_drone
	name = "rogue derelict drone"
	desc = "A drone from unknown worlds, derelict across the stars with one final command. \"Assimilate.\""
	icon = 'icons/mob/rogue_drones.dmi'
	icon_state = "melee"
	icon_living = "melee"
	icon_dead = "melee_broken"
	gender = NEUTER
	mob_biotypes = MOB_ROBOTIC

	health = 60
	maxHealth = 60

	melee_damage_lower = 12
	melee_damage_upper = 24

	speed = 3

	attack_verb_continuous = "saws"
	attack_verb_simple = "saws"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW
	verb_say = "states"
	verb_ask = "queries"
	verb_exclaim = "declares"
	verb_yell = "alarms"
	bubble_icon = "machine"
	possible_a_intents = list(INTENT_HELP, INTENT_GRAB, INTENT_DISARM, INTENT_HARM)
	faction = list(FACTION_ROGUE_DRONE)

	speech_span = SPAN_ROBOT

	armor = list("melee" = 25, "bullet" = 33, "laser" = 25, "energy" = 25, "bomb" = 0, "bio" = 0, "rad" = 100, "fire" = 50, "acid" = 0)

	habitable_atmos = IMMUNE_ATMOS_REQS
	minimum_survivable_temperature = TCMB
	ai_controller = /datum/ai_controller/basic_controller/rogue_drone

	initial_language_holder = /datum/language_holder/ipc

	//cooldown to scrap things
	COOLDOWN_DECLARE(salvage_cooldown)

	var/list/death_loot = list(/obj/effect/decal/cleanable/robot_debris)

	// Does this type do range attacks?
	var/ranged_attacker = FALSE
	// What round does this drone use?
	var/calibre = /obj/item/ammo_casing/c10mm
	// What does a drone shooting sound like?
	var/firing_sound = 'sound/weapons/gun/pistol/shot.ogg'
	// How much spread the drone has? Lets hear those snaps fly by...
	var/spread = 5

/mob/living/basic/rogue_drone/Initialize(mapload)
	. = ..()

	AddElement(/datum/element/death_drops, death_loot)
	if(!ranged_attacker)
		return
	AddComponent(/datum/component/ranged_attacks, calibre, null, firing_sound, spread)

/mob/living/basic/rogue_drone/ranged
	name = "armed rogue drone"
	desc = "An armed variant of the rogue, saw-borne drones. A dangerous threat for anyone to witness and feel."
	icon_state = "range"
	icon_living = "range"
	icon_dead = "range_broken"
	ranged_attacker = TRUE
