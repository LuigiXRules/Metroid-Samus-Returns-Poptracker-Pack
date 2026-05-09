-- Lobby
Area5LobbySaveStationEntrance:connect_one_way_entrance(MeboidMillpondExit) -- Normal Door
Area5LobbySaveStationEntrance:connect_one_way_entrance(PhaseDriftChamber, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapePhaseDriftChamber
	)
end)
Area5LobbySaveStationEntrance:connect_one_way_entrance(Area5LobbySaveStationExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanCrossPitfallBridge
	)
end)
Area5LobbySaveStationExit:connect_one_way_entrance(Area5LobbySaveStationEntrance, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			GrappleBeam,
			CanCrossPitfallBridge
		)
	)
end)
Area5LobbySaveStationExit:connect_one_way_entrance(JShapeTunnelTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area5LobbySaveStationExit:connect_two_ways_entrance(TransportTowerIntEBottom) -- Normal Door
TransportTowerIntEBottom:connect_one_way_entrance(TransportTowerIntETop, function ()
	return Any(
		All(
			PhaseDrift,
			CanClimbWall
		),
		All(
			CanBlobthrower,
			Any(
				SpaceJump,
				CanSpider
			)
		)
	)
end)
TransportTowerIntETop:connect_one_way_entrance(TransportTowerLobbyEBottom) -- Elevator
-- TransportTowerIntETop:connect_one_way_entrance(Area5LobbyTeleporterWCave, function ()
--	return Any(
--		SpaceJump,
--		CanSpider
--	)
-- end)
TransportAreas4And6Upper:connect_one_way_entrance(Area4TransportArea5Lower, CanHighLedge) -- Elevator
TransportAreas4And6Upper:connect_one_way_entrance(Area5LobbyPassagewayUpper)
TransportAreas4And6Upper:connect_one_way_entrance(TransportAreas4And6Chamber, function ()
	return Any(
		LightningArmor,
		DamageBoostStatic
	)
end)
TransportAreas4And6Upper:connect_one_way_entrance(TransportAreas4And6Southwest)
TransportAreas4And6Upper:connect_one_way_entrance(TransportAreas4And6Southeast, OpenMorphTunnelDoor)
TransportAreas4And6Upper:connect_one_way_entrance(TransportAreas4And6PickupRight, function ()
	return All(
		OpenMorphTunnelDoor,
		MetroidHatchling
	)
end)
TransportAreas4And6Chamber:connect_one_way_entrance(TransportAreas4And6Upper, function ()
	return Any(
		LightningArmor,
		DamageBoostStatic,
		All(
			MorphBall,
			ScrewAttack
		),
		All(
			CanPowerBomb,
			GrappleBeam
		)
	)
end)
TransportAreas4And6Chamber:connect_one_way_entrance(TransportAreas4And6Southeast, function () return Has(ScrewAttack) end)
TransportAreas4And6Chamber:connect_one_way_entrance(TransportAreas4And6PickupRight, function ()
	return All(
		GrappleBeam,
		CanSpiderBoost
	)
end)
TransportAreas4And6Chamber:connect_one_way_entrance(TransportAreas4And6PickupLeft, CanSpiderBoost)
TransportAreas4And6Southwest:connect_one_way_entrance(TransportAreas4And6Upper, CanClimbWall)
TransportAreas4And6Southwest:connect_one_way_entrance(TransportAreas4And6PickupLeft, function ()
	return All(
		ScrewAttack,
		CanClimbWall
	)
end)
TransportAreas4And6Southeast:connect_one_way_entrance(TransportAreas4And6Upper, OpenMorphTunnelDoor)
TransportAreas4And6Southeast:connect_one_way_entrance(TransportAreas4And6Chamber, function ()
	return All(
		ScrewAttack,
		Any(
			SpaceJump,
			All(
				WallJumpSimple,
				MovementSimple
			)
		)
	)
end)
TransportAreas4And6Southeast:connect_one_way_entrance(TransportAreas4And6Southwest, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
TransportAreas4And6Southeast:connect_two_ways_entrance(TransportAreas4And6Bottom, OpenMorphTunnelDoor)
TransportAreas4And6Bottom:connect_one_way_entrance(Area6TransportArea5) -- Elevator
TransportAreas4And6PickupRight:connect_one_way_entrance(TransportAreas4And6Upper, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			MetroidHatchling,
			GrappleBeam
		)
	)
end)
TransportAreas4And6PickupRight:connect_one_way_entrance(TransportAreas4And6Chamber, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
TransportAreas4And6PickupLeft:connect_one_way_entrance(TransportAreas4And6Chamber, CanSpiderBoost)
TransportAreas4And6PickupLeft:connect_one_way_entrance(TransportAreas4And6Southwest, function() return Has(ScrewAttack) end)

Area5LobbyTeleporterWLower:connect_one_way_entrance(JShapeTunnelTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area5LobbyTeleporterWLower:connect_one_way_entrance(Area5LobbyTeleporterWUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighLedge,
		Any(
			PhaseDrift,
			CanDamageToughEnemy
		)
	)
end)
Area5LobbyTeleporterWLower:connect_one_way_entrance(Area5LobbyGamma2Access, function ()
	return All(
		CanHighLedge,
		Any(
			All(
				GravitySuit,
				CanFlyVertical
			),
			All(
				CanSpiderBoostUnderwater,
				DamageBoostStatic
			)
		)
	)
end)
Area5LobbyTeleporterWLower:connect_one_way_entrance(Area5LobbyTeleporterWLake, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
Area5LobbyTeleporterWLake:connect_one_way_entrance(Area5LobbyTeleporterWLower, function ()
	return All(
		ScrewAttack,
		Any(
			CanSpider,
			All(
				GravitySuit,
				CanClimbWall
			)
		)
	)
end)
Area5LobbyTeleporterWLake:connect_one_way_entrance(JShapeTunnelBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
Area5LobbyTeleporterWUpper:connect_one_way_entrance(Area5LobbyTeleporterWLower)
Area5LobbyTeleporterWUpper:connect_one_way_entrance(Area5LobbyTeleporterWCave, function ()
	return All(
		CanThorns,
		Any(
			MetroidHatchling,
			CanPowerBomb
		)
	)
end)
-- Area5LobbyTeleporterWUpper:connect_one_way_entrance(TransportTowerIntW, CanClimbWall) - locked door
Area5LobbyTeleporterWCave:connect_one_way_entrance(Area5LobbyTeleporterWUpper, function ()
	return All(
		CanThorns,
		Any(
			MetroidHatchling,
			CanPowerBomb
		)
	)
end)
Area5LobbyTeleporterWCave:connect_one_way_entrance(TransportTowerIntETop, function ()
	return All(
		CanThorns,
		Any(
			MetroidHatchling,
			CanPowerBomb
		)
	)
end) -- Normal Door
JShapeTunnelTop:connect_one_way_entrance(Area5LobbySaveStationExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		MovementSimple
	)
end)
JShapeTunnelTop:connect_one_way_entrance(Area5LobbyTeleporterWLower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		MovementSimple
	)
end)
JShapeTunnelTop:connect_one_way_entrance(JShapeTunnelBottom, OpenMorphTunnelDoor)
JShapeTunnelBottom:connect_one_way_entrance(Area5LobbySaveStationExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		CanClimbWall
	)
end)
JShapeTunnelBottom:connect_one_way_entrance(Area5LobbyTeleporterWLower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		CanClimbWall
	)
