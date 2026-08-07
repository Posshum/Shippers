//Title is following Shiptest's mob_movement.dm for cycling between limbs.

//Lists the Carbon's body zones that are selectable from the top of the body, "Head", to the bottom of the body, "Right Leg"
GLOBAL_LIST_INIT(carbon_body_zones, list(BODY_ZONE_PRECISE_EYES, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_HEAD,
		BODY_ZONE_CHEST, BODY_ZONE_PRECISE_GROIN, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, ))

/**
 * Hidden verb to set the target zone of a mob up a list of possible targets to choose from.
 *
 * (bound to Page Up) - repeated presses increments up the possible target zones of the body.
 */
/client/verb/body_target_cycle_up()
	set name = "body-target-cycle"
	set hidden = TRUE

	if(!check_has_body_select())
		return

	var/next_in_line
	var/pos_in_cycle
	pos_in_cycle = GLOB.carbon_body_zones[mob.zone_selected]
	pos_in_cycle++
	next_in_line = GLOB.carbon_body_zones[pos_in_cycle]

	var/atom/movable/screen/zone_sel/selector = mob.hud_used.zone_select
	selector.set_selected_zone(next_in_line, mob)

/**
 * Hidden verb to set the target zone of a mob down a list of possible targets to choose from.
 *
 * (bound to Page Down) - repeated presses increments down the possible target zones of the body.
 */
/client/verb/body_target_cycle_down()
	set name = "body-target-cycle-down"
	set hidden = TRUE

	if(!check_has_body_select())
		return

	var/next_in_line
	var/pos_in_cycle
	pos_in_cycle = GLOB.carbon_body_zones[mob.zone_selected]
	pos_in_cycle--
	next_in_line = GLOB.carbon_body_zones[pos_in_cycle]

	var/atom/movable/screen/zone_sel/selector = mob.hud_used.zone_select
	selector.set_selected_zone(next_in_line, mob)

//Keybinding datum for target cycling up.
/datum/keybinding/mob/target_whole_body_cycle_up
	hotkey_keys = list("Northeast") //Page UP
	name = "target_whole_body_cycle_up"
	full_name = "Target: Cycle Target Up"
	description = ""
	keybind_signal = COMSIG_KB_MOB_TARGETCYCLEWHOLEBODYUP_DOWN

/datum/keybinding/mob/target_whole_body_cycle_up/down(client/user)
	. = ..()
	if(.)
		return
	user.body_target_cycle_up()
	return TRUE

//Keybinding datum for target cycling down.
/datum/keybinding/mob/target_whole_body_cycle_down
	hotkey_keys = list("Southeast") //Page DOWN
	name = "target_whole_body_cycle_down"
	full_name = "Target: Cycle Target Down"
	description = ""
	keybind_signal = COMSIG_KB_MOB_TARGETCYCLEWHOLEBODYLOWER_DOWN

/datum/keybinding/mob/target_whole_body_cycle_down/down(client/user)
	. = ..()
	if(.)
		return
	user.body_target_cycle_down()
	return TRUE
