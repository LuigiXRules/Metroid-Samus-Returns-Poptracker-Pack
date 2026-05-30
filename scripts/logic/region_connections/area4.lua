-- Caves
Area4CavesIntersectionTerminalCenter:connect_one_way_entrance(Area4CavesIntersectionTerminalBottom, CanBombBlock)
Area4CavesIntersectionTerminalCenter:connect_two_ways_entrance(Area4CavesIntersectionTerminalAlcove, function ()
	return Any(
		MorphBall,
		MetroidHatchling
	)
end)
Area4CavesIntersectionTerminalCenter:connect_one_way_entrance(TransportArea3MinesTopLeft) -- Normal Door
Area4CavesIntersectionTerminalCenter:connect_one_way_entrance(FleechSwarmCave, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area4CavesIntersectionTerminalCenter:connect_one_way_entrance(CrumbleCatwalk, function ()
	return All(
		OpenGryncoreDoor,
		MorphBall,
		GrappleBeam
	)
end)
Area4CavesIntersectionTerminalBottom:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter, CanBombBlock)
Area4CavesIntersectionTerminalBottom:connect_one_way_entrance(AmethystAltars)
Area4CavesIntersectionTerminalBottom:connect_one_way_entrance(TransitTunnelTop, OpenChargeDoor)
Area4CavesIntersectionTerminalAlcove:connect_one_way_entrance(LavaPondArena, OpenGigadoraDoor)
Area4CavesIntersectionTerminalPickup:connect_one_way_entrance(TransportArea3MinesTopLeft, OpenGigadoraDoor)
Area4CavesIntersectionTerminalPickup:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter, OpenMorphTunnelDoor)
Area4CavesIntersectionTerminalPickup:connect_one_way(Area4CavesIntersectionTerminalPickupPickup, function () return Has(MorphBall) end)

-- SpazerBeamChamber:connect_one_way_entrance(AmethystAltars) - locked door
SpazerBeamChamber:connect_one_way_entrance(AmethystAltars, function ()
	return All(
		OpenGigadoraDoor,
		CanEscapeSpazerChamber
	)
end)
-- CrumbleCatwalk:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter) - locked door
CrumbleCatwalk:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter, function ()
	return All(
		OpenMorphTunnelDoor,
		GrappleBeam
	)
end)
CrumbleCatwalk:connect_one_way(CrumbleCatwalkPickup, function ()
	return All(
		MorphBall,
		Any(
			All(
				Any(
					SpaceJump,
					CanSpider
				),
				GrappleBeam
			),
			All(
				PhaseDrift,
				Any(
					GrappleBeam,
					CanSpiderBoost,
					CanIBJVertical
				)
			)
		)
	)
end)
LavaPondArena:connect_one_way_entrance(Area4CavesIntersectionTerminalAlcove, function() return Has(VariaSuit) end) -- Normal Door
LavaPondArena:connect_one_way_entrance(LavaPondExit, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		GrappleBeam
	)