end)
TransportTowerIntW:connect_one_way_entrance(TransportTowerLobbyW) -- Elevator
TransportTowerIntW:connect_one_way_entrance(Area5LobbyTeleporterWUpper) -- Normal Door

Area5LobbyTeleporterELower:connect_one_way_entrance(Area5LobbyPassagewayLower) -- Normal Door
Area5LobbyTeleporterELower:connect_two_ways_entrance(Area5LobbyTeleporterEUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanFleechSwarm
	)
end)
Area5LobbyTeleporterEUpper:connect_one_way_entrance(Area5LobbyTeleporterEPickup, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighBombBlock,
		Any(
			CanEscapeLobbyTeleporterEastPickupLeft,
			CanEscapeLobbyTeleporterEastPickupRight
		)
	)
end)
Area5LobbyTeleporterEUpper:connect_two_ways_entrance(Area5LobbyAlpha2) -- Normal Door
Area5LobbyTeleporterEPickup:connect_one_way_entrance(Area5LobbyTeleporterEUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeLobbyTeleporterEastPickupLeft
	)
end)
Area5LobbyTeleporterEPickup:connect_one_way_entrance(Area5LobbyPassagewayUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeLobbyTeleporterEastPickupRight
	)
end)
Area5LobbyAlpha2:connect_one_way_entrance(MeboidMillpondLake) -- Normal Door
Area5LobbyAlpha2:connect_one_way(Area5LobbyAlpha2Alpha, CanDamageMetroid)
Area5LobbyGamma2Access:connect_one_way_entrance(Area5LobbyTeleporterWLower) -- Normal Door
Area5LobbyGamma2Access:connect_one_way_entrance(Area5LobbyGamma2, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
PhaseDriftChamber:connect_one_way_entrance(MeboidMillpondExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapePhaseDriftChamber
	)
end)
PhaseDriftChamber:connect_one_way_entrance(MeboidMillpondLake, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapePhaseDriftChamber
	)
