/datum/ai_controller/basic_controller/rogue_drone
	blackboard = list(
		BB_TARGETTING_DATUM = new /datum/targetting_datum/basic,
	)

	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk
	planning_subtrees = list(
		/datum/ai_planning_subtree/simple_find_target,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/attack_obstacle_in_path/rogue_drone
	)

/datum/ai_planning_subtree/attack_obstacle_in_path/rogue_drone
	attack_behaviour = /datum/ai_behavior/attack_obstructions/rogue_drone
