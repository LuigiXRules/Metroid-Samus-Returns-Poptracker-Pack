-- Exterior
TransportArea2Upper:connect_one_way_entrance(TransportAreas1And3Area3) -- Elevator
TransportArea2Upper:connect_one_way_entrance(TransportArea2MiddleLeft)
TransportArea2Upper:connect_one_way_entrance(BeamBurstMain) -- Normal Door
TransportArea2Upper:connect_one_way_entrance(TransportArea4Upper) -- Normal Door
TransportArea2MiddleLeft:connect_one_way_entrance(TransportArea2Upper, CanShorterShaft)
TransportArea2MiddleLeft:connect_one_way_entrance(TransportArea2MiddleRight, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea2MiddleLeft:connect_one_way_entrance(TransportArea4Middle) -- Normal Door
TransportArea2MiddleRight:connect_one_way_entrance(TransportArea2Upper, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea2MiddleRight:connect_one_way_entrance(TransportArea4Lower, function()
	return All(
		OpenMorphTunnelDoor,
		CanBeamBlockThroughTunnel,
		CanAnyMissile
	)
end)
TransportArea2MiddleRight:connect_one_way_entrance(Area3ExteriorEntranceMaze) -- Normal Door
TransportArea2Lower:connect_one_way_entrance(TransportArea2MiddleRight, function()
	return All(
		OpenMorphTunnelDoor,
		CanAnyMissile
	)
end)
TransportArea2Lower:connect_one_way_entrance(TransportArea4Lower) -- Normal Door
TransportArea2Lower:connect_one_way_entrance(Area3ExteriorEntranceMaze) -- Normal Door
TransportArea2Lower:connect_one_way_entrance(TransportArea4Transport) -- Normal Door
Area3ExteriorMaze:connect_one_way_entrance(FactoryExtShaftMiddle, OpenMorphTunnelDoor)
Area3ExteriorMaze:connect_one_way(Area3ExteriorMazePickup, function()
	return All(
		CanBombBlock,
		Any(
			MetroidHatchling,
			All(
				CanPowerBomb,
				CanClimbWall
			)
		),
		Any(
			CanSpiderBoost,
			MovementSimple,
			All(
				MetroidHatchling,
				Any(
					CanSpider,
					MovementSimple
				)
			)
		)
	)
end)

GrappleBeamChamber:connect_one_way_entrance(FactoryExtCrevice, OpenMissileDoor)
GrappleBeamChamber:connect_one_way(GrappleBeamPickup, function ()
	return All(
		MorphBall,
		GrappleBeam
	)
end)
-- FactoryExtTeleporter:connect_one_way_entrance() - not logically relevant?
FactoryExtEntrance:connect_one_way_entrance(FactoryExtAccessExit) -- Normal Door
FactoryExtEntrance:connect_one_way_entrance(FactoryExtPlatform, CanAlmostHighLedge)
-- FactoryExtEntrance:connect_one_way_entrance(FactoryExtTeleporter)
FactoryExtEntrance:connect_one_way(FactoryExtEntrancePickup, function ()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		All(
			CanIBJVertical,
			CanSpider
		)
	)
end)
FactoryExtPlatform:connect_one_way_entrance(FactoryExtEntrance)
FactoryExtPlatform:connect_one_way_entrance(FactoryExtCrevice, CanEscapeFactoryExteriorCrevice)
FactoryExtPlatform:connect_one_way_entrance(FactoryExtTop, function ()
	return Any(
		SpaceJump,
		CanIBJVertical,
		All(
			MovementSimple,
			CanSpiderBoost
		)
	)
end)
FactoryExtCrevice:connect_one_way_entrance(FactoryExtPlatform, CanEscapeFactoryExteriorCrevice)
FactoryExtCrevice:connect_one_way_entrance(GrappleBeamChamber, OpenMissileDoor)
FactoryExtCrevice:connect_one_way_entrance(FactoryExtTop, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			KnowledgeSimple,
			CanAlmostHighLedge
		),
		GrappleBeam,
		CanSpider
	)
