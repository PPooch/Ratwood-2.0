/obj/effect/quest_spawn
	name = "quest spawner"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_OBSERVER
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/atom/movable/contained_atom
	var/datum/proximity_monitor/proximity_monitor

/obj/effect/quest_spawn/Initialize(mapload)
	. = ..()
	proximity_monitor = new(src, 7)

/obj/effect/quest_spawn/Destroy(force)
	. = ..()
	QDEL_NULL(contained_atom)
	QDEL_NULL(proximity_monitor)

/obj/effect/quest_spawn/HasProximity(mob/nearby)
	if(!contained_atom)
		return

	if(!isliving(nearby) || !nearby.ckey)
		return

	var/datum/component/quest_object/quest_component = contained_atom.GetComponent(/datum/component/quest_object)
	if(!istype(quest_component))
		return

	var/datum/quest/quest = quest_component.quest_ref?.resolve()
	if(!istype(quest))
		return

	var/atom/scroll = quest.quest_scroll_ref?.resolve()
	if(!scroll || get_dist(get_turf(src), get_turf(scroll)) > 7)
		return

	var/image/I = image(icon = 'icons/effects/effects.dmi', loc = get_turf(src), icon_state = "mobwarning", layer = 18)
	I.layer = 18
	I.plane = 18
	I.alpha = 125
	I.mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	flick_overlay_view(I, 5 SECONDS)

	var/atom/movable/released = contained_atom
	released.forceMove(get_turf(src))
	contained_atom = null

	playsound(loc, "plantcross", 100, FALSE, 3)

	if(isliving(released))
		var/mob/living/L = released
		L.on_quest_release()

	qdel(src)

/// Called on a quest mob once it has been moved out of stasis onto a turf. Override for spawn-time behavior that needs real neighbors.
/mob/living/proc/on_quest_release()
	return

/obj/effect/quest_spawn/ex_act()
	return
