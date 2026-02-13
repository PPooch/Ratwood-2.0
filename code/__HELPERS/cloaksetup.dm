/mob/proc/cloak_and_title_setup()
	if(!client)
		addtimer(CALLBACK(src, PROC_REF(cloak_and_title_setup)), 50)
		return
	var/list/allowed_cloaks
	var/name_index
	switch(src.mind.assigned_role)
		if("Knight")
			name_index = "knight's"
			allowed_cloaks = list(
			"Jupon" = 			/obj/item/clothing/cloak/stabard/surcoat/guard,
			"Knight tabard" = 	/obj/item/clothing/cloak/tabard/retinue,
			"Cape" = 			/obj/item/clothing/cloak/cape/guard,
			"Guard hood" = 		/obj/item/clothing/cloak/stabard/guardhood)
		if("Squire")
			name_index = "squire's"
			allowed_cloaks = list(
			"Jupon" = 			/obj/item/clothing/cloak/stabard/surcoat/guard,
			"Cape" = 			/obj/item/clothing/cloak/cape/guard,
			"Tabard" = 			/obj/item/clothing/cloak/stabard/guard,
			"Guard hood" = 		/obj/item/clothing/cloak/stabard/guardhood)
		if("Man at Arms")
			name_index = "man-at-arms"
			allowed_cloaks = list(
			"Jupon" = 			/obj/item/clothing/cloak/stabard/surcoat/guard,
			"Tabard" = 			/obj/item/clothing/cloak/stabard/guard,
			"Guard hood" = 		/obj/item/clothing/cloak/stabard/guardhood
			)
		if("Sergeant")
			name_index = "sergeant"
			allowed_cloaks = list(
			"Jupon" = 			/obj/item/clothing/cloak/stabard/surcoat/guard,
			"Tabard" = 			/obj/item/clothing/cloak/stabard/guard,
			"Cape" = 			/obj/item/clothing/cloak/cape/guard,
			"Guard hood" = 		/obj/item/clothing/cloak/stabard/guardhood
			)

	var/choive_key = input(src, "Choose your cloak", "IDENTIFY YOURSELF") as anything in allowed_cloaks
	var/typepath = allowed_cloaks[choive_key]
	var/obj/item/clothing/cloak/cloak_choice = new typepath(src)
	cloak_choice.name = "[name_index] [cloak_choice.name] ([findtext(src.real_name, " ") ? copytext(src.real_name, 1, findtext(src.real_name, " ")) : src.real_name])"
	src.equip_to_slot_or_del(cloak_choice, SLOT_CLOAK)/*
	if(src.mind.assigned_role == "Knight")
		var/prev_real_name = src.real_name
		var/prev_name = src.name
		var/honorary = "Ser"
		if(should_wear_femme_clothes(src))
			honorary = "Dame"
		src.real_name = "[honorary] [prev_real_name]"
		src.name = "[honorary] [prev_name]"

		for(var/X in peopleknowme)
			for(var/datum/mind/MF in get_minds(X))
				if(MF.known_people)
					MF.known_people -= prev_real_name
					src.mind.person_knows_me(MF)*/