end)
FactoryExtTop:connect_one_way_entrance(FactoryExtPlatform)
FactoryExtTop:connect_one_way_entrance(FactoryExtShaftMiddle)
FactoryExtTop:connect_one_way_entrance(TransportFactoryExtE) -- Elevator
FactoryExtShaftMiddle:connect_one_way_entrance(FactoryExtTop, CanHighLedge)
FactoryExtShaftMiddle:connect_one_way_entrance(Area3ExteriorMaze, OpenMorphTunnelDoor)
FactoryExtShaftMiddle:connect_one_way_entrance(FactoryExtShaftBottom)
FactoryExtShaftBottom:connect_one_way_entrance(FactoryExtShaftMiddle, function ()
	return Any(
		CanAlmostHighLedge,
		CanClimbShaft
	)
end)
FactoryExtShaftBottom:connect_one_way_entrance(HalzynHangoutLower) -- Normal Door

Area3ExteriorTransportCavernsW:connect_one_way_entrance(TransportFactoryExtW) -- Elevator
Area3ExteriorTransportCavernsW:connect_one_way_entrance(BeamBurstMain) -- Normal Door
Area3ExteriorTransportCavernsW:connect_one_way(Area3ExteriorTransportCavernsWPickup, CanAnyMissile)
TransportArea4Upper:connect_one_way_entrance(TransportArea4Middle, OpenMorphTunnelDoor)
TransportArea4Middle:connect_one_way_entrance(TransportArea2MiddleLeft) -- Normal Door
TransportArea4Middle:connect_one_way_entrance(TransportArea4Upper, OpenMorphTunnelDoor)
TransportArea4Middle:connect_one_way_entrance(TransportArea4Lower, OpenMorphTunnelDoor)
TransportArea4Middle:connect_one_way(TransportArea4MiddlePickup, function ()
	return All(
		MorphBall,
		GrappleBeam
	)
end)
TransportArea4Lower:connect_one_way_entrance(TransportArea2Lower) -- Normal Door
TransportArea4Lower:connect_one_way_entrance(TransportArea3MinesTop) -- Elevator
Area3ExteriorEntranceMaze:connect_one_way_entrance(TransportArea2Lower, function ()
	return Has(MorphBall)
end) -- Normal Door
Area3ExteriorEntranceMaze:connect_one_way(Area3ExteriorEntranceMazePickup, function ()
	return All(
		MorphBall,
		Any(
			SpaceJump,
			PhaseDrift,
			CanSpider,
			MovementSimple
		)
	)
end)
Area3ExteriorTransportCavernsNTransport:connect_one_way_entrance(BeamBurstTransportAccess) -- Normal Door
Area3ExteriorTransportCavernsNTransport:connect_one_way_entrance(TransportFactoryExtNTransport) -- Elevator
Area3ExteriorTransportCavernsNTransport:connect_one_way_entrance(Area3ExteriorTransportCavernsNUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				WaveBeam,
				BeamBurst
			),
			All(
				CanBombBlock,
				CanShortShaft,
				Any(
					CanSpider,
					DamageBoostStatic
				)
			)
		)
	)
end)
Area3ExteriorTransportCavernsNUpper:connect_one_way_entrance(FactoryExtAccessLower) -- Normal Door
Area3ExteriorTransportCavernsNUpper:connect_one_way_entrance(Area3ExteriorTransportCavernsNTransport, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				WaveBeam,
				BeamBurst
			),
			All(
				Any(
					CanSpider,
					CanDamageToughEnemy
				),
				CanBombBlock
			)
		)
	)
end)
BeamBurstMain:connect_one_way_entrance(TransportArea2Upper) -- Normal Door
-- BeamBurstMain:connect_one_way_entrance(Area3ExteriorTransportCavernsW) - Locked Door
BeamBurstMain:connect_two_ways_entrance(BeamBurstPickup, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			LightningArmor,
			CanSpider
		)
	)
