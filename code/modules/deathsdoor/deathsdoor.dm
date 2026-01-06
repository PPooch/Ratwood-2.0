GLOBAL_LIST_INIT(deaths_door_entries,list())
GLOBAL_VAR(deaths_door_exit)//turf at necra's shrine on each map

/obj/structure/deaths_door_shrine
	name = "A Way Out"
	desc = "The eerie calm comes to an end, one way or another."
	icon = 'icons/roguetown/misc/foliagetall.dmi'
	icon_state = "doorway"
	opacity = FALSE
	density = TRUE
	max_integrity = 0

/obj/structure/deaths_door_shrine/attack_hand(mob/living/user)
	to_chat(user, span_notice("You reach for the glowing portal..."))
	if(!do_after(user, 2 SECONDS, src))
		return

	if(user.mob_biotypes & MOB_UNDEAD)
		user.visible_message(span_danger("The Undermaiden churns the undead!"))
		explosion(get_turf(user), light_impact_range = 1, flame_range = 1, smoke = FALSE)
		return

	exit_deaths_door(user, user)

/obj/structure/deaths_door_shrine/MouseDrop_T(atom/movable/O, mob/living/user)
	if(!istype(O, /mob/living))
		return
	var/mob/living/target = O

	if(target.mob_biotypes & MOB_UNDEAD)
		target.visible_message(span_danger("The Undermaiden churns the undead!"))
		explosion(get_turf(target), light_impact_range = 1, flame_range = 1, smoke = FALSE)
		return

	if(user.incapacitated())
		return
	if(!Adjacent(user) || !user.Adjacent(target))
		return
	if(!do_after_mob(user, target, 1 SECONDS))
		return

	exit_deaths_door(user, target)

	user.visible_message(
		span_notice("[user] guides [target] through Necra's shrine.")
	)

/obj/structure/deaths_door_shrine/proc/exit_deaths_door(mob/living/user, mob/living/target = null)
	var/list/dests = list()

	// Acolytes can choose exits
	if(user.mind?.has_spell(/obj/effect/proc_holder/spell/invoked/necras_sight))
		var/list/sight_dests = get_necras_sight_entries(user)
		if(length(sight_dests))
			for(var/turf/T in sight_dests)
				dests[T] = sight_dests[T]

	// Always allow shrine exit
	if(GLOB.deaths_door_exit)
		dests[GLOB.deaths_door_exit] = "Necra's Shrine"
	// Warn Necra followers without sight
	if(!user.mind?.has_spell(/obj/effect/proc_holder/spell/invoked/necras_sight))
		if(user.patron == /datum/patron/divine/necra)
			to_chat(user, span_warning("Necra's paths blur before you. You lack the sight to choose."))

	if(!length(dests))
		message_admins("Death's Door Shrine: No exit destinations! Inform a mapper!")
		return

	var/turf/T = prompt_deaths_door_exit(user, dests)
	if(!T)
		return
	target.forceMove(T)
	playsound(get_turf(target), 'sound/misc/portalenter.ogg', 50, TRUE, -2, ignore_walls = TRUE)
	target.visible_message(span_danger("The air warps and rapidly chills as [user] stumbles out of a deathly calm realm."))

/proc/prompt_deaths_door_exit(mob/living/user, list/dests)
	if(!length(dests))
		return null

	if(length(dests) == 1)
		return dests[1]

	// Build display list: label -> turf
	var/list/named = list()
	for(var/turf/T as anything in dests)
		var/label = dests[T]
		if(!label)
			label = "[get_area(T)]"
		named[label] = T

	var/choice = input(user, "Choose a path from Death's Edge:", "Necra's Way") \
		as null|anything in named
	if(!choice)
		return null

	return named[choice]

/proc/get_necras_sight_entries(mob/living/user)
	var/list/targets = list()
	var/obj/effect/proc_holder/spell/invoked/necras_sight/spell = \
		locate(/obj/effect/proc_holder/spell/invoked/necras_sight) in user.mind?.spell_list
	if(!spell)
		return targets

	for(var/obj/O in spell.marked_objects.Copy())
		// prune deleted objects
		if(!O || QDELETED(O))
			spell.marked_objects -= O
			continue

		if(!isturf(O.loc))
			spell.marked_objects -= O
			continue
		var/turf/T = O.loc
		var/label = spell.marked_objects[O]

		// Fallback safety
		if(!label || !length(label))
			label = O.name

		targets[T] = label

	return targets

