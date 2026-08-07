//Borrowing from crate shelves, I thought I'd also bring this over to some larger flora.

/obj/structure/flora/Bumped(atom/movable/AM)
	. = ..()
	var/bump_power = 0
	if(istype(AM, /obj/projectile))
		bump_power = 1
	else if(istype(AM, /obj/vehicle))
		bump_power = 3
	else if(isitem(AM))
		var/obj/item/bumper = AM
		switch(bumper.w_class)
			if(WEIGHT_CLASS_TINY, WEIGHT_CLASS_SMALL)
				bump_power = 1
			if(WEIGHT_CLASS_NORMAL)
				bump_power = 2
			if(WEIGHT_CLASS_BULKY, WEIGHT_CLASS_HUGE, WEIGHT_CLASS_GIGANTIC)
				bump_power = 3
	else if(isliving(AM))
		var/mob/living/bumper = AM
		bump_power = HAS_TRAIT(bumper, TRAIT_HULK) ? 3 : 1
	if(bump_power)
		wobble(bump_power, AM)

//Trees can be destroyed if they are pushed too hard.
/obj/structure/flora/proc/wobble(power, atom/movable/wobbler = null)
	var/wobble_amount = clamp(rand(5, (power * 25)), 0, 100) / 5
	var/wobble_dir = wobbler ? get_dir(src, wobbler) : pick(GLOB.alldirs)
	var/wobble_x = 0
	var/wobble_y = 0
	switch(wobble_dir)
		if(NORTH)
			wobble_y = -wobble_amount
		if(SOUTH)
			wobble_y = wobble_amount
		if(EAST)
			wobble_x = -wobble_amount
		if(WEST)
			wobble_x = wobble_amount
		if(NORTHEAST)
			wobble_x = -wobble_amount * 0.5
			wobble_y = -wobble_amount * 0.5
		if(NORTHWEST)
			wobble_x = wobble_amount * 0.5
			wobble_y = -wobble_amount * 0.5
		if(SOUTHEAST)
			wobble_x = -wobble_amount * 0.5
			wobble_y = wobble_amount * 0.5
		if(SOUTHWEST)
			wobble_x = wobble_amount * 0.5
			wobble_y = wobble_amount * 0.5
	animate(src, pixel_x = pixel_x + wobble_x, pixel_y = pixel_y + wobble_y, time = 0.2 SECONDS)
	animate(pixel_x = initial(pixel_x), pixel_y = initial(pixel_y), time = 0.2 SECONDS)
