/// This subsystem will play music to players on occasion, functioning similarly to that of the ambience system.
/// This subsystem makes some robust checks to check the current state of the player, health, mood, hunger, hostiles, or even areas.
SUBSYSTEM_DEF(dynamicmusic)
	name = "Dynamic Music"
	flags = SS_BACKGROUND|SS_NO_INIT
	priority = FIRE_PRIORITY_DYNAMIC_MUSIC
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	wait = 1 SECONDS
	///Assoc list of listening client - next music track time
	var/list/music_listening_clients = list()
	var/list/active_listening_clients = list()

/datum/controller/subsystem/dynamicmusic/fire(resumed)
	for(var/client/client_iterator as anything in music_listening_clients)

		//Check to see if the client exists and isn't held by a new player
		if(isnull(client_iterator) || isnewplayer(client_iterator.mob))
			continue //No client to play to, or not in-game yet, don't bother.
		var/area/current_area = get_area(client_iterator.mob)
		var/mob/living/client_mob = client_iterator?.mob
		var/list/sounds_list = client_iterator.SoundQuery()

		for(var/sound/S in sounds_list) //Check the sounds currently playing rather than every object in range around the mob.
			if(S.channel == CHANNEL_DYNAMIC_MUSIC)
				for(var/obj/machinery/jukebox/J in range(15, client_mob.loc))//Lets always assume 15 tiles.
					if(J.active) //If the jukebox is active and playing? Mute the channel and let the jukebox take prio.
						client_mob.stop_sound_channel(CHANNEL_DYNAMIC_MUSIC)
						return
			else
				continue

		if(music_listening_clients[client_iterator] > world.time)
			continue //Not ready for the next sound.

		music_listening_clients[client_iterator] = world.time + current_area.play_music(client_mob)
		active_listening_clients[client_iterator] = world.time + current_area.play_music(client_mob, time_only = TRUE)


///Attempts to play a soundtrack to a mob.

	//This system will need to be enhanced over a bit, but, this should in the end make music a dynamic treat to players.
	//It doesn't make procedural music, just dynamic music based on context, don't confuse those.
/area/proc/play_music(mob/M, sound/override_sound, volume = 85, time_only = FALSE)
	var/sound/new_sound = override_sound || pick(music_track_alive)
	/* 	if(musictracks == AMBIENCE_GENERIC && prob(1))
		new_sound = pick(AMBIENCE_RARE) */ //Hold off on this for a second.

	//Handle dynamics from this point onwards.
	var/mob/living/music_target = M
	if(music_target.health < music_target.maxHealth / 2) //under 50 HP
		new_sound = override_sound || pick(music_track_hurt)
	if(music_target.stat == UNCONSCIOUS && music_target.health < music_target.maxHealth / 5) //under 20 HP
		new_sound = override_sound || pick(music_track_unconscious)
	if(music_target.stat == DEAD)
		new_sound = override_sound || pick(music_track_dead)

	//Load the sound to ready it, and FIRE!
	new_sound = sound(new_sound, repeat = 0, wait = 0, volume = 85, channel = CHANNEL_DYNAMIC_MUSIC)
	//Must always load after to ensure we get the correct song.
	var/sound_length = ceil(SSsound_cache.get_sound_length(new_sound.file))
	if(time_only)
		return	sound_length

	SEND_SOUND(M, new_sound)

	return rand(min_track_cooldown + sound_length, max_track_cooldown + sound_length)
