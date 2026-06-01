-- Entrance
LabTeleporterW:connect_one_way_entrance(TransportArea6Left, function ()
	return All(
		CanBombBlock,
		Any(
			ScrewAttack,
			CanThorns
		)
	)
end) -- Normal Door
LabTeleporterW:connect_one_way_entrance(RobotRetreatBottom, function ()
	return All(
		Any(
			All(
				CanSpiderBoost,
				CanThorns
			),
			All(
				ScrewAttack,
				Any(
					All(
						CanClimbWall,
						Any(
							SpaceJump,
							All(
								CanAlmostHighJumpGap,
								CanBombBlock
							),
							All(
								CanSpider,
								CanBombBlock
							)
						)
					),
					All(
						MovementSimple,
						GrappleBeam,
						CanSpiderBoost
					)
				)
			)
		),
		Any(
			All(
				MorphBall,
				ScrewAttack,
				Any(
					SpaceJump,
					All(
						HighJumpBoots,
						WallJumpSimple
					)
				)
			),
			All(
				CanBombBlock,
				Any(
					CanClimbWall,
					CanThorns
				)
			)
		),
		Any(
			All(
				ScrewAttack,
				CanClimbShaft,
				Any(
					HighJumpBoots,
					SuperJumpBeginner
				)
			),
			CanPowerBomb
		),
		CanClimbShaft
	)
end)
LabTeleporterW:connect_one_way_entrance(LabTeleporterWPickup, CanSpiderBoost)
GrapplePuzzleMadness:connect_one_way_entrance(TransportArea6Bottom) -- Normal Door
GrapplePuzzleMadness:connect_one_way_entrance(GrapplePuzzleFoyerTop) -- Normal Door
GrapplePuzzleMadness:connect_one_way_entrance(GrapplePuzzleFoyerPrize, function ()
	return All(
		CanEscapeGrapplePuzzleMadness,
		GrappleBeam,
		CanBombBlockNearCeiling,
		CanAnyMissile
	)
end) -- Normal Door
SpiderBoostTunnelSNortheast:connect_one_way_entrance(RobotRegimeLower, function ()
	return All(
		OpenChargeDoor,
		CanEscapeSpiderBoostTunnelSWater
	)
end)
SpiderBoostTunnelSNortheast:connect_one_way_entrance(SpiderBoostTunnelSSoutheast, CanBombBlock)
SpiderBoostTunnelSNortheast:connect_two_ways_entrance(SpiderBoostTunnelSNorthwest, OpenMorphTunnelDoor)
SpiderBoostTunnelSNorthwest:connect_one_way_entrance(RobotRegimeLower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanShortShaft,
		LightningArmor,
		SpringBall,
		MovementIntermediate
	)
end)
SpiderBoostTunnelSNorthwest:connect_one_way_entrance(RobotRegimeTunnels, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam,
		CanSpiderBoost
	)
end)
SpiderBoostTunnelSNorthwest:connect_one_way_entrance(RobotRetreatCenter, OpenChargeDoor)
SpiderBoostTunnelSSoutheast:connect_one_way_entrance(SpiderBoostTunnelSNortheast, function ()
	return Any(
		All(
			CanSpider,
			CanBombBlock
		),
		All(
			CanClimbShaft,
			CanPowerBomb
		)
	)
end)
SpiderBoostTunnelSSoutheast:connect_one_way_entrance(SpiderBoostTunnelSSouthwest, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				CanBomb,
				Any(
					CanSpider,
					MovementSimple
				)
			)
		)
	)
