/datum/looping_sound/showering
	start_sound = 'sound/machines/shower/shower_start.ogg'
	start_length = 2
	mid_sounds = list('sound/machines/shower/shower_mid1.ogg'=1,'sound/machines/shower/shower_mid2.ogg'=1,'sound/machines/shower/shower_mid3.ogg'=1)
	mid_length = 10
	end_sound = 'sound/machines/shower/shower_end.ogg'
	volume = 20
	ignore_walls = FALSE

/datum/looping_sound/supermatter
	mid_sounds = list('sound/machines/sm/loops/calm.ogg' = 1)
	mid_length = 60
	volume = 40
	extra_range = 25
	falloff_exponent = 10
	falloff_distance = 5
	vary = TRUE

/datum/looping_sound/destabilized_crystal
	mid_sounds = list('sound/machines/sm/loops/delamming.ogg' = 1)
	mid_length = 60
	volume = 55
	extra_range = 15
	vary = TRUE

/datum/looping_sound/smes
	start_sound = 'sound/machines/smes/smes_mid1.ogg'
	start_length = 4
	mid_sounds = list('sound/machines/smes/smes_mid2.ogg'=1, 'sound/machines/smes/smes_mid3.ogg'=1, 'sound/machines/smes/smes_mid4.ogg'=1)
	mid_length = 4
	end_sound = 'sound/machines/smes/smes_mid5.ogg'
	volume = 11
	extra_range = -13
	ignore_walls = FALSE

/datum/looping_sound/generator
	start_sound = 'sound/machines/generator/generator_start.ogg'
	start_length = 4
	mid_sounds = list('sound/machines/generator/generator_mid1.ogg'= 1, 'sound/machines/generator/generator_mid2.ogg'= 1, 'sound/machines/generator/generator_mid3.ogg'= 1)
	mid_length = 4
	end_sound = 'sound/machines/generator/generator_end.ogg'
	volume = 45
	ignore_walls = FALSE

/datum/looping_sound/oven
	start_sound = 'sound/machines/oven/oven_loop_start.ogg'
	start_length = 12
	mid_sounds = list('sound/machines/oven/oven_loop_mid.ogg' = 1)
	mid_length = 14
	end_sound = 'sound/machines/oven/oven_loop_end.ogg'
	volume = 100
	falloff_exponent = 4

/datum/looping_sound/computer
	start_sound = 'sound/machines/computer/computer_start.ogg'
	start_length = 1 SECONDS
	//I want the weight to work but its kind of rough balancing it lololol
	mid_sounds = list('sound/machines/computer/computer_mid1.ogg',
		'sound/machines/computer/computer_mid2.ogg',
		'sound/machines/computer/computer_mid3.ogg',
		'sound/machines/computer/computer_mid4.ogg',
		'sound/machines/computer/computer_mid5.ogg',
		'sound/machines/computer/computer_mid6.ogg')
	mid_length = 0.9 SECONDS
	end_sound = 'sound/machines/computer/computer_end.ogg'
	volume = 2
	extra_range = -14
	ignore_walls = FALSE

/datum/looping_sound/washing_machine
	start_sound = 'sound/machines/washing_machine/washing_machine_start.ogg'
	start_length = 4 SECONDS
	mid_sounds = list('sound/machines/washing_machine/washing_machine_cycle1.ogg'=1)
	mid_length = 3 SECONDS
	end_sound = 'sound/machines/washing_machine/washing_machine_end.ogg'
	volume = 15
	extra_range = -12
	ignore_walls = FALSE

/datum/looping_sound/sink
	start_sound = 'sound/machines/sink/sink_start.ogg'
	start_length = 1 SECONDS
	mid_sounds = list('sound/machines/sink/sink_mid.ogg'=1)
	mid_length = 2 SECONDS
	end_sound = 'sound/machines/sink/sink_end.ogg'
	volume = 25
	extra_range = -11
	ignore_walls = FALSE

/datum/looping_sound/vent
	start_sound = 'sound/machines/vents/vent_start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/vents/vent_loop.ogg'=1)
	mid_length = 4
	end_sound = 'sound/machines/vents/vent_end.ogg'
	volume = 4
	extra_range = -15
	ignore_walls = FALSE

/datum/looping_sound/deep_fryer
	start_sound = 'sound/machines/fryer/deep_fryer_immerse.ogg' //my immersions
	start_length = 10
	mid_sounds = list('sound/machines/fryer/deep_fryer_1.ogg' = 1, 'sound/machines/fryer/deep_fryer_2.ogg' = 1)
	mid_length = 2
	end_sound = 'sound/machines/fryer/deep_fryer_emerge.ogg'
	volume = 15
	ignore_walls = FALSE

