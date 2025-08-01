//Converted Modular Computer version of the Helm Controller, original found in code\modules\overmap\helm.dm, /obj/machinery/computer/helm

#define JUMP_STATE_OFF 0
#define JUMP_STATE_CHARGING 1
#define JUMP_STATE_IONIZING 2
#define JUMP_STATE_FIRING 3
#define JUMP_STATE_FINALIZED 4
#define JUMP_CHARGE_DELAY (7 SECONDS)
#define JUMP_CHARGEUP_TIME (1 MINUTES)

/datum/computer_file/program/helm
	filename = "helm_controller"
	filedesc = "Helm Controller"
	program_icon_state = "power_monitor"
	extended_desc = "This program connects to the various thrusters, sensor arrays, and controls for said thrusters and sensors."
	ui_header = "power_norm.gif"
	transfer_access = ACCESS_CAPTAIN
	usage_flags = PROGRAM_CONSOLE
	requires_ntnet = 0
	size = 9
	tgui_id = "HelmConsole"
	program_icon = "plug"

	/// The ship we reside on for ease of access
	var/datum/overmap/ship/controlled/current_ship
	/// All users currently using this
	var/list/concurrent_users = list()
	/// Is this console view only? I.E. cant dock/etc
	var/viewer = FALSE
	/// When are we allowed to jump
	var/jump_allowed
	/// The current state of our jump
	var/jump_state = JUMP_STATE_OFF
	/// Are we calibrating the jump?
	var/calibrating = FALSE
	/// Jump timer ID holder
	var/jump_timer
	/// Is the AI allowed to control this helm console?
	var/allow_ai_control = FALSE
	/// Store an ntnet relay for tablets on the ship
	var/obj/machinery/ntnet_relay/integrated/ntnet_relay
	/// Where are we jumping to, if null, deletes the ship
	var/datum/overmap_star_system/jump_destination
	/// If we are jumping, what cords are we jumping to?
	var/list/jump_coords

/datum/computer_file/program/helm/run_program(mob/living/user)
	. = ..()
	jump_allowed = world.time + CONFIG_GET(number/bluespace_jump_wait)
	ntnet_relay = new(src)

	// Update UI
	if(!current_ship && !reload_ship())
		return

	//Check for mob and lock
	if(isliving(user) && !viewer && check_keylock())
		return

	//Generate Key
	if(!current_ship.shipkey && istype(user) && computer.Adjacent(user) && !viewer)
		computer.say("Generated new shipkey, do not lose it!")
		var/key = new /obj/item/key/ship(get_turf(src), current_ship)
		user.put_in_hands(key)
		return

	// Register map objects
	if(current_ship)
		user.client.register_map_obj(current_ship.token.cam_screen)
		user.client.register_map_obj(current_ship.token.cam_plane_master)
		user.client.register_map_obj(current_ship.token.cam_background)
		current_ship.token.update_screen()


/*###############################
BLUESPACE JUMPING HANDLING BEGIN
################################*/

/datum/config_entry/number/bluespace_jump_wait
	default = 5 MINUTES

/datum/computer_file/program/helm/proc/calibrate_jump(datum/overmap_star_system/new_system, list/newpos)
	///We are already jumping, don't calibrate again!
	if(jump_state != JUMP_STATE_OFF || calibrating)
		return
	if(jump_allowed < 0)
		computer.say("Bluespace Jump Calibration offline. Please contact your system administrator.")
		return
	if(current_ship.docked_to || current_ship.docking)
		computer.say("Bluespace Jump Calibration detected interference in the local area.")
		return
	if(world.time < jump_allowed)
		var/jump_wait = DisplayTimeText(jump_allowed - world.time)
		computer.say("Bluespace Jump Calibration is currently recharging. ETA: [jump_wait].")
		return
	message_admins("[ADMIN_LOOKUPFLW(usr)] has initiated a bluespace jump in [ADMIN_VERBOSEJMP(computer)]")
	jump_timer = addtimer(CALLBACK(src, PROC_REF(jump_sequence), TRUE), JUMP_CHARGEUP_TIME, TIMER_STOPPABLE)
	if(new_system)
		priority_announce("Bluespace jump calibration to destination [new_system.name] initialized. Calibration completion in [JUMP_CHARGEUP_TIME/600] minutes.", sender_override="[current_ship.name] Bluespace Pylon", zlevel=computer.virtual_z())
		jump_destination = new_system
		jump_coords = newpos
	else
		priority_announce("Bluespace jump calibration initialized. Exitting Frontier. Calibration completion in [JUMP_CHARGEUP_TIME/600] minutes.", sender_override="[current_ship.name] Bluespace Pylon", zlevel=computer.virtual_z())

	calibrating = TRUE
	return TRUE