/obj/structure/deaths_door_portal
	name = "death's door"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "underworldportal"
	anchored = TRUE
	density = FALSE
	var/turf/destination

/obj/structure/deaths_door_portal/Initialize(mapload, mob/living/_caster)
	. = ..()
	var/list/dests = GLOB.deaths_door_entries
	if(!length(dests))
		message_admins("Death's Door Portal: No entry destinations! Inform a mapper!")
		return

	destination = pick(dests)

/obj/structure/deaths_door_portal/attack_hand(mob/living/user)
	playsound(get_turf(src), 'sound/misc/carriage2.ogg', 50, TRUE, -2, ignore_walls = TRUE)
	to_chat(user, span_notice("You reach for the glowing portal..."))
	if(!do_after(user, 3 SECONDS, src))
		return
	enter_portal(user)

/obj/structure/deaths_door_portal/MouseDrop_T(atom/movable/O, mob/living/user)
	if(!istype(O, /mob/living))
		return
	var/mob/living/M = O

	if(user.incapacitated())
		return
	if(!Adjacent(user) || !user.Adjacent(M))
		return
	playsound(get_turf(src), 'sound/misc/carriage2.ogg', 50, TRUE, -2, ignore_walls = TRUE)
	if(!do_after_mob(user, M, 4 SECONDS))
		return

	if(M.mob_biotypes & MOB_UNDEAD)
		to_chat(user, span_danger("The Undermaiden churns the undead!"))
		explosion(get_turf(M), light_impact_range = 1, flame_range = 1, smoke = FALSE)
		return

	enter_portal(M, user)

	user.visible_message(
		span_warning("[user] drags [M] into Death's Door!")
	)

/obj/structure/deaths_door_portal/proc/enter_portal(mob/living/target, mob/living/forcer)
	if(!destination)
		return
	playsound(get_turf(src), 'sound/misc/portalenter.ogg', 50, TRUE, -2, ignore_walls = TRUE)
	target.forceMove(destination)

GLOBAL_VAR_INIT(underworld_strands, 0)
/obj/effect/landmark/underworldstrands

/obj/item/soulthread/deathsdoor
	name = "shimmering lux-thread"
	desc = "Eerie glowing thread, cometh from the grave"
	var/should_track = TRUE

/obj/item/soulthread/deathsdoor/Initialize()
	. = ..()
	if(should_track)
		GLOB.underworld_strands += 1

/obj/item/soulthread/deathsdoor/Destroy()
	if(should_track)
		GLOB.underworld_strands -= 1
	strand_upkeep()
	return ..()

/obj/item/soulthread/deathsdoor/pickup(mob/user)
	..()
	if(should_track)
		GLOB.underworld_strands -= 1
	strand_upkeep()

/obj/item/soulthread/deathsdoor/dropped(mob/user)
	..()
	if(should_track)
		GLOB.underworld_strands += 1

/proc/strand_upkeep()
	if(GLOB.underworld_strands <= 1)
		for(var/obj/effect/landmark/underworldstrands/B in GLOB.landmarks_list)
			new /obj/item/soulthread/deathsdoor(B.loc)


/mob/living/proc/extract_from_deaths_edge()//for total exhaustion in death's precipice
	// Already unconscious? Don't loop
	if(stat >= UNCONSCIOUS)
		return
	src.apply_status_effect(/datum/status_effect/debuff/devitalised)
	src.SetSleeping(20 SECONDS)
	var/turf/T = get_adventurer_latejoin_turf()
	if(!T)
		return

	visible_message(
		span_danger("[src] collapses as Necra's grasp tightens."),
		span_warning("The last thing you see before you collapse is a spirit tugging strands of lux straight out of your chest.")
	)

	src.forceMove(T)

/mob/living/proc/get_adventurer_latejoin_turf()
	var/list/candidates = list()

	for(var/obj/effect/landmark/start/adventurerlate/L in GLOB.landmarks_list)
		if(L.loc && isturf(L.loc))
			candidates += L.loc

	if(!length(candidates))
		return null

	return pick(candidates)