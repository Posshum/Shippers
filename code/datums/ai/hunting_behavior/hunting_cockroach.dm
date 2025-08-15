	//WE FEAST!
/datum/ai_planning_subtree/find_and_hunt_target/roach
	hunting_behavior = /datum/ai_behavior/hunt_target/unarmed_attack_target/roach
	hunt_targets = list(/obj/item/food)


	//Takes a while to eat... Nom nom. Much slower than a rat, however... They multiply a lot, and quickly, if they can find food.
/datum/ai_behavior/hunt_target/unarmed_attack_target/roach
	hunt_cooldown = 1 MINUTES