end)
LavaPondExit:connect_one_way_entrance(LavaPondArena, OpenMorphTunnelDoor)
LavaPondExit:connect_one_way_entrance(Area4CavesGammaAccessSRight, OpenMorphTunnelDoor)
TransportArea3MinesTop:connect_one_way_entrance(TransportArea3MinesLeftSeal, CanCrossPurplePuddle)
TransportArea3MinesTop:connect_one_way_entrance(TransportArea4Transport, CanCrossPurplePuddle) -- Elevator
TransportArea3MinesTop:connect_one_way_entrance(TransportArea3MinesPickupGrappleBlock, function ()
	return All(
		MorphBall,
		GrappleBeam
	)
end)
TransportArea3MinesLeftSeal:connect_one_way_entrance(TransportArea3MinesTop, CanCrossPurplePuddle)
TransportArea3MinesLeftSeal:connect_one_way_entrance(TransportArea3MinesRightSeal, CanCrossPurplePuddle)
TransportArea3MinesLeftSeal:connect_one_way_entrance(TransportArea3MinesTopLeft, function ()
	return Any(
		CanFlyVertical,
		All(
			GrappleBeam,
			CanSpider
		)
	)
end)
TransportArea3MinesLeftSeal:connect_one_way(TransportArea3MinesLeftSealPickup, function ()
	return All(
		GrappleBeam,
		MorphBall,
		CanCrossPurplePuddle
	)
end)
TransportArea3MinesLeftSeal:connect_one_way_entrance(TransportArea3MinesLeftGrappleBlock, function ()
	return All(
		SuperMissile,
		GrappleBeam
	)
end)
TransportArea3MinesTopLeft:connect_one_way_entrance(TransportArea3MinesLeftSeal)
TransportArea3MinesTopLeft:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter) -- Normal Door
TransportArea3MinesTopLeft:connect_one_way_entrance(Area4CavesIntersectionTerminalPickup, function ()
	return All(
		OpenGigadoraDoor,
		CanFlyVertical
	)
end)
TransportArea3MinesRightSeal:connect_one_way_entrance(TransportArea3MinesLeftSeal, function ()
	return Any(
		SpaceJump,
		CanSpider
	)
end)
TransportArea3MinesRightSeal:connect_one_way_entrance(TransportArea3MinesTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea3MinesRightSeal:connect_two_ways_entrance(TransportArea3MinesBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea3MinesRightSeal:connect_one_way_entrance(TransportArea3MinesMinesTransport, function()
	return All(
		OpenMorphTunnelDoor,
		CanShortShaft
	)
end)
-- TransportArea3MinesRightSeal:connect_one_way_entrance(Area4TransportArea5) - blocked by grapple block
TransportArea3MinesMinesTransport:connect_one_way_entrance(TransportArea3MinesRightSeal, OpenMorphTunnelDoor)
TransportArea3MinesMinesTransport:connect_one_way_entrance(MinesTransportCentralCaves) -- Elevator
TransportArea3MinesBottom:connect_two_ways_entrance(TransportArea3MinesBottomLeft, CanSpider)
TransportArea3MinesBottom:connect_one_way_entrance(VenomousPondRight, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
TransportArea3MinesBottomLeft:connect_one_way_entrance(Area4TransportArea5Upper, OpenMorphTunnelDoor)

Area4CavesAlpha2:connect_one_way_entrance(Area4CavesAlpha2AccessUpper, CanEscapeEvolvedAlpha) -- Normal Door
Area4CavesAlpha2:connect_one_way(Area4CavesAlpha2Pickup, function ()
	return Any(
		CanClimbShaft,
		CanEscapeEvolvedAlpha
	)
end)
Area4CavesAlpha2:connect_one_way(Area4CavesAlpha2Alpha, function ()
	return All(
		CanDamageMetroid,
		CanEscapeEvolvedAlpha
	)
end)
TransitTunnelTop:connect_one_way_entrance(Area4CavesIntersectionTerminalBottom, OpenChargeDoor)
-- TransitTunnelTop:connect_one_way_entrance(Area4CavesAlpha2AccessUpper) - locked door
TransitTunnelTop:connect_two_ways_entrance(TransitTunnelMiddle, function ()
	return All(
		OpenMorphTunnelDoor,
		CanTraverseTransitTunnel
	)
end)
TransitTunnelMiddle:connect_one_way_entrance(TransitTunnelBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				CanReach(TransportArea3MinesLeftGrappleBlock),
				GrappleBeam,
				CanBomb()
			)
		)
	)
end)
TransitTunnelMiddle:connect_one_way(TransitTunnelMiddlePickup, function ()
	return All(
		CanTraverseTransitTunnel,
		CanBombBlock
	)
end)
TransitTunnelBottom:connect_one_way_entrance(TransitTunnelMiddle, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
TransitTunnelBottom:connect_one_way_entrance(Area4CavesAlpha2AccessLower, function ()
	return All(
		OpenGigadoraDoor,
		CanBomb
	)
end)
FleechSwarmCave:connect_one_way_entrance(Area4CavesIntersectionTerminalCenter, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
FleechSwarmCave:connect_one_way(FleechSwarmCavePickup, function ()
	return All(
		MorphBall,
		CanFleechSwarm
	)
end)
-- HostileHangout:connect_one_way_entrance() - Gamma doesn't escape?

Area4CavesGammaArena:connect_one_way_entrance(Area4CavesGammaAccessNRight) -- Normal Door
Area4CavesGammaArena:connect_two_ways_entrance(Area4CavesGammaLower, function ()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area4CavesGammaArena:connect_one_way(Area4CavesGammaArenaGamma, CanDamageMetroid)
Area4CavesGammaLower:connect_one_way_entrance(Area4CavesGammaAccessSTop)
Area4CavesGammaLower:connect_one_way(Area4CavesGammaLowerPickup, function ()
	return All(
		MorphBall,
		MissileLauncher,
		CanFlyVertical
	)
end)
Area4CavesGammaAccessSRight:connect_one_way_entrance(LavaPondExit) -- Normal Door
Area4CavesGammaAccessSRight:connect_two_ways_entrance(Area4CavesGammaAccessSLeft, CanCrossCavesGammaHazards)
Area4CavesGammaAccessSRight:connect_one_way(Area4CavesGammaAccessSRightPickup, function ()
	return Any(
		CanPowerBomb,
		All(
			CanBomb,
			LightningArmor
		),
		All(
			MetroidHatchling,
			MorphBall
		)
	)
end)
Area4CavesGammaAccessSLeft:connect_one_way_entrance(OutwardClimb)
Area4CavesGammaAccessSTop:connect_one_way_entrance(Area4CavesGammaLower)
Area4CavesGammaAccessSTop:connect_one_way_entrance(Area4CavesGammaAccessSRight, function ()
	return All(
		GrappleBeam,
		MorphBall
	)
end)
OutwardClimb:connect_one_way_entrance(Area4CavesGammaAccessSRight)
OutwardClimb:connect_one_way_entrance(Area4CavesGammaAccessNRight)
AmethystAltars:connect_one_way_entrance(Area4CavesIntersectionTerminalBottom)
AmethystAltars:connect_one_way_entrance(SpazerBeamChamber, function ()
	return All(
		OpenMissileDoor,
		CanEscapeSpazerChamber
	)
end)
-- AmethystAltars:connect_one_way_entrance(SpaceJumpChamber) - locked door
AmethystAltars:connect_one_way_entrance(AmethystAltarsPickup, function ()
	return All(
		CanAnyMissile,
		Any(
			IceBeam,
			All(
				CanAlmostHigherJump,
				MovementSimple
			)
		)
	)
end)
Area4CavesGammaAccessNLeft:connect_one_way_entrance(OutwardClimb)
Area4CavesGammaAccessNLeft:connect_two_ways_entrance(Area4CavesGammaAccessNRight, CanCrossCavesGammaHazards)
Area4CavesGammaAccessNRight:connect_one_way_entrance(Area4CavesGammaArena) -- Normal Door
-- Area4CavesAlpha2AccessLower:connect_one_way_entrance(TransitTunnelBottom) - locked door
Area4CavesAlpha2AccessLower:connect_two_ways_entrance(Area4CavesAlpha2AccessUpper, OpenMorphTunnelDoor)
Area4CavesAlpha2AccessUpper:connect_one_way_entrance(Area4CavesAlpha2, OpenMorphTunnelDoor)
Area4CavesAlpha2AccessUpper:connect_one_way_entrance(TransitTunnelTop) -- Normal Door
VenomousPondRight:connect_one_way_entrance(TransportArea3MinesBottom, function ()
	return All(
		OpenMorphTunnelDoor,
		CanFlyVertical
	)
end)
VenomousPondRight:connect_two_ways_entrance(VenomousPondLeft, function ()
	return Any(
		SpaceJump,
		CanSpiderBoost
	)
end)
VenomousPondLeft:connect_one_way_entrance(Area4TransportArea5Lower, OpenMorphTunnelDoor)
Area4TransportArea5Upper:connect_one_way_entrance(TransportArea3MinesBottomLeft, OpenMorphTunnelDoor)
Area4TransportArea5Upper:connect_one_way_entrance(TransportArea3MinesRightSeal, function ()
	return All(
		OpenChargeDoor,
		MorphBall,
		GrappleBeam
	)
end)
Area4TransportArea5Upper:connect_two_ways_entrance(Area4TransportArea5Lower, function () return Has(ScrewAttack) end)
Area4TransportArea5Upper:connect_one_way(TransportArea5UpperPickup, function ()
	return All(
		MorphBall,
		GrappleBeam,
		SuperMissile
	)
end)
Area4TransportArea5Lower:connect_one_way_entrance(VenomousPondLeft) -- Normal Door
Area4TransportArea5Lower:connect_one_way_entrance(TransportAreas4And6Upper) -- Elevator

-- Mines
MinesIntersectionTerminalExit:connect_one_way_entrance(MinesIntersectionTerminalBottom, function ()
	return Any(
		MorphBall,
		CanShortShaft
	)
end)
MinesIntersectionTerminalExit:connect_one_way_entrance(TsumuriTunnel)
MinesIntersectionTerminalBottom:connect_one_way_entrance(MinesIntersectionTerminalExit)
MinesIntersectionTerminalBottom:connect_one_way_entrance(MinesIntersectionTerminalSaveStation, CanAlmostHighLedge)
MinesIntersectionTerminalBottom:connect_one_way(MinesIntersectionTerminalBottomPickup, function ()
	return All(
		CanBombBlock,
		Any(
			WaveBeam,
			CanPowerBomb
		),
		Any(
			PhaseDrift,
			MetroidHatchling
		)
	)
end)
MinesIntersectionTerminalSaveStation:connect_one_way_entrance(MinesIntersectionTerminalBottom)
MinesIntersectionTerminalSaveStation:connect_one_way_entrance(MinesIntersectionTerminalMiddle, function ()
	return Any(
		HighJumpBoots,
		CanClimbWall,
		SuperJumpEasy,
		CanIBJDiagonal
	)
end)
MinesIntersectionTerminalSaveStation:connect_one_way_entrance(GemstoneGorgeBottom, OpenSuperDoor)
MinesIntersectionTerminalMiddle:connect_one_way_entrance(MinesIntersectionTerminalSaveStation)
MinesIntersectionTerminalMiddle:connect_one_way_entrance(DualPondAlcove, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
MinesIntersectionTerminalMiddle:connect_one_way_entrance(LavaReservoirRight, OpenGigadoraDoor)
MinesIntersectionTerminalMiddle:connect_one_way_entrance(SuperMissileChamber, OpenMissileDoor)
MinesIntersectionTerminalAccessway:connect_one_way_entrance(MinesIntersectionTerminalMiddle)
MinesIntersectionTerminalAccessway:connect_one_way_entrance(MinesIntersectionTerminalTop, CanShorterShaft)
MinesIntersectionTerminalAccessway:connect_one_way_entrance(SuperMissileChamber, OpenSuperDoor)
MinesIntersectionTerminalTop:connect_one_way_entrance(MinesIntersectionTerminalAccessway)
MinesIntersectionTerminalTop:connect_one_way_entrance(GreenCrystalDugout, CanAlmostHighLedge)
MinesIntersectionTerminalTop:connect_one_way(MinesIntersectionTerminalTopPickup, function ()
	return All(
		SuperMissile,
		MorphBall,
		Any(
			GrappleBeam,
			All(
				GravitySuit,
				CanIBJVertical
			),
			CanSpiderBoostUnderwater
		)
	)
end)

SuperMissileChamber:connect_one_way_entrance(MinesIntersectionTerminalMiddle, OpenMissileDoor)
SuperMissileChamber:connect_one_way_entrance(MinesIntersectionTerminalAccessway, function ()
	return All(
		OpenSuperDoor,
		Any(
			CanClimbWall,
			All(
				CanAlmostHighJump,
				CanClimbShaft
			)
		)
	)
end)
SuperMissileChamber:connect_one_way(SuperMissilePickup, function()
	return Any(
		CanClimbWall,
		All(
			CanAlmostHigherJump,
			WallJumpSimple
		)
	)
end)
PinkCrystalPreserveTop:connect_two_ways_entrance(PinkCrystalPreserveBottom, CanEscapePinkCrystals)
PinkCrystalPreserveTop:connect_two_ways_entrance(PinkCrystalPreservePickup, function ()
	return Any(
		SpaceJump,
		CanSpiderBoost
	)
end)
PinkCrystalPreserveBottom:connect_one_way_entrance(Area4MinesZeta, function ()
	return Any(
		CanAlmostHighJump,
		All(
			CanSpider,
			Any(
				Bomb,
				SpringBall,
				MovementSimple
			)
		)
	)
end) -- Normal Door
PinkCrystalPreservePickup:connect_one_way_entrance(PinkCrystalPreserveBottom)
PinkCrystalPreservePickup:connect_one_way(PinkCrystalPreservePickupPickup, function ()
	return All(
		MorphBall,
		CanFlyVertical
	)
end)
MinesTransportCentralCaves:connect_one_way_entrance(TransportArea3MinesMinesTransport) -- Elevator
MinesTransportCentralCaves:connect_one_way_entrance(MinesEntrance, OpenChargeDoor)
LavaReservoirRight:connect_one_way_entrance(MinesIntersectionTerminalMiddle, function () return Has(VariaSuit) end) -- Normal Door
LavaReservoirRight:connect_one_way_entrance(LavaReservoirLeft, function ()
	return All(
		VariaSuit,
		GravitySuit,
		CanFlyVertical
	)
end) -- Normal Door
LavaReservoirLeft:connect_one_way_entrance(LavaReservoirRight, function ()
	return All(
		VariaSuit,
		GravitySuit
	)
end) -- Normal Door
DualPondAlcove:connect_one_way_entrance(MinesIntersectionTerminalMiddle, function ()
	return All(
		OpenMorphTunnelDoor,
		CanPowerBomb
	)
end)
DualPondAlcove:connect_one_way(DualPondAlcovePickup, function ()
	return All(
		CanSpiderBoost,
		Any(
			KnowledgeSimple,
			GravitySuit,
			All(
				Any(
					GravitySuit,
					HighJumpBoots,
					All(
						CanSpider,
						MovementSimple
					),
					All(
						SuperJumpMedium,
						WallJumpSimple
					)
				),
				Any(
					SpaceJump,
					HighJumpBoots
				)
			)
		)
	)
end)
Area4MinesZeta:connect_one_way_entrance(PinkCrystalPreserveBottom) -- Normal Door
Area4MinesZeta:connect_one_way(Area4MinesZetaZeta, CanDamageMetroid)

GawronGrooveLeft:connect_one_way_entrance(GawronGrooveTop, function ()
	return All(
		VariaSuit,
		Any(
			IceBeam,
			CanHighLedge
		)
	)
end)
GawronGrooveLeft:connect_one_way_entrance(GawronGrooveArenaLeft, function ()
	return All(
		SuperMissile,
		VariaSuit,
		CanEscapeBasaltBasin
	)
end)
GawronGrooveTop:connect_one_way_entrance(GawronGrooveLeft, function () return Has(VariaSuit) end)
GawronGrooveTop:connect_one_way_entrance(GawronGrooveRight, function () return Has(VariaSuit) end)
GawronGrooveTop:connect_one_way_entrance(BasaltBasinTop, function () 
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanBombBlock
	)
end)
GawronGrooveTop:connect_one_way(GawronGrooveTopPickup, function ()
	return All(
		MorphBall,
		SuperMissile,
		VariaSuit
	)
end)
GawronGrooveRight:connect_one_way_entrance(GawronGrooveTop, function ()
	return All(
		VariaSuit,
		Any(
			CanAlmostHighLedge,
			MovementSimple
		)
	)
end)
GawronGrooveRight:connect_one_way_entrance(BasaltBasinTop, function () 
	return All(
		OpenMorphTunnelDoor,
		SuperMissile,
		VariaSuit,
		CanBombBlock
	)
end)
GawronGrooveRight:connect_one_way_entrance(Area4MinesGamma2, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanEscapeEvolvedGamma
	)
end)
GawronGrooveArenaLeft:connect_one_way_entrance(GawronGrooveLeft, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeBasaltBasin,
		SuperMissile,
		VariaSuit
	)
end)
GawronGrooveArenaLeft:connect_two_ways_entrance(GawronGrooveArenaRight, function ()
	return All(
		VariaSuit,
		Any(
			CanFly,
			CanSpiderBoost,
			DamageBoostStatic
		)
	)
end)
GawronGrooveArenaRight:connect_one_way_entrance(BasaltBasinSeal, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanClimbWall,
		CanBombBlock
	)
end)
MinesEntrance:connect_one_way_entrance(MinesTransportCentralCaves, OpenChargeDoor)
MinesEntrance:connect_one_way_entrance(DiggernautExcavationTunnelsEntrance, OpenMissileDoor)
-- MinesEntrance:connect_one_way_entrance(TsumuriTunnel, CanFlyVertical) - locked door
TsumuriTunnel:connect_one_way_entrance(MinesIntersectionTerminalExit, OpenSuperDoor)
TsumuriTunnel:connect_one_way_entrance(MinesEntrance) -- Normal Door
-- MinesTeleporter:connect_one_way_entrance() - not logically relevant
GreenCrystalDugout:connect_one_way_entrance(MinesIntersectionTerminalTop)
GreenCrystalDugout:connect_one_way_entrance(GawronGrooveLeft) -- Normal Door
GemstoneGorgeBottom:connect_one_way_entrance(MinesIntersectionTerminalSaveStation, OpenSuperDoor)
GemstoneGorgeBottom:connect_one_way_entrance(GemstoneGorgeTop, function ()
	return All(
		OpenMorphTunnelDoor,
		CanFlyVertical
	)
end)
GemstoneGorgeBottom:connect_one_way(GemstoneGorgeBottomPickup, function ()
	return All(
		SpaceJump,
		ScrewAttack,
		CanBombBlock
	)
end)
GemstoneGorgeTop:connect_one_way_entrance(PinkCrystalPreserveBottom)
-- GemstoneGorgeTop:connect_one_way_entrance(LavaReservoirLeft) - locked door
GemstoneGorgeTop:connect_one_way_entrance(GemstoneGorgeBottom, OpenMorphTunnelDoor)
Area4MinesGamma2:connect_one_way_entrance(GawronGrooveArenaRight, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanEscapeEvolvedGamma
	)
