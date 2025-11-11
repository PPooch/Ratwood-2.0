//intent datums ฅ^•ﻌ•^ฅ

/datum/intent/mace/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = BLUNT_DEFAULT_PENFACTOR
	damfactor = 1.1
	intent_intdamage_factor = 1.15
	swingdelay = 0
	icon_state = "instrike"
	item_d_type = "blunt"

/datum/intent/mace/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	penfactor = BLUNT_DEFAULT_PENFACTOR
	damfactor = 1.7
	swingdelay = 10
	clickcd = 14
	icon_state = "insmash"
	item_d_type = "blunt"

/datum/intent/mace/smash/flataxe
	damfactor = 1.2
	clickcd = 10

/datum/intent/mace/rangedthrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("thrusts")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	clickcd = CLICK_CD_CHARGED
	recovery = 30
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 25
	damfactor = 0.9
	item_d_type = "stab"

//blunt objs ฅ^•ﻌ•^ฅ

/obj/item/rogueweapon/mace
	force = 20
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/effect/daze)
	name = "mace"
	desc = "Helps anyone fall asleep."
	icon_state = "mace"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/maces
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/iron
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	minstr = 7
	wdefense = 2
	wbalance = WBALANCE_HEAVY
	intdamage_factor = 1.35
	icon_angle_wielded = 50

/obj/item/rogueweapon/mace/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -11,"sy" = -8,"nx" = 12,"ny" = -8,"wx" = -5,"wy" = -8,"ex" = 6,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -4,"nx" = -5,"ny" = -4,"wx" = -5,"wy" = -3,"ex" = 7,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -45,"sturn" = 45,"wturn" = -45,"eturn" = 45,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/alloy
	name = "decrepit mace"
	desc = "Frayed bronze, perched atop a rotwooden shaft. His sacrifice had drowned Old Syon, and - in its wake - left Man bereft of all it had accomplished. With all other prayers falling upon deaf ears, Man had crafted this idol in tribute to its new God; violence."
	icon_state = "amace"
	force = 17
	force_wielded = 21
	max_integrity = 180
	blade_dulling = DULLING_SHAFT_CONJURED
	color = "#bb9696"
	smeltresult = /obj/item/ingot/aaslag
	anvilrepair = null


/obj/item/rogueweapon/mace/church
	force = 25
	force_wielded = 30
	name = "bell ringer"
	desc = "This heavy hammer is used to ring the church's bell."
	icon_state = "churchmace"
	wbalance = WBALANCE_HEAVY
	smeltresult = /obj/item/ingot/steel
	wdefense = 3

/obj/item/rogueweapon/mace/steel
	force = 25
	force_wielded = 32
	name = "steel mace"
	desc = "This steel mace is objectively superior to an iron one."
	icon_state = "smace"
	wbalance = WBALANCE_HEAVY
	smeltresult = /obj/item/ingot/steel
	wdefense = 3
	smelt_bar_num = 2

/obj/item/rogueweapon/mace/steel/palloy
	name = "ancient alloy mace"
	desc = "Polished gilbranze, perched atop a reinforced shaft. Break the unenlightened into naught-but-giblets; like a potter's vessels, dashed against the rocks."
	icon_state = "amace"
	smeltresult = /obj/item/ingot/aaslag


/obj/item/rogueweapon/mace/silver
	name = "silver war hammer"
	desc = "A light war hammer forged of silver."
	icon_state = "silverhammer"
	force = 24
	gripped_intents = null
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/effect/daze)
	wdefense = 4
	smeltresult = /obj/item/ingot/silver
	smelt_bar_num = 2
	is_silver = TRUE

