/obj/item/gun/ballistic/firearm/handgonne
	name = "handgonne"
	desc = "A tube of steel and hope. \
	An invention of Grenzelhoft siege smiths, independent of the Naledi conclave, yet reliant on smokepowder all the same. \
	Etched into the stock is a workshop stamp, though the production number is scratched off..."
	icon = 'modular_helmsguard/icons/weapons/handgonne.dmi'
	icon_state = "handgonne"
	item_state = "handgonne"

/obj/item/gun/ballistic/firearm/handgonne/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	var/accident_chance = 0
	var/firearm_skill = (user.get_skill_level(/datum/skill/combat/firearms))
	var/turf/knockback = get_ranged_target_turf(user, turn(user.dir, 180), rand(1,2))
	spread = (spread_num - firearm_skill)
	if(firearm_skill < 1)
		accident_chance =80

	if(firearm_skill < 2)
		accident_chance =50
	if(firearm_skill >= 2 && firearm_skill < 5)
		accident_chance =10
	if(firearm_skill >= 5)
		accident_chance =0
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
			//adjust_experience(user, /datum/skill/combat/crossbows, user.STAINT * 4)
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	gunpowder = FALSE
	reloaded = FALSE
	spark_act()

	playsound(src, "modular_helmsguard/sound/arquebus/fuse.ogg", 100)
	spawn(rand(10,20))
		..()
		spawn (1)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
		spawn (5)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 2))
		spawn (12)
			new/obj/effect/particle_effect/smoke/arquebus(get_ranged_target_turf(user, user.dir, 1))
		for(var/mob/M in range(5, user))
			if(!M.stat)
				shake_camera(M, 3, 1)
		if(prob(accident_chance))
			user.flash_fullscreen("whiteflash")
			user.apply_damage(rand(5,15), BURN, pick(BODY_ZONE_PRECISE_R_EYE, BODY_ZONE_PRECISE_L_EYE, BODY_ZONE_PRECISE_NOSE, BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND))
			user.visible_message(span_danger("[user] accidentally burnt themselves while firing the [src]."))
			user.emote("painscream")
			if(prob(60))
				user.dropItemToGround(src)
				user.Knockdown(rand(15,30))
				user.Immobilize(30)
		if(prob(accident_chance))
			user.visible_message(span_danger("[user] is knocked back by the recoil!"))
			user.throw_at(knockback, rand(1,2), 7)
			if(prob(accident_chance))
				user.dropItemToGround(src)
				user.Knockdown(rand(15,30))
				user.Immobilize(30)

/obj/item/gun/ballistic/firearm/flintgonne
	name = "flintgonne"
	desc = "A weapon of Avar make, provided in scant numbers to fuseliers, using smokepowder to shoot an armor piercing metal ball. \
	Although not as advanced as a Naledi-borne arquebus? It can still dispatch the inhumen just as easily."
	icon = 'modular_helmsguard/icons/weapons/flintgonne.dmi'//Not Helmsguard. OldRW original, I think? But it's no better a place to put it.
	icon_state = "flintgonne"
	item_state = "flintgonne"
	gripped_intents = list(/datum/intent/shoot/firearm/flintgonne, /datum/intent/arc/firearm/flintgonne, INTENT_GENERIC)

/datum/intent/shoot/firearm/flintgonne
	basetime = 200

/datum/intent/arc/firearm/flintgonne
	basetime = 220