end)
Area4MinesGamma2:connect_one_way(Area4MinesGamma2Gamma, function ()
	return All(
		VariaSuit,
		CanDamageMetroid
	)
end)

BasaltBasinTop:connect_one_way_entrance(BasaltBasinSeal, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanEscapeBasaltBasin
	)
end)
BasaltBasinTop:connect_one_way_entrance(GawronGrooveLeft, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanBombBlock
	)
end)
BasaltBasinTop:connect_one_way_entrance(GawronGrooveRight, function ()
	return All(
		OpenMorphTunnelDoor,
		SuperMissile,
		VariaSuit,
		CanBombBlock,
		CanAlmostHighLedge
	)
end)
BasaltBasinSeal:connect_one_way_entrance(GawronGrooveArenaRight, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanBombBlock
	)
end)
BasaltBasinSeal:connect_one_way_entrance(GawronGrooveArenaRight, function ()
	return All(
		OpenMorphTunnelDoor,
		CanHighBombBlock
	)
end)
BasaltBasinSeal:connect_one_way_entrance(BasaltBasinTop, function ()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit,
		CanEscapeBasaltBasin
	)
end)
SpaceJumpChamber:connect_one_way_entrance(MinesIntersectionTerminalBottom, CanEscapeSJChamberTop) -- Normal Door
SpaceJumpChamber:connect_one_way_entrance(DiggernautExcavationTunnelsSublevel1, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeSJChamberTop,
		SuperMissile
	)
