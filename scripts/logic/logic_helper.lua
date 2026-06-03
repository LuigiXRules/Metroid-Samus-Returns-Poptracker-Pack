local CachedValues = {}
function InvalidateCache()
	CachedValues = {}
end

-- Individual items
-- function HasDna() return MetroidDNA

-- General

function CanBomb()
	return All(
		MorphBall,
		Bomb
	)
end
function CanPowerBomb()
	return All(
		MorphBall,
		PowerBomb
	)
end
function CanBombBlock()
	return Any(
		CanBomb,
		CanPowerBomb
	)
end

function CanIBJDouble()
	return All(
		Any(
			IBJDouble,
			All(
				IBJDisabled,
				AccessibilityLevel.SequenceBreak
			)
		),
		CanBomb
	)
end
function CanIBJVertical()
	return All(
		Any(
			IBJVertical,
			All(
				IBJDouble,
				AccessibilityLevel.SequenceBreak
			)
		),
		CanBomb
	)
end
function CanIBJDiagonal()
	return All(
		Any(
			IBJDiagonal,
			All(
				IBJVertical,
				AccessibilityLevel.SequenceBreak
			)
		),
		CanBomb
	)
end

function CanSuperJumpMorphExtend()
	return Any(
		All(
			SuperJumpMedium,
			MorphExtendsMedium
		),
		All(
			AccessibilityLevel.SequenceBreak,
			Any(
				SuperJumpEasy,
				MorphExtendsEasy
			)
		)
	)
end

function CanBeamBurst()
	return All(
		BeamBurst,
		Any(
			WaveBeam,
			SpazerBeam,
			PlasmaBeam
		)
	)
