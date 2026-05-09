-- Exit
TransportSurfaceBottom:connect_one_way_entrance(HatchlingChamber, function() return Has(MetroidHatchling) end) -- Normal Door
TransportSurfaceBottom:connect_one_way_entrance(TransportSurfaceThorns, function ()
	return All(
		MetroidHatchling,
		CanFlyVertical,
		Any(
			SpaceJump,
			CanThorns
		)
	)
end)
TransportSurfaceThorns:connect_one_way_entrance(TransportSurfaceBottom, function() return Has(MetroidHatchling) end)
TransportSurfaceThorns:connect_two_ways_entrance(TransportSurfaceBridge, function ()
	return All(
		MetroidHatchling,
		ScrewAttack
	)
end)
TransportSurfaceThorns:connect_one_way(TransportSurfaceThornsPickup, function ()
	return All(
		MorphBall,
		LightningArmor
	)
end)
TransportSurfaceBridge:connect_two_ways_entrance(TransportSurfaceElevator, function () return Has(MetroidHatchling) end)
TransportSurfaceBridge:connect_one_way(TransportSurfaceBridgePickup, function ()
	return All(
		MorphBall,
		Any(
			PhaseDrift,
			All(
				CanSpiderBoost,
				Any(
					CanHighLedge,
					MovementIntermediate
				)
			)
		)
	)
end)
TransportSurfaceElevator:connect_one_way_entrance(SurfaceTransportArea8Elevator) -- Elevator
NestHallwaySLeft:connect_one_way_entrance(NestTeleporter, OpenMorphTunnelDoor)
-- NestHallwaySLeft:connect_one_way_entrance(NestHallwaySRight) - locked door
NestHallwaySLeft:connect_one_way_entrance(NestHallwaySRight, function ()
	return All(
		OpenMorphTunnelDoor,
		ScrewAttack
	)
end)
NestHallwaySRight:connect_one_way_entrance(NestSmallShaft, CanCombatMetroidLarva) -- Normal Door
NestHallwaySRight:connect_one_way_entrance(NestHallwaySLeft) -- Normal Door
AmphitheaterBottom:connect_one_way_entrance(NestNetworkTop) -- Normal Door
AmphitheaterBottom:connect_one_way_entrance(AmphitheaterOverhang, CanClimbWall)
AmphitheaterBottom:connect_one_way(AmphitheaterBottomPickupUpperLeft, CanClimbWall)
AmphitheaterBottom:connect_one_way(AmphitheaterBottomPickupUpperRight, function ()
	return All(
		CanClimbWall,
		CanPowerBomb,
		LightningArmor,
		Any(
			CanSpider,
			PhaseDrift,
			MovementSimple
		)
	)
end)
AmphitheaterOverhang:connect_one_way_entrance(AmphitheaterBottom)
AmphitheaterOverhang:connect_one_way_entrance(AmphitheaterOverhangTunnel, function ()
	return All(
		OpenMorphTunnelDoor,
		CanFlyVertical
	)
end)
AmphitheaterOverhangTunnel:connect_one_way_entrance(AmphitheaterOverhang, OpenMorphTunnelDoor)
AmphitheaterOverhangTunnel:connect_one_way_entrance(AmphitheaterCrossway, function ()
	return All(
		OpenMorphTunnelDoor,
		CanClimbWall
	)
end)
AmphitheaterOverhangTunnel:connect_one_way(AmphitheaterOverhangTunnelPickup, function ()
	return Any(
		CanSpiderBoost,
		All(
			MovementSimple,
			Any(
				CanPowerBomb,
				All(
					CanSpider,
					CanBomb
				)
			)
		)
	)
end)
AmphitheaterCrossway:connect_one_way_entrance(AmphitheaterOverhangTunnel, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			All(
				CanSpider,
				CanBombBlock
			),
			All(
				CanClimbWall,
				CanPowerBomb
			)
		)
	)
