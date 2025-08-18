GLOBAL_LIST_INIT(generic_music,list(
	'sound/music/musicgen1.ogg',
	'sound/music/musicgen2.ogg',
	'sound/music/musicgen3.ogg',
	'sound/music/musicgen4.ogg',
	'sound/music/musicgen5.ogg',
))

GLOBAL_LIST_INIT(combat_music,list(
	'sound/music/musiccombat1.ogg',
	'sound/music/musiccombat2.ogg',
	'sound/music/musiccombat3.ogg',
	'sound/music/musiccombat4.ogg',
))

GLOBAL_LIST_INIT(hurt_music,list(
	'sound/music/musichurt1.ogg',
	'sound/music/musichurt2.ogg',
	'sound/music/musichurt3.ogg',
))

GLOBAL_LIST_INIT(unconscious_music,list(
	'sound/music/musicuncon1.ogg',
	'sound/music/musicuncon2.ogg',
	'sound/music/musicuncon3.ogg',
	'sound/music/musicuncon4.ogg',
))

GLOBAL_LIST_INIT(dead_music,list(
	'sound/music/musicdead1.ogg',
	'sound/music/musicdead2.ogg',
	'sound/music/musicdead3.ogg',
	'sound/music/musicdead4.ogg',
))

GLOBAL_LIST_INIT(dynamicmusic_assoc,list(
	MUSIC_GENERIC = GLOB.generic_music,
	MUSIC_COMBAT = GLOB.combat_music,
	MUSIC_HURT = GLOB.hurt_music,
	MUSIC_UNCONSCIOUS = GLOB.unconscious_music,
	MUSIC_DEAD = GLOB.dead_music,
))