end)
BeamBurstMain:connect_one_way_entrance(BeamBurstIntersection, CanBlobthrower)
BeamBurstPickup:connect_two_ways_entrance(BeamBurstIntersection, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
BeamBurstPickup:connect_one_way(BeamBurstPickupPickup, function() return Has(MorphBall) end)
BeamBurstIntersection:connect_one_way_entrance(BeamBurstMain, CanBlobthrower)
BeamBurstTransportAccess:connect_two_ways_entrance(BeamBurstIntersection, CanBlobthrower)
BeamBurstTransportAccess:connect_one_way_entrance(Area3ExteriorTransportCavernsNTransport) -- Normal Door
HalzynHangoutLower:connect_one_way_entrance(FactoryExtShaftBottom) -- Normal Door
HalzynHangoutLower:connect_one_way_entrance(HalzynHangoutUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam,
		CanClimbWall
	)
end)
HalzynHangoutLower:connect_one_way(HalzynHangoutLowerPickup, function ()
	return All(
		LightningArmor,
		CanPowerBomb
	)
end)
HalzynHangoutUpper:connect_one_way_entrance(HalzynHangoutLower)
HalzynHangoutUpper:connect_one_way_entrance(Area3ExteriorGammaEntrance, function ()
	return Any(
		GrappleBeam,
		CanHigherJump
	)
end) -- Normal Door
HalzynHangoutUpper:connect_one_way(HalzynHangoutUpperPickup, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
Area3ExteriorGammaEntrance:connect_one_way_entrance(HalzynHangoutUpper) -- Normal Door
Area3ExteriorGammaEntrance:connect_one_way_entrance(Area3ExteriorGammaUpperArena, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighLedge,
		CanBombBlock
	)
end)
Area3ExteriorGammaUpperArena:connect_one_way_entrance(Area3ExteriorGammaEntrance, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area3ExteriorGammaUpperArena:connect_one_way(Area3ExteriorGammaUpperArenaGamma, CanDamageMetroid)
-- NooksCranny:connect_one_way_entrance() - something related to a Gamma?
FactoryExtAccessLower:connect_one_way_entrance(Area3ExteriorTransportCavernsNTransport) -- Normal Door
FactoryExtAccessLower:connect_one_way_entrance(BeamBurstPickup, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam,
		Any(
			All(
				CanBombBlock,
				CanBlobthrower
			),
			All(
				MorphBall,
				LightningArmor
			),
			WallJumpIntermediate,
			CanAlmostHigherJump
		)
	)
end)
FactoryExtAccessLower:connect_one_way_entrance(FactoryExtAccessUpper, function ()
	return All(
		Any(
			CanClimbWall,
			All(
				Any(
					CanAlmostHighLedge,
					WallJumpIntermediate
				),
				CanDamageToughEnemy
			)
		),
		CanEscapeFactoryExteriorAccess
	)
end)
FactoryExtAccessUpper:connect_two_ways_entrance(FactoryExtAccessExit, function ()
	return Any(
		CanBlobthrower,
		CanSpider,
		CanFly
	)
end)
FactoryExtAccessUpper:connect_one_way_entrance(FactoryExtAccessLower, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
FactoryExtAccessExit:connect_one_way_entrance(FactoryExtEntrance) -- Normal Door

-- Metroid Caverns
TransportFactoryExtNTransport:connect_one_way_entrance(Area3ExteriorTransportCavernsNTransport) -- Elevator
TransportFactoryExtNTransport:connect_one_way_entrance(TransportFactoryExtNUpper)
TransportFactoryExtNUpper:connect_one_way_entrance(TransportFactoryExtNTransport, CanClimbShaft)
TransportFactoryExtNUpper:connect_one_way_entrance(Area3CavernsAlpha2W) -- Normal Door
TransportFactoryExtNUpper:connect_one_way_entrance(TransportFactoryExtNLower)
TransportFactoryExtNLower:connect_one_way_entrance(TransportFactoryExtNUpper, function ()
	return Any(
		CanShortShaft,
		MorphBall
	)
end)
TransportFactoryExtNLower:connect_one_way_entrance(Area3CavernsGammaCArena) -- Normal Door
-- TransportFactoryExtNLower:connect_one_way_entrance(Area3CavernsGammaSWest) - Locked Door
TransportFactoryExtNLower:connect_one_way_entrance(TransportFactoryExtNBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			All(
				GravitySuit,
				CanAlmostHighJump
			),
			All(
				HighJumpBoots,
				CanSuperJumpMorphExtend
			),
			CanSpiderBoostUnderwater
		)
	)
