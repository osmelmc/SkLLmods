;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SLS_TIF_SellMilk4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Actor pActor =  SexLab.PlayerRef
ActorBase pActorBase = pActor.GetActorBase()
; Game.GetPlayer().RemoveItem(Milk, 1)

Debug.Notification( "Leonara opens your top excitedly..." )

CowLife.PlayerReceivedCowharness()

Game.GetPlayer().AddItem(Gold, ( (pActorBase.GetWeight() as Int) + 10 )  )

MilkProduced.SetValue( 1 )
MilkProducedTotal.SetValue( MilkProducedTotal.GetValue() + 1 )

CowCount.SetValue( CowCount.GetValue() + 1 )

	Float fBreastScale = StorageUtil.GetFloatValue(none, "_SLH_fBreast") 
	StorageUtil.SetFloatValue(none, "_SLH_fBreast",  fBreastScale * 0.6) 
	StorageUtil.SetIntValue(none, "_SLH_iForcedRefresh", 1) 

Utility.Wait(1.0)

If  (SexLab.ValidateActor( SexLab.PlayerRef ) > 0) &&  (SexLab.ValidateActor(akSpeaker) > 0) 

	SexLab.QuickStart(akSpeaker, SexLab.PlayerRef, AnimationTags = "Breast")
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property Milk  Auto  

MiscObject Property Gold  Auto  

SexLabFramework Property SexLab  Auto  

GlobalVariable Property MilkProduced  Auto  

GlobalVariable Property MilkProducedTotal  Auto  

SLS_QST_CowLife Property CowLife Auto

GlobalVariable Property CowCount  Auto  