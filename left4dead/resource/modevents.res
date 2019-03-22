//=========== (C) Copyright 1999 Valve, L.L.C. All rights reserved. ===========
//
// The copyright to the contents herein is the property of Valve, L.L.C.
// The contents may be used and/or copied only with the written permission of
// Valve, L.L.C., or in accordance with the terms and conditions stipulated in
// the agreement/contract under which the contents have been supplied.
//=============================================================================

// No spaces in event names, max length 32
// All strings are case sensitive
// total game event byte length must be < 1024
//
// valid data key types are:
//   none   : value is not networked
//   string : a zero terminated string
//   bool   : unsigned int, 1 bit
//   byte   : unsigned int, 8 bit
//   short  : signed int, 16 bit
//   long   : signed int, 32 bit
//   float  : float, 32 bit

"cstrikeevents"
{
	"player_death"				// a game event, name may be 32 charaters long
	{
		// this extents the original player_death by a new fields
		"userid"	"short"   	// user ID who died				
		"entityid"	"long"   	// entity ID who died, userid should be used first, to get the dead Player.  Otherwise, it is not a player, so use this.		
		"attacker"	"short"	 	// user ID who killed
		"attackername" "string" // What type of zombie, so we don't have zombie names
		"attackerentid" "long"	// if killer not a player, the entindex of who killed.  Again, use attacker first
		"weapon"	"string" 	// weapon name killer used 
		"headshot"	"bool"		// singals a headshot
		"attackerisbot" "bool"  // is the attacker a bot
		"victimname" "string"   // What type of zombie, so we don't have zombie names
		"victimisbot" "bool"    // is the victim a bot
		"abort" "bool"    // did the victim abort
		"type"		"long"		// damage type
		"victim_x"	"float"
		"victim_y"	"float"
		"victim_z"	"float"
	}
	
	"player_hurt"
	{
		"local"		"1"			// Not networked
		"userid"	"short"   	// user ID who was hurt
		"attacker"	"short"	 	// user id who attacked
		"attackerentid"	"long"	// entity id who attacked, if attacker not a player, and userid therefore invalid
		"health"	"short"		// remaining health points
		"armor"		"byte"		// remaining armor points
		"weapon"	"string"	// weapon name attacker used, if not the world
		"dmg_health"	"short"	// damage done to health
		"dmg_armor"	"byte"		// damage done to armor
		"hitgroup"	"byte"		// hitgroup that was damaged
		"type"		"long"		// damage type
	}

	"player_team"				// player change his team
	{
		"userid"	"short"		// user ID on server
		"team"		"byte"		// team id
		"oldteam" "byte"		// old team id
		"disconnect" "bool"	// team change because player disconnects
		"name"	"string"
		"isbot"	"bool"
	}
	
	"player_bot_replace"
	{
		"player"	"short"		// user ID of the player
		"bot"		"short"		// user ID of the bot
	}
	
	"bot_player_replace"
	{
		"bot"		"short"		// user ID of the bot
		"player"	"short"		// user ID of the player
	}
	
	"player_afk"
	{
		"player"	"short"		// user ID of the player
	}
	
	"weapon_fire"
	{
		"local"		"1"		// don't network this, its way too spammy
		"userid"	"short"
		"weapon"	"string" 	// used weapon name
		"weaponid"	"short"		// used weapon ID
		"count"		"short"		// number of bullets
	}

	"weapon_fire_on_empty"
	{
		"local"		"1"		// don't network this, its way too spammy
		"userid"	"short"
		"weapon"	"string" 	// weapon name used
		"count"		"short"		// number of bullets
	}

	"weapon_reload"
	{
		"userid"	"short"
		"manual"	"bool"		// player manually started the reload
	}

	"weapon_zoom"
	{
		"userid"	"short"
	}
	
	"ability_use"
	{
		"userid"	"short"
		"ability"	"string"	// ability classname
		"context"	"short"		// enum of the way it was used (different for each ability)
	}

	"ammo_pickup"
	{
		"userid"	"short"		// The player who got some ammo from a weapon_ammo_spawner
	}

	"item_pickup"
	{
		"userid"	"short"
		"item"		"string"	// either a weapon such as 'tmp' or 'hegrenade', or an item such as 'nvgs'
	}

	"grenade_bounce"
	{
		"userid"	"short"
	}

	"hegrenade_detonate"
	{
		"userid"	"short"
	}

	"bullet_impact"
	{
		"userid"	"short"
		"x"		"float"
		"y"		"float"
		"z"		"float"
	}

	"player_footstep"
	{
		"userid"	"short"
	}

	"player_jump"
	{
		"userid"	"short"
	}

	"player_blind"
	{
		"userid"	"short"
	}

	"player_falldamage"
	{
		"userid"	"short"		// Who got hurt
		"damage"	"float"		// for how much
		"causer"	"short"		// Who caused them to do so (if anyone)
	}

	"player_ledge_grab"
	{
		"userid"	"short"		// Who grabbed the ledge
		"causer"	"short"		// Who caused them to do so (if anyone)
		"has_upgrade"	"bool"		// whether they have an upgrade to help themself.
	}
	
	"player_ledge_release"
	{
		"userid"		"short"			// person who released from the ledge
	}

	"door_moving"
	{
		"entindex"	"long"
		"userid"		"short"
	}

	"door_open"
	{
		"userid"		"short"	// Who opened the door
		"checkpoint"		"bool"	// Is the door a checkpoint door
		"closed"		"bool"	// Was the door closed when it started opening?
	}

	"door_close"
	{
		"userid"		"short"	// Who closed the door
		"checkpoint"		"bool"	// Is the door a checkpoint door
	}

	"door_unlocked"
	{
		"userid"		"short"	// Who opened the door
		"checkpoint"	"bool"	// Is the door a checkpoint door
	}

	"rescue_door_open"
	{
		"userid"		"short"	// Who opened the door
		"entindex"		"long"	// door that opened
	}
	
	"waiting_checkpoint_door_used"	// Someone tried to open a checkpoint door that is locked till everyone loads in
	{
		"userid"		"short"	// player who tried to open it
		"entindex"		"long"	// door that was used
	}

	"waiting_door_used_versus"	// Someone tried to open a checkpoint door that is locked till everyone loads in
	{
		"userid"		"short"	// player who tried to open it
		"entindex"		"long"	// door that was used
	}
	
	"waiting_checkpoint_button_used"	// Someone tried to push a button that's locked until everyone is gathered
	{
		"userid"		"short"	// player who tried to open it
	}
	
	"success_checkpoint_button_used"	// Someone pushed a button that's locked until everyone is gathered
	{
		"userid"		"short"	// player who openned it
	}
	
	"round_freeze_end"
	{
	}

	"round_start_pre_entity"
	{
	}

	"round_start_post_nav"
	{
	}

	"nav_blocked"
	{
		"area"		"long"
		"blocked"	"bool"
	}

	"nav_generate"
	{
	}

	"round_end_message"
	{
		"winner"	"byte"		// winner team/user i
		"reason"	"byte"		// reson why team won
		"message"	"string"	// end round message
	}
 
// Client side VoteController talking to HUD
	"vote_ended"
	{
	}
	"vote_started"
	{
		"issue"			"string"
		"param1"		"string"
		"team"			"byte"
		"initiator"		"long" // entity id of the player who initiated the vote
	}
	"vote_changed"
	{
		"yesVotes"		"byte"
		"noVotes"		"byte"
		"potentialVotes"	"byte"
	}
	"vote_passed"
	{
		"details"		"string"
		"param1"		"string"
		"team"			"byte"
	}
	"vote_failed"
	{
		"team"			"byte"
	}
	"vote_cast_yes"
	{
		"team"			"byte"
		"entityid"		"long"	// entity id of the voter
	}
	"vote_cast_no"
	{
		"team"			"byte"
		"entityid"		"long"	// entity id of the voter
	}
	
	// TERROR:
	"infected_hurt"
	{
		"local"		"1"		// don't network this, its way too spammy
		"attacker"	"short"	 	// player userid who attacked
		"entityid"	"long"		// entity id of infected
		"hitgroup"	"byte"		// hitgroup that was damaged
		"amount"	"short"		// how much damage was done
		"type"		"long"		// damage type
	}

	"infected_death"
	{
		"attacker"	"short"	 	// user ID who killed
		"headshot"	"bool"		// singals a headshot
		"minigun"	"bool"		// singals a minigun kill
		"blast"		"bool"		// singals a death from blast damage
	}
	

	"hostname_changed"
	{
		"hostname"		"string"
	}

	"difficulty_changed"
	{
		"newDifficulty"	"short"
		"oldDifficulty"	"short"
		"strDifficulty" "string" // new difficulty as string
	}
	
	"finale_start"
	{
		"rushes"		"short"
		"campaign"		"string"
	}
	"finale_rush"
	{
	}
	"finale_escape_start"
	{
	}
	"finale_vehicle_ready"
	{
	}
	"finale_vehicle_leaving"
	{
		"survivorcount"	"short" // number of survivors that made it out
	}
	"finale_win"
	{
		"map_name"		"string"
		"difficulty"	"short"
		"versus"		"bool"
	}
	
	// Used for signaling when the entity that controls escape vehicle spawning is enabled / disabled (Crash Course)
	"finale_escape_state_change"
	{
		"userid"		"short"	// player who re-enabled the escape sequence 
		"enabled"		"bool"	// FALSE if escape sequence is halted - TRUE if sequence is begun
	}
	
	"mission_lost" // As in, the survivor team failed.  Opposite of finale_win, but not necessarily during the finale.
	{
	}
	"finale_radio_start"
	{
		"health"	"short"
	}
	"finale_radio_damaged"
	{
		"health"	"short"
	}
	"final_reportscreen"	// Right before the final report screen comes up, let awards possibly fire
	{
	}
	"map_transition"
	{
	}
	"player_transitioned"
	{
		"userid"	"short"			// the person that just finished transitioning
	}
	
	"heal_begin"
	{
		"userid"	"short"			// person doing the healing
		"subject"	"short"			// person being healed
	}

	"heal_success"
	{
		"userid"	"short"			// person doing the healing
		"subject"	"short"			// person being healed
		"health_restored"	"short"		// amount of health restored
	}
	
	"heal_end"
	{
		"userid"	"short"			// person doing the healing
		"subject"	"short"			// person being healed
	}

	"heal_interrupted"
	{
		"userid"	"short"			// person who was being healed, but moved.
		"subject"	"short"			// person being healed
	}
	
	"give_weapon"
	{
		"userid"	"short"			// The giver of the weapon
		"recipient"	"short"			// The recipient of the weapon
		"weapon"	"short"			// The ID of the weapon given
	}
	
	"pills_used"
	{
		"userid"	"short"			// person who had the pills
		"subject"	"short"			// person swallowing the pills
	}
	
	"pills_used_fail"
	{
		"userid"	"short"			// person who tried to use the pills
	}

	"revive_begin"
	{
		"userid"	"short"			// person doing the reviving
		"subject"	"short"			// person being revived
	}

	"revive_success"
	{
		"userid"		"short"			// person doing the reviving
		"subject"		"short"			// person who was revived
		"lastlife"		"bool"			// person revived will die if they fall again
		"ledge_hang"	"bool"			// 1 if person revived was ledge hanging
	}

	"revive_end"
	{
		"userid"		"short"		// person doing the reviving
		"subject"		"short"		// person being revived
		"ledge_hang"	"bool"		// person is ledge hanging
	}
		
	"drag_begin"
	{
		"userid"	"short"			// person doing the dragging
		"subject"	"short"			// person being dragged
	}

	"drag_end"
	{
		"userid"	"short"			// person doing the dragging
		"subject"	"short"			// person being dragged
	}

	"player_incapacitated"				// when a player becomes incapacitated
	{
		"userid"	"short"			// person who became incapacitated
		"attacker"	"short"	 		// user ID who made us incapacitated
		"attackerentid"	"long"	 		// if attacker not player, entindex of who made us incapacitated
		"weapon"	"string" 		// weapon name attacker used 
		"type"		"long"			// damage type
		"has_upgrade"	"bool"			// does this player have an upgrade that lets them help themselves? 
	}
	
	"player_incapacitated_start"	// when a player is about to become incapacitated, so you can see his last living state
	{
		"userid"	"short"			// person who became incapacitated
		"attacker"	"short"	 		// user ID who made us incapacitated
		"attackerentid"	"long"	 	// if attacker not player, entindex of who made us incapacitated
		"weapon"	"string" 		// weapon name attacker used 
		"type"		"long"			// damage type
	}

	"player_entered_start_area"		// when a player spawns into the player start area
	{
		"userid"	"short"			// person who entered
	}

	"player_first_spawn"			// when a player spawns for the first time in a given mission
	{
		"userid"	"short"			// person who spawned
		"map_name"	"string"
		"isbot"		"bool"
	}

	"player_left_start_area"		// when a player leaves the player start area
	{
		"userid"	"short"			// person who left
	}

	"player_entered_checkpoint"		// when a basecombatcharacter enters a checkpoint area
	{
		"userid"	"short"			// player who entered
		"entityid"	"long"			// If not a player, the entity index of the one entering
		"door"		"long"			// Entindex of the checkpoint door the player entered to get here.
		"area"		"long"
		"doorname"	"string"		// name of the entity they see
	}

	"player_left_checkpoint"		// when a player leaves a checkpoint area
	{
		"userid"	"short"			// player who left
		"entityid"	"long"			// If not a player, the entity index of the one exiting
		"area"		"long"
	}

	"player_shoved"
	{
		"userid"	"short"   	// player index who was shoved
		"attacker"	"short"	 	// player index who attacked them
	}

	"player_stunned"
	{
		"userid"		"short"   	// player index who was stunned
		"attacker"		"short"	 	// player index of last attacker
		"damagetype"	"long"		// last damage type
	}
	
	"entity_shoved"
	{
		"entityid"	"short"   	// the entity index of the one ewho was shoved
		"attacker"	"short"	 	// player index who attacked them
	}
	
	"player_jump_apex"
	{
		"userid"	"short"			// player who jumped
	}
	
	"player_blocked"
	{
		"userid"	"short"   	// player index who was trying to move
		"blocker"	"short"	 	// player index who kept them from moving
	}
	
	"player_now_it"
	{
		"userid"	"short"		// Player who is now it
		"attacker"	"short"		// player that did the it-ing
		"exploded"	"bool"		// whether it was vomit or explosion
		"infected"	"bool"		// is the vomit infectious
	}

	"player_no_longer_it"
	{
		"userid"	"short"		// Player who is now no longer it
	}

	"witch_harasser_set"
	{
		"userid"	"short"		// Player who woke up the witch
		"witchid"	"long"		// Entindex of witch woken up
	}
	
	"witch_spawn"
	{
		"witchid"	"long"		// Entindex of witch spawning right now.
	}

	"witch_killed"
	{
		"userid"	"short"		// Player who killed the witch
		"witchid"	"long"		// Entindex of witch that was killed.
		"oneshot"	"bool"      // TRUE if the Witch was killed with one shot
	}
	
	"tank_spawn"
	{
		"userid"	"short"		// User ID of the tank spawning now
		"tankid"	"long"		// Entindex of tank spawning right now.
	}

	"melee_kill"
	{
		"userid"	"short"		// Player who bashed the infected
		"entityid"	"long"		// Entindex of infected what got killed
		"ambush"	"bool"		// Infected was unaware when killed
	}

	"area_cleared"
	{
		"userid"	"short"			// person who cleared the area
		"area"		"long"			// id of the cleared area
	}

	"award_earned"
	{
		"userid"	"short"			// player who earned the award
		"entityid"	"long"			// client likes ent id
		"subjectentid"	"long"			// entity id of other party in the award, if any
		"award"		"short"			// id of award earned
	}

	"tongue_grab"
	{
		"userid"	"short"			// player who did the grabbing
		"victim"	"short"			// player that got grabbed
	}

	"tongue_broke_bent"
	{
		"userid"	"short"			// Tongue owner
	}

	"tongue_broke_victim_died"
	{
		"userid"	"short"			// Tongue owner
	}
 
	"tongue_release"
	{
		// Fired in all cases where the tongue releases a victim, whether choked or not, etc.
		"userid"	"short"			// The tongue owner
		"victim"	"short"			// The (now released) victim
		"distance"	"long"			// Distance the victim was dragged.
	}
	
	"choke_start"	
	{
		"userid"	"short"			// The choker
		"victim"	"short"			// The person being choked
		"reached_owner"	"bool"			// Has victim reached the Smoker that's pulling him?
		"has_upgrade"	"bool"			// Does the victim have an upgrade to help themeselves with?
	}
	
	"choke_end"	
	{
		"userid"	"short"			// The choker
		"victim"	"short"			// The person being choked
	}

	"choke_stopped"
	{
		"userid"	"short"			// Who stopped it
		"victim"	"short"			// And who was being choked	
	}
	
	"tongue_pull_stopped"
	{
		"userid"	"short"			// Who stopped it
		"victim"	"short"			// And who was being pulled	
	}
	
	"lunge_shove"
	{
		"userid"	"short"			// player who did the lunging
		"victim"	"short"			// player that got lunged
	}
	
	"lunge_pounce"
	{
		"userid"	"short"			// player who did the lunging
		"victim"	"short"			// player that got lunged
		"damage"	"short"			// Damage dealt by pounce
		"distance"	"long"			// Distance from pounce start to contact
		"has_upgrade"	"bool"			// Does the victim have an upgrade to help themeselves with?
	}
	
	"pounce_end"
	{
		"userid"	"short"			// Who stopped it
		"victim"	"short"			// And who was being pounced
	}
	
	"pounce_stopped"
	{
		"userid"	"short"			// Who stopped it
		"victim"	"short"			// And who was being pounced
	}
	
	"fatal_vomit"
	{
		"userid"	"short"			// Who vomited
		"victim"	"short"			// And who was killed or incapped
	}
	
	"survivor_call_for_help"
	{
		"userid"	"short"			// The actual player entity who is awaiting rescue.
		"subject"	"long"			// SurvivorRescue entity representing the player who needs to be rescued from the closet (used for position)
	}
	
	"survivor_rescued"
	{
		"rescuer"	"short"			// player that did the rescuing
		"victim"	"short"			// the survivor being rescued
	}
	
	"survivor_rescue_abandoned"
	{
	}
	
	"relocated"
	{
		"userid"	"short"			// player who was relocated
	}

	"respawning"
	{
		"userid"	"short"			// player who started respawning
	}

	"tank_frustrated"
	{
		"userid"	"short"			// player who was culled
	}

	"weapon_given"
	{
		"userid"		"short"			// player who got the weapon
		"giver"			"short"			// player that did the giving
		"weapon"		"short"			// weapon id given
		"weaponentid"	"short"			// weapon entity id 
	}
	
	"weapon_give_duplicate_fail"
	{
		"userid"	"short"			// player who almost got the weapon
		"giver"		"short"			// player that tried to give it
		"weapon"	"short"			// weapon id given
	}
	
	"break_breakable"	// Override from gameevents.res
	{
		"userid"	"short"	// userid of breaker
		"entindex"	"long"  // entindex of thing breaking
		"material"	"byte"	// BREAK_GLASS, BREAK_WOOD, etc
		"hulkonly"  "bool" // SF_BREAK_HULK_ONLY
	}
	
	"achievement_earned"
	{
		"player"	"byte"		// entindex of the player
		"achievement"	"short"		// achievement ID
	}

	"spec_target_updated"
	{
	}

	"spawner_give_item" // A spawner has given a player an item (weapon, pills, ammo, health kit, etc)
	{
		"userid"	"short"		// Item recipient
		"item"		"string"	// Name of item given
		"spawner"	"long"		// entindex of the spawner entity
	}

	"create_panic_event"	// A panic event has been created, though not necessarily started
	{
		"userid"	"short"			// player who was started the panic
	}
	
	"explain_pills"
	{
		"subject"	"long"		// The weapon_pain_pills spawner that will be indicated
	}
	"explain_weapons"
	{
		"subject"	"long"		// The weapon_pain_pills spawner that will be indicated
	}

	"entity_visible"
	{
		"userid"	"short"		// The player who sees the entity
		"subject"	"long"		// Entindex of the entity they see
		"classname"	"string"	// Classname of the entity they see
		"entityname" "string"	// name of the entity they see
	}

	"boomer_near"
	{
		"userid"	"short"		// The boomer 
		"victim"	"short"		// The survivor whom the boomer has gotten very close to
	}
	
	"explain_pre_radio"				// explain the rescue radio will remind you to ready for the finale
	{
		"userid"	"short"
		"subject"	"long"		
	}
	
	"started_pre_radio"				// explain the rescue radio will remind you to ready for the finale
	{
		"userid"	"short"
		"subject"	"long"		
	}

	"explain_radio"				// explain the rescue radio will start the finale
	{
		"userid"	"short"
		"subject"	"long"		
	}
	
	"explain_gas_truck"				// explain how pulling the lever on the gas truck will start the finale
	{
		"userid"	"short"
		"subject"	"long"		// The lever	
	}

	"explain_panic_button"			// explain that pressing this button will start a panic event.
	{
		"userid"	"short"
		"subject"	"long"		// The panic button
	}

	"explain_elevator_button"		// explain how to operate the hospital elevator button.
	{
		"userid"	"short"
		"subject"	"long"		// The button
	}

	"explain_lift_button"			// explain how to operate the lift button.
	{
		"userid"	"short"
		"subject"	"long"		// The lift button
	}
	
	"explain_church_door"			// explain how to provoke the crazy church guy.
	{
		"userid"	"short"
		"subject"	"long"		// The saferoom door
	}
	
	"explain_emergency_door"			// explain how to open the emergency door.
	{
		"userid"	"short"
		"subject"	"long"		// The door
	}
		"explain_crane"			// explain how to lower the box on the crane.
	{
		"userid"	"short"
		"subject"	"long"		// The lever/button
	}
	"explain_bridge"			// explain how to close the gates to make a bridge.
	{
		"userid"	"short"
		"subject"	"long"		// The button
	}
	
	
	"explain_howitzer"			// explain how to fire the howitzer.
	{							// map l4d_garage01_alleys
		"userid"	"short"
		"subject"	"long"		// The howitzer lever
	}
	
	"explain_generator_button"		// explain how to power up the lift part 1
	{								// map l4d_garage01_lots
		"userid"	"short"
		"subject"	"long"			// generator button
	}
	
	"explain_lift_lever"			// explain how to power up the lift part 2
	{								// map l4d_garage01_lots
		"userid"	"short"
		"subject"	"long"			// lift lever
	}
	
	"explain_repair_generator"		// explain how to power up the lift part 3
	{								// map l4d_garage01_lots
		"userid"	"short"
		"subject"	"long"			// generator button
	}	

	"explain_gas_can_panic"			// explain how to shoot the gas can.
	{
		"userid"	"short"
		"subject"	"long"		// The gas can
	}
	
	"explain_van_panic"			// explain how to start the van.
	{
		"userid"	"short"
		"subject"	"long"		// The van
	}
	
	"explain_mainstreet"			// explain how to lower the forklift
	{
		"userid"	"short"
		"subject"	"long"		// The forklift
	}

	"explain_train_lever"			// explain how to operate the train lever.
	{
		"userid"	"short"
		"subject"	"long"		// The lever on box car
	}
	
	"explain_train_boss"	
	{
		"userid"	"short"
		"subject"	"long"		
	}
	
	"explain_train_exit" 	// Someone tried to exit the tank train car before the tank was dead.
	{
		"userid"		"short"
		"subject"		"long"
	}
		
	"explain_freighter"				// explain how to start the freighter survival map
	{								// map l4d_sv_freighter
		"userid"	"short"
		"subject"	"long"			// generator button
	}	
	
	"explain_highrise_finale2"		
	{
		"userid"	"short"
		"subject"	"long"		
	}
	
	"explain_start_generator"	
	{							
		"userid"	"short"		
		"subject"	"long"		
	}	
	"explain_start_generator2"	
	{							
		"userid"	"short"		
		"subject"	"long"		
	}
	
	"explain_bridge_button"		
	{							
		"userid"	"short"		
		"subject"	"long"		
	}
	
	"explain_restart_generator"	
	{							
		"userid"	"short"		
		"subject"	"long"		
	}
	
	"finale_elevator_ready"
	{
	}
	
	"finale_bridge_ready"
	{
	}

	"explain_disturbance"		// explain that disturbances (car alarm) attract infected horde
	{
		"userid"	"short"
		"subject"	"long"		// The source of disturbance
	}

	"use_target"				// a new use target has been found
	{
		"targetid"	"long"		// Entindex of the use target
		"classname"	"string"	// classname of the use target
		"isprop"	"bool"		// is this a prop that can be carried
	}

	"player_use"				// a new use target has been found
	{
		"userid"	"short"		// userid of user
		"targetid"	"long"		// Entindex of the used entity
	}

	"friendly_fire"
	{
		"attacker"	"short"		// player who fired the weapon
		"victim"	"short"		// player who got shot
		"guilty"	"short"		// player who was at fault
		"type"		"long"		// damage type
	}
	
	"gameinstructor_draw"
	{
	}
	
	"gameinstructor_nodraw"
	{
	}
	
	"player_talking_state"
	{
		"player"	"byte"
		"istalking"	"bool"
	}
	
	// client event for player has picked up a weapon
	"weapon_pickup"
	{
		"context"	"byte"	//split screen message context
		"weaponid"	"byte"
		"weaponslot"	"byte"
	}
	
	"hunter_punched"
	{
		"userid"		"short"	// player who caused ignition
		"hunteruserid"	"long"	// user ID of Hunter
		"islunging"		"bool"	// TRUE if the Hunter was in the act of lunging
	}
	
	"hunter_headshot"
	{
		"userid"		"short" // player who made the headshot
		"hunteruserid"	"long"	// user ID of Hunter
		"islunging"		"bool" // TRUE if the Hunter was in the act of lunging
	}

	"zombie_ignited"
	{
		"userid"		"short"  // player who caused ignition
		"entityid"		"long"	 // entity ID of Tank
		"victimname"    "string" // "Witch", "Tank", "Hunter", "Smoker", or "Infected"
	}
	
	"boomer_exploded"
	{
		"userid"		"short"   	// Boomer that exploded
		"attacker"		"short"		// player who caused the explosion
		"splashedbile"	"bool"		// Exploding boomer splashed bile on Survivors
	}
	
	"non_pistol_fired"				
	{
		"userid"		"short"   	// User that fired a non-pistol weapon
	}

	"non_shotgun_fired"				
	{
		"userid"		"short"   	// User that fired a non-pistol weapon
	}

	
	"explosive_thrown"				
	{
		"userid"		"short"   	// User that fired a non-pistol weapon
		"weaponid"		"short"		// Type of weapon thrown
	}
	
	// This is networked, special event for game instructor
	"weapon_fire_at_40"
	{
		"userid"	"short"
		"weapon"	"string" 	// used weapon name
		"weaponid"	"short"		// used weapon ID
		"count"		"short"		// number of bullets
	}

	// Abbreviated version of 'player_hurt' that is networked
	"player_hurt_concise"
	{
		"userid"		"short"		// user ID who was hurt
		"attackerentid"	"long"		// entity id who attacked, if attacker not a player, and userid therefore invalid
		"dmg_health"	"short"		// damage done to health
	}
    
	"tank_killed"
	{
		"userid"	"short"   	// user ID of dead tank
		"attacker"	"short"	 	// user id of killer
		"solo"		"bool"		// TRUE if a player single-handedly killed the Tank
	}    
	
	// Used for a notification message when an achievement fails to write
	"achievement_write_failed"
	{
	}	

	// Used for clients to know how long until they become a ghost (and can spawn)
	"ghost_spawn_time"
	{
		"userid"		"short"   	// user ID of the player that is becoming a ghost
		"spawntime"		"short"		// How long of a wait until player is a ghost
	}		

	// Used to know when we elapse 30 minutes on a survival map
	"survival_at_30min"
	{
	}			
	
	// Sent when a versus round is over
	"versus_final_score"
	{
		"zombiescore"	"short"
		"survivorscore"	"short"
	}
	
	// DLC 3 Achievments
 	"generator_started"
 	{
 	}
 	
 	"infected_explosive_barrel_kill"
 	{
 		"userid"	"short"		// the player that initiated the barrel explosion, through explosion dmg or resulting burn
 	}	
 	
 	"player_begin_sacrifice_run"
 	{
 		"userid"	"short"		// player that jumps off the bridge to sacrifice him/herself
 	}
 	
 	"player_complete_sacrifice"
 	{
 		"userid"	"short"		// player that successfully restarts the generator and dies
 	}
}

