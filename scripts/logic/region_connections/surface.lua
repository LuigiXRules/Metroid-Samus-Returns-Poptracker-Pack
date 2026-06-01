-- Landing Site
LandingSiteEast:connect_two_ways_entrance(LandingSiteWest, CanClimbWall)
LandingSiteEast:connect_one_way_entrance(HornoadHallwayWest)
LandingSiteWest:connect_one_way_entrance(SurfaceStash, function()
	return All(
		OpenGigadoraDoor,
		CanClimbWall
	)
end)
LandingSiteWest:connect_one_way_entrance(SurfaceCrumbleChallenge, function()
	return All(
		CanClimbWall,
		CanPowerBomb
	)
end)
LandingSiteWest:connect_one_way_entrance(SurfaceTransportArea8Exit, function()
	return Has(MetroidHatchling)
end)
LandingSiteWest:connect_one_way(ProteusRidley, function ()
	return All(
		MetroidHatchling,
		CanReach(SurfaceTransportArea8Exit),
		HasDNAforGoal,
		CanCombatRidley
	)
end)

--Starting Rooms
TwistyTunnel:connect_one_way_entrance(HornoadHallwayEast) -- Normal Door
TwistyTunnel:connect_two_ways_entrance(MorphBallUpper, OpenMissileDoor)
TwistyTunnel:connect_one_way(TwistyTunnelPickup, function() return Has(MorphBall) end)
MorphBallUpper:connect_one_way_entrance(MorphBallLower, OpenMorphTunnelDoor)
MorphBallLower:connect_one_way_entrance(MorphBallUpper, function()
	return All(
		OpenMorphTunnelDoor,
		CanAlmostHighLedge
	)
end)
MorphBallLower:connect_two_ways_entrance(ChozoSealUpper) -- Normal Door
ChozoSealUpper:connect_one_way_entrance(ScanPulseRight) -- Normal Door
ChozoSealUpper:connect_one_way_entrance(ChozoSealLower)
ChozoSealLower:connect_one_way_entrance(ChozoSealUpper, CanHighLedge)
ChozoSealLower:connect_two_ways_entrance(TransportArea1) -- Normal Door
ChozoSealTunnel:connect_one_way_entrance(TransportArea1, OpenMorphTunnelDoor)
TransportArea1:connect_one_way_entrance(ChozoSealTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea1:connect_one_way_entrance(TransportSurfaceArea2Surface) -- Elevator
TransportArea1:connect_one_way_entrance(SurfaceTransportCache, function() return Has(MetroidHatchling) end)
TransportArea1:connect_one_way(TransportArea1Pickup, function()
	return All(
		MorphBall,
		CanAlmostHighLedge
	)
end)

-- Charge Beam Area
ChozoCacheE:connect_one_way(ChargeBeamAccess, OpenMorphTunnelDoor)
ChargeBeamChamber:connect_one_way_entrance(ChargeBeamAccess, function()
	return All(
		OpenMissileDoor,
		CanAlmostHighLedge
	)
end)
ChargeBeamChamber:connect_one_way_entrance(ChargeBeamAccess, OpenChargeDoor)
SurfaceEastAlphaLobby:connect_one_way_entrance(EnergyRechargeShaftLower, OpenMorphTunnelDoor)
SurfaceEastAlphaLobby:connect_two_ways_entrance(SurfaceEastAlphaArena, function()
	return All(
		OpenMorphTunnelDoor,
		CanAnyMissile
	)
end)
SurfaceEastAlphaLobby:connect_one_way_entrance(MoheekMarket, OpenMorphTunnelDoor)
SurfaceEastAlphaLobby:connect_one_way_entrance(ChozoCacheW, OpenGryncoreDoor)
SurfaceEastAlphaArena:connect_one_way_entrance(SurfaceAmmoRecharge) -- Normal Door
SurfaceEastAlphaArena:connect_one_way_entrance(SurfaceEastAlphaArenaAlpha, CanDamageWeakMetroid)
SurfaceEastAlphaPickup:connect_one_way_entrance(MoheekMarket, OpenMorphTunnelDoor)
ScanPulseRight:connect_one_way_entrance(ChozoSealUpper) -- Normal Door
ScanPulseRight:connect_two_ways_entrance(ScanPulseLeft, OpenMorphTunnelDoor)
ScanPulseLeft:connect_one_way_entrance(ChargeBeamAccess, OpenChargeDoor)
ScanPulseLeft:connect_one_way_entrance(CavernCavity)
ChozoCacheW:connect_one_way_entrance(SurfaceEastAlphaLobby, OpenGryncoreDoor)
MoheekMarket:connect_one_way_entrance(SurfaceEastAlphaLobby, OpenMorphTunnelDoor)
MoheekMarket:connect_one_way_entrance(SurfaceEastAlphaPickup, OpenMorphTunnelDoor)
CavernCavity:connect_one_way_entrance(ScanPulseLeft, CanEscapeCavernCavity)
CavernCavity:connect_one_way_entrance(EnergyRechargeShaftUpper) -- Normal Door
CavernCavity:connect_one_way_entrance(CavernAlcove, function()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanClimbShaft,
			CanAlmostHighLedge
		)
	)
