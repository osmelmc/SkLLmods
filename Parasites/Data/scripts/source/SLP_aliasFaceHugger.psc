Scriptname SLP_aliasFaceHugger extends ReferenceAlias  

; Effect
; Chance of removal if hit

SLP_fcts_parasites Property fctParasites  Auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	Actor kPlayer= Game.GetPlayer() as Actor

	If (akTarget == kPlayer)

		; 	debug.trace(self + "Dismissing follower because he is now attacking the player")

	    if (aeCombatState == 0)
	      	; Debug.Trace("We have left combat with the player!")

			If (Utility.RandomInt(0,100)>80)
				;

			EndIf
	    elseif (aeCombatState == 1)
	      	; Debug.Trace("We have entered combat with the player!")

			If (Utility.RandomInt(0,100)>20)
				; 

			EndIf

	    elseif (aeCombatState == 2)
	      	; Debug.Trace("We are searching for the player...")

			If (Utility.RandomInt(0,100)>50)
				; 

			EndIf

	    endIf

	EndIf


EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Actor kPlayer = Game.GetPlayer()

	If (akAggressor != None)
		;  Debug.Trace("We were hit by " + akAggressor)
		; Debug.Notification("." )

		If (Utility.RandomInt(0,100)>98)  
			Debug.Trace("[SLP_aliasFaceHugger] Cure Face or Hip Hugger" )
 
			if (fctParasites.isInfectedByString( kPlayer,  "FaceHugger" ))
				Debug.MessageBox("The creature releases its grip around your hips under the violence of the attack." )
 				fctParasites.cureFaceHugger( kPlayer )

			elseif (!fctParasites.isInfectedByString( kPlayer,  "FaceHuggerGag" ))
				Debug.MessageBox("The creature releases its grip around your face under the violence of the attack." )
				fctParasites.cureFaceHuggerGag( kPlayer )
			endif			
		endif
	EndIf

EndEvent