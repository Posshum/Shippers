/datum/skill/reloading
	name = "Reloading"
	title = "Loader"
	desc = "You load, not just for your own sake, but for everyone's sake, keeping every box of ammo topped off with fresh ammo..."
	modifiers = list(SKILL_SPEED_MODIFIER = list(1, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4))

/datum/skill/reloading/New()
	. = ..()
	levelUpMessages[1] = span_nicegreen("I'm starting to understand how reloading works...")
	levelUpMessages[2] = span_nicegreen("I'm still lacking some skills in reloading, but it's making a bit more sense.")
	levelUpMessages[4] = span_nicegreen("I'm really starting to understand how reloading works!")
	levelUpMessages[6] = span_boldnicegreen("I've mastered the arts of reloading!!!")