end)
TransportFactoryExtNLower:connect_one_way(TransportFactoryExtNLowerPickup, CanBombBlock)
TransportFactoryExtNBottom:connect_one_way_entrance(TransportFactoryExtNLower, OpenMorphTunnelDoor)
TransportFactoryExtNBottom:connect_one_way_entrance(Area3CavernsGammaSMazeEntrance, function ()
	return All(
		OpenMorphTunnelDoor,
		SuperMissile
	)
end)
Area3CavernsAlpha2W:connect_one_way_entrance(TransportFactoryExtNUpper) -- Normal Door
Area3CavernsAlpha2W:connect_one_way_entrance(TransportFactoryExtW) -- Normal Door
Area3CavernsAlpha2W:connect_one_way(Area3CavernsAlpha2WAlpha, CanDamageMetroid)
Area3CavernsGammaCArena:connect_one_way_entrance(TransportFactoryExtNLower) -- Normal Door
Area3CavernsGammaCArena:connect_two_ways_entrance(Area3CavernsGammaCExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBlobthrower
	)
end)
Area3CavernsGammaCArena:connect_one_way(Area3CavernsGammaCArenaGamma, CanDamageMetroid)
Area3CavernsGammaCExit:connect_one_way_entrance(LetumShrine) -- Normal Door
Area3CavernsGammaSMazeEntrance:connect_one_way_entrance(TransportFactoryExtNBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		SuperMissile
	)
end)
Area3CavernsGammaSMazeEntrance:connect_one_way_entrance(Area3CavernsGammaSMazeJunctionAccess, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			All(
				GravitySuit,
				CanHighJump
			),
			CanSpiderBoostUnderwater
		)
	)
