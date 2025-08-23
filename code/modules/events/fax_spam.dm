/datum/round_event_control/fax_spam
	name = "Fax Spam"
	typepath = /datum/round_event/fax_spam
	weight = 10
	max_occurrences = INFINITY
	earliest_start = 5 MINUTES
	requires_ship = TRUE

/datum/round_event/fax_spam
	var/obj/item/advertisement/spam_type

/datum/round_event/fax_spam/setup()
	spam_type = pick(subtypesof(/obj/item/advertisement))

/datum/round_event/fax_spam/start()
	for(var/obj/machinery/fax/fax_machine in GLOB.machines)
		if(fax_machine.visible_to_network)
			var/obj/item/advertisement/spam_message = new spam_type
			fax_machine.receive(spam_message, "Unknown Sender")

/obj/item/advertisement
	name = "advertisement"
	icon = 'icons/obj/fliers.dmi'
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	pressure_resistance = 0
	resistance_flags = FLAMMABLE
	max_integrity = 50
	drop_sound = 'sound/items/handling/paper_drop.ogg'
	pickup_sound = 'sound/items/handling/paper_pickup.ogg'
	grind_results = list(/datum/reagent/cellulose = 3)

/obj/item/advertisement/gec
	name = "robust advertisement"
	desc = "A recruitment pamphlet for the Galactic Engineer's Concordat, listing several benefits to union members compared to the average worker."
	icon_state = "gec"

/obj/item/advertisement/vitcom
	desc = "A pamphlet advertising VitCom Consumer Electronic's new model of \"bowman\" headset, focusing on benefits for salvage crews working with loud machinery."
	icon_state = "vitcom"

/obj/item/advertisement/vanity
	name = "fancy advertisement"
	desc = "A fancifully decorated pamphlet advertising Vanity's premier line of gemstone studded electronics, you wonder if you'll ever be able to afford one working in the Frontier..."
	icon_state = "vanity"

/obj/item/advertisement/cliptour
	desc = "A pamphlet advertising tour guides on Luna-Town, most prominently an interior tour of certain restricted sections of the UNSV Lichtenstein."
	icon_state = "cliptour"

/obj/item/advertisement/generic
	desc = "Some random advert asking you to buy more paper from the advert company for your fax machine so that they can keep sending you more adverts... You don't know what company it is however."
	icon_state = "generic"

/obj/item/advertisement/generic/mop
	desc = "A random advertisement focusing on how you should be worrying about your cleanliness, and offers a product most janitors already use. A mop!"

//Literally just Borderland's advert for Torgue. It's funny!
/obj/item/advertisement/generic/korgue
	desc = "This advertisement looks explosive, it has a huge box of text stating \"The next time you go shopping for a new gun, ask yourself one question: Are you a man? If you answer in the affirmative, then you're ready for a Korgue. You see, we at Korgue make guns for real men. Tough guys. Badasses. The kind of guys your dad was and you hope to be! Korgue doesn't screw around making lightweight toys and we sure as hell aren't concerned with selling you a stylish accessory like those hip-huggers over at Paliwan. No. We make them tough, and we make them heavy. It's up to you to make 'em dead. Do it with a Korgue.\" ... Whatever the hell that was all about. You smell gunpowder all of a sudden."

/obj/item/advertisement/generic/medical
	desc = "This advertisement looks clean and bleak. It describes how you should be making sure you stay in good health, and ensure that you're brushing your teeh and washing yourself. Oh, and to also look into buying as many medical supplies as you can for all of the exploration you're about to do... It's good for your health, after all!"