end)
AmphitheaterCrossway:connect_two_ways_entrance(AmphitheaterCenter, OpenMorphTunnelDoor)
AmphitheaterCrossway:connect_one_way(AmphitheaterCrosswayPickup, function ()
	return All(
		ScrewAttack,
		Any(
			HighJumpBoots,
			SpaceJump,
			WallJumpSimple
		),
		CanBombBlock
	)
end)
AmphitheaterCenter:connect_one_way_entrance(AmphitheaterOverhang, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
AmphitheaterCenter:connect_one_way_entrance(AmphitheaterTop, function ()
	return Any(
		CanClimbWall,
		All(
			CanHighLedge,
			MovementIntermediate
		)
	)
end)
AmphitheaterTop:connect_one_way_entrance(NestTeleporter) -- Normal Door
AmphitheaterTop:connect_one_way_entrance(AmphitheaterCenter)
AmphitheaterTop:connect_one_way(AmphitheaterTopPickup, function ()
	return All(
		GrappleBeam,
		MorphBall,
		CanHighLedge
	)
end)

NestNetworkBottom:connect_one_way_entrance(Area8EntranceTeleporterUpper) -- Normal Door
NestNetworkBottom:connect_one_way_entrance(NestNoduleBottom) -- Normal Door
NestNetworkCenter:connect_one_way_entrance(NestNetworkTop, CanClimbNestNetwork)
NestNetworkCenter:connect_one_way_entrance(NestNetworkTunnels, function ()
	return All(
		ScrewAttack,
		CanEscapeNestNetworkTunnels
	)
end)
NestNetworkCenter:connect_one_way_entrance(NestNetworkBottom, CanEscapeNestNetworkBottomtoCenter)
NestNetworkCenter:connect_one_way_entrance(NestNodulePickup, function ()
	return All(
		ScrewAttack,
		CanEscapeNestNetworkBottomtoCenter
	)
end)
NestNetworkTunnels:connect_one_way_entrance(NestNetworkCenter, CanClimbNestNetworkTunnels)
NestNetworkTunnels:connect_one_way_entrance(Area8EntranceTeleporterUpper, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
NestNetworkTunnels:connect_one_way_entrance(NestNetworkBottom, CanThorns)
NestNetworkTunnels:connect_one_way(NestNetworkTunnelsPickup, function ()
	return Any(
		CanSpiderBoost,
		CanThorns
	)
end)
NestNetworkTop:connect_one_way_entrance(AmphitheaterBottom) -- Normal Door
NestNetworkTop:connect_one_way_entrance(NestNetworkCenter)
NestNetworkTop:connect_one_way(NestNetworkTopPickup, function() return Has(MetroidHatchling) end)
Area8EntranceTeleporterLower:connect_one_way_entrance(NestVestibule) -- Normal Door
Area8EntranceTeleporterLower:connect_one_way_entrance(Area8EntranceTeleporterUpper, function ()
	return All(
		ScrewAttack,
		CanHighLedge
	)
end)
Area8EntranceTeleporterLower:connect_one_way(Area8EntranceTeleporterLowerPickup, function ()
	return All(
		MorphBall,
		CanShortShaft,
		CanAnyMissile,
		Any(
			LightningArmor,
			MetroidHatchling
		)
	)
end)
Area8EntranceTeleporterUpper:connect_one_way_entrance(NestNetworkBottom) -- Normal Door
Area8EntranceTeleporterUpper:connect_one_way_entrance(Area8EntranceTeleporterLower, function() return Has(ScrewAttack) end)
NestNoduleBottom:connect_one_way_entrance(NestNetworkBottom) -- Normal Door
NestNoduleBottom:connect_one_way_entrance(NestNoduleTop, CanClimbNestNodule)
NestNoduleTop:connect_one_way_entrance(NestNetworkCenter) -- Normal Door
NestNoduleTop:connect_one_way_entrance(NestNoduleBottom)
NestNoduleTop:connect_one_way(NestNoduleTopPickup, function ()
	return All(
		MorphBall,
		Any(
			All(
				MetroidHatchling,
				Any(
					CanPowerBomb,
					CanSpider
				),
				Any(
					CanThorns,
					CanSpider
				)
			),
			All(
				CanPowerBomb,
				LightningArmor,
				Any(
					CanSpider,
					PhaseDrift
				)
			)
		)
	)
end)
NestNodulePickup:connect_one_way_entrance(NestNetworkBottom, function() return Has(ScrewAttack) end) -- Normal Door
NestNodulePickup:connect_one_way_entrance(NestNoduleBottom, CanBombBlock)
NestNodulePickup:connect_one_way(NestNodulePickupPickup, function() return Has(MorphBall) end)
NestSmallShaft:connect_one_way_entrance(NestHallwaySRight, CanCombatMetroidLarva) -- Normal Door
NestSmallShaft:connect_one_way_entrance(NestShaftE, CanCombatMetroidLarva) -- Normal Door
NestShaftE:connect_one_way_entrance(NestSmallShaft, function ()
	return All(
		CanCombatMetroidLarva,
		MorphBall
	)
end) -- Normal Door
NestShaftE:connect_one_way_entrance(NestHallwayNe, function ()
	return All(
		CanCombatMetroidLarva,
		MorphBall
	)
end) -- Normal Door
NestHallwayNe:connect_one_way_entrance(NestShaftE, CanCombatMetroidLarva) -- Normal Door
NestHallwayNe:connect_one_way_entrance(NestRechargeStations, CanCombatMetroidLarva) -- Normal Door
NestHallwayNw:connect_one_way_entrance(NestRechargeStations, CanCombatMetroidLarva) -- Normal Door
NestHallwayNw:connect_one_way_entrance(NestShaftW, CanCombatMetroidLarva) -- Normal Door
NestRechargeStations:connect_one_way_entrance(NestHallwayNe) -- Normal Door
NestRechargeStations:connect_one_way_entrance(NestHallwayNw) -- Normal Door
NestShaftW:connect_one_way_entrance(NestHallwayNw, CanNavigateMetroidNestShaftWest) -- Normal Door
NestShaftW:connect_one_way_entrance(QueenAccess, CanNavigateMetroidNestShaftWest) -- Normal Door
NestShaftW:connect_one_way(NestShaftWPickup, CanNavigateMetroidNestShaftWest)
QueenAccess:connect_one_way_entrance(NestShaftW) -- Normal Door
QueenAccess:connect_one_way_entrance(Queen, CanEscapeQueenArena)
Queen:connect_one_way_entrance(QueenAccess, function ()
	return All(
		SpaceJump,
		ScrewAttack
	)
end)
Queen:connect_one_way_entrance(HatchlingChamber, CanCombatQueen)
Area8TransportArea7:connect_one_way_entrance(Area7TransportArea8, function ()
	return Any(
		MorphBall,
		ScrewAttack
	)
end) -- Elevator
Area8TransportArea7:connect_one_way_entrance(NestVestibule, function ()
	return All(
		ScrewAttack,
		Any(
			SpaceJump,
			All(
				CanClimbWall,
				Any(
					WallJumpIntermediate,
					All(
						WallJumpSimple,
						HighJumpBoots
					)
				)		
			)
		)
	)
end) -- Normal Door
-- HatchlingChamber:connect_one_way_entrance(Queen, CanEscapeQueenArena)
HatchlingChamber:connect_one_way_entrance(TransportSurfaceBottom, function () 
	return All(
		Has(MetroidHatchling),
		CanReach(Queen)
	)
end, {Queen}) -- wall somewhere?
HatchlingChamber:connect_one_way(HatchlingChamberPickup, function () return CanReach(Queen) end, {Queen})
NestVestibule:connect_one_way_entrance(Area8TransportArea7) -- Normal Door
NestVestibule:connect_one_way_entrance(Area8EntranceTeleporterLower) -- Normal Door
NestVestibule:connect_one_way(NestVestibulePickup, function ()
	return All(
		ScrewAttack,
		MorphBall,
		Any(
			SpaceJump,
			All(
				HighJumpBoots,
				WallJumpIntermediate
			)
		),
		Any(
			SpiderBall,
			MovementSimple
		)
	)
end)
NestTeleporter:connect_one_way_entrance(AmphitheaterTop) -- Normal Door
NestTeleporter:connect_one_way_entrance(NestHallwaySLeft, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighLedge
	)
end)