end)
PhaseDriftChamber:connect_one_way(PhaseDriftPickupArtifact, function() return Has(MorphBall) end)
PhaseDriftChamber:connect_one_way(PhaseDriftPickupPitfallBlocks, function ()
	return Any(
		PhaseDrift,
		CanSpiderBoost
	)
end)
MeboidMillpondLake:connect_one_way_entrance(Area5LobbyAlpha2) -- Normal Door
MeboidMillpondLake:connect_one_way_entrance(MeboidMillpondExit, function ()
	return Any(
		GravitySuit,
		CanHighLedge
	)
end)
MeboidMillpondLake:connect_one_way(MeboidMillpondLakePickup, CanSpiderBoostUnderwater)
MeboidMillpondExit:connect_one_way_entrance(MeboidMillpondLake)
MeboidMillpondExit:connect_one_way_entrance(Area5LobbySaveStationEntrance) -- Normal Door
MeboidMillpondExit:connect_one_way_entrance(PhaseDriftChamber, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area5LobbyGamma2:connect_one_way_entrance(Area5LobbyGamma2Access, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanBombBlock
	)
end)
Area5LobbyGamma2:connect_one_way(Area5LobbyGamma2Gamma, function ()
	return All(
		VariaSuit,
		CanDamageMetroid
	)
end)
Area5LobbyPassagewayUpper:connect_one_way_entrance(TransportAreas4And6Upper)
Area5LobbyPassagewayUpper:connect_one_way_entrance(Area5LobbyPassagewayLower)
Area5LobbyPassagewayLower:connect_one_way_entrance(Area5LobbyTeleporterELower)
Area5LobbyPassagewayLower:connect_one_way_entrance(Area5LobbyPassagewayUpper, CanShortShaft)