end
function CanBeamBlockThroughTunnel()
	return Any(
		WaveBeam,
		CanBombBlock,
		MovementSimple,
		All(
			MovementDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanBeamBlockThroughFanTunnel()
	return Any(
		WaveBeam,
		CanPowerBomb,
		MovementSimple,
		All(
			MovementDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanSpider()
	return All(
		MorphBall,
		SpiderBall
	)
end
function CanSpiderBoost()
	return All(
		MorphBall,
		SpiderBall,
		PowerBomb
	)
end
function CanSpiderBoostUnderwater()
	return All(
		CanSpiderBoost,
		Any(
			GravitySuit,
			KnowledgeSimple,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanSpiderBoostThroughPitfalls()
	return Any(
		All(
			KnowledgeSimple,
			CanSpiderBoost
		),
		All(
			KnowledgeDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanCrossPitfallBridge()
	return Any(
		PhaseDrift,
		CanSpiderBoostThroughPitfalls
	)
end
function CanFlyVertical()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanIBJVertical
	)
end
function CanFlyVerticalUnderwater()
	return Any(
		CanSpiderBoostUnderwater,
		All(
			GravitySuit,
			CanFlyVertical
		)
	)
end
function CanFly()
	return Any(
		SpaceJump,
		CanIBJDiagonal
	)
end
function CanClimbWall()
	return Any(
		CanSpider,
		CanFlyVertical
	)
end
function CanClimbWallUnderwater()
	return Any(
		CanSpider,
		All(
			GravitySuit,
			CanFlyVertical
		)
	)
end

function CanHighJumpNoGrip()
	return Any(
		HighJumpBoots,
		CanFlyVertical,
		CanIBJDouble
	)
end
function CanHighJump()
	return Any(
		CanHighJumpNoGrip,
		CanSuperJumpMorphExtend
	)
end
function CanHighLedge()
	return Any(
		CanSpider,
		CanHighJump
	)
end
function CanHighUnderwaterLedge()
	return Any(
		CanSpider,
		All(
			GravitySuit,
			CanHighJump
		)	
	)
end

function CanAlmostHighJump()
	return Any(
		CanHighJump,
		SuperJumpBeginner,
		All(
			SuperJumpDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanAlmostHighLedge()
	return Any(
		CanAlmostHighJump,
		CanSpider
	)
end
function CanAlmostHighJumpGap()
	return Any(
		CanHighJump,
		SuperJumpEasy,
		All(
			SuperJumpBeginner,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanUnderwaterAlmostHighJump()
	return Any(
		All(
			GravitySuit,
			CanAlmostHighJump
		),
		CanSpiderBoostUnderwater
	)
end
function CanUnderwaterAlmostHighLedge()
	return Any(
		All(
			GravitySuit,
			CanAlmostHighJump
		),
		CanSpider
	)
end
function CanJumpUnderwater()
	return Any(
		HighJumpBoots,
		GravitySuit,
		SuperJumpEasy,
		All(
			SuperJumpBeginner,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanHighSuperJump()
	return Any(
		All(
			SuperJumpBeginner,
			HighJumpBoots
		),
		All(
			SuperJumpDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanHighSuperJumporClimb()
	return Any(
		CanHighSuperJump,
		CanSpider
	)
end
function CanAlmostHigherJump()
	return Any(
		CanHighSuperJump,
		CanFlyVertical,
		All(
			HighJumpBoots,
			CanIBJDouble
		)
	)
end
function CanAlmostHigherLedge()
	return Any(
		CanAlmostHigherJump,
		CanSpider
	)
end
function CanHigherJump()
	return Any(
		SuperJumpEasy,
		CanFlyVertical,
		All(
			HighJumpBoots,
			CanIBJDouble
		),
		All(
			SuperJumpBeginner,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanHigherLedge()
	return Any(
		CanHigherJump,
		CanSpider
	)
end

function CanHighBombBlock()
	return Any(
		All(
			CanHighLedge,
			CanBomb
		),
		CanPowerBomb
	)
end
function CanBombBlockNearCeiling()
	return Any(
		All(
			CanSpider,
			CanBombBlock
		),
		All(
			SpaceJump,
			CanPowerBomb
		)
	)
end

function CanShorterShaft()
	return Any(
		WallJumpSimple,
		CanAlmostHighLedge,
		All(
			WallJumpDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanShortShaft()
	return Any(
		CanHighLedge,
		WallJumpSimple,
		All(
			WallJumpDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanClimbShaft()
	return Any(
		CanClimbWall,
		WallJumpSimple,
		All(
			WallJumpDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanClimbElevatedShaft()
	return Any(
		CanSpider,
		All(
			CanClimbShaft,
			Any(
				CanHighJumpNoGrip,
				SuperJumpEasy,
				All(
					SuperJumpBeginner,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end

function CanAnyMissile()
	return Any(
		MissileLauncher,
		SuperMissile
	)
end
function CanDamageToughEnemyRanged()
	return Any(
		CanAnyMissile,
		CanBeamBurst,
		CanPowerBomb
	)
end
function CanDamageToughEnemy()
	return Any(
		CanDamageToughEnemyRanged,
		ScrewAttack
	)
end
function CanBlobthrower()
	return Any(
		CanBeamBurst,
		CanPowerBomb
	)
end
function CanTunnelSteelOrb()
	return Any(
		All(
			CanBeamBurst,
			CanBeamBlockThroughTunnel
		),
		CanPowerBomb
	)
end
function CanThorns()
	return Any(
		LightningArmor,
		DamageBoostStatic,
		All(
			DamageBoostDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanFleechSwarm()
	return Any(
		LightningArmor,
		GravitySuit
	)
end

function OpenChargeDoor()
	return Any(
		ChargeBeam,
		All(
			KnowledgeSimple,
			CanBeamBurst
		),
		All(
			KnowledgeDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function OpenMissileDoor()
	return CanAnyMissile()
end
function OpenSuperDoor()
	return Has(SuperMissile)
end
function OpenPowerBombDoor()
	return CanPowerBomb()
end
function OpenMorphTunnelDoor()
	return Has(MorphBall)
end
function OpenGigadoraDoor()
	return Has(SpazerBeam)
end
function OpenGryncoreDoor()
	return Has(PlasmaBeam)
end
function OpenTaramargaDoor()
	return Has(WaveBeam)
end

-- Combat logic; band-aid solution until I figure out how to do this properly
function CanCombatMetroidNoAmmo()
	return Any(
		IceBeam,
		CanBeamBurst
	)
end
function CanBeamBurstandIceBeam()
	return All(
		IceBeam,
		CanBeamBurst
	)
end
function CanDamageWeakMetroid()
	return Any(
		CanCombatMetroidNoAmmo,
		CanAnyMissile
	)
end
function CanCombatAlpha()
	return Any(
		CanCombatMetroidNoAmmo,
		CanAnyMissile
	)
end
function CanCombatEvolvedAlpha()
	return CanDamageWeakMetroid()
end
function CanCombatGamma()
	return Any(
		CanCombatMetroidNoAmmo,
		CanAnyMissile
	)
end
function CanCombatEvolvedGamma()
	return All(
		CanCombatMetroidNoAmmo,
		Any(
			MissileTank,
			SuperMissile
		)
	)
end

function CanCombatZeta()
	return Any(
		CanCombatMetroidNoAmmo,
		All(
			GrappleBeam,
			CanAnyMissile
		)
	)
end
function CanCombatEvolvedZeta()
	return CanCombatZeta()
end
function CanDodgeOmega()
	return All(
		SpaceJump,
		MorphBall
	)
end
function CanDamageOmegawithMissiles()
	return All(
		CanAnyMissile,
		Any(
			IceBeam,
			PlasmaBeam
		)
	)
end
function CanCombatOmega()
	return All(
		CanDodgeOmega,
		Any(
			CanBeamBurst,
			CanDamageOmegawithMissiles
		),
		Any(
			CanBeamBurstandIceBeam,
			CanPowerBomb,
			CanDamageOmegawithMissiles,
			PlasmaBeam
		)
	)
end
function CanCombatEvolvedOmega()
	return CanCombatOmega()
end

-- Region specific
-- Surface
function CanEscapeCavernCavity()
	return Any(
		CanClimbShaft,
		CanAlmostHighLedge
	)
end
function CanEscapeEnergyRechargeShaft()
	return CanAlmostHighLedge()
end
function CanEscapeChargeChamber()
	return Any(
		All(
			CanAlmostHighLedge,
			OpenMissileDoor
		),
		OpenChargeDoor
	)
end

function CanEscapeTransportArea8()
	return CanClimbShaft()
end
function CanCrossTransportArea8()
	return All(
		MetroidHatchling,
		CanEscapeTransportArea8,
		Any(
			SpaceJump,
			CanSpiderBoost,
			CanThorns,
			CanClimbElevatedShaft
		)
	)
end
function CanCombatRidley()
	return All(
		SpaceJump,
		SpazerBeam,
		PlasmaBeam
	)
end

function HasDNAforGoal()
    return Tracker:ProviderCountForCode("metroiddna") >= Tracker:ProviderCountForCode("dnarequired")
end

function CheckDNAAvailable()
	Tracker:FindObjectForCode("MetroidDNA").MaxCount = Tracker:ProviderCountForCode("dnaavailable")
end
ScriptHost:AddWatchForCode("DNAinPool", "dnaavailable", CheckDNAAvailable)
function CheckDNARequired()
	Tracker:FindObjectForCode("DNARequired").MaxCount = Tracker:ProviderCountForCode("dnaavailable")
end
ScriptHost:AddWatchForCode("DNANeeded", "dnaavailable", CheckDNARequired)

-- Area 1
function CanEscapeIceChamberAccess()
	return Any(
		IceBeam,
		CanAlmostHighJump
	)
end
function CanEscapeInnerTempleWestHall()
	return Any(
		CanAlmostHigherLedge,
		CanBombBlock
	)
end

-- Area 2
function CanEscapeArachnusDrop()
	return CanClimbWall()
end
function CanEscapeArachnusLoop()
	return All(
		CanBombBlock,
		Any(
			All(
				SpringBall,
				Bomb
			),
			PowerBomb
		)
	)
end
function CanEscapeCavernsAlphaEast()
	return Any(
		All(
			Any(
				CanHighJumpNoGrip,
				CanSpider
			),
			CanBomb
		),
		CanPowerBomb
	)
end

function CanEscapeDamExteriorWest()
	return Any(
		CanAlmostHighJump,
		CanSpiderBoost
	)
end
function CanEscapeWavetoVaria()
	return CanBeamBlockThroughTunnel()
end
function CanEscapeInteriorTeleporter()
	return CanShortShaft()
end
function CanEscapeHiJumpAccess()
	return CanAlmostHigherLedge()
end
function CanEscapeFleechFireContainment()
	return All(
		CanFleechSwarm,
		CanClimbShaft
	)
end
function CanEscapeInteriorGammaArenatoIntersectionTerminal()
	return All(
		CanAnyMissile,
		CanBombBlock,
		CanSpider
	)
end
function CanEscapeWhimsicalWaterwheels()
	return CanAlmostHighLedge()
end
function CanEscapeTransportAccess()
	return Any(
		CanSpider,
		All(
			CanShorterShaft,
			CanThorns
		)
	)
end

-- Area 3
function CanEscapeFactoryExteriorAccess()
	return Any(
		GrappleBeam,
		CanBlobthrower,
		CanSpider,
		CanFly
	)
end
function CanEscapeFactoryExteriorCrevice()
	return CanClimbWall()
end

function CanEscapeEvolvedAlphaNorthtoGamma()
	return All(
		CanClimbWall,
		CanBombBlock
	)
end
function CanEscapeInteriorGammaArenaSouth()
	return Any(
		GrappleBeam,
		All(
			HighJumpBoots,
			Any(
				CanSuperJumpMorphExtend,
				CanIBJDouble
			)
		),
		CanFlyVertical
	)
end

function CanEscapeParabyPeriphery()
	return CanClimbWall()
end
function CanEscapeFactoryIntersection()
	return CanClimbWall()
end
function CanEscapeRamulkenResidence()
	return CanClimbShaft()
end
function CanEscapeGammaArenaCavernsTransport()
	return All(
		CanEscapeGammaArena,
		CanClimbWall
	)
end
function CanEscapeGammaArena()
	return Any(
		GrappleBeam,
		CanAlmostHighJump,
		CanFlyVertical
	)
end

-- Area 4
function CanCrossPurplePuddle()
	return Any(
		SpaceJump,
		CanSpider,
		DamageBoostStatic, -- may need to be fixed?
		All(
			DamageBoostDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanTraverseTransitTunnel()
	return Any(
		CanSpider,
		CanThorns
	)
end
function CanEscapeEvolvedAlpha()
	return Any(
		CanAlmostHighJump,
		GravitySuit
	)
end
function CanCrossCavesGammaHazards()
	return Any(
		GrappleBeam,
		CanSpiderBoost,
		CanThorns
	)
end

function CanEscapeSpazerChamber()
	return All(
		OpenGigadoraDoor,
		CanAlmostHighLedge
	)
end
function CanEscapePinkCrystals()
	return Any(
		SpaceJump,
		CanIBJVertical,
		All(
			CanSpiderBoost,
			Any(
				DamageBoostStatic,
				KnowledgeSimple,
				All(
					Any(
						DamageBoostDisabled,
						KnowledgeDisabled
					),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end
function CanEscapeEvolvedGamma()
	return CanAlmostHighLedge()
end

function CanEscapeSJChamberTop()
	return CanFlyVertical()
end
function CanEscapeDiggernautTunnelsTop()
	return Any(
		All(
			SpaceJump,
			MorphBall
		),
		CanIBJVertical
	)
end
function CanSJChambertoDiggernautTunnelsMaze()
	return All(
		SuperMissile,
		CanBomb,
		CanSpider,
		CanEscapeDiggernautTunnelsTop
	)
end
function CanEscapeSJChamberBottom()
	return Any(
		CanFlyVertical,
		CanSJChambertoDiggernautTunnelsMaze
	)
end

function CanEscapeDiggernautTunnelsSide()
	return All(
		GrappleBeam,
		CanEscapeSJChamberTop
	)
end
function CanEscapeDiggernautTunnelsBottom()
	return Any(
		CanEscapeDiggernautTunnelsTop,
		CanEscapeDiggernautTunnelsSide
	)
end

function CanEscapeBasaltBasin()
	return All(
		Any(
			SpaceJump,
			CanIBJVertical,
			All(
				CanSpiderBoost,
				MovementSimple
			)
		),
		CanBombBlock
	)
end

-- Area 5
function CanCrossInteriorGammaAccess()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanThorns
	)
end
function CanWallJumptoInteriorGammaAccess()
	return All(
		HighJumpBoots,
		Any(
			All(
				PhaseDrift,
				Any(
					WallJumpSimple,
					All(
						WallJumpDisabled,
						AccessibilityLevel.SequenceBreak
					)
				)
			),
			WallJumpIntermediate,
			All(
				WallJumpSimple,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end
-- function CanGripJumptoInteriorGammaAccess(?)
function CanCrossTowerExteriorBlobthrower()
	return Any(
		CanBlobthrower,
		CanHighJump,
		Any(
			All(
				SuperJumpEasy,
				Any(
					MovementSimple,
					DamageBoostStatic,
					All(
						Any(
							MovementDisabled,
							DamageBoostDisabled
						),
						AccessibilityLevel.SequenceBreak
					)
				)
			),
			All(
				SuperJumpBeginner,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanEscapeLobbyTeleporterEastPickupLeft()
	return All(
		Any(
			CanSpider,
			All(
				GravitySuit,
				CanClimbWall
			),
			CanFlyVertical
		),
		CanBombBlock
	)
end
function CanEscapeLobbyTeleporterEastPickupRight()
	return All(
		MorphBall,
		GrappleBeam
	)
end
function CanEscapePhaseDriftChamber()
	return CanBombBlock()
end

function CanEscapeExteriorZetaArena()
	return CanAlmostHighJump()
end
function CanEscapeGravityChamberAccess()
	return Any(
		CanJumpUnderwater,
		CanSpider
	)
end
function CanEscapeGravityChamber()
	return Any(
		CanJumpUnderwater,
		CanSpiderBoostUnderwater
	)
end
function CanEscapeScrewAttackChamber()
	return All(
		ScrewAttack,
		CanClimbShaft
	)
end

function CanEscapeInteriorSaveStationWater()
	return CanHighUnderwaterLedge()
end
function CanEscapeEvolvedZetaArena()
	return CanAlmostHighJump()
end

-- Area 6
function CanCrossTransporttoArea5()
	return Any(
		HighJumpBoots,
		SpaceJump,
		CanSpider,
		DamageBoostStatic,
		All(
			DamageBoostDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanCrossCrumblingBridge()
	return Any(
		PhaseDrift,
		CanSpiderBoost
	)
end
function CanNavigateHideoutSprawlTunnels()
	return All(
		ScrewAttack,
		SuperMissile,
		GrappleBeam,
		CanBombBlock,
		Any(
			HighJumpBoots,
			ScrewAttack,
			WallJumpSimple,
			All(
				WallJumpDisabled,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end
function CanCombatDiggernaut()
	return All(
		Any(
			PlasmaBeam,
			MissileLauncher,
			All(
				SuperMissile,
				Has(SuperMissileTank, 5)
			)
		),
		MorphBall,
		Bomb,
		SpiderBall,
		SpaceJump
	)
end
function CanCrossSwarmSquare()
	return Any(
		SpaceJump,
		CanSpider,
		CanPowerBomb,
		All(
			CanIBJVertical,
			CanThorns
		)
	)
end
function CanTraversePoisonousTunnel()
	return All(
		CanBombBlock,
		Any(
			LightningArmor,
			CanSpider
		)
	)
end

function CanEscapeChozoSealWBottom()
	return CanHighLedge()
end
function CanEscapeChozoSealE()
	return Any(
		CanClimbWall,
		All(
			Any(
				WallJumpSimple,
				All(
					WallJumpDisabled,
					AccessibilityLevel.SequenceBreak
				)
			),
			Any(
				HighJumpBoots,
				SuperJumpBeginner,
				MorphExtendsEasy,
				All(
					Any(
						SuperJumpDisabled,
						MorphExtendsDisabled
					),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end
function CanEscapeOmegaArena()
	return Any(
		OpenChargeDoor,
		All(
			CanTraversePoisonousTunnel,
			GrappleBeam,
			MorphBall
		)
	)
end
function CanEscapeCrumblingBridgePit()
	return CanBombBlockNearCeiling()
end
function CanEscapeDiggernaut()
	return All(
		CanCombatDiggernaut,
		CanPowerBomb
	)
end
function CanEscapeSwarmSquaretoTransport()
	return Has(GrappleBeam)
end
function CanEscapeDiggernautLoop()
	return All(
		CanEscapeDiggernaut,
		CanFlyVertical,
		CanCrossSwarmSquare,
		CanEscapeSwarmSquaretoTransport
	)
end

-- Area 7
function CanCrossOmegaNorthAccess()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanThorns
	)
end
function CanCrossWallfireWorkstationTop()
	return Any(
		LightningArmor,
		PhaseDrift,
		CanBlobthrower
	)
end
function CanJumpUpWallfireWorkstation()
	return All(
		Any(
			PhaseDrift,
			LightningArmor
		),
		Any(
			HighJumpBoots,
			SpaceJump,
			SuperJumpEasy,
			All(
				SuperJumpBeginner,
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end

function CanEscapeTransporttoArea6Bottom()
	return CanClimbWall()
end

function CanEscapeTransporttoArea6Tunnels()
	return Any(
		CanPowerBomb,
		All(
			CanBombBlock,
			CanClimbShaft
		)
	)
end
function CanEscapeRobotRegimeBottom()
	return Any(
		CanHighJump,
		All(
			CanThorns,
			Any(
				WallJumpIntermediate,
				CanSpider,
				All(
					WallJumpSimple,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end
function CanEscapeSpiderBoostTunnelSWater()
	return Any(
		CanJumpUnderwater,
		CanSpider
	)
end
function CanEscapeEvolvedOmegaArena()
	return Any(
		All(
			CanClimbShaft,
			CanCrossWallfireWorkstationTop
		),
		All(
			ScrewAttack,
			MorphBall
		)
	)
end
function CanEscapeGrapplePuzzleMadness()
	return All(
		MorphBall,
		ScrewAttack,
		CanClimbShaft
	)
end

-- Area 8
function CanCombatMetroidLarva()
	return All(
		IceBeam,
		CanAnyMissile,
		CanBombBlock
	)
end
function CanCombatQueen()
	return All(
		CanSpider,
		Any(
			SpaceJump,
			CanSpiderBoost
		),
		CanBeamBurstandIceBeam,
		Any(
			CanPowerBomb,
			All(
				MissileLauncher,
				Has(MissileTank, 2)
			),
			All(
				SuperMissile,
				Has(SuperMissileTank, 4)
			),
			All(
				MissileLauncher,
				SuperMissile
			) -- Any more combinations would require a major refactoring of the combat logic
		)
	)
end

function CanClimbNestNetwork()
	return Any(
		CanClimbWall,
		All(
			HighJumpBoots,
			Any(
				WallJumpSimple,
				All(
					WallJumpDisabled,
					AccessibilityLevel.SequenceBreak
				)
			),
			Any(
				SuperJumpBeginner,
				MorphExtendsEasy,
				All(
					Any(
						SuperJumpDisabled,
						MorphExtendsDisabled
					),
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end
function CanClimbNestNetworkTunnels()
	return All(
		ScrewAttack,
		Any(
			HighJumpBoots,
			WallJumpSimple,
			SuperJumpEasy,
			All(
				Any(
					WallJumpDisabled,
					SuperJumpBeginner
				),
				AccessibilityLevel.SequenceBreak
			)
		)
	)
end
function CanClimbNestNodule()
	return CanShorterShaft()
end
function CanNavigateMetroidNestShaftWest()
	return All(
		CanCombatMetroidLarva,
		CanHighLedge,
		MorphBall
	)
end

function CanEscapeNestNetworkBottomtoCenter()
	return Any(
		CanClimbNestNodule,
		ScrewAttack
	)
end
function CanEscapeNestNetworkTunnels()
	return Any(
		CanClimbNestNetworkTunnels,
		All(
			Any(
				All(
					OpenMorphTunnelDoor,
					GrappleBeam
				),
				CanThorns
			),
			CanEscapeNestNetworkBottomtoCenter
		)
	)
end
function CanEscapeQueenArena()
	return All(
		CanCombatQueen,
		Any(
			All(
				SpaceJump,
				ScrewAttack,
				CanBombBlock
			),
			MetroidHatchling
		)
	)
end
