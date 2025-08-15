/mob/living/basic/cockroach
	name = "cockroach"
	desc = "This station is just crawling with bugs."
	icon_state = "cockroach"
	icon_dead = "cockroach" //Make this work
	density = FALSE
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	mob_size = MOB_SIZE_TINY
	health = 5	//Cockroaches are a bit more robust all of a sudden...
	maxHealth = 5
	speed = 1.25
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB

	verb_say = "chitters"
	verb_ask = "chitters inquisitively"
	verb_exclaim = "chitters loudly"
	verb_yell = "chitters loudly"
	response_disarm_continuous = "shoos"
	response_disarm_simple = "shoo"
	response_harm_continuous = "splats"
	response_harm_simple = "splat"
	speak_emote = list("chitters")

	basic_mob_flags = DEL_ON_DEATH
	faction = list("hostile")

	unsuitable_atmos_damage = 0
	minimum_survivable_temperature = 270
	maximum_survivable_temperature = INFINITY

	ai_controller = /datum/ai_controller/basic_controller/cockroach

/mob/living/basic/cockroach/Initialize()
	. = ..()
	SSmobs.foodroaches |= src
	AddElement(/datum/element/death_drops, list(/obj/effect/decal/cleanable/insectguts))
	AddComponent( \
		/datum/component/squashable, \
		squash_chance = 50, \
		squash_damage = 5, \
	)

/mob/living/basic/cockroach/death(gibbed)
	. = ..()
	SSmobs.foodroaches -= src

/mob/living/basic/cockroach/Destroy()
	SSmobs.foodroaches -= src
	return ..()

/mob/living/basic/cockroach/ex_act() //Explosions are a terrible way to handle a cockroach.
	return FALSE


/datum/ai_controller/basic_controller/cockroach
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic()
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		//Chitter. Be annoying.
		/datum/ai_planning_subtree/random_speech/cockroach,
		//Then lets see if we can go and eat something.
		/datum/ai_planning_subtree/find_and_hunt_target/roach,
	)

/obj/projectile/bullet/glockroach
	damage = 1 //Does little damage, but stacks with burst of bullets!
	damage_type = BRUTE

/obj/item/ammo_casing/glockroach
	name = "0.9mm bullet casing"
	desc = "A... 0.9mm bullet casing? What?"
	caliber = "0.9mm"
	projectile_type = /obj/projectile/bullet/glockroach


/mob/living/basic/cockroach/glockroach
	name = "glockroach"
	desc = "HOLY SHIT, THAT COCKROACH HAS A GUN!"
	icon_state = "glockroach"
	melee_damage_lower = 2.5
	melee_damage_upper = 10
	obj_damage = 10
	faction = list(FACTION_HOSTILE)
	ai_controller = /datum/ai_controller/basic_controller/cockroach/glockroach
	///number of burst shots
	var/burst_shots
	///cooldown between attacks
	var/ranged_cooldown = 1 SECONDS

/mob/living/basic/cockroach/glockroach/Initialize(mapload)
	. = ..()
	AddComponent(\
		/datum/component/ranged_attacks,\
		casing_type = /obj/item/ammo_casing/glockroach,\
		burst_shots = burst_shots,\
		cooldown_time = ranged_cooldown,\
	)

/datum/ai_controller/basic_controller/cockroach/glockroach
	planning_subtrees = list(
		/datum/ai_planning_subtree/random_speech/cockroach/glockroach,
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_ranged_attack_subtree/glockroach, //If we are attacking someone, this will prevent us from hunting
		/datum/ai_planning_subtree/find_and_hunt_target/roach
	)

/datum/ai_planning_subtree/basic_ranged_attack_subtree/glockroach
	ranged_attack_behavior = /datum/ai_behavior/basic_ranged_attack/glockroach

/datum/ai_behavior/basic_ranged_attack/glockroach
	action_cooldown = 4 SECONDS
	burst_interval = 0.3 SECONDS
	shots = 3

/mob/living/basic/cockroach/UnarmedAttack(atom/attack_target, proximity_flag, list/modifiers)
	. = ..()
	if(!.)
		return

	if(!proximity_flag)
		return

	if(istype(attack_target, /obj/item/food))
		try_consume_food(attack_target)
		return TRUE


/mob/living/basic/cockroach/proc/try_consume_food(obj/item/food/food)
	var/cap = CONFIG_GET(number/roachcap)
	// Normal food will either heal us
	if(prob(90) || health < maxHealth)
		visible_message(
			span_notice("[src] snips \the [food]."),
			span_notice("You snip at \the [food][health < maxHealth ? ", restoring your health" : ""].")
		)
		adjust_health(-maxHealth)

	// Or, if we're at full health, there's a 10% chance that normal food will spawn a new roach to multiply!
	// ...if the roach cap allows us, that is
	else if(length(SSmobs.foodroaches) >= cap)
		visible_message(
			span_warning("[src] carefully snips \the [food], hiding it from the [cap] roaches on the station!"),
			span_notice("You carefully snip \the [food], hiding it from the [cap] other roaches on board the station.")
		)
	else
		visible_message(
			span_notice("[src] snips through \the [food], attracting another roach!"),
			span_notice("You snip through \the [food], attracting another roach!")
		)
		create_a_new_roach()

	qdel(food)

/// Creates a new roach based on this roach's subtype. Very rarely produces a glockroach.
/mob/living/basic/cockroach/proc/create_a_new_roach()
	if(prob(99))
		new /mob/living/basic/cockroach(loc)
	else //1% chance.
		new /mob/living/basic/cockroach/glockroach(loc)