end)
Area3CavernsGammaSMazeJunctionAccess:connect_one_way_entrance(Area3CavernsGammaSMazeEntrance, OpenMorphTunnelDoor)
Area3CavernsGammaSMazeJunctionAccess:connect_one_way_entrance(Area3CavernsGammaSMazeJunction, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area3CavernsGammaSMazeJunctionAccess:connect_one_way(Area3CavernsGammaSMazeJunctionAccessPickup, function ()
	return Any(
		All(
			MetroidHatchling,
			CanSpider
		),
		All(
			PhaseDrift,
			CanAnyMissile
		)
	)
end)
Area3CavernsGammaSMazeJunction:connect_one_way_entrance(Area3CavernsGammaSMazeJunctionAccess, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area3CavernsGammaSMazeJunction:connect_two_ways_entrance(Area3CavernsGammaSWest, OpenMorphTunnelDoor)
Area3CavernsGammaSMazeJunction:connect_one_way_entrance(Area3CavernsGammaSArena, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area3CavernsGammaSMazeJunction:connect_one_way_entrance(Area3CavernsGammaSEast, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			GravitySuit,
			CanClimbShaft
		)
	)
end)
Area3CavernsGammaSWest:connect_one_way_entrance(TransportFactoryExtNLower) -- Normal Door
Area3CavernsGammaSArena:connect_one_way_entrance(Area3CavernsGammaSMazeJunction, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area3CavernsGammaSArena:connect_one_way_entrance(Area3CavernsGammaSEast, CanBombBlock) -- Normal Door
Area3CavernsGammaSArena:connect_one_way(Area3CavernsGammaSArenaGamma, CanDamageMetroid)
Area3CavernsGammaSEast:connect_one_way_entrance(Area3CavernsGammaSMazeJunction, OpenMorphTunnelDoor)
Area3CavernsGammaSEast:connect_one_way_entrance(RamulkenRollwayLower, OpenTaramargaDoor)
Area3CavernsSaveStationN:connect_one_way_entrance(GravittGardenMiddle) -- Normal Door
Area3CavernsSaveStationN:connect_one_way_entrance(QuarryTunnelLeft) -- Normal Door
GravittGardenLower:connect_one_way_entrance(LetumShrine, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
GravittGardenLower:connect_one_way_entrance(GravittGardenMiddle, function ()
	return Any(
		GrappleBeam,
		CanAlmostHigherJump
	)
end)
GravittGardenMiddle:connect_one_way_entrance(GravittGardenLower)
GravittGardenMiddle:connect_one_way_entrance(Area3CavernsSaveStationN)
GravittGardenMiddle:connect_one_way_entrance(GravittGardenUpper, CanClimbShaft)
GravittGardenUpper:connect_one_way_entrance(GravittGardenMiddle)
GravittGardenUpper:connect_one_way_entrance(Area3CavernsAlpha2NArena)
AscendingAlleyway:connect_one_way_entrance(RamulkenRollwayUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
AscendingAlleyway:connect_one_way_entrance(QuarryShaftGrappleBlock, function ()
	return All(
		OpenMorphTunnelDoor,
		CanAnyMissile,
		GrappleBeam
	)
end)
AscendingAlleyway:connect_one_way(AscendingAlleywayPickup, function()
	return All(
		CanAnyMissile,
		Any(
			GrappleBeam,
			CanAlmostHigherJump
		),
		MorphBall
	)
end)
RamulkenRollwayLower:connect_one_way_entrance(Area3CavernsTeleporterEUpper, function ()
	return All(
		OpenChargeDoor,
		Any(
			MorphBall,
			CanShortShaft
		)
	)
end)
RamulkenRollwayLower:connect_one_way_entrance(Area3CavernsGammaSEast, function ()
	return All(
		OpenTaramargaDoor,
		Any(
			MorphBall,
			CanShortShaft
		)
	)
end)
RamulkenRollwayLower:connect_one_way_entrance(RamulkenRollwayUpper, function ()
	return Any(
		CanFlyVertical,
		All(
			GrappleBeam,
			Any(
				KnowledgeSimple,
				CanClimbWall,
				CanAlmostHigherJump
			)
		)
	)
end)
RamulkenRollwayLower:connect_one_way(RamulkenRollwayLowerPickup, function ()
	return Any(
		All(
			CanPowerBomb,
			Any(
				CanSpider,
				MovementSimple
			)
		),
		All(
			CanAnyMissile,
			CanBombBlock,
			Any(
				GravitySuit,
				CanSpiderBoostUnderwater,
				CanHighSuperJump
			),
			Any(
				CanSpider,
				MovementSimple,
				All(
					GravitySuit,
					SpaceJump
				)
			)
		)
	)
end)
RamulkenRollwayUpper:connect_one_way_entrance(RamulkenRollwayLower)
RamulkenRollwayUpper:connect_one_way_entrance(AscendingAlleyway, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)

Area3CavernsTeleporterELower:connect_one_way_entrance(QuarryShaftBottom, OpenChargeDoor)
Area3CavernsTeleporterELower:connect_one_way_entrance(WaterfallCavern) -- Normal Door
Area3CavernsTeleporterELower:connect_one_way_entrance(Area3CavernsTeleporterEUpper, function()
	return Any(
		CanClimbWall,
		All(
			HighJumpBoots,
			WallJumpSimple
		)
	)
end)
Area3CavernsTeleporterEUpper:connect_one_way_entrance(RamulkenRollwayLower, OpenChargeDoor)
Area3CavernsTeleporterEUpper:connect_one_way_entrance(Area3CavernsTeleporterELower)
Area3CavernsTeleporterEUpper:connect_one_way(Area3CavernsTeleporterEUpperPickup, function ()
	return All(
		MorphBall,
		Any(
			GrappleBeam,
			CanHigherJump
		),
		Any(
			All(
				WaveBeam,
				BeamBurst
			),
			CanPowerBomb
		)
	)
end)
QuarryShaftBottom:connect_one_way_entrance(Area3CavernsTeleporterELower, OpenChargeDoor)
QuarryShaftBottom:connect_one_way_entrance(QuarryShaftLower, function ()
	return Any(
		MorphBall,
		CanClimbShaft
	)
end)
QuarryShaftLower:connect_one_way_entrance(QuarryShaftBottom)
QuarryShaftLower:connect_one_way_entrance(QuarryShaftUpper, CanShortShaft)
QuarryShaftLower:connect_one_way_entrance(LonelyLoopBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanClimbWall,
			All(
				HighJumpBoots,
				WallJumpIntermediate
			)
		)
	)
end)
QuarryShaftUpper:connect_one_way_entrance(QuarryShaftLower)
QuarryShaftUpper:connect_two_ways_entrance(QuarryShaftTop, OpenMorphTunnelDoor)
-- QuarryShaftUpper:connect_one_way_entrance(QuarryShaftGrappleBlock) - probably wrong side of the grapple block
QuarryShaftTop:connect_one_way_entrance(TransportFactoryIntSLeft) -- Normal Door
QuarryShaftGrappleBlock:connect_one_way_entrance(QuarryShaftUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanClimbShaft
	)
end)
QuarryShaftPickup:connect_one_way_entrance(LonelyLoopTop, OpenGigadoraDoor)
LonelyLoopBottom:connect_one_way_entrance(QuarryShaftLower, OpenMorphTunnelDoor)
LonelyLoopBottom:connect_one_way_entrance(LonelyLoopTop, function()
	return All(
		OpenMorphTunnelDoor,
		Any(
			GrappleBeam,
			SpaceJump,
			CanHighSuperJump
		)
	)
end)
LonelyLoopTop:connect_one_way_entrance(QuarryShaftPickup, OpenGigadoraDoor)
LonelyLoopTop:connect_one_way_entrance(LonelyLoopBottom, OpenMorphTunnelDoor)
QuarryTunnelLeft:connect_one_way_entrance(Area3CavernsSaveStationN) -- Normal Door
QuarryTunnelLeft:connect_one_way_entrance(QuarryTunnelRight, function() return Has(GrappleBeam) end)
QuarryTunnelRight:connect_two_ways_entrance(TransportFactoryIntSLeft) -- Normal Door
TransportFactoryIntSLeft:connect_one_way_entrance(QuarryShaftTop) -- Normal Door
TransportFactoryIntSLeft:connect_one_way_entrance(TransportFactoryIntSRight, function ()
	return Any(
		CanSpiderBoost,
		PhaseDrift
	)
end)
TransportFactoryIntSRight:connect_one_way_entrance(Area3InteriorGammaTransportCavernsEElevator) -- Elevator
TransportFactoryIntSRight:connect_one_way_entrance(TransportFactoryIntSLeft, function ()
	return Any(
		CanSpiderBoost,
		PhaseDrift,
		All(
			CanAnyMissile,
			GrappleBeam
		)
	)
end)
TransportFactoryIntSRight:connect_one_way(TransportFactoryIntSRightPickup, CanAnyMissile)
Area3CavernsGamma2S:connect_two_ways_entrance(Area3CavernsGamma2SAccess, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area3CavernsGamma2S:connect_one_way(Area3CavernsGamma2SGamma, CanDamageMetroid)
Area3CavernsGamma2SAccess:connect_two_ways_entrance(WaterfallCavern) -- Normal Door
WaterfallCavern:connect_one_way_entrance(Area3CavernsTeleporterELower) -- Normal Door
Area3CavernsGamma2N:connect_one_way_entrance(Area3CavernsAlpha2NExit, function() return Has(VariaSuit) end)
Area3CavernsGamma2N:connect_one_way(Area3CavernsGamma2NGamma, function ()
	return All(
		VariaSuit,
		CanBombBlock,
		Any(
			CanSpider,
			GravitySuit
		),
		CanDamageMetroid
	)
end)
TransportFactoryExtW:connect_one_way_entrance(Area3CavernsAlpha2W) -- Normal Door
TransportFactoryExtW:connect_one_way_entrance(Area3ExteriorTransportCavernsW) -- Elevator
Area3CavernsAlpha2NArena:connect_one_way_entrance(GravittGardenUpper) -- Normal Door
Area3CavernsAlpha2NArena:connect_two_ways_entrance(Area3CavernsAlpha2NExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeEvolvedAlphaNorthtoGamma
	)
end)
Area3CavernsAlpha2NArena:connect_one_way(Area3CavernsAlpha2NArenaAlpha, CanDamageMetroid)
Area3CavernsAlpha2NExit:connect_one_way_entrance(Area3CavernsGamma2N) -- Normal Door
LetumShrine:connect_one_way_entrance(Area3CavernsGammaCExit) -- Normal Door
-- LetumShrine:connect_one_way_entrance(Area3CavernsTeleporterW) - Normal Door; not logically relevant
LetumShrine:connect_one_way_entrance(GravittGardenLower, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
-- Area3CavernsTeleporterW:connect_one_way_entrance() - not logically relevant

-- Interior
SecuirtySite:connect_one_way_entrance(Area3InteriorGammaS, OpenPowerBombDoor)
SecuirtySite:connect_one_way(SecuirtySitePickup, function ()
	return All(
		Any(
			MetroidHatchling,
			All(
				CanBombBlock,
				MorphBall,
				LightningArmor
			)
		),
		Any(
			CanDamageToughEnemy,
			LightningArmor,
			All(
				MorphBall,
				Any(
					Bomb,
					SpiderBall,
					SpringBall
				)
			)
		)
	)
end)
Area3InteriorGammaSAccess:connect_one_way_entrance(Area3InteriorGammaTransportCavernsESouthwest, OpenTaramargaDoor)
Area3InteriorGammaSAccess:connect_one_way_entrance(Area3InteriorGammaS, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInteriorGammaArenaSouth
	)
end)
ParabyPeripheryLeft:connect_one_way_entrance(Area3InteriorGammaTransportCavernsESoutheast) -- Normal Door
ParabyPeripheryLeft:connect_two_ways_entrance(ParabyPeripheryRight, CanEscapeParabyPeriphery)
ParabyPeripheryRight:connect_one_way_entrance(Area3InteriorAlphaAccessBottom, OpenChargeDoor)
ParabyPeripheryRight:connect_one_way(ParabyPeripheryRightPickup, CanBombBlock)
FanControl:connect_one_way_entrance(WallfireWatchTop, OpenSuperDoor)
FanControl:connect_one_way(FanControlPickup, function ()
	return Any(
		CanPowerBomb,
		All(
			CanAnyMissile,
			CanBomb
		)
	)
end)
GrappleCircuitMain:connect_one_way_entrance(TransportFactoryExtE, function ()
	return All(
		OpenMorphTunnelDoor,
		CanShorterShaft
	)
end)
-- GrappleCircuitMain:connect_one_way_entrance(GrappleCircuitUpperBlock, function() return Has(GrappleBeam) end)
GrappleCircuitMain:connect_one_way_entrance(FactoryIntersectionPickup, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end) -- would be nice if I could figure out how to make this work
FactoryIntersectionTop:connect_one_way_entrance(TransportFactoryExtE) -- Normal Door
-- FactoryIntersectionTop:connect_one_way_entrance(GrappleCircuitLowerBlock, function ()
--	return All(
--		OpenMorphTunnelDoor,
--		CanReach(GrappleCircuitUpperBlock),
--		GrappleBeam
--	)
-- end)
FactoryIntersectionTop:connect_two_ways_entrance(FactoryIntersectionBottom, CanEscapeFactoryIntersection)
FactoryIntersectionBottom:connect_one_way_entrance(TransportFactoryExtE) -- Normal Door
FactoryIntersectionBottom:connect_one_way_entrance(RamulkenResidence, CanEscapeRamulkenResidence)
-- FactoryIntTeleporter:connect_one_way_entrance() - not logically relevant
TransportFactoryExtE:connect_one_way_entrance(FactoryIntersectionTop) -- Normal Door
TransportFactoryExtE:connect_one_way_entrance(FactoryExtTop) -- Elevator
TransportFactoryExtE:connect_one_way_entrance(GrappleCircuitMain, OpenMorphTunnelDoor)
Area3InteriorAlphaAccessBottom:connect_one_way_entrance(ParabyPeripheryRight, function ()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
Area3InteriorAlphaAccessBottom:connect_one_way_entrance(Area3InteriorAlphaAccessTop, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		Any(
			All(
				GrappleBeam,
				CanSpider
			),
			CanSpiderBoost,
			All(
				GravitySuit,
				Any(
					GrappleBeam,
					CanFlyVertical
				)
			)
		)
	)
end)
Area3InteriorAlphaAccessTop:connect_one_way_entrance(Area3InteriorAlpha, function () return Has(VariaSuit) end)
Area3InteriorAlphaAccessTop:connect_one_way_entrance(Area3InteriorAlphaAccessBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanClimbWall,
		Any(
			All(
				GrappleBeam,
				CanSpider
			),
			CanSpiderBoost,
			GravitySuit
		)
	)
end)
Area3InteriorGammaTransportCavernsEArena:connect_one_way_entrance(Area3InteriorGammaCAccessUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeGammaArena
	)
