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
				YellowTricksSome,
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
				YellowTricksSome,
				AccessibilityLevel.SequenceBreak
			),
			All(
				IBJDisabled,
				YellowTricksAll,
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
				YellowTricksSome,
				AccessibilityLevel.SequenceBreak
			),
			All(
				IBJDouble,
				YellowTricksAll,
				AccessibilityLevel.SequenceBreak
			)
		),
		CanBomb
	)
end

function CanSuperJumpMorphExtend()
	return Any(
		All(
			CanSuperJumpMedium,
			CanMorphExtendMedium
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
		CanMovementSimple
	)
end
function CanBeamBlockThroughFanTunnel()
	return Any(
		WaveBeam,
		CanPowerBomb,
		CanMovementSimple
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
			CanKnowledgeSimple
		)
	)
end

function CanSpiderBoostThroughPitfalls()
	return All(
		CanKnowledgeSimple,
		CanSpiderBoost
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
		CanSuperJumpBeginner
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
		CanSuperJumpEasy
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
		CanSuperJumpEasy
	)
end

function CanHighSuperJump()
	return All(
		CanSuperJumpBeginner,
		HighJumpBoots
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
		CanSuperJumpEasy,
		CanFlyVertical,
		All(
			HighJumpBoots,
			CanIBJDouble
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
		CanWallJumpSimple,
		CanAlmostHighLedge
	)
end
function CanShortShaft()
	return Any(
		CanHighLedge,
		CanWallJumpSimple
	)
end
function CanClimbShaft()
	return Any(
		CanClimbWall,
		CanWallJumpSimple
	)
end
function CanClimbElevatedShaft()
	return Any(
		CanSpider,
		All(
			CanClimbShaft,
			Any(
				CanHighJumpNoGrip,
				CanSuperJumpEasy
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
		CanDamageBoostStatic
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
			CanKnowledgeSimple,
			CanBeamBurst
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

-- Tricks
function CanKnowledgeSimple()
	return Any(
		KnowledgeSimple,
		All(
			KnowledgeDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanWallJumpSimple()
	return Any(
		WallJumpSimple,
		All(
			WallJumpDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanWallJumpIntermediate()
	return Any(
		WallJumpIntermediate,
		All(
			WallJumpSimple,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		),
		All(
			WallJumpDisabled,
			YellowTricksAll,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanSuperJumpBeginner()
	return Any(
		SuperJumpBeginner,
		All(
			SuperJumpDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanSuperJumpEasy()
	return Any(
		SuperJumpEasy,
		All(
			SuperJumpBeginner,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		),
		All(
			SuperJumpDisabled,
			YellowTricksAll,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanSuperJumpMedium()
	return Any(
		SuperJumpMedium,
		All(
			SuperJumpEasy,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		),
		All(
			SuperJumpDisabled,
			YellowTricksAll,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanMorphExtendEasy()
	return Any(
		MorphExtendsEasy,
		All(
			MorphExtendsDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanMorphExtendMedium()
	return Any(
		MorphExtendsMedium,
		All(
			MorphExtendsEasy,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		),
		All(
			MorphExtendsDisabled,
			YellowTricksAll,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanDamageBoostStatic()
	return Any(
		DamageBoostStatic,
		All(
			DamageBoostDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end

function CanMovementSimple()
	return Any(
		MovementSimple,
		All(
			MovementDisabled,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		)
	)
end
function CanMovementIntermediate()
	return Any(
		MovementIntermediate,
		All(
			MovementSimple,
			YellowTricksSome,
			AccessibilityLevel.SequenceBreak
		),
		All(
			MovementDisabled,
			YellowTricksAll,
			AccessibilityLevel.SequenceBreak
		)
	)
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
				CanDamageBoostStatic,
				CanKnowledgeSimple
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
				CanMovementSimple
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
				CanWallJumpSimple
			),
			CanWallJumpIntermediate
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
				CanSuperJumpEasy,
				Any(
					CanMovementSimple,
					CanDamageBoostStatic
				)
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
		CanDamageBoostStatic
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
			CanWallJumpSimple
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
			CanWallJumpSimple,
			Any(
				HighJumpBoots,
				CanSuperJumpBeginner,
				CanMorphExtendEasy
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
			CanSuperJumpEasy
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
				CanWallJumpIntermediate,
				CanSpider
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
				CanWallJumpSimple
			),
			Any(
				CanSuperJumpBeginner,
				CanMorphExtendEasy
			)
		)
	)
end
function CanClimbNestNetworkTunnels()
	return All(
		ScrewAttack,
		Any(
			HighJumpBoots,
			CanWallJumpSimple,
			CanSuperJumpEasy
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
