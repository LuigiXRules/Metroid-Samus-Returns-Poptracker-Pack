-- Exit
Area6TransportArea7:connect_one_way_entrance(CrumblingStairwell, function() return Has(MorphBall) end) -- Normal Door
Area6TransportArea7:connect_one_way_entrance(Diggernaut, function ()
	return All(
		OpenChargeDoor,
		CanEscapeDiggernautLoop
	)
end)
Area6TransportArea7:connect_one_way_entrance(TransportArea6Transport, function() return Has(MorphBall) end) -- Elevator
Area6TransportArea7:connect_one_way(Area6TransportArea7Pickup, function ()
	return All(
		CanThorns,
		CanHighBombBlock,
		GrappleBeam,
		Any(
			CanAnyMissile,
			CanPowerBomb
		),
		CanSpider
	)
end)
Area6TeleporterS:connect_one_way_entrance(CrumblingStairwell) -- Normal Door
Area6Omega:connect_one_way_entrance(PoisonousTunnelUpper) -- Normal Door
Area6Omega:connect_one_way_entrance(Area6ZetaAccess) -- Normal Door
Area6Omega:connect_one_way(Area6OmegaOmega, CanCombatOmega)
HideoutSprawlBottom:connect_one_way_entrance(HideoutEntrance, OpenMissileDoor)
HideoutSprawlBottom:connect_one_way_entrance(HideoutSprawlMain, CanClimbWall)
HideoutSprawlMain:connect_one_way_entrance(HideoutSprawlBottom)
HideoutSprawlMain:connect_one_way_entrance(Area6OmegaAccess, function ()
	return All(
		ScrewAttack,
		CanHighLedge
	)
end) -- Normal Door
HideoutSprawlMain:connect_one_way(HideoutSprawlMainPickup, function ()
	return All(
		ScrewAttack,
		GrappleBeam,
		CanSpiderBoost
	)
end)
HideoutSprawlTunnels:connect_one_way_entrance(Area6OmegaAccess) -- Normal Door
HideoutSprawlTunnels:connect_one_way_entrance(HideoutSprawlMain, function ()
	return All(
		OpenMorphTunnelDoor,
		CanNavigateHideoutSprawlTunnels
	)
end)
HideoutSprawlTunnels:connect_one_way(HideoutSprawlTunnelsPickup, CanNavigateHideoutSprawlTunnels)
Area6TeleporterNAccess:connect_one_way_entrance(PoisonousTunnelUpper, function ()
	return All(
		OpenChargeDoor,
		CanClimbShaft
	)
end)
Area6TeleporterNAccess:connect_one_way_entrance(Area6TeleporterNUpper) -- Normal Door
CrumblingBridgeRight:connect_one_way_entrance(Area6ChozoSealEUpper, function ()
	return All(
		OpenChargeDoor,
		CanEscapeChozoSealE
	)
end)
CrumblingBridgeRight:connect_two_ways_entrance(CrumblingBridgeLeft, function ()
	return All(
		OpenMorphTunnelDoor,
		CanCrossCrumblingBridge
	)
end)
CrumblingBridgeLeft:connect_one_way_entrance(Area6Zeta) -- Normal Door
CrumblingBridgeLeft:connect_one_way(CrumblingBridgeLeftPickupTunnel, function ()
	return Any(
		CanPowerBomb,
		CanEscapeCrumblingBridgePit
	)
end)
CrumblingBridgeLeft:connect_one_way(CrumblingBridgeLeftPickupPit, function ()
	return All(
		CanAnyMissile,
		CanEscapeCrumblingBridgePit
	)
end)
HideoutEntrance:connect_one_way_entrance(Area6TeleporterNUpper, function ()
	return All(
		OpenChargeDoor,
		Any(
			CanBombBlockNearCeiling,
			All(
				SpaceJump,
				ScrewAttack
			)
		)
	)
end)
HideoutEntrance:connect_one_way_entrance(HideoutSprawlBottom, function ()
	return All(
		OpenMissileDoor,
		Any(
			CanBombBlockNearCeiling,
			All(
				SpaceJump,
				ScrewAttack
			)
		)
	)
end)
CrumblingStairwell:connect_one_way_entrance(Area6ChozoSealWMain, CanEscapeChozoSealWBottom) -- Normal Door
CrumblingStairwell:connect_one_way_entrance(Area6TransportArea7, function ()
	return Any(
		SpaceJump,
		All(
			CanSpider,
			Any(
				HighJumpBoots,
				CanIBJDiagonal
			)
		)
	)
end) -- Normal Door
CrumblingStairwell:connect_one_way(CrumblingStairwellPickup, function ()
	return All(
		CanBombBlock,
		Any(
			PhaseDrift,
			CanSpider
		)
	)
end)
-- Diggernaut:connect_one_way_entrance(Area6TransportArea7, CanBombBlock) - locked door
Diggernaut:connect_one_way_entrance(ElectricEscalade, CanEscapeDiggernaut) -- Normal Door
Diggernaut:connect_one_way(DiggernautPickup, CanCombatDiggernaut)
SwarmSquare:connect_one_way_entrance(ElectricEscalade, function ()
	return All(
		OpenPowerBombDoor,
		CanCrossSwarmSquare
	)
end)
SwarmSquare:connect_one_way_entrance(Area6TransportArea7, function ()
	return All(
		OpenMorphTunnelDoor,
		CanCrossSwarmSquare,
		CanEscapeSwarmSquaretoTransport
	)
end)
ElectricEscalade:connect_one_way_entrance(Diggernaut, CanEscapeDiggernaut) -- Normal Door
ElectricEscalade:connect_one_way_entrance(SwarmSquare, function ()
	return All(
		OpenPowerBombDoor,
		CanClimbWall
	)
end)
ElectricEscalade:connect_one_way(ElectricEscaladePickup, function ()
	return Any(
		CanSpiderBoost,
		CanIBJVertical
	)
end)
PoisonousTunnelUpper:connect_one_way_entrance(Area6Omega) -- Normal Door
PoisonousTunnelUpper:connect_one_way_entrance(Area6TeleporterNAccess, OpenChargeDoor)
PoisonousTunnelUpper:connect_two_ways_entrance(PoisonousTunnelPickup, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock,
		Any(
			LightningArmor,
			CanSpider
		)
	)
