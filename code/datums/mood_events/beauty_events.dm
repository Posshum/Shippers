/datum/mood_event/absolutely_disgusting_room
	description = span_boldwarning("This room looks absolutely horrendous!!!")
	mood_change = -25

/datum/mood_event/horridroom
	description = span_boldwarning("This room looks terrible!")
	mood_change = -10

/datum/mood_event/badroom
	description = span_warning("This room looks really bad...")
	mood_change = -5

/datum/mood_event/normalroom
	description = ("This room looks as it should be.") //Default mood for rooms. No fancy effect...
	mood_change = 0

/datum/mood_event/decentroom
	description = span_nicegreen("This room looks alright...")
	mood_change = 1

/datum/mood_event/goodroom
	description = span_nicegreen("This room looks really pretty.")
	mood_change = 3

/datum/mood_event/greatroom
	description = span_nicegreen("This room is beautiful!")
	mood_change = 5