/datum/computer_file/program/helm/proc/cancel_jump()
	if(!calibrating)
		return
	priority_announce("Bluespace Pylon spooling down. Jump calibration aborted.", sender_override = "[current_ship.name] Bluespace Pylon", zlevel = computer.virtual_z())
	calibrating = FALSE
	jump_coords = null
	deltimer(jump_timer)

/datum/computer_file/program/helm/proc/jump_sequence()
	switch(jump_state)
		if(JUMP_STATE_OFF)
			jump_state = JUMP_STATE_CHARGING
			SStgui.close_uis(src)
		if(JUMP_STATE_CHARGING)
			jump_state = JUMP_STATE_IONIZING
			priority_announce("Bluespace Jump Calibration completed. Ionizing Bluespace Pylon.", sender_override = "[current_ship.name] Bluespace Pylon", zlevel = computer.virtual_z())
		if(JUMP_STATE_IONIZING)
			jump_state = JUMP_STATE_FIRING
			priority_announce("Bluespace Ionization finalized; preparing to fire Bluespace Pylon.", sender_override = "[current_ship.name] Bluespace Pylon", zlevel = computer.virtual_z())
		if(JUMP_STATE_FIRING)
			jump_state = JUMP_STATE_FINALIZED
			priority_announce("Bluespace Pylon launched.", sender_override = "[current_ship.name] Bluespace Pylon", sound = 'sound/magic/lightning_chargeup.ogg', zlevel = computer.virtual_z())
			addtimer(CALLBACK(src, PROC_REF(do_jump)), 10 SECONDS)
			return
	jump_timer = addtimer(CALLBACK(src, PROC_REF(jump_sequence), TRUE), JUMP_CHARGE_DELAY, TIMER_STOPPABLE)

/datum/computer_file/program/helm/proc/do_jump()
	if(jump_destination)
		priority_announce("Bluespace Jump Initiated. Welcome to [jump_destination.name]", sender_override = "[current_ship.name] Bluespace Pylon", sound = 'sound/magic/lightningbolt.ogg', zlevel = computer.virtual_z())
	else
		priority_announce("Bluespace Jump Initiated.", sender_override = "[current_ship.name] Bluespace Pylon", sound = 'sound/magic/lightningbolt.ogg', zlevel = computer.virtual_z())
	if(!jump_destination)
		qdel(current_ship)
		return
	if(jump_coords)
		current_ship.move_overmaps(jump_destination, jump_coords["x"], jump_coords["y"])
	else
		current_ship.move_overmaps(jump_destination)
	jump_destination = null
	jump_state = JUMP_STATE_OFF
	jump_coords = null
	calibrating = FALSE

/*######################
SHUTTLE CONNECTING BEGIN
######################*/

/datum/computer_file/program/helm/proc/connect_to_shuttle(obj/docking_port/mobile/port, obj/docking_port/stationary/dock)
	computer.connect_to_shuttle()
	if(!viewer)
		SSpoints_of_interest.make_point_of_interest(src)
	if(current_ship && current_ship != port.current_ship)
		current_ship.helms -= src
	current_ship = port.current_ship
	current_ship.helms |= src

/*
 * This proc manually rechecks that the helm computer is connected to a proper ship.
 */
/datum/computer_file/program/helm/proc/reload_ship()
	var/obj/docking_port/mobile/port = SSshuttle.get_containing_shuttle(src)
	if(port?.current_ship)
		if(current_ship && current_ship != port.current_ship)
			current_ship.helms -= src
		current_ship = port.current_ship
		current_ship.helms |= src

/*###################
UI DATA / VARS BEGIN
###################*/

