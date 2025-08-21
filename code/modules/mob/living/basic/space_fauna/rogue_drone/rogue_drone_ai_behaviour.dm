/datum/ai_behavior/basic_ranged_attack/rogue_drone
	required_distance = 7
	action_cooldown = 2 SECONDS
	avoid_friendly_fire = TRUE

/datum/ai_behavior/basic_ranged_attack/rogue_drone_unhinged
	required_distance = 8
	action_cooldown = 5 SECONDS
	shots = 4
	burst_interval = 0.3 SECONDS
	avoid_friendly_fire = FALSE

/datum/ai_behavior/attack_obstructions/rogue_drone
	can_attack_dense_objects = TRUE
	action_cooldown = 2 SECONDS