end)
-- connection to Sublevel 2 is a grapple block from the other side
SpaceJumpChamber:connect_one_way_entrance(DiggernautExcavationTunnelsSublevel3, function ()
	return All(
		OpenMorphTunnelDoor,
		CanSJChambertoDiggernautTunnelsMaze
	)
end)
SpaceJumpChamber:connect_one_way(SpaceJumpPickup, CanEscapeSJChamberBottom)
DiggernautExcavationTunnelsEntrance:connect_one_way_entrance(MinesEntrance, OpenMissileDoor)
DiggernautExcavationTunnelsEntrance:connect_one_way_entrance(DiggernautExcavationTunnelsSublevel1, OpenMorphTunnelDoor)
DiggernautExcavationTunnelsSublevel1:connect_one_way_entrance(DiggernautExcavationTunnelsEntrance, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeDiggernautTunnelsTop
	)
end)
DiggernautExcavationTunnelsSublevel1:connect_one_way_entrance(DiggernautExcavationTunnelsSublevel2, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeDiggernautTunnelsBottom
	)
end)
DiggernautExcavationTunnelsSublevel1:connect_one_way_entrance(SpaceJumpChamber, function ()
	return All(
		OpenMorphTunnelDoor,
		SuperMissile
	)
end)
DiggernautExcavationTunnelsSublevel1:connect_one_way(DiggernautExcavationTunnelsSublevel1Pickup, function ()
	return All(
		MorphBall,
		Any(
			MetroidHatchling,
			All(
				PhaseDrift,
				CanBombBlock
			)
		)
	)
end)
DiggernautExcavationTunnelsSublevel2:connect_one_way_entrance(DiggernautExcavationTunnelsSublevel1, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeDiggernautTunnelsTop
	)
end)
DiggernautExcavationTunnelsSublevel2:connect_two_ways_entrance(DiggernautExcavationTunnelsSublevel3, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeDiggernautTunnelsBottom
	)
end)
DiggernautExcavationTunnelsSublevel2:connect_one_way_entrance(SpaceJumpChamber, function ()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeDiggernautTunnelsSide
	)
end)
DiggernautExcavationTunnelsSublevel2:connect_one_way(DiggernautExcavationTunnelsSublevel2PickupPlants, function ()
	return All(
		CanBombBlock,
		LightningArmor
	)
end)
DiggernautExcavationTunnelsSublevel2:connect_one_way(DiggernautExcavationTunnelsSublevel2PickupPuzzle, CanBombBlock)
DiggernautExcavationTunnelsSublevel3:connect_one_way(DiggernautExcavationTunnelsSublevel3Pickup, CanBombBlock)