/datum/computer_file/program/helm/ui_data(mob/user)
	. = list()
	if(!current_ship)
		return

	.["calibrating"] = calibrating
	.["canRename"] = COOLDOWN_FINISHED(current_ship, rename_cooldown)
	.["otherInfo"] = list()
	var/list/objects = current_ship.get_nearby_overmap_objects(empty_if_src_docked = FALSE)
	var/dequeue_pointer = 0
	while (dequeue_pointer++ < objects.len)
		var/datum/overmap/ship/controlled/object = objects[dequeue_pointer]
		if(!istype(object, /datum/overmap)) //Not an overmap object, ignore this
			continue

		var/available_dock = FALSE

		//Even if its full or incompatible with us, it should still show up.
		if(object in current_ship.current_overmap.overmap_container[current_ship.x][current_ship.y])
			available_dock = TRUE

		//Detect any ships in this location we can dock to
		if(istype(object) && object.shuttle_port)
			for(var/obj/docking_port/stationary/docking_port as anything in object.shuttle_port.docking_points)
				if(current_ship.shuttle_port.check_dock(docking_port, silent = TRUE, intention_to_dock = FALSE))
					available_dock = TRUE
					break

		objects |= object.contents

		var/list/other_data = list(
			name = object.name,
			candock = available_dock,
			ref = REF(object)
		)
		.["otherInfo"] += list(other_data)

	.["x"] = current_ship.x || current_ship.docked_to.x
	.["y"] = current_ship.y || current_ship.docked_to.y
	.["docking"] = current_ship.docking
	.["docked"] = current_ship.docked_to
	.["heading"] = dir2text(current_ship.get_heading()) || "None"
	.["sector"] = current_ship.current_overmap.name
	.["speed"] = current_ship.get_speed()
	.["eta"] = current_ship.get_eta()
	.["estThrust"] = current_ship.est_thrust
	.["engineInfo"] = list()
	.["aiControls"] = allow_ai_control
	.["burnDirection"] = current_ship.burn_direction
	.["burnPercentage"] = current_ship.burn_percentage
	for(var/datum/weakref/engine in current_ship.shuttle_port.engine_list)
		var/obj/machinery/power/shuttle/engine/real_engine = engine.resolve()
		if(!real_engine)
			current_ship.shuttle_port.engine_list -= engine
			continue
		var/list/engine_data
		if(!real_engine.thruster_active)
			engine_data = list(
				name = real_engine.name,
				fuel = 0,
				maxFuel = 100,
				enabled = real_engine.enabled,
				ref = REF(engine)
			)
		else
			engine_data = list(
				name = real_engine.name,
				fuel = real_engine.return_fuel(),
				maxFuel = real_engine.return_fuel_cap(),
				enabled = real_engine.enabled,
				ref = REF(engine)
			)
		.["engineInfo"] += list(engine_data)

/datum/computer_file/program/helm/ui_static_data(mob/user)
	. = list()
	.["isViewer"] = viewer || (!allow_ai_control && issilicon(user))
	.["mapRef"] = current_ship.token.map_name
	.["shipInfo"] = list(
		name = current_ship.real_name,
		prefixed = current_ship.name,
		class = current_ship.source_template.name,
		mass = current_ship.shuttle_port.turf_count,
		sensor_range = 4
	)
	.["canFly"] = TRUE
	.["aiUser"] = issilicon(user)