-- Exterior
TowerExtSoutheast:connect_one_way_entrance(TransportTowerExtETop) -- Elevator
TowerExtSoutheast:connect_one_way_entrance(Area5ExteriorGamma, function ()
	return All(
		OpenChargeDoor,
		CanClimbWallUnderwater
	)
end)
TowerExtSoutheast:connect_one_way_entrance(TowerExtIntersection, CanClimbWall)
TowerExtIntersection:connect_one_way_entrance(TowerExtSoutheast)
TowerExtIntersection:connect_one_way_entrance(RedPlantMaze, OpenPowerBombDoor)
TowerExtIntersection:connect_one_way_entrance(TowerExtTop, CanClimbWall)
TowerExtIntersection:connect_one_way_entrance(Area5ExteriorZetaAccessRight, function ()
	return All(
		OpenGryncoreDoor,
		CanClimbWall
	)
end)
TowerExtIntersection:connect_one_way_entrance(Area5ExteriorGamma2Access, function ()
	return Any(
		SpaceJump,
		All(
			LightningArmor,
			DamageBoostStatic,
			CanSpiderBoost
		)
	)
end) -- Normal Door
TowerExtTop:connect_one_way_entrance(TowerExtIntersection, function ()
	return Any(
		CanBlobthrower,
		CanHighJump
	)
end)
TowerExtTop:connect_one_way_entrance(TowerExtSouthwest, function ()
	return Any(
		CanBlobthrower,
		CanHighJump
	)
end)
TowerExtTop:connect_two_ways_entrance(OvergrownMazeMain, OpenSuperDoor)
TowerExtTop:connect_one_way(TowerExtTopPickup, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
TowerExtSouthwest:connect_one_way_entrance(TowerExtTop, CanClimbWall)
TowerExtSouthwest:connect_one_way_entrance(TransportTowerIntN, CanClimbWall) -- Normal Door
TowerExtSouthwest:connect_one_way(TowerExtSouthwestPickupCrevice, function ()
	return All(
		CanClimbWall,
		CanBombBlock
	)
end)
TowerExtSouthwest:connect_one_way(TowerExtSouthwestPickupAlcove, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
TowerExtSouthwest:connect_one_way(TowerExtSouthwestPickupPuzzle, function ()
	return All(
		CanClimbWallUnderwater,
		MorphBall,
		Any(
			MetroidHatchling,
			All(
				CanBlobthrower,
				GrappleBeam,
				Any(
					PhaseDrift,
					CanSpider
				)
			)
		)
	)
end)
OvergrownMazeMain:connect_two_ways_entrance(OvergrownMazeExit, function ()
	return All(
		OpenMorphTunnelDoor,
		CanSpiderBoost
	)
end)
OvergrownMazeMain:connect_one_way(OvergrownMazeMainPickup, function ()
	return Any(
		CanSpiderBoost,
		All(
			MorphBall,
			GrappleBeam
		)
	)
end)
OvergrownMazeExit:connect_one_way_entrance(TowerExtSouthwest, OpenMorphTunnelDoor)
-- ScrewAttackChamber:connect_one_way_entrance(ScrewAttackAccess) - locked door
ScrewAttackChamber:connect_one_way_entrance(ScrewAttackAccess, function ()
	return All(
		ScrewAttack,
		CanClimbShaft
	)
end)
Area5ExteriorZetaAccessRight:connect_one_way_entrance(TowerExtIntersection, OpenGryncoreDoor)
Area5ExteriorZetaAccessRight:connect_two_ways_entrance(Area5ExteriorZetaAccessLeft, function () return Has(ScrewAttack) end)
Area5ExteriorZetaAccessRight:connect_one_way_entrance(ParabyParlor, function ()
	return All(
		OpenMorphTunnelDoor,
		CanClimbWallUnderwater,
		CanBombBlock
	)
end)
Area5ExteriorZetaAccessLeft:connect_one_way_entrance(Area5ExteriorZeta, CanEscapeExteriorZetaArena) -- Normal Door
RedPlantMaze:connect_one_way_entrance(TowerExtIntersection, OpenPowerBombDoor)
RedPlantMaze:connect_one_way(RedPlantMazePickup, function() return Has(LightningArmor) end)
TransportTowerIntN:connect_one_way_entrance(TowerExtSouthwest) -- Normal Door
TransportTowerIntN:connect_one_way_entrance(TransportTowerExtW) -- Elevator
Area5ExteriorZeta:connect_one_way_entrance(Area5ExteriorZetaAccessLeft, CanEscapeExteriorZetaArena) -- Normal Door
Area5ExteriorZeta:connect_one_way(Area5ExteriorZetaZeta, CanDamageMetroid)
ParabyParlor:connect_one_way_entrance(Area5ExteriorZetaAccessRight, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
ParabyParlor:connect_one_way_entrance(ScrewAttackAccess, CanClimbShaft) -- Normal Door
Area5ExteriorGamma2Access:connect_one_way_entrance(TowerExtIntersection, function ()
	return All(
		VariaSuit,
		Any(
			SpaceJump,
			CanSpiderBoost,
			CanThorns
		)
	)
end) -- Normal Door
Area5ExteriorGamma2Access:connect_one_way_entrance(Area5ExteriorGamma2Arena, function ()
	return All(
		VariaSuit,
		Any(
			SpaceJump,
			CanSpiderBoost,
			CanThorns
		)
	)
end) -- Normal Door
Area5ExteriorGamma2Arena:connect_one_way_entrance(Area5ExteriorGamma2Access) -- Normal Door
Area5ExteriorGamma2Arena:connect_one_way(Area5ExteriorGamma2ArenaGamma, function ()
	return All(
		VariaSuit,
		CanDamageMetroid,
		Any(
			All(
				SpaceJump,
				GravitySuit
			),
			CanSpider,
			DamageBoostStatic
		)
	)
end)
Area5ExteriorGamma:connect_one_way_entrance(TowerExtSoutheast, function ()
	return All(
		OpenChargeDoor,
		CanClimbWallUnderwater
	)
end)
Area5ExteriorGamma:connect_one_way(Area5ExteriorGammaPickup, function ()
	return All(
		CanClimbWall,
		CanBombBlock,
		CanBlobthrower
	)
end)
Area5ExteriorGamma:connect_one_way(Area5ExteriorGammaGamma, function ()
	return All(
		CanDamageMetroid,
		CanClimbWall,
		CanBombBlock
	)
end)
ScrewAttackAccess:connect_one_way_entrance(ParabyParlor) -- Normal Door
ScrewAttackAccess:connect_one_way_entrance(ScrewAttackChamber, function ()
	return All(
		OpenMissileDoor,
		CanFlyVerticalUnderwater
	)
end)
ScrewAttackAccess:connect_one_way_entrance(ScrewAttackChamber, function ()
	return All(
		ScrewAttack,
		CanFlyVerticalUnderwater
	)
end)

-- Interior
TransportTowerLobbyEBottom:connect_one_way_entrance(TransportTowerIntETop) -- Elevator
TransportTowerLobbyEBottom:connect_two_ways_entrance(Area5InteriorSaveStationSoutheast) -- Normal Door
TransportTowerLobbyEBottom:connect_two_ways_entrance(TransportTowerLobbyETop, OpenMorphTunnelDoor)
TransportTowerLobbyETop:connect_one_way_entrance(TransportTowerExtEBottom) -- Normal Door
Area5InteriorSaveStationSoutheast:connect_one_way_entrance(Area5InteriorSaveStationSaveStation, function ()
	return All(
		OpenMorphTunnelDoor,
		CanShortShaft
	)
end)
Area5InteriorSaveStationSouthwest:connect_one_way_entrance(TransportTowerLobbyW, OpenGryncoreDoor)
Area5InteriorSaveStationSouthwest:connect_two_ways_entrance(Area5InteriorSaveStationSaveStation, OpenMorphTunnelDoor)
Area5InteriorSaveStationSaveStation:connect_one_way_entrance(Area5InteriorSaveStationSoutheast, OpenMorphTunnelDoor)
Area5InteriorSaveStationSaveStation:connect_one_way_entrance(Area5InteriorSaveStationExit, function ()
	return Any(
		SpaceJump,
		CanIBJDiagonal,
		All(
			CanSpider,
			MovementSimple
		),
		All(
			HighJumpBoots,
			Any(
				DamageBoostStatic,
				MovementSimple
			)
		)
	)
end)
Area5InteriorSaveStationExit:connect_one_way_entrance(Area5InteriorGamma2Access, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam,
		CanEscapeInteriorSaveStationWater
	)
end)
Area5InteriorSaveStationExit:connect_two_ways_entrance(Area5InteriorSaveStationWater, CanEscapeInteriorSaveStationWater)
Area5InteriorSaveStationExit:connect_one_way_entrance(Area5InteriorSaveStationSaveStation, function ()
	return Any(
		CanFly,
		All(
			MorphBall,
			GrappleBeam
		),
		All(
			CanSpiderBoost,
			MovementSimple
		)
	)
end)
Area5InteriorSaveStationWater:connect_one_way(Area5InteriorSaveStationWaterPickup, CanBombBlock)
TransportTowerExtEBottom:connect_one_way_entrance(TransportTowerLobbyETop) -- Normal Door
TransportTowerExtEBottom:connect_one_way_entrance(TransportTowerExtETop, function ()
	return All(
		CanDamageToughEnemy,
		CanClimbShaft
	)
end)
TransportTowerExtETop:connect_one_way_entrance(TransportTowerExtEBottom)
TransportTowerExtETop:connect_two_ways_entrance(GrappleShufflerTunnel) -- Normal Door
TransportTowerExtETop:connect_one_way_entrance(MeboidMarina) -- Normal Door
TransportTowerExtETop:connect_one_way_entrance(TowerExtSoutheast) -- Elevator
PlasmaBeamChamber:connect_two_ways_entrance(GrappleShufflerPuzzleBottom, OpenMissileDoor)
PlasmaBeamChamber:connect_two_ways_entrance(AutrackAcropolis, OpenGryncoreDoor)
GrappleShufflerTunnel:connect_one_way_entrance(Area5InteriorTeleporter) -- Normal Door
GrappleShufflerPuzzleTop:connect_one_way_entrance(Area5InteriorTeleporter) -- Normal Door
GrappleShufflerPuzzleTop:connect_one_way_entrance(GrappleShufflerPuzzleBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
GrappleShufflerPuzzleTop:connect_one_way(GrappleShufflerPuzzleTopPickup, function ()
	return All(
		ScrewAttack,
		CanSpider,
		CanBombBlock
	)
end)
AutrackAcropolis:connect_one_way_entrance(Area5InteriorTeleporter) -- Normal Door
AutrackAcropolis:connect_one_way_entrance(TransportTowerExtW, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		Any(
			All(
				CanSpider,
				CanDamageToughEnemy
			),
			All(
				SpaceJump,
				PhaseDrift
			)
		)
	)
end)
GravitySuitUnderwater:connect_one_way_entrance(GravitySuitAccessLake, CanEscapeGravityChamber) -- Normal Door
GravitySuitUnderwater:connect_one_way_entrance(GravitySuitAccessLoop) -- Normal Door
GravitySuitStatue:connect_one_way_entrance(GravitySuitAccessLoop) -- Normal Door
GravitySuitStatue:connect_one_way_entrance(GravitySuitUnderwater) -- Normal Door

PhaseDriftTrialReward:connect_one_way_entrance(PhaseDriftTrialW, OpenPowerBombDoor)
PhaseDriftTrialW:connect_two_ways_entrance(PhaseDriftTrialE, function ()
	return All(
		OpenSuperDoor,
		Any(
			CanSpider,
			PhaseDrift
		)
	)
end)
PhaseDriftTrialW:connect_one_way_entrance(PhaseDriftTrialReward, function ()
	return All(
		OpenSuperDoor,
		Any(
			CanSpider,
			PhaseDrift
		)
	)
end)
PhaseDriftTrialW:connect_one_way(PhaseDriftTrialWPickupLower, function ()
	return All(
		CanSpider,
		CanBombBlock
	)
end)
PhaseDriftTrialW:connect_one_way(PhaseDriftTrialWPickupUpper, function ()
	return Any(
		CanSpider,
		PhaseDrift
	)
end)
PhaseDriftTrialE:connect_one_way_entrance(PhaseDriftTrialEntrance, function ()
	return Any(
		CanSpider,
		PhaseDrift
	)
end) -- Normal Door
PhaseDriftTrialE:connect_one_way_entrance(TransportTowerExtW)
TransportTowerLobbyW:connect_one_way_entrance(Area5InteriorSaveStationSouthwest, OpenGryncoreDoor)
TransportTowerLobbyW:connect_one_way_entrance(TransportTowerIntW) -- Elevator
MeboidMarina:connect_one_way_entrance(Area5InteriorZeta2AccessLeft, function ()
	return All(
		OpenGryncoreDoor,
		CanClimbWallUnderwater
	)
end)
MeboidMarina:connect_one_way_entrance(TransportTowerExtETop, CanHighUnderwaterLedge) -- Normal Door
Area5InteriorZeta2AccessLeft:connect_one_way_entrance(MeboidMarina, function ()
	return All(
		OpenGryncoreDoor,
		SpaceJump,
		ScrewAttack
	)
end)
Area5InteriorZeta2AccessLeft:connect_one_way_entrance(Area5InteriorZeta2AccessRight, function ()
	return All(
		CanClimbWallUnderwater,
		SpaceJump,
		ScrewAttack
	)
end)
Area5InteriorZeta2AccessRight:connect_one_way_entrance(Area5InteriorZeta2AccessLeft, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
Area5InteriorZeta2AccessRight:connect_one_way_entrance(Area5InteriorZeta2, function ()
	return All(
		CanClimbWallUnderwater,
		SpaceJump,
		ScrewAttack,
		CanEscapeEvolvedZetaArena
	)
end)
Area5InteriorZeta2AccessRight:connect_one_way(Area5InteriorZeta2AccessRightPickup, function ()
	return All(
		SpaceJump,
		ScrewAttack,
		MorphBall,
		CanAnyMissile
	)
end)
TransportTowerExtW:connect_one_way_entrance(AutrackAcropolis, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportTowerExtW:connect_two_ways_entrance(GravitySuitAccessTop, OpenGigadoraDoor)
TransportTowerExtW:connect_one_way_entrance(PhaseDriftTrialEntrance, function ()
	return All(
		OpenMorphTunnelDoor,
		CanClimbWall
	)
end)
TransportTowerExtW:connect_one_way_entrance(TransportTowerIntN) -- Elevator
GravitySuitAccessTop:connect_two_ways_entrance(GravitySuitAccessLake, CanEscapeGravityChamberAccess)
GravitySuitAccessLake:connect_one_way_entrance(GravitySuitUnderwater, CanEscapeGravityChamber) -- Normal Door
GravitySuitAccessLake:connect_one_way(GravitySuitAccessLakePickup, function ()
	return All(
		CanBombBlock,
		Any(
			GrappleBeam,
			CanSpiderBoostUnderwater
		),
		Any(
			CanSpider,
			PhaseDrift
		)
	)
end)
GravitySuitAccessLoop:connect_one_way_entrance(GravitySuitUnderwater) -- Normal Door
GravitySuitAccessLoop:connect_one_way_entrance(GravitySuitStatue, OpenMissileDoor)
PhaseDriftTrialEntrance:connect_one_way_entrance(TransportTowerExtW, OpenMorphTunnelDoor)
PhaseDriftTrialEntrance:connect_one_way_entrance(PhaseDriftTrialE, CanClimbWall) -- Normal Door
Area5InteriorGamma2:connect_one_way_entrance(Area5InteriorGamma2Access, function() return Has(VariaSuit) end)
Area5InteriorGamma2:connect_one_way(Area5InteriorGamma2Gamma, function ()
	return All(
		SpaceJump,
		CanDamageMetroid
	)
end)
Area5InteriorTeleporter:connect_one_way_entrance(GrappleShufflerTunnel, CanHighLedge) -- Normal Door
-- Area5InteriorTeleporter:connect_one_way_entrance(AutrackAcropolis) - locked door
Area5InteriorTeleporter:connect_one_way_entrance(GrappleShufflerPuzzleTop) -- Normal Door
Area5InteriorTeleporter:connect_one_way(Area5InteriorTeleporterPickup, function() return Has(MetroidHatchling) end)
Area5InteriorZeta2:connect_one_way_entrance(Area5InteriorZeta2AccessRight, CanEscapeEvolvedZetaArena) -- Normal Door
Area5InteriorZeta2:connect_one_way(Area5InteriorZeta2Zeta, CanDamageMetroid)
Area5InteriorGamma2Access:connect_one_way_entrance(Area5InteriorSaveStationWater, function ()
	return All(
		OpenMorphTunnelDoor,
		CanCrossInteriorGammaAccess,
		CanEscapeInteriorSaveStationWater
	)
end)
Area5InteriorGamma2Access:connect_one_way_entrance(Area5InteriorGamma2, function ()
	return All(
		OpenMorphTunnelDoor,
		CanCrossInteriorGammaAccess
	)
end)
