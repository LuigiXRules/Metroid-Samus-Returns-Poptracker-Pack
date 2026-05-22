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
		IBJDouble,
		CanBomb
	)
end
function CanIBJVertical()
	return All(
		IBJVertical,
		CanBomb
	)
end
function CanIBJDiagonal()
	return All(
		IBJDiagonal,
		CanBomb
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
		MovementSimple
	)
end
function CanBeamBlockThroughFanTunnel()
	return Any(
		WaveBeam,
		CanPowerBomb,
		MovementSimple
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
			KnowledgeSimple
		)
	)
end

function CanSpiderBoostThroughPitfalls()
	return All(
		KnowledgeSimple,
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

function CanHighJump()
	return Any(
		HighJumpBoots,
		CanFlyVertical,
		CanIBJDouble
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
function CanUnderwaterHighJump()
	return Any(
		All(
			GravitySuit,
			CanHighJump
		),
		CanSpiderBoostUnderwater
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

function CanShortShaft()
	return Any(
		CanHighLedge,
		WallJumpSimple
	)
end
function CanClimbShaft()
	return Any(
		CanClimbWall,
		WallJumpSimple
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
function CanDamageMetroid()
	return Any(
		MissileLauncher,
		SuperMissile,
		CanBeamBurst,
		IceBeam
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
		DamageBoostStatic
	)
end
function CanFleechSwarm()
	return Any(
		LightningArmor,
		GravitySuit
	)
end

function CanCombatOmega()
	return All(
		CanDamageMetroid,
		SpaceJump,
		MorphBall
	)
end

function OpenChargeDoor()
	return Any(
		ChargeBeam,
		All(
			KnowledgeSimple,
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

-- Region specific
-- Surface
function CanEscapeCavernCavity()
	return CanClimbShaft()
end
function CanEscapeEnergyRechargeShaft()
	return CanHighLedge()
end
function CanEscapeChargeChamber()
	return Any(
		All(
			CanHighLedge,
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
			CanThorns
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
		CanHighJump
	)
end
function CanEscapeInnerTempleWestHall()
	return Any(
		CanClimbWall,
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
	return All(
		CanHighLedge,
		CanBombBlock
	)
end

function CanEscapeWaveChamber()
	return Any(
		CanHighJump,
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
	return CanClimbWall()
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

function CanEscapeTransportAccess()
	return Any(
		CanSpider,
		All(
			CanShortShaft,
			CanThorns
		)
	)
end

-- Area 3
function CanClimbAscendingAlleyway()
	return All(
		CanAnyMissile,
		Any(
			GrappleBeam,
			CanFlyVertical
		),
		MorphBall
	)
end
function CanGrappleTunnel()
	return Any(
		GrappleBeam,
		CanFlyVertical
	)
end

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
	return CanGrappleTunnel()
end

-- Area 4
function CanCrossPurplePuddle()
	return Any(
		SpaceJump,
		CanSpider,
		DamageBoostStatic -- may need to be fixed?
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
		CanHighJump,
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
		CanHighLedge
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
				KnowledgeSimple
			)
		)
	)
end
function CanEscapeEvolvedGamma()
	return CanHighLedge()
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
				WallJumpSimple
			),
			WallJumpIntermediate
		)
	)
end
-- function CanGripJumptoInteriorGammaAccess(?)
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
	return CanHighJump()
end
function CanEscapeGravityChamberAccess()
	return Any(
		HighJumpBoots,
		GravitySuit,
		CanSpider
	)
end
function CanEscapeGravityChamber()
	return Any(
		HighJumpBoots,
		GravitySuit,
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
	return Any(
		CanSpider,
		All(
			GravitySuit,
			CanHighLedge
		)
	)
end
function CanEscapeEvolvedZetaArena()
	return CanHighJump()
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
			WallJumpSimple
		)
	)
end
function CanCombatDiggernaut()
	return All(
		Any(
			MissileLauncher,
			SuperMissile,
			CanBeamBurst
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
			HighJumpBoots,
			WallJumpSimple
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
				CanSpider
			)
		)
	)
end
function CanEscapeSpiderBoostTunnelSWater()
	return Any(
		HighJumpBoots,
		GravitySuit,
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
		CanDamageMetroid,
		CanSpider,
		Any(
			SpaceJump,
			CanSpiderBoost
		)
	)
end

function CanClimbNestNetwork()
	return CanClimbWall()
end
function CanClimbNestNetworkTunnels()
	return All(
		ScrewAttack,
		Any(
			HighJumpBoots,
			WallJumpSimple
		)
	)
end
function CanClimbNestNodule()
	return CanShortShaft()
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
				ScrewAttack
			),
			MetroidHatchling
		)
	)
end