/datum/computer_file/program/helm/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return
	if(viewer)
		return
	if(!current_ship)
		return
	if(check_keylock())
		return
	. = TRUE

	switch(action) // Universal topics
		if("rename_ship")
			var/new_name = params["newName"]
			if(!new_name)
				return
			new_name = trim(new_name)
			if (!length(new_name) || new_name == current_ship.real_name)
				return
			if(!reject_bad_text(new_name, MAX_CHARTER_LEN) || CHAT_FILTER_CHECK(new_name))
				computer.say("Error: Replacement designation rejected by system.")
				return
			if(tgui_alert(usr, "Are you sure you want to rename the ship to the \"[current_ship.source_template.prefix] [new_name]\"?", "Rename Confirmation", list("Yes", "No")) != "Yes")
				return
			if(!current_ship.Rename(new_name))
				computer.say("Error: [COOLDOWN_TIMELEFT(current_ship, rename_cooldown)/10] seconds until ship designation can be changed.")
				return
			update_static_data(usr, ui)
			return
		if("reload_ship")
			reload_ship()
			update_static_data(usr, ui)
			return
		if("reload_engines")
			current_ship.refresh_engines()
			return
		if("toggle_ai_control")
			if(issilicon(usr))
				to_chat(usr, span_warning("You are unable to toggle AI controls."))
				return
			allow_ai_control = !allow_ai_control
			computer.say(allow_ai_control ? "AI Control has been enabled." : "AI Control is now disabled.")
			return
		if("act_overmap")
			if(SSshuttle.jump_mode > BS_JUMP_CALLED)
				to_chat(usr, "<span class='warning'>Cannot interact due to bluespace jump preperations!</span>")
				return
			var/datum/overmap/to_act = locate(params["ship_to_act"]) in current_ship.get_nearby_overmap_objects(include_docked = TRUE, empty_if_src_docked = FALSE)
			var/feedback_text = current_ship.show_interaction_menu(usr, to_act)
			if(feedback_text)
				computer.say(feedback_text)
			return

	if(jump_state != JUMP_STATE_OFF)
		computer.say("Bluespace Jump in progress. Controls suspended.")
		return

	if(!current_ship.docked_to && !current_ship.docking)
		switch(action)
			if("quick_dock")
				if(SSshuttle.jump_mode > BS_JUMP_CALLED)
					to_chat(usr, span_warning("Cannot dock due to bluespace jump preperations!"))
					return
				var/datum/overmap/to_act = locate(params["ship_to_act"]) in current_ship.get_nearby_overmap_objects(include_docked = TRUE)
				computer.say(current_ship.Dock(to_act))
				return
			if("toggle_engine")
				var/datum/weakref/engine = locate(params["engine"]) in current_ship.shuttle_port.engine_list
				var/obj/machinery/power/shuttle/engine/real_engine = engine.resolve()
				if(!real_engine)
					current_ship.shuttle_port.engine_list -= engine
					return
				real_engine.enabled = !real_engine.enabled
				real_engine.update_icon_state()
				current_ship.refresh_engines()
				return
			if("change_burn_percentage")
				var/new_percentage = clamp(text2num(params["percentage"]), 1, 100)
				current_ship.burn_percentage = new_percentage
				return
			if("change_heading")
				var/new_direction = text2num(params["dir"])
				if(new_direction == current_ship.burn_direction)
					current_ship.change_heading(BURN_NONE)
					return
				current_ship.change_heading(new_direction)
				return
			if("stop")
				if(current_ship.burn_direction == BURN_NONE)
					current_ship.change_heading(BURN_STOP)
					return
				current_ship.change_heading(BURN_NONE)
				return
			if("bluespace_jump")
				if(calibrating)
					cancel_jump()
					return
				else
					if(length(SSovermap.tracked_star_systems) >= 1)
						var/list/choices = LAZYCOPY(SSovermap.tracked_star_systems)
						for(var/datum/overmap_star_system/current_system as anything in choices)
							if(!current_system.can_jump_to)
								LAZYREMOVE(choices, current_system)

						LAZYADD(choices, "Out of the Frontier")
						LAZYREMOVE(choices, current_ship.current_overmap)
						var/selected_system = tgui_input_list(usr, "To which system?", "Bluespace Jump", choices)
						if(selected_system == "Out of the Frontier")
							if(tgui_alert(usr, "Do you want to bluespace jump? Your ship and everything on it will be removed from the round.", "Jump Confirmation", list("Yes", "No")) != "Yes")
								return
							calibrate_jump()
							return
						if(!selected_system)
							return
						else
							jump_destination = selected_system
						calibrate_jump(selected_system)
						return


					else
						if(tgui_alert(usr, "Do you want to bluespace jump? Your ship and everything on it will be removed from the round.", "Jump Confirmation", list("Yes", "No")) != "Yes")
							return
						calibrate_jump()
						return
			if("dock_empty")
				current_ship.dock_in_empty_space(usr)
				return
	else if(current_ship.docked_to)
		if(action == "undock")
			current_ship.calculate_avg_fuel()
			if(current_ship.avg_fuel_amnt < 25 && tgui_alert(usr, "Ship only has ~[round(current_ship.avg_fuel_amnt)]% fuel remaining! Are you sure you want to undock?", computer.name, list("Yes", "No")) != "Yes")
				return
			current_ship.Undock()

