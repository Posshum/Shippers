// Hey! Listen! Update _maps\map_catalogue.txt with your new ruins!

/datum/map_template/ruin/space
	prefix = "_maps/RandomRuins/SpaceRuins/"
	cost = 1
	allow_duplicates = FALSE
	ruin_type = RUINTYPE_SPACE

/datum/map_template/ruin/space/singularitylab
	id = "singularitylab"
	suffix = "singularity_lab.dmm"
	name = "Singularity Lab"
	description = "An overgrown facility, home to an inactive singularity and many plants"
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/spacemall
	id = "spacemall"
	suffix = "spacemall.dmm"
	name = "Space Mall"
	description = "An old shopping centre, owned by a former member of Makosso-Warra's board of directors.."
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/scrapstation
	id = "scrapstation"
	suffix = "scrapstation.dmm"
	name = "Ramzi Scrapping Station"
	description = "A Syndicate FOB dating back to the ICW, now home to the Ramzi Clique and their latest haul."
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/deepstorage
	id = "VI deepstorage"
	suffix = "vi_deepstorage.dmm"
	name = "Vigilitas Deepstorage"
	description = "A Vigilitas blacksite for holding important and suspicious cargo."
	ruin_tags = list(RUIN_TAG_BOSS_COMBAT, RUIN_TAG_MAJOR_LOOT, RUIN_TAG_SHELTER)

/datum/map_template/ruin/space/onefull
	id = "onehalftwo"
	suffix = "onehalftwo.dmm"
	name = "Makosso-Warra Refueling Station"
	description = "An abandoned Makosso-Warra refueling post evacuated after an attempted ACLF plasmaflood. Since then, hivebots and a small Ramzi Clique salvage team have attempted to claim the station."
	ruin_tags = list(RUIN_TAG_MEDIUM_COMBAT, RUIN_TAG_MEDIUM_LOOT, RUIN_TAG_SHELTER)
	ruin_mission_types = list(
		/datum/mission/ruin/fueling_papers,
	)

/datum/mission/ruin/fueling_papers
	name = "Nanotrasen Asset Recovery Program"
	desc = "Pre-war, this station was evacuated pending ACLF sabotage and could not be properly scuttled with budget limitations at the time. Nanotrasen would like some documents left behind at the site to be recovered, in exchange for a fair sum."
	author = "Nanotrasen Recovery Program"
	value = 1500
	mission_limit = 1
	faction = list(
		/datum/faction/nt,
		/datum/faction/syndicate/cybersun,
	)

/datum/mission/ruin/fueling_papers/generate_mission_details()
	. = ..()
	if(faction == /datum/faction/nt)
		name = "Nanotrasen Asset Recovery Program"
		author = "Nanotrasen Recovery Program"
		desc = "Pre-war, this station was evacuated pending ACLF sabotage and could not be properly scuttled with budget limitations at the time. Nanotrasen would like some documents left behind at the site to be recovered, in exchange for a fair sum."
	if(faction == /datum/faction/syndicate/cybersun)
		name = "Virtual Solutions Asset Retrieval"
		author = "Cybersun Virtual Solutions"
		desc = "Cybersun has found an orbital Nanotrasen facility that was improperly scuttled. Virtual Solutions would gladly receive any unsecured site data, and will reward you for your work."

/datum/mission/ruin/signaled/kill/foreman
	name = "Kill Foreman Bonsha"
	desc = "Defector Verron Bonsha has established a Ramzi Clique post inside a former Coalation FOB. Killing him should send the local Clique into disarray and disrupt their supply lines."
	author = "2nd Battlegroup Headquarters"
	faction = /datum/faction/syndicate/ngr
	value = 2000
	mission_limit = 1