end)
Area3InteriorGammaTransportCavernsEArena:connect_one_way_entrance(Area3InteriorGammaTransportCavernsECenter, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeGammaArenaCavernsTransport
	)
end)
Area3InteriorGammaTransportCavernsEArena:connect_one_way_entrance(Area3InteriorGammaTransportCavernsEArenaGamma, function ()
	return All(
		CanReach(Area3InteriorGammaCAccessHidingSpot),
		CanDamageMetroid
	)
end,
{Area3InteriorGammaCAccessHidingSpot})
Area3InteriorGammaTransportCavernsECenter:connect_one_way_entrance(Area3InteriorGammaTransportCavernsEArena, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeGammaArenaCavernsTransport
	)
end)
Area3InteriorGammaTransportCavernsECenter:connect_one_way_entrance(Area3InteriorGammaCAccessLower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanAlmostHighLedge
	)
end)
Area3InteriorGammaTransportCavernsECenter:connect_two_ways_entrance(Area3InteriorGammaTransportCavernsESouthwest, OpenMorphTunnelDoor)
Area3InteriorGammaTransportCavernsESouthwest:connect_one_way_entrance(Area3InteriorGammaSAccess, OpenTaramargaDoor)
Area3InteriorGammaTransportCavernsESouthwest:connect_one_way_entrance(Area3InteriorGammaTransportCavernsESoutheast, function ()
	return Any(
		CanSpiderBoost,
		GravitySuit,
		GrappleBeam,
		All(
			HighJumpBoots,
			SuperJumpBeginner
		)
	)
end)
Area3InteriorGammaTransportCavernsESoutheast:connect_one_way_entrance(ParabyPeripheryLeft) -- Normal Door
Area3InteriorGammaTransportCavernsESoutheast:connect_one_way_entrance(Area3InteriorGammaTransportCavernsESouthwest)
Area3InteriorGammaTransportCavernsEElevator:connect_one_way_entrance(TransportFactoryIntSRight) -- Elevator
Area3InteriorGammaTransportCavernsEElevator:connect_one_way_entrance(Area3InteriorGammaTransportCavernsESouthwest, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
RamulkenResidence:connect_one_way_entrance(FactoryIntersectionBottom, CanEscapeRamulkenResidence) -- Normal Door
RamulkenResidence:connect_two_ways_entrance(WallfireWatchMain) -- Normal Door
WallfireWatchMain:connect_one_way_entrance(Area3InteriorGammaCAccessUpper) -- Normal Door
WallfireWatchMain:connect_one_way_entrance(WallfireWatchTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanAlmostHigherJump
	)
end)
WallfireWatchTop:connect_one_way_entrance(FanControl, OpenSuperDoor)
WallfireWatchTop:connect_one_way_entrance(WallfireWatchMain, OpenMorphTunnelDoor)
Area3InteriorAlpha:connect_one_way_entrance(Area3InteriorAlphaAccessTop, function() return Has(VariaSuit) end) -- Normal Door
Area3InteriorAlpha:connect_one_way(Area3InteriorAlphaAlpha, function ()
	return All(
		VariaSuit,
		CanDamageMetroid
	)
end)
Area3InteriorAlpha:connect_one_way(Area3InteriorAlphaLava, function ()
	return All(
		VariaSuit,
		GravitySuit,
		GrappleBeam,
		SuperMissile
	)
end)
Area3InteriorGammaS:connect_one_way_entrance(Area3InteriorGammaSAccess, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInteriorGammaArenaSouth
	)
