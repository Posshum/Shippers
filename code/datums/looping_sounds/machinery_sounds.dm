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
	mid_sounds = list('sound/machines/generator/generator_mid1.ogg'=1, 'sound/machines/generator/generator_mid2.ogg'=1, 'sound/machines/generator/generator_mid3.ogg'=1)
	mid_length = 4
	end_sound = 'sound/machines/generator/generator_end.ogg'
	volume = 22
	extra_range = -10
	ignore_walls = FALSE

/datum/looping_sound/computer
	start_sound = 'sound/machines/computer/computer_start.ogg'
	start_length = 10
	mid_sounds = list('sound/machines/computer/computer_mid1.ogg'=1, 'sound/machines/computer/computer_mid2.ogg'=5, 'sound/machines/computer/computer_mid3.ogg'=5)
	mid_length = 4
	end_sound = 'sound/machines/computer/computer_end.ogg'
	volume = 3
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
	mid_sounds = list('sound/machines/roulettejackpot.ogg')
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