/obj/item/rogueweapon/mace/silver/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.85,"sx" = -7,"sy" = 4,"nx" = 7,"ny" = 4,"wx" = -2,"wy" = 5,"ex" = 1,"ey" = 5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -25,"sturn" = 25,"wturn" = 35,"eturn" = -35,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.85,"sx" = 5,"sy" = -4,"nx" = -5,"ny" = -4,"wx" = -5,"wy" = -3,"ex" = 7,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -45,"sturn" = 45,"wturn" = -45,"eturn" = 45,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/woodclub
	force = 15
	force_wielded = 18
	name = "wooden club"
	desc = "A primitive cudgel carved of a stout piece of treefall."
	icon_state = "club1"
	//dropshrink = 0.75
	wbalance = WBALANCE_NORMAL
	wdefense = 1
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	anvilrepair = /datum/skill/craft/carpentry
	minstr = 7
	resistance_flags = FLAMMABLE

/obj/item/rogueweapon/mace/woodclub/New()
	..()
	icon_state = "club[rand(1,2)]"

/datum/intent/mace/strike/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = BLUNT_DEFAULT_PENFACTOR

/datum/intent/mace/smash/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = BLUNT_DEFAULT_PENFACTOR

/datum/intent/mace/smash/wood/ranged
	reach = 2

/obj/item/rogueweapon/mace/cudgel
	name = "cudgel"
	desc = "A stubby little club for brigands or thieves. Attempting parries with this is a bad idea."
	force = 25
	icon_state = "cudgel"
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash, /datum/intent/mace/strike)
	smeltresult = /obj/item/ash
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	wbalance = WBALANCE_NORMAL
	minstr = 7
	wdefense = 1
	resistance_flags = FLAMMABLE
	grid_width = 32
	grid_height = 96

/obj/item/rogueweapon/mace/cudgel/psy
	name = "psydonian handmace"
	desc = "A shorthanded mace, a convenient sleeping aid, or a means to root out heresy. It's all in the wrist."
	wbalance = WBALANCE_SWIFT
	resistance_flags = FIRE_PROOF
	icon_state = "psyflangedmace"
	wdefense = 2

/obj/item/rogueweapon/mace/cudgel/psy/ComponentInitialize()
	add_psyblessed_component(is_preblessed = FALSE, bonus_force = 3, bonus_sharpness = 100, bonus_integrity = 50, bonus_wdef = 1, make_silver = TRUE)

/obj/item/rogueweapon/mace/cudgel/psy/preblessed/ComponentInitialize()
	add_psyblessed_component(is_preblessed = TRUE, bonus_force = 3, bonus_sharpness = 100, bonus_integrity = 50, bonus_wdef = 1, make_silver = TRUE)

/obj/item/rogueweapon/mace/cudgel/psy/old
	name = "old psydonian handmace"
	desc = "A shorthanded mace and convenient sleeping aid, its grown harder to swing with age, though it hasn't lost reliability."
	force = 20
	wbalance = WBALANCE_NORMAL
	icon_state = "opsyflangedmace"

/obj/item/rogueweapon/mace/cudgel/psy/old/ComponentInitialize()
	return

/obj/item/rogueweapon/mace/cudgel/copper
	name = "copper bludgeon"
	desc = "An extremely crude weapon for cruder bastards."
	force = 15
	icon_state = "cbludgeon"
	force_wielded = 20
	smeltresult = /obj/item/ingot/copper
	wdefense = 2

/obj/item/rogueweapon/mace/cudgel/justice
	name = "'Justice'"
	desc = "The icon of the right of office of the Marshal. While mostly ceremonial in design, it serves it's purpose in dishing out some much needed justice."
	force = 30
	icon_state = "justice"
	force_wielded = 30
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	smeltresult = /obj/item/ingot/steel
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	wbalance = WBALANCE_SWIFT
	resistance_flags = FIRE_PROOF
	minstr = 7
	wdefense = 5

/obj/item/rogueweapon/mace/cudgel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -8,"sy" = -7,"nx" = 10,"ny" = -7,"wx" = -1,"wy" = -8,"ex" = 1,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 91,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -3,"sy" = -4,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 70,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/mace/wsword
	name = "wooden sword"
	desc = "This wooden sword is great for training."
	force = 5
	force_wielded = 8
	icon_state = "wsword"
	//dropshrink = 0.75
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 7
	wdefense = 5
	wbalance = WBALANCE_NORMAL
	associated_skill = /datum/skill/combat/swords
	anvilrepair = /datum/skill/craft/carpentry
	resistance_flags = FLAMMABLE