end)
PoisonousTunnelUpper:connect_one_way_entrance(Area6TeleporterNAccess, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
Area6ZetaAccess:connect_one_way_entrance(Area6Omega, CanBombBlock) -- Normal Door
Area6ZetaAccess:connect_one_way_entrance(Area6Zeta, CanBombBlock) -- Normal Door
Area6Zeta:connect_one_way_entrance(Area6ZetaAccess) -- Normal Door
Area6Zeta:connect_one_way_entrance(CrumblingBridgeLeft) -- Normal Door
Area6Zeta:connect_one_way(Area6ZetaZeta, CanDamageMetroid)

-- Entrance
Area6TransportArea5:connect_one_way_entrance(TransportAreas4And6Bottom, function ()
	return Any(
		HighJumpBoots,
		SpaceJump,
		CanSpider,
		DamageBoostStatic
	)
end) -- Elevator
Area6TransportArea5:connect_one_way_entrance(Area6ChozoSealWMain, function ()
	return Any(
		HighJumpBoots,
		SpaceJump,
		CanSpider,
		All(
			CanHighLedge,
			DamageBoostStatic
		)
	)
end)
Area6ChozoSealELower:connect_one_way_entrance(Area6ChozoSealWTop, OpenMorphTunnelDoor)
Area6ChozoSealELower:connect_one_way_entrance(Area6ChozoSealEUpper, function ()
	return All(
		CanBombBlock,
		CanAnyMissile,
		GrappleBeam,
		CanHighLedge,
		Any(
			SpaceJump,
			SpiderBall,
			LightningArmor,
			DamageBoostStatic
		)
	)
end)
Area6ChozoSealEUpper:connect_one_way_entrance(CrumblingBridgeRight, function ()
	return All(
		OpenChargeDoor,
		CanEscapeChozoSealE
	)
end)
Area6ChozoSealEUpper:connect_one_way(Area6ChozoSealEUpperPickup, function ()
	return All(
		CanBombBlock,
		GrappleBeam,
		Any(
			MetroidHatchling,
			All(
				Any(
					CanSpider,
					PhaseDrift,
					MovementSimple
				)
			)
		)
	)
end)
Area6OmegaAccess:connect_one_way_entrance(HideoutSprawlMain, CanHighJump) -- Normal Door
Area6OmegaAccess:connect_one_way_entrance(HideoutSprawlTunnels, OpenPowerBombDoor)
Area6OmegaAccess:connect_one_way_entrance(Area6Omega, CanHighJump)
Area6ChozoSealWMain:connect_one_way_entrance(Area6TransportArea5) -- Normal Door
Area6ChozoSealWMain:connect_two_ways_entrance(Area6ChozoSealWPassageway, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area6ChozoSealWMain:connect_one_way_entrance(Area6TeleporterS, CanHighLedge) -- Normal Door
-- Area6ChozoSealWMain:connect_one_way_entrance(CrumblingStairwell) - locked door
Area6ChozoSealWMain:connect_one_way(Area6ChozoSealWMainPickupTunnel, function ()
	return All(
		CanBombBlock,
		Any(
			CanSpider,
			MovementSimple
		)
	)
end)
Area6ChozoSealWMain:connect_one_way(Area6ChozoSealWMainPickupCeiling, function ()
	return Any(
		CanBombBlockNearCeiling,
		CanIBJVertical
	)
end)
Area6ChozoSealWMain:connect_one_way(Area6ChozoSealWMainPickupBottom, function ()
	return All(
		CanPowerBomb,
		GrappleBeam,
		ScrewAttack,
		CanAnyMissile,
		Any(
			SpaceJump,
			All(
				CanFlyVertical,
				Any(
					HighJumpBoots,
					WallJumpSimple
				)
			)
		)
	)
end)
Area6ChozoSealWPassageway:connect_one_way_entrance(Area6TransportArea5, function ()
	return All(
		MorphBall,
		GrappleBeam
	)
end) -- Normal Door
Area6ChozoSealWPassageway:connect_one_way_entrance(Area6ChozoSealWTop, CanClimbWall)
Area6ChozoSealWTop:connect_one_way_entrance(Area6ChozoSealWPassageway)
Area6ChozoSealWTop:connect_one_way_entrance(Area6ChozoSealELower, OpenMorphTunnelDoor)
Area6ChozoSealWTop:connect_two_ways_entrance(Area6TeleporterNLower) -- Normal Door
Area6TeleporterNLower:connect_one_way_entrance(Area6TeleporterNUpper, CanShortShaft)
Area6TeleporterNUpper:connect_one_way_entrance(Area6TeleporterNLower)
Area6TeleporterNUpper:connect_one_way_entrance(HideoutEntrance, OpenChargeDoor)
-- Area6TeleporterNUpper:connect_one_way_entrance(Area6TeleporterNAccess) - locked door