/datum/computer_file/program/helm/ui_status(mob/user)
	var/user_ref = REF(user)
	var/is_living = isliving(user)
	// Living creature or not, we remove you anyway.
	concurrent_users -= user_ref
	// Unregister map objects
	if(current_ship)
		user.client?.clear_map(current_ship.token.map_name)
		if(current_ship.burn_direction > BURN_NONE && !length(concurrent_users) && !viewer && is_living) // If accelerating with nobody else to stop it
			computer.say("Pilot absence detected, engaging acceleration safeties.")
			current_ship.change_heading(BURN_NONE)

	// Turn off the console
	if(!length(concurrent_users) && is_living)
		playsound(src, 'sound/machines/terminal_off.ogg', 25, FALSE)
		computer.use_power(0)

//Disable now for testing
/* /datum/computer_file/program/helm/can_run(mob/user, loud, access_to_check, transfer)
	. = ..()

	if(istype(key, /obj/item/clothing/accessory/medal/gold/captain))
		var/obj/item/clothing/accessory/medal/gold/captain/medal = key
		key = medal.shipkey

	if(!istype(key, /obj/item/key/ship))
		return ..()

	current_ship?.attempt_key_usage(user, key, src)
	return TRUE */

/datum/computer_file/program/helm/run_emag()
	. = ..()
	computer.say("Warning, database corruption present, resetting local database state.")
	playsound(src, 'sound/effects/fuse.ogg')
	current_ship.helm_locked = FALSE

/* /datum/computer_file/program/helm/multitool_act(mob/living/user, obj/item/I)
	if(!computer.Adjacent(user))
		return

	to_chat(user, span_warning("You begin to manually override the local database..."))
	if(!do_after(user, 2 SECONDS, list(src)))
		return COMPONENT_BLOCK_TOOL_ATTACK

	priority_announce("Illegal access to local ship database detected.", sender_override="[computer.name]", zlevel=computer.virtual_z())
	if(!do_after(user, 10 SECONDS, list(src)))
		return COMPONENT_BLOCK_TOOL_ATTACK

	computer.say("Warning, database corruption present, resetting local database state.")
	playsound(src, 'sound/effects/fuse.ogg')
	current_ship.helm_locked = FALSE
	return COMPONENT_BLOCK_TOOL_ATTACK */

/// Checks if this helm is locked, or for the key being destroyed. Returns TRUE if locked.
/datum/computer_file/program/helm/proc/check_keylock(silent=FALSE)
	if(!current_ship.helm_locked)
		return FALSE
	if(!current_ship.shipkey)
		current_ship.helm_locked = FALSE
		return FALSE
	if(IsAdminAdvancedProcCall())
		return FALSE
	if(issilicon(usr) && allow_ai_control)
		return FALSE
	if(!silent)
		computer.say("[src] is currently locked; please insert your key to continue.")
		playsound(src, 'sound/machines/buzz-two.ogg')
	return TRUE

/* /datum/computer_file/program/helm/viewscreen
	name = "ship viewscreen"
	icon_state = "wallconsole"
	icon_screen = "wallconsole_navigation"
	icon_keyboard = null
	layer = SIGN_LAYER
	density = FALSE
	viewer = TRUE
	unique_icon = TRUE

/datum/computer_file/program/helm/viewscreen/computer
	name = "viewscreen console"
	icon_state = "oldcomp"
	icon_screen = "oldcomp_retro_rnd"
	density = TRUE

MAPPING_DIRECTIONAL_HELPERS(/datum/computer_file/program/helm/viewscreen, 17) */

#undef JUMP_STATE_OFF
#undef JUMP_STATE_CHARGING
#undef JUMP_STATE_IONIZING
#undef JUMP_STATE_FIRING
#undef JUMP_STATE_FINALIZED
#undef JUMP_CHARGE_DELAY
#undef JUMP_CHARGEUP_TIME