/obj/item/rogueweapon/mace/wsword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -12,
"nx" = 9,
"ny" = -11,
"wx" = -11,
"wy" = -11,
"ex" = 1,
"ey" = -12,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 90,
"sturn" = -90,
"wturn" = -90,
"eturn" = 90,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -1,
"nx" = 10,
"ny" = 0,
"wx" = -13,
"wy" = -1,
"ex" = 2,
"ey" = -1,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 0,
"sturn" = 0,
"wturn" = 0,
"eturn" = 0,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/goden
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/mace/rangedthrust, /datum/intent/effect/daze)
	name = "Goedendag"
	desc = "Good morning."
	icon_state = "goedendag"
	icon = 'icons/roguetown/weapons/64.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ash
	swingsound = BLUNTWOOSH_MED
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	dropshrink = 0.6
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/mace/goden/aalloy
	name = "decrepit grand mace"
	desc = "Good nite, sire."
	force = 12
	force_wielded = 22
	icon_state = "ancient_supermace"
	blade_dulling = DULLING_SHAFT_CONJURED
	color = "#bb9696"
	smeltresult = /obj/item/ingot/aaslag
	anvilrepair = null

/obj/item/rogueweapon/mace/goden/steel
	name = "grand mace"
	desc = "Good morning, sire."
	icon_state = "polemace"
	force = 15
	force_wielded = 35
	smeltresult = /obj/item/ingot/steel
	smelt_bar_num = 2
	wdefense_wbonus = 5

/obj/item/rogueweapon/mace/goden/steel/paalloy
	name = "ancient grand mace"
	desc = "A twisting polehammer, forged in polished gilbranze. What did you think this was all about? This destruction, this war, this sacrifice; it was all to prepare Man for its true ascension."
	icon_state = "ancient_supermace"
	smeltresult = /obj/item/ingot/aaslag


/obj/item/rogueweapon/mace/goden/deepduke
	name = "deep duke's staff"
	desc = "A staff made of seaglass and sturdy but unusual metal, holding no power after its misled owner's death. More useful as a bashing tool than a magic focus."
	icon = 'icons/roguetown/mob/monster/pufferboss.dmi'
	icon_state = "pufferprod"
	force = 15
	force_wielded = 35
	minstr = 11
	max_integrity = 900
	smeltresult = /obj/item/ingot/steelholy
	smelt_bar_num = 2

/obj/item/rogueweapon/mace/goden/steel/ravox
	name = "duel settler"
	desc = "The tenets of ravoxian duels are enscribed upon the head of this maul."
	icon_state = "ravoxhammer"
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/effect/daze) // It loses the Goden stab so I give it daze
	max_integrity = 350 // I am reluctant to give a steel goden more force as it breaks weapon so durability it is.

/obj/item/rogueweapon/mace/goden/psymace
	name = "psydonian mace"
	desc = "An ornate mace, plated in a ceremonial veneer of silver. Even the unholy aren't immune to discombobulation."
	icon_state = "psymace"
	force = 25
	force_wielded = 32
	wbalance = WBALANCE_HEAVY
	dropshrink = 0.75
	smelt_bar_num = 2

/obj/item/rogueweapon/mace/goden/psymace/ComponentInitialize()
	. = ..()
	add_psyblessed_component(is_preblessed = FALSE, bonus_force = 3, bonus_sharpness = 0, bonus_integrity = 50, bonus_wdef = 1, make_silver = TRUE)

/obj/item/rogueweapon/mace/spiked
	icon_state = "spiked_club"

/obj/item/rogueweapon/mace/steel/morningstar
	icon_state = "morningstar"