end)
ChargeBeamAccess:connect_one_way_entrance(ScanPulseLeft, OpenChargeDoor)
ChargeBeamAccess:connect_one_way_entrance(ChozoCacheE, OpenMorphTunnelDoor)
ChargeBeamAccess:connect_one_way_entrance(ChargeBeamChamber, function()
	return All(
		OpenMissileDoor,
		CanEscapeChargeChamber
	)
end)
ChargeBeamAccess:connect_one_way_entrance(SurfaceAmmoRecharge) -- Normal Door
ChargeBeamAccess:connect_one_way(ChargeBeamAccessPickup, function() return Has(MorphBall) end) -- Maybe put inspect accessibility level here?
HornoadHallwayWest:connect_one_way_entrance(LandingSiteEast)
HornoadHallwayWest:connect_one_way_entrance(HornoadHallwayEast, function()
	return Any(
		CanAnyMissile,
		MorphBall,
		CanClimbElevatedShaft
	)
end)
HornoadHallwayEast:connect_one_way_entrance(HornoadHallwayWest)
HornoadHallwayEast:connect_one_way_entrance(TwistyTunnel, function()
	return Any(
		CanAnyMissile,
		CanClimbShaft
	)
end)
SurfaceStash:connect_one_way_entrance(LandingSiteWest, OpenGigadoraDoor)
SurfaceStash:connect_one_way(SurfaceStashPickup, function()
	return All(
		GrappleBeam,
		MorphBall,
		Any(
			CanSpider,
			PhaseDrift
		),
		CanClimbShaft
	)
end)
SurfaceCrumbleChallenge:connect_one_way_entrance(LandingSiteWest)
SurfaceTransportCache:connect_one_way_entrance(TransportArea1, function()
	return Any(
		MetroidHatchling,
		CanPowerBomb
	)
end)
CavernAlcove:connect_one_way_entrance(CavernCavity, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeCavernCavity
	)
end)
CavernAlcove:connect_one_way(CavernAlcovePickup, function()
	return All(
		MorphBall,
		CanClimbShaft
	)
end)
EnergyRechargeShaftUpper:connect_one_way_entrance(CavernCavity) -- Normal Door
EnergyRechargeShaftUpper:connect_two_ways_entrance(EnergyRechargeShaftLower, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeEnergyRechargeShaft
	)
end)
EnergyRechargeShaftUpper:connect_one_way(EnergyRechargeShaftUpperPickup, function() return Has(MorphBall) end)
EnergyRechargeShaftLower:connect_one_way_entrance(SurfaceEastAlphaLobby, OpenMorphTunnelDoor)
SurfaceAmmoRecharge:connect_one_way_entrance(SurfaceEastAlphaArena) -- Normal Door
SurfaceAmmoRecharge:connect_one_way_entrance(ChargeBeamAccess) -- Normal Door

-- Surface West
SurfaceTransportArea8Elevator:connect_one_way_entrance(TransportSurfaceElevator) -- Elevator
SurfaceTransportArea8Elevator:connect_one_way_entrance(SurfaceTransportArea8LeftShaft, function()
	return All(
		MetroidHatchling,
		CanEscapeTransportArea8
	)
end)
SurfaceTransportArea8LeftShaft:connect_one_way_entrance(SurfaceTransportArea8Elevator, function() return Has(MetroidHatchling) end)
SurfaceTransportArea8LeftShaft:connect_two_ways_entrance(SurfaceTransportArea8Hallway, CanCrossTransportArea8)
SurfaceTransportArea8LeftShaft:connect_one_way(SurfaceTransportArea8LeftShaftPickup, function() 
	return All(
		MetroidHatchling,
		LightningArmor,
		MorphBall,
		CanClimbWall
	)
end)
SurfaceTransportArea8Hallway:connect_two_ways_entrance(SurfaceTransportArea8Exit, function() 
	return All(
		Any(
			MetroidHatchling,
			MorphBall
		),
		CanEscapeTransportArea8
	)
end)
SurfaceTransportArea8Hallway:connect_one_way(SurfaceTransportArea8HallwayPickup, function() 
	return All(
		MetroidHatchling,
		CanSpider,
		Any(
			CanSpiderBoost,
			CanIBJVertical,
			All(
				SpaceJump,
				MovementSimple
			)
		)
	)
end)
SurfaceTransportArea8Exit:connect_one_way_entrance(LandingSiteWest, function() 
	return All(
		Any(
			MetroidHatchling,
			MorphBall
		),
		CanEscapeTransportArea8
	)
end)