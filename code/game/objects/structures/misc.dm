/obj/structure/showcase
	name = "Showcase"
	icon = 'icons/obj/structures/props/stationobjs.dmi'
	icon_state = "showcase_1"
	desc = "A stand with the empty body of a cyborg bolted to it."
	density = TRUE
	anchored = TRUE
	health = 250

/obj/structure/showcase/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_HIGH_OVER_ONLY

/obj/structure/showcase/bullet_act(obj/item/projectile/P)
	var/damage = P.damage
	health -= damage
	..()
	healthcheck()
	return 1

/obj/structure/showcase/proc/explode()
	src.visible_message(SPAN_DANGER("<B>[src] blows apart!</B>"), null, null, 1)
	deconstruct(FALSE)

/obj/structure/showcase/deconstruct(disassembled = TRUE)
	if(!disassembled)
		var/turf/Tsec = get_turf(src)

		new /obj/item/stack/sheet/metal(Tsec)
		new /obj/item/stack/rods(Tsec)
		new /obj/item/stack/rods(Tsec)

		new /obj/effect/spawner/gibspawner/robot(Tsec)
	return ..()

/obj/structure/showcase/proc/healthcheck()
	if(health <= 0)
		explode()

/obj/structure/showcase/ex_act(severity)
	switch(severity)
		if(EXPLOSION_THRESHOLD_LOW to EXPLOSION_THRESHOLD_MEDIUM)
			if(prob(50))
				deconstruct(FALSE)
		if(EXPLOSION_THRESHOLD_MEDIUM to INFINITY)
			deconstruct(FALSE)

/obj/structure/target
	name = "shooting target"
	anchored = FALSE
	desc = "A shooting target."
	icon = 'icons/obj/objects.dmi'
	icon_state = "target_a"
	density = FALSE
	health = 5000

/obj/structure/target/syndicate
	icon_state = "target_s"
	desc = "A shooting target that looks like a hostile agent."
	health = 7500

/obj/structure/target/alien
	icon_state = "target_q"
	desc = "A shooting target with a threatening silhouette."
	health = 6500

/obj/structure/monorail
	name = "monorail track"
	icon = 'icons/obj/structures/structures.dmi'
	icon_state = "monorail"
	density = FALSE
	anchored = TRUE
	layer = ATMOS_PIPE_LAYER + 0.01

//used on fiorina
/obj/structure/monorail/launchtrack
	name = "launch track"

//ICE COLONY RESEARCH DECORATION-----------------------//
//Most of icons made by ~Morrinn
/obj/structure/xenoautopsy
	name = "Research thingies"
	icon = 'icons/obj/structures/props/alien_autopsy.dmi'
	icon_state = "jarshelf_9"

/obj/structure/xenoautopsy/jar_shelf
	name = "jar shelf"
	icon_state = "jarshelf_0"
	var/randomise = 1 //Random icon

/obj/structure/xenoautopsy/jar_shelf/New()
	if(randomise)
		icon_state = "jarshelf_[rand(0,9)]"

/obj/structure/xenoautopsy/tank
	name = "cryo tank"
	icon_state = "tank_empty"
	desc = "It is empty."

/obj/structure/xenoautopsy/tank/broken
	name = "cryo tank"
	icon_state = "tank_broken"
	desc = "Something broke it..."

/obj/structure/xenoautopsy/tank/alien
	name = "cryo tank"
	icon_state = "tank_alien"
	desc = "There is something big inside..."

/obj/structure/xenoautopsy/tank/hugger
	name = "cryo tank"
	icon_state = "tank_hugger"
	desc = "There is something spider-like inside..."

/obj/structure/xenoautopsy/tank/larva
	name = "cryo tank"
	icon_state = "tank_larva"
	desc = "There is something worm-like inside..."

/obj/item/alienjar
	name = "sample jar"
	icon = 'icons/obj/structures/props/alien_autopsy.dmi'
	icon_state = "jar_sample"
	desc = "Used to store organic samples inside for preservation."

/obj/item/alienjar/Initialize(mapload, ...)
	. = ..()

	var/image/I
	I = image('icons/obj/structures/props/alien_autopsy.dmi', "sample_[rand(0,11)]")
	I.layer = src.layer - 0.1
	overlays += I
	pixel_x += rand(-3,3)
	pixel_y += rand(-3,3)


//stairs

/obj/structure/stairs
	name = "Stairs"
	icon = 'icons/obj/structures/structures.dmi'
	desc = "Stairs.  You walk up and down them."
	icon_state = "rampbottom"
	gender = PLURAL
	unslashable = TRUE
	unacidable = TRUE
	health = null
	layer = ABOVE_TURF_LAYER//Being on turf layer was causing issues with cameras. This SHOULDN'T cause any problems.
	plane = FLOOR_PLANE
	density = FALSE
	opacity = FALSE

/obj/structure/stairs/perspective //instance these for the required icons
	icon = 'icons/obj/structures/stairs/perspective_stairs.dmi'
	icon_state = "np_stair"
//for fiorina
/obj/structure/stairs/perspective/p_stair_sn_full_cap
	icon_state = "p_stair_sn_full_cap"

/obj/structure/stairs/perspective/p_stair_full
	icon_state = "p_stair_full"

/obj/structure/stairs/perspective/p_stair_ew_full_cap
	icon_state = "p_stair_ew_full_cap"

/obj/structure/stairs/perspective/p_stair_ew_half_cap
	icon_state = "p_stair_ew_half_cap"
/obj/structure/stairs/perspective/kutjevo
	icon = 'icons/obj/structures/stairs/perspective_stairs_kutjevo.dmi'

/obj/structure/stairs/perspective/ice
	icon = 'icons/obj/structures/stairs/perspective_stairs_ice.dmi'


// Prop
/obj/structure/ore_box
	icon = 'icons/obj/structures/props/mining.dmi'
	icon_state = "orebox0"
	name = "ore box"
	desc = "A heavy box used for storing ore."
	density = TRUE
	anchored = FALSE

/obj/structure/ore_box/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_HIGH_OVER_ONLY|PASS_OVER_THROW_ITEM

/obj/structure/computer3frame
	density = TRUE
	anchored = FALSE
	name = "computer frame"
	icon = 'icons/obj/structures/machinery/stock_parts.dmi'
	icon_state = "0"
	var/state = 0

/obj/structure/computer3frame/server
	name = "server frame"

/obj/structure/computer3frame/wallcomp
	name = "wall-computer frame"

/obj/structure/computer3frame/laptop
	name = "laptop frame"