end)
Area3InteriorGammaS:connect_one_way_entrance(SecuirtySite, function ()
	return All(
		OpenPowerBombDoor,
		CanAlmostHighLedge
	)
end)
Area3InteriorGammaS:connect_one_way(Area3InteriorGammaSGamma, CanDamageMetroid)
-- DedicatedCallisoRoost:connect_one_way_entrance() - not logically relevant
-- FactoryTeleporterAccess:connect_one_way_entrance() - not logically relevant
Area3InteriorGammaCAccessUpper:connect_one_way_entrance(WallfireWatchMain) -- Normal Door
Area3InteriorGammaCAccessUpper:connect_one_way_entrance(Area3InteriorGammaTransportCavernsEArena, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeGammaArena
	)
end)
Area3InteriorGammaCAccessUpper:connect_one_way_entrance(Area3InteriorGammaCAccessHidingSpot, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area3InteriorGammaCAccessHidingSpot:connect_one_way_entrance(Area3InteriorGammaCAccessUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area3InteriorGammaCAccessLower:connect_one_way_entrance(Area3InteriorGammaCAccessHidingSpot, function ()
	return All(
		OpenMorphTunnelDoor,
		LightningArmor,
		CanBombBlock
	)
end)
Area3InteriorGammaCAccessLower:connect_one_way_entrance(Area3InteriorGammaTransportCavernsECenter, OpenMorphTunnelDoor)