/obj/item/rogueweapon/mace/warhammer
	force = 20
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/warhammer/pick)
	gripped_intents = null
	name = "warhammer"
	desc = "Made to punch through armor and skull alike."
	icon_state = "iwarhammer"
	wbalance = WBALANCE_HEAVY
	smeltresult = /obj/item/ingot/iron
	wdefense = 3
	intdamage_factor = 1.2

/obj/item/rogueweapon/mace/warhammer/alloy
	name = "decrepit warhammer"
	desc = "A macehead of frayed bronze, spiked and perched atop a thin shaft. To see such a knightly implement abandoned to decay and neglect; that wounds the heart greater than any well-poised strike."
	icon_state = "awarhammer"
	force = 17
	max_integrity = 180
	blade_dulling = DULLING_SHAFT_CONJURED
	color = "#bb9696"
	smeltresult = /obj/item/ingot/aaslag
	anvilrepair = null

/obj/item/rogueweapon/mace/warhammer/steel
	force = 25
	possible_item_intents = list(/datum/intent/mace/strike, /datum/intent/mace/warhammer/pick, /datum/intent/mace/warhammer/stab)
	name = "steel warhammer"
	desc = "A fine steel warhammer, makes a satisfying sound when paired with a knight's helm."
	icon_state = "swarhammer"
	smeltresult = /obj/item/ingot/steel
	wdefense = 4

/obj/item/rogueweapon/mace/warhammer/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -9,"sy" = -8,"nx" = 9,"ny" = -7,"wx" = -7,"wy" = -8,"ex" = 3,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -7,"nx" = -6,"ny" = -3,"wx" = 3,"wy" = -4,"ex" = 4,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -44,"sturn" = 45,"wturn" = 47,"eturn" = 33,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()

/obj/item/rogueweapon/mace/warhammer/steel/paalloy
	name = "ancient alloy warhammer"
	desc = "A macehead of polished gilbranze, spiked and perched atop a reinforced shaft. An elegant weapon from a more civilized age; when Man lived in harmony with one-another, and when 'the undying' was nothing more than a nitemare's thought."
	icon_state = "awarhammer"
	smeltresult = /obj/item/ingot/aaslag

/datum/intent/mace/warhammer/stab
	name = "thrust"
	icon_state = "instab"
	blade_class = BCLASS_STAB
	attack_verb = list("thrusts", "stabs")
	animname = "stab"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	no_early_release = TRUE
	penfactor = 20
	damfactor = 0.8
	item_d_type = "stab"

/datum/intent/mace/warhammer/pick
	name = "pick"
	icon_state = "inpick"
	blade_class = BCLASS_PICK
	attack_verb = list("picks", "impales")
	animname = "stab"
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	misscost = 1
	swingdelay = 15
	clickcd = 15
	penfactor = 80
	damfactor = 0.9
	item_d_type = "stab"

//Mauls. Woe. Most characters will not be able to engage with this, beyond hobbling.
//Why? The unique strength lockout. The minimum strength is not a suggestion.
/obj/item/rogueweapon/mace/maul
	force = 12//Don't one-hand this.
	force_wielded = 32//-3 compared to grand mace(steel goden). Better intents.
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/maul, /datum/intent/maul/crush, /datum/intent/effect/daze, /datum/intent/effect/hobble)
	name = "maul"
	desc = "Who would need something this large? It looks like it was made for tearing down walls, rather than men."
	icon_state = "sledge"
	icon = 'icons/roguetown/weapons/64.dmi'
	wlength = WLENGTH_LONG
	swingsound = BLUNTWOOSH_HUGE
	slot_flags = null//No.
	smelt_bar_num = 2
	minstr = 14
	wdefense = 2
	wdefense_wbonus = 1//3
	demolition_mod = 1.25//Oh, yes...
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	dropshrink = 0.6
	bigboy = TRUE
	gripsprite = TRUE
	minstr_req = TRUE//You MUST have the required strength. No exceptions.
	max_integrity = 300