end)
SpiderBoostTunnelSSouthwest:connect_one_way_entrance(SpiderBoostTunnelSSoutheast, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
SpiderBoostTunnelSSouthwest:connect_one_way_entrance(RobotRetreatGrappleBlock, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
SpiderBoostTunnelSSouthwest:connect_one_way(SpiderBoostTunnelSSouthwestPickup, CanPowerBomb)
LabTeleporterEUpper:connect_one_way_entrance(RobotRegimeLower, OpenGryncoreDoor)
-- LabTeleporterEUpper:connect_one_way_entrance(WallfireWorkstationTop) - locked door
LabTeleporterEUpper:connect_one_way_entrance(LabTeleporterELower)
LabTeleporterELower:connect_one_way_entrance(LabTeleporterEUpper, function ()
	return Any(
		ScrewAttack,
		CanAlmostHighLedge
	)
end)
LabTeleporterELower:connect_one_way_entrance(Area7OmegaSAccessRight, OpenGigadoraDoor)
LabTeleporterELower:connect_one_way_entrance(LabTeleporterEBottom, OpenMorphTunnelDoor)
LabTeleporterEBottom:connect_one_way_entrance(LabTeleporterELower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanShorterShaft
	)
end)
LabTeleporterEBottom:connect_one_way_entrance(WallfireWorkstationSaveStation, OpenChargeDoor)
Area7Omega2:connect_one_way_entrance(WallfireWorkstationArena, OpenGigadoraDoor)
Area7Omega2:connect_one_way(Area7Omega2Omega, CanCombatEvolvedOmega)

RobotRegimeLower:connect_one_way_entrance(LabTeleporterEUpper, OpenGryncoreDoor)
RobotRegimeLower:connect_one_way_entrance(SpiderBoostTunnelSNortheast, function ()
	return All(
		OpenChargeDoor,
		CanEscapeSpiderBoostTunnelSWater
	)
end)
RobotRegimeLower:connect_one_way_entrance(SpiderBoostTunnelSNorthwest, function ()
	return All(
		OpenMorphTunnelDoor,
		LightningArmor
	)
end)
RobotRegimeLower:connect_two_ways_entrance(RobotRegimeUpper, CanEscapeRobotRegimeBottom)
RobotRegimeUpper:connect_one_way_entrance(SpiderBoostTunnelNTunnel, function ()
	return All(
		OpenMorphTunnelDoor,
		CanClimbWall
	)
end)
RobotRegimeUpper:connect_one_way(RobotRegimeUpperPickup, function ()
	return All(
		CanClimbShaft,
		GrappleBeam,
		MorphBall
	)
end)
RobotRegimeTunnels:connect_one_way_entrance(SpiderBoostTunnelSNorthwest, CanSpiderBoost)
RobotRegimeTunnels:connect_one_way_entrance(RobotRegimeLower, OpenMorphTunnelDoor)
TransportArea6Transport:connect_one_way_entrance(Area6TransportArea7) -- Elevator
TransportArea6Transport:connect_one_way_entrance(TransportArea6Tunnels, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
TransportArea6Transport:connect_two_ways_entrance(TransportArea6Left, OpenMorphTunnelDoor)
TransportArea6Transport:connect_one_way_entrance(TransportArea6Top, CanShorterShaft)
TransportArea6Top:connect_one_way_entrance(TransportArea6Left)
TransportArea6Top:connect_one_way_entrance(TransportArea6Transport)
-- TransportArea6Top:connect_one_way_entrance(WallfireWorkstationBottom, CanAlmostHigherLedge) - locked door
TransportArea6Top:connect_one_way(TransportArea6TopPickup, function ()
	return All(
		CanAlmostHigherLedge,
		CanAnyMissile
	)
end)
TransportArea6Tunnels:connect_one_way_entrance(TransportArea6Left, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeTransporttoArea6Tunnels
	)
end)
TransportArea6Tunnels:connect_one_way_entrance(TransportArea6Transport, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeTransporttoArea6Tunnels
	)
end)
TransportArea6Tunnels:connect_one_way(TransportArea6TunnelsPickup, function ()
	return All(
		CanEscapeTransporttoArea6Tunnels,
		SuperMissile,
		CanBombBlock,
		Any(
			CanSpider,
			All(
				CanClimbShaft,
				MovementIntermediate
			)
		)
	)
end)
TransportArea6Left:connect_one_way_entrance(TransportArea6Tunnels, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea6Left:connect_one_way_entrance(TransportArea6Top, CanShorterShaft)
TransportArea6Left:connect_two_ways_entrance(TransportArea6Bottom, CanEscapeTransporttoArea6Bottom)
TransportArea6Left:connect_one_way_entrance(LabTeleporterW, CanAlmostHighLedge) -- Normal Door
TransportArea6Left:connect_one_way(TransportArea6LeftPickup, function ()
	return All(
		MetroidHatchling,
		CanBombBlock
	)
end)
TransportArea6Bottom:connect_one_way_entrance(GrapplePuzzleMadness, CanAlmostHighLedge) -- Normal Door
TransportArea6Bottom:connect_one_way(TransportArea6BottomPickup, function ()
	return All(
		CanPowerBomb,
		Any(
			CanSpider,
			PhaseDrift
		)
	)
end)
Area7OmegaSAccessRight:connect_one_way_entrance(LabTeleporterELower, OpenGigadoraDoor)
Area7OmegaSAccessRight:connect_two_ways_entrance(Area7OmegaSAccessCenter, function ()
	return Any(
		ScrewAttack,
		CanThorns
	)
end)
Area7OmegaSAccessCenter:connect_one_way_entrance(Area7OmegaS, CanClimbShaft) -- Normal Door
Area7OmegaSAccessCenter:connect_one_way(Area7OmegaSAccessCenterPickup, CanSpiderBoost)
Area7OmegaS:connect_one_way_entrance(Area7OmegaSAccessCenter) -- Normal Door
Area7OmegaS:connect_one_way_entrance(Area7OmegaSAccessRight, function ()
	return All(
		OpenMorphTunnelDoor,
		CanAnyMissile
	)
end)
Area7OmegaS:connect_one_way(Area7OmegaSOmega, CanCombatOmega)
Area7OmegaN:connect_two_ways_entrance(Area7OmegaNAccessLeft) -- Normal Door
Area7OmegaN:connect_one_way(Area7OmegaNOmega, CanCombatOmega)
Area7OmegaNAccessRight:connect_one_way_entrance(RobotRetreatLeftExit) -- Normal Door
Area7OmegaNAccessRight:connect_two_ways_entrance(Area7OmegaNAccessLeft, CanCrossOmegaNorthAccess)
Area7OmegaNAccessLeft:connect_one_way_entrance(RobotRetreatTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area7OmegaNAccessLeft:connect_one_way(Area7OmegaNAccessLeftPickup, CanPowerBomb)

WallfireWorkstationSaveStation:connect_one_way_entrance(LabTeleporterEBottom, OpenChargeDoor)
WallfireWorkstationSaveStation:connect_two_ways_entrance(WallfireWorkstationBottom, CanPowerBomb)
WallfireWorkstationBottom:connect_one_way_entrance(TransportArea6Top) -- Normal Door
WallfireWorkstationBottom:connect_one_way_entrance(WallfireWorkstationClimb, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighLedge
	)
end)
WallfireWorkstationClimb:connect_one_way_entrance(WallfireWorkstationBottom, OpenMorphTunnelDoor)
WallfireWorkstationClimb:connect_one_way_entrance(WallfireWorkstationTop, function ()
	return All(
		CanClimbWall,
		Any(
			CanDamageToughEnemyRanged,
			CanJumpUpWallfireWorkstation
		)
	)
end)
WallfireWorkstationClimb:connect_one_way(WallfireWorkstationClimbPickup, function ()
	return All(
		CanAnyMissile,
		Any(
			All(
				CanSpider,
				CanDamageToughEnemyRanged
			),
			All(
				MorphBall,
				Any(
					CanDamageToughEnemyRanged,
					CanJumpUpWallfireWorkstation
				)
			)
		)
	)
end)
WallfireWorkstationTop:connect_one_way_entrance(LabTeleporterEUpper) -- Normal Door
WallfireWorkstationTop:connect_one_way_entrance(WallfireWorkstationClimb)
WallfireWorkstationTop:connect_one_way_entrance(WallfireWorkstationArena, function ()
	return All(
		CanCrossWallfireWorkstationTop,
		CanEscapeEvolvedOmegaArena
	)
end)
WallfireWorkstationArena:connect_one_way_entrance(WallfireWorkstationTop, function ()
	return All(
		CanClimbShaft,
		CanCrossWallfireWorkstationTop
	)
end)
WallfireWorkstationArena:connect_one_way_entrance(WallfireWorkstationClimb, function ()
	return All(
		OpenMorphTunnelDoor,
		ScrewAttack
	)
end)
WallfireWorkstationArena:connect_one_way_entrance(Area7Omega2, OpenGigadoraDoor)
GrapplePuzzleFoyerTop:connect_one_way_entrance(GrapplePuzzleMadness) -- Normal Door
GrapplePuzzleFoyerTop:connect_one_way_entrance(Area7TransportArea8) -- Normal Door
GrapplePuzzleFoyerPrize:connect_one_way_entrance(GrapplePuzzleFoyerTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeGrapplePuzzleMadness
	)
end)
RobotRetreatBottom:connect_one_way_entrance(LabTeleporterW) -- Normal Door
RobotRetreatBottom:connect_one_way_entrance(RobotRetreatGrappleBlock, function ()
	return Any(
		CanClimbWall,
		CanClimbElevatedShaft
	)
end)
RobotRetreatGrappleBlock:connect_one_way_entrance(RobotRetreatBottom)
RobotRetreatGrappleBlock:connect_one_way_entrance(RobotRetreatCenter, CanClimbShaft)
RobotRetreatCenter:connect_one_way_entrance(RobotRetreatGrappleBlock)
RobotRetreatCenter:connect_one_way_entrance(SpiderBoostTunnelSNorthwest, OpenChargeDoor)
RobotRetreatCenter:connect_one_way_entrance(RobotRetreatLeftExit, CanClimbShaft)
RobotRetreatLeftExit:connect_one_way_entrance(RobotRetreatCenter)
RobotRetreatLeftExit:connect_one_way_entrance(Area7OmegaNAccessRight) -- Normal Door
RobotRetreatLeftExit:connect_one_way_entrance(RobotRetreatTop, function ()
	return Any(
		CanIBJDouble,
		All(
			CanBombBlock,
			CanSpider
		),
		All(
			CanBombBlock,
			CanShorterShaft
		)
	)
end)
RobotRetreatTop:connect_one_way_entrance(RobotRetreatLeftExit, CanBombBlock)
RobotRetreatTop:connect_two_ways_entrance(SpiderBoostTunnelNPuzzle, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
RobotRetreatTop:connect_one_way_entrance(SpiderBoostTunnelNTunnel, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		CanShortShaft
	)
end)
SpiderBoostTunnelNTunnel:connect_one_way_entrance(RobotRetreatTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanSpiderBoost
	)
end)
SpiderBoostTunnelNTunnel:connect_one_way_entrance(RobotRegimeUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanSpiderBoost,
		Any(
			CanEscapeRobotRegimeBottom,
			MovementSimple
		)
	)
end)
SpiderBoostTunnelNPuzzle:connect_one_way(SpiderBoostTunnelNPuzzlePickup, function ()
	return All(
		MorphBall,
		LightningArmor,
		Any(
			PhaseDrift,
			CanSpiderBoost
		)
	)
end)
Area7TransportArea8:connect_one_way_entrance(GrapplePuzzleFoyerTop, function() return Has(MorphBall) end) -- Normal Door
Area7TransportArea8:connect_one_way_entrance(Area8TransportArea7, function ()
	return All(
		MorphBall,
		CanClimbShaft
	)
end) -- Elevator
