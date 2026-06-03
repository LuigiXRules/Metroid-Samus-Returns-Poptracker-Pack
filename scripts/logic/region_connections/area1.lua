-- Entrance
TransportSurfaceArea2Surface:connect_one_way_entrance(TransportArea1) -- Elevator
TransportSurfaceArea2Surface:connect_one_way_entrance(MoheekMount) -- Normal Door
TransportSurfaceArea2Surface:connect_one_way_entrance(TransportSurfaceArea2Area2, function()
	return All(
		MorphBall,
		Any(
			PowerBomb,
			ScrewAttack,
			All(
				MissileLauncher,
				CanBeamBlockThroughTunnel
			)
		)
	)
end)
TransportSurfaceArea2Area2:connect_one_way_entrance(TransportSurfaceArea2Surface, function()
	return All(
		MorphBall,
		Any(
			Bomb,
			All(
				Any(
					MovementSimple,
					All(
						MovementDisabled,
						AccessibilityLevel.SequenceBreak
					)
				),
				MissileLauncher
			),
			All(
				ScrewAttack,
				Any(
					CanClimbShaft,
					MovementSimple,
					All(
						MovementDisabled,
						AccessibilityLevel.SequenceBreak
					)
				)
			)
		)
	)
end)
TransportSurfaceArea2Area2:connect_one_way_entrance(TransportAreas1And3Area1) -- Elevator
TransportSurfaceArea2Area2:connect_one_way_entrance(Area1TransportCache, function()
	return All(
		OpenTaramargaDoor,
		Any(
			ScrewAttack,
			MorphBall
		),
		CanAlmostHighJump,
		CanBeamBlockThroughTunnel
	)
end)
MoheekMount:connect_one_way_entrance(TransportSurfaceArea2Surface) -- Normal Door
MoheekMount:connect_one_way_entrance(HarmonizedHallway)
MoheekMount:connect_one_way_entrance(Area1MagmaPoolLeft, OpenChargeDoor)
GulluggGangway:connect_one_way_entrance(ChuteLeechCabin)
GulluggGangway:connect_one_way_entrance(WaterMazeTunnel)
GulluggGangway:connect_one_way_entrance(WaterMazeMaze, function()
	return All(
		OpenGryncoreDoor,
		WaveBeam
	)
end)
GulluggGangway:connect_one_way_entrance(Area1MagmaPoolRight, OpenChargeDoor)
GulluggGangway:connect_one_way_entrance(HarmonizedHallway)
BombChamber:connect_one_way_entrance(BombAccess, OpenMissileDoor)
BombChamber:connect_two_ways_entrance(BombTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
BombTunnel:connect_one_way_entrance(BombAccess, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
BombTunnel:connect_one_way(BombTunnelPickup, CanBombBlock)

-- Temple
InnerTempleEHallUpper:connect_one_way_entrance(InnerTempleUpperHallway, function()
	return Any(
		CanClimbWall,
		All(
			HighJumpBoots,
			CanClimbShaft
		),
		CanSuperJumpMorphExtend,
		All(
			SuperJumpBeginner,
			WallJumpSimple,
			MorphExtendsEasy
		),
		All(
			SuperJumpDisabled,
			WallJumpDisabled,
			MorphExtendsDisabled,
			AccessibilityLevel.SequenceBreak
		)
	)
end) -- Normal Door
InnerTempleEHallUpper:connect_one_way_entrance(TempleExteriorSoutheast) -- Normal Door
InnerTempleEHallUpper:connect_one_way_entrance(InnerTempleEHallLower)
InnerTempleEHallLower:connect_one_way_entrance(InnerTempleEHallUpper, function()
	return Any(
		IceBeam,
		CanHigherJump
	)
end)
InnerTempleEHallLower:connect_two_ways_entrance(DestroyedArmory, OpenChargeDoor)
InnerTempleEHallLower:connect_one_way_entrance(IceBeamAccess, CanEscapeIceChamberAccess)
DestroyedArmory:connect_one_way_entrance(SpiderBallTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
DestroyedArmory:connect_one_way(DestroyedArmoryPickup, function()
	return Any(
		SpaceJump,
		IceBeam,
		All(
			CanSpider,
			Any(
				CanBombBlock,
				MovementIntermediate,
				All(
					MovementSimple,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
SpiderBallDoorAccess:connect_one_way_entrance(TempleExteriorSoutheast, OpenMorphTunnelDoor)
SpiderBallDoorAccess:connect_one_way_entrance(SpiderBallChamber) -- Normal Door
SpiderBallChamber:connect_one_way_entrance(TempleExteriorSoutheast)
SpiderBallChamber:connect_one_way(SpiderBallChamberPickup, function()
	return All(
		MorphBall,
		CanHighLedge
	)
end)
SpiderBallTunnel:connect_one_way_entrance(DestroyedArmory, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
SpiderBallTunnel:connect_one_way(SpiderBallTunnelPickup, CanBombBlock)
Area1ExteriorAlpha:connect_one_way_entrance(TempleExteriorSouthwest) -- Normal Door
Area1ExteriorAlpha:connect_one_way(Area1ExteriorAlphaAlpha, CanCombatAlpha)
Area1ExteriorAlpha:connect_one_way(Area1ExteriorAlphaPickup, function()
	return All(
		CanBombBlock,
		CanAlmostHighLedge
	)
end)
TempleExteriorSoutheast:connect_one_way_entrance(InnerTempleEHallUpper) -- Normal Door
-- There is a locked door between TempleExteriorSoutheast and SpiderBallChamber; may be important for door rando
TempleExteriorSoutheast:connect_one_way_entrance(Area1ExteriorAlpha, CanClimbWall) -- Normal Door
TempleExteriorSoutheast:connect_one_way_entrance(SpiderBallDoorAccess, OpenMorphTunnelDoor)
TempleExteriorSoutheast:connect_one_way_entrance(TempleExteriorCenter, CanClimbWall)
TempleExteriorSoutheast:connect_one_way(TempleExteriorSoutheastPickup, CanAlmostHighLedge)
TempleExteriorCenter:connect_one_way_entrance(TempleExteriorSoutheast)
TempleExteriorCenter:connect_one_way_entrance(TempleExteriorTop, CanClimbWall)
TempleExteriorCenter:connect_one_way_entrance(TempleExteriorSouthwest)
TempleExteriorCenter:connect_one_way(TempleExteriorCenterPickup, CanBombBlock)
TempleExteriorSouthwest:connect_one_way_entrance(TempleExteriorCenter, CanClimbWall)
TempleExteriorSouthwest:connect_one_way_entrance(InnerTempleVentShaftTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
TempleExteriorSouthwest:connect_one_way_entrance(ChuteLeechCabin)
TempleExteriorSouthwest:connect_one_way_entrance(InnerTempleSaveStation)
TempleExteriorTop:connect_one_way_entrance(TempleExteriorCenter)
TempleExteriorTop:connect_one_way(TempleExteriorTopPickup, function()
	return All(
		CanBombBlock,
		CanAnyMissile
	)
end)

-- Inner Temple
Area1CavernsLobby:connect_one_way_entrance(Area1CavernsHub, CanBombBlock)
Area1CavernsLobby:connect_one_way_entrance(Area1CavernsEnergyRecharge, function()
	return All(
		Any(
			CanAlmostHighLedge,
			MovementSimple,
			All(
				MovementDisabled,
				AccessibilityLevel.SequenceBreak
			)
		),
		CanBombBlock
	)
end)
Area1CavernsLobby:connect_two_ways_entrance(Area1CavernsAlphaSwAccess)
Area1CavernsLobby:connect_one_way_entrance(Area1CavernsAlphaSe) -- Normal Door
Area1CavernsAlphaSwAccess:connect_one_way_entrance(Area1CavernsAlphaSw, function()
	return All(
		Any(
			CanAlmostHighLedge,
			IceBeam
		),
		CanAnyMissile,
		Any(
			IceBeam,
			SpaceJump
		)
	)
end)
Area1CavernsAlphaSe:connect_one_way_entrance(Area1CavernsLobby) -- Normal Door
Area1CavernsAlphaSe:connect_one_way(Area1CavernsAlphaSeAlpha, CanCombatAlpha)
Area1CavernsAlphaNe:connect_one_way_entrance(Area1CavernsAlphaNeAccess) -- Normal Door
Area1CavernsAlphaNe:connect_one_way(Area1CavernsAlphaNeAlpha, CanCombatAlpha)
WaterMazeTunnel:connect_one_way_entrance(GulluggGangway)
WaterMazeTunnel:connect_one_way_entrance(Area1CavernsSaveStationMain)
WaterMazeMaze:connect_one_way_entrance(GulluggGangway, OpenGryncoreDoor)
WaterMazeMaze:connect_one_way_entrance(WaterMazePickup, function()
	return All(
		CanAnyMissile,
		MorphBall,
		OpenMorphTunnelDoor,
		Any(
			All(
				PhaseDrift,
				Any(
					GravitySuit,
					CanHighSuperJumporClimb
				)
			),
			All(
				MetroidHatchling,
				GravitySuit
			)
		)
	)
end)
WaterMazePickup:connect_one_way_entrance(WaterMazeMaze, function()
	return All(
		OpenMorphTunnelDoor,
		MissileLauncher
	)
end)
WaterMazePickup:connect_one_way_entrance(Area1CavernsSaveStationMain, function()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
IceBeamChamber:connect_one_way_entrance(IceBeamAccess, OpenMissileDoor)
IceBeamChamber:connect_one_way(IceBeamCrystalsPickup, function()
	return All(
		MorphBall,
		MetroidHatchling,
		CanAnyMissile
	)
end)
Area1CavernsEnergyRecharge:connect_one_way_entrance(Area1CavernsLobby, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)

Area1MagmaPoolLeft:connect_one_way_entrance(MoheekMount, function()
	return All(
		OpenChargeDoor,
		VariaSuit,
		CanClimbWall
	)
end)
Area1MagmaPoolLeft:connect_two_ways_entrance(Area1MagmaPoolRight, function()
	return All(
		OpenChargeDoor,
		VariaSuit,
		Any(
			GravitySuit,
			CanSpider
		)
	)
end)
Area1MagmaPoolLeft:connect_one_way(Area1MagmaPoolLeftAlcovePickup, function()
	return All(
		VariaSuit,
		Any(
			SpaceJump,
			CanSpider
		)
	)
end)
Area1MagmaPoolLeft:connect_one_way(Area1MagmaPoolLeftMagmaPickup, function()
	return All(
		VariaSuit,
		GravitySuit,
		SuperMissile,
		MorphBall,
		Any(
			CanAlmostHigherJump,
			CanClimbElevatedShaft
		)
	)
end)
Area1MagmaPoolRight:connect_one_way_entrance(GulluggGangway, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)

InnerTempleWHallUpper:connect_one_way_entrance(InnerTempleSaveStation, CanEscapeInnerTempleWestHall)
InnerTempleWHallUpper:connect_one_way_entrance(InnerTempleTeleporterAccess) -- Normal Door
InnerTempleWHallUpper:connect_one_way_entrance(BombAccess)
InnerTempleWHallUpper:connect_two_ways_entrance(InnerTempleWHallLower, OpenMorphTunnelDoor)
InnerTempleWHallLower:connect_one_way_entrance(Area1CavernsHub, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInnerTempleWestHall
	)
end)
Area1CavernsSaveStationMain:connect_one_way_entrance(WaterMazeTunnel)
Area1CavernsSaveStationMain:connect_one_way_entrance(Area1CavernsHub)
-- Also connects to WaterMazePickup, but it's a one-way grapple block that you open from the other side; he removed this?
Area1CavernsSaveStationMain:connect_one_way_entrance(Area1CavernsSaveStationPickupTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
Area1CavernsSaveStationPickupTunnel:connect_one_way_entrance(Area1CavernsHub, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area1CavernsSaveStationPickupTunnel:connect_one_way_entrance(Area1CavernsSaveStationMain, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
InnerTempleTeleporterAccess:connect_one_way_entrance(InnerTempleWHallUpper) -- Normal Door
InnerTempleTeleporterAccess:connect_one_way_entrance(InnerTempleTeleporter, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
InnerTempleVentShaftTunnel:connect_one_way_entrance(InnerTempleUpperHallway, OpenMorphTunnelDoor)
InnerTempleVentShaftTunnel:connect_one_way_entrance(TempleExteriorSouthwest, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
InnerTempleVentShaftShaft:connect_one_way_entrance(InnerTempleUpperHallway, OpenGigadoraDoor)
InnerTempleVentShaftShaft:connect_one_way_entrance(InnerTempleTeleporterAccess, CanEscapeInnerTempleWestHall)
InnerTempleVentShaftShaft:connect_one_way_entrance(InnerTempleVentShaftShaftPickup, function()
	return Any(
		SpaceJump,
		CanSpider,
		All(
			HighJumpBoots,
			Any(
				WallJumpIntermediate,
				All(
					WallJumpSimple,
					AccessibilityLevel.SequenceBreak
				)
			)
		)
	)
end)
Area1CavernsHub:connect_one_way_entrance(Area1CavernsSaveStationMain)
Area1CavernsHub:connect_one_way_entrance(InnerTempleWHallLower, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInnerTempleWestHall
	)
end)
Area1CavernsHub:connect_one_way_entrance(Area1CavernsSaveStationPickupTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				CanBomb,
				Any(
					CanSpider,
					CanIBJVertical
				)
			)
		)
	)
end)
Area1CavernsHub:connect_two_ways_entrance(Area1CavernsAlphaNeAccess)
Area1CavernsHub:connect_one_way_entrance(Area1CavernsLobby, CanBombBlock)
Area1CavernsAlphaNeAccess:connect_one_way_entrance(Area1CavernsAlphaNe) -- Normal Door
BombAccess:connect_one_way_entrance(InnerTempleWHallUpper)
BombAccess:connect_one_way_entrance(BombChamber, OpenMissileDoor)
BombAccess:connect_one_way_entrance(BombTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
InnerTempleSaveStation:connect_one_way_entrance(InnerTempleWHallUpper, CanEscapeInnerTempleWestHall)
InnerTempleSaveStation:connect_one_way_entrance(TempleExteriorSouthwest)
-- InnerTempleUpperHallway:connect_one_way_entrance(InnerTempleEHallUpper) - Locked Door
InnerTempleUpperHallway:connect_one_way_entrance(InnerTempleVentShaftTunnel, OpenMorphTunnelDoor)
InnerTempleUpperHallway:connect_one_way_entrance(InnerTempleVentShaftShaft, OpenGigadoraDoor)
InnerTempleTeleporter:connect_one_way_entrance(InnerTempleTeleporterAccess, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
InnerTempleTeleporter:connect_one_way_entrance(InnerTempleEHallLower)
IceBeamAccess:connect_one_way_entrance(InnerTempleEHallLower, CanEscapeIceChamberAccess)
IceBeamAccess:connect_one_way_entrance(IceBeamChamber, OpenMissileDoor)
Area1TransportCache:connect_one_way_entrance(TransportSurfaceArea2Area2, OpenTaramargaDoor)
Area1TransportCache:connect_one_way(Area1TransportCachePickup, CanBombBlock)
HarmonizedHallway:connect_one_way_entrance(MoheekMount)
HarmonizedHallway:connect_one_way_entrance(GulluggGangway)
Area1CavernsAlphaSw:connect_one_way_entrance(Area1CavernsAlphaSwAccess, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area1CavernsAlphaSw:connect_one_way(Area1CavernsAlphaSwAlpha, CanCombatAlpha)
ChuteLeechCabin:connect_one_way_entrance(GulluggGangway)
ChuteLeechCabin:connect_one_way_entrance(TempleExteriorSouthwest)