/obj/item/rogueweapon/mace/maul/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/mace/maul/grand
	name = "grand maul"
	desc = "You could probably crack a man's spine just by tapping them with this. \
	Only a lunatic would carry something so heavy, however."
	icon_state = "cross"
	force_wielded = 34//-1 compared to grand mace.
	smeltresult = /obj/item/ingot/steel
	minstr = 15
	wdefense_wbonus = 4//6
	smelt_bar_num = 3
	max_integrity = 350

//Dwarvish mauls. Unobtanium outside of Grudgebearer. Do not change that.
/obj/item/rogueweapon/mace/maul/steel
	name = "dwarvish maul"
	desc = "An incredibly heavy, oversized hammer. The owner is not compensating, for this maul will do the speaking. \
	This one has been well balanced, allowing for a weaker wielder to make use of it."
	icon_state = "dwarfhammer"
	smeltresult = /obj/item/ingot/steel
	minstr = 11//+2STR from Grudgebearer Soldier. Should cover this.
	wdefense_wbonus = 3//5
	smelt_bar_num = 3//You'll break my heart.
	max_integrity = 340

/obj/item/rogueweapon/mace/maul/spiked
	name = "spiked maul"
	desc = "Covered in spikes, such is the weapon of a Dwarvish smith. \
	This one has been well balanced, allowing for a weaker wielder to make use of it."
	icon_state = "spiky"
	gripped_intents = list(/datum/intent/maul/spiked, /datum/intent/maul/crush, /datum/intent/effect/daze, /datum/intent/effect/hobble)
	wdefense_wbonus = 2//4
	minstr = 10//+1STR from Grudgebearer Smith. It should be fine.
	smelt_bar_num = 3//Please don't...
	max_integrity = 320

//Intents for the mauls.
/datum/intent/effect/hobble
	name = "hobbling strike"
	icon_state = "incrack"//Temp. Just so it's easy to differentiate.
	attack_verb = list("hobbles")
	animname = "strike"
	hitsound = list('sound/combat/hits/blunt/shovel_hit3.ogg')
	swingdelay = 6
	damfactor = 0.8
	penfactor = MAUL_DEFAULT_PENFACTOR
	clickcd = CLICK_CD_HEAVY
	item_d_type = "blunt"
	intent_effect = /datum/status_effect/debuff/hobbled
	target_parts = list(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)//Intentionally leaving out feet. If you know, you know.

/datum/intent/maul
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hammers", "wallops")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	swingdelay = 0
	intent_intdamage_factor = 1.3//+.15 from normal mace strike. This is the weapon's purpose.
	penfactor = MAUL_DEFAULT_PENFACTOR//You're getting FULL armour damage with this.
	clickcd = CLICK_CD_HEAVY//Take a guess.
	icon_state = "instrike"
	item_d_type = "blunt"

/datum/intent/maul/crush
	name = "crush"
	blade_class = BCLASS_SMASH
	attack_verb = list("crushes")
//	chargetime = 2 SECONDS//Leftover from knockback. Return when that's good.
	swingdelay = 12//+2 from mace smash. Walk away from it.
	damfactor = 1.7//Identical to mace smash.
	intent_intdamage_factor = 1.5//Yeah, that guy? Nuke him.
	icon_state = "incrush"
//TODO: Implement knockback that isn't coal. Gutted what I had. This just functioned like old blunt throwing. Not great. - Carl
//	knockback = TRUE//We making it out of the vale with this one. RAAAAAA

/datum/intent/maul/spiked
	name = "perforating strike"
	attack_verb = list("rends", "hammers", "wallops")
	blade_class = BCLASS_PIERCE//TEAR CHUNKS OFF OF THEM. THROW IT ACROSS THE ROOM.
	hitsound = list('sound/combat/hits/bladed/genthrust (1).ogg', 'sound/combat/hits/bladed/genthrust (2).ogg')
	icon_state = "intear"