/datum/looping_sound/grill
	mid_sounds = list('sound/machines/grill/grillsizzle.ogg' = 1)
	mid_length = 19
	volume = 40

/datum/looping_sound/deep_fryer
	mid_length = 2
	mid_sounds = list('sound/machines/fryer/deep_fryer_1.ogg' = 1, 'sound/machines/fryer/deep_fryer_2.ogg' = 1)
	volume = 10
	ignore_walls = FALSE

/datum/looping_sound/microwave
	start_sound = 'sound/machines/microwave/microwave-start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/microwave/microwave-mid1.ogg'=10, 'sound/machines/microwave/microwave-mid2.ogg'=1)
	mid_length = 10
	end_sound = 'sound/machines/microwave/microwave-end.ogg'
	volume = 90
	ignore_walls = FALSE

/datum/looping_sound/jackpot
	mid_length = 11
	mid_sounds = list('sound/machines/roulettejackpot.ogg' = 1)
	volume = 85
	vary = TRUE

/datum/looping_sound/drill
	mid_sounds = list('sound/machines/gravgen/gravgen_mid1.ogg'=1, 'sound/machines/gravgen/gravgen_mid2.ogg'=1, 'sound/machines/gravgen/gravgen_mid3.ogg'=1, 'sound/machines/gravgen/gravgen_mid4.ogg'=1)
	mid_length = 4
	volume = 50
	extra_range = 6

/datum/looping_sound/boiling
	mid_sounds = list('sound/effects/bubbles2.ogg' = 1)
	mid_length = 7 SECONDS
	volume = 25
	ignore_walls = FALSE

/datum/looping_sound/vending_machine
	mid_sounds = list('sound/machines/vending/vending_mid1.ogg','sound/machines/vending/vending_mid2.ogg','sound/machines/vending/vending_mid3.ogg')
	mid_length = 1.05 SECONDS
	volume = 5 //Gotta make sure they aren't TOO annoying... It's meant to be ambient!
	ignore_walls = FALSE
	extra_range = -10

/datum/looping_sound/conveyor_belt
	mid_sounds = list('sound/machines/conveyor/conveyor_mid1.ogg', 'sound/machines/conveyor/conveyor_mid2.ogg', 'sound/machines/conveyor/conveyor_mid3.ogg')
	mid_length = 1 SECONDS
	volume = 6 //These stack!
	ignore_walls = FALSE

/datum/looping_sound/holofield_generator
	start_sound = 'sound/machines/holofield/holofield_start.ogg'
	start_length = 1 SECONDS
	mid_sounds = list('sound/machines/holofield/holofield_mid1.ogg','sound/machines/holofield/holofield_mid2.ogg',
	'sound/machines/holofield/holofield_mid3.ogg','sound/machines/holofield/holofield_mid4.ogg',
	'sound/machines/holofield/holofield_mid5.ogg','sound/machines/holofield/holofield_mid6.ogg',)
	mid_length = 1 SECONDS
	end_sound = 'sound/machines/holofield/holofield_end.ogg'
	volume = 66
	ignore_walls = TRUE

/datum/looping_sound/telecomms
	start_sound = 'sound/machines/tcomms/telecomms_start.ogg'
	start_length = 1 SECONDS
	mid_sounds = list(
	//'sound/machines/tcomms/telecomms_mid1.ogg',
	//'sound/machines/tcomms/telecomms_mid2.ogg',
	//'sound/machines/tcomms/telecomms_mid3.ogg', Keep these 4 out to help reduce on the "Scree, Scree, Scree" effect of Tcomms, it does get annoying.
	//'sound/machines/tcomms/telecomms_mid4.ogg',
	'sound/machines/tcomms/telecomms_mid5.ogg','sound/machines/tcomms/telecomms_mid6.ogg',
	'sound/machines/tcomms/telecomms_mid7.ogg','sound/machines/tcomms/telecomms_mid8.ogg','sound/machines/tcomms/telecomms_mid9.ogg',
	'sound/machines/tcomms/telecomms_mid10.ogg',)
	mid_length = 1 SECONDS
	end_sound = 'sound/machines/tcomms/telecomms_end.ogg'
	volume = 18 //Loud equipment...
	ignore_walls = FALSE

/datum/looping_sound/recycler
	mid_sounds = list('sound/machines/recycler/recycler_mid1.ogg')
	mid_length = 1 SECONDS
	volume = 22
	ignore_walls = FALSE

/datum/looping_sound/furnace
	mid_sounds = list('sound/machines/furnace/furnace_mid1.ogg')
	mid_length = 1 SECONDS
	volume = 22
	ignore_walls = FALSE

