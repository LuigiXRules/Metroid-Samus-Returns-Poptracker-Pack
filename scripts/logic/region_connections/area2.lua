-- Exterior
DamExteriorEast:connect_one_way_entrance(LightningArmorUpper) -- Elevator
DamExteriorEast:connect_one_way_entrance(CritterPlaygroundBottom) -- Normal Door
DamExteriorEast:connect_one_way_entrance(CritterPlaygroundTunnel, OpenMorphTunnelDoor)
DamExteriorEast:connect_one_way_entrance(DamExteriorTop, CanFlyVertical)
DamExteriorEast:connect_one_way(DamExteriorEastPickup, function()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		All(
			CanIBJVertical,
			LightningArmor
		)
	)
end)
DamExteriorTop:connect_one_way_entrance(DamExteriorEast)
DamExteriorTop:connect_one_way_entrance(DamExteriorWest)
DamExteriorTop:connect_one_way_entrance(DamExteriorInner, CanEscapeArachnusDrop)
DamExteriorTop:connect_one_way_entrance(DamExteriorAlphaLedge, function()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanIBJDiagonal
	)
end)
DamExteriorInner:connect_one_way_entrance(DamExteriorTop, CanEscapeArachnusDrop)
DamExteriorInner:connect_one_way_entrance(Arachnus, function ()
	return All(
		OpenMissileDoor,
		CanEscapeArachnusLoop
	)
end)
-- DamExteriorInner:connect_one_way_entrance(Area2ExteriorMaintenanceTunnel) - locked
DamExteriorWest:connect_one_way_entrance(DamExteriorTop, CanClimbWall)
DamExteriorWest:connect_one_way_entrance(DamExteriorAlphaLedge, function()
	return Any(
		CanFlyVertical,
		All(
			LightningArmor,
			CanSpider
		)
	)
end)
DamExteriorWest:connect_one_way_entrance(DamExteriorWest, function()
	return Any(
		MetroidHatchling,
		CanBombBlock
	)
end)
DamExteriorWest:connect_one_way_entrance(RockIcicleCorridor) -- Normal Door
DamExteriorWest:connect_one_way_entrance(Area2ExteriorCavernsEntrance) -- Normal Door
DamExteriorWest:connect_one_way_entrance(WaveBeamNorthwest) -- Elevator
DamExteriorBottom:connect_one_way_entrance(DamExteriorWest, function()
	return Any(
		CanBombBlock,
		All(
			MetroidHatchling,
			CanClimbShaft
		)
	)
end)
-- DamExteriorBottom:connect_one_way_entrance(Area2ExteriorCavernsEntrance) - locked
DamExteriorBottom:connect_one_way_entrance(DamExteriorTop, function()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanIBJDiagonal,
		All(
			CanSpider,
			DamageBoostStatic
		)
	)
end)
DamExteriorAlphaLedge:connect_one_way_entrance(DamExteriorWest)
DamExteriorAlphaLedge:connect_one_way_entrance(DamExteriorTop, function()
	return Any(
		SpaceJump,
		CanSpiderBoost,
		CanIBJDiagonal,
		All(
			CanSpider,
			DamageBoostStatic
		)
	)
end)
DamExteriorAlphaLedge:connect_one_way_entrance(Area2ExteriorAlpha2) -- Normal Door

-- Arachnus:connect_one_way(DamExteriorInner) - locked
Arachnus:connect_one_way_entrance(FanFunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeArachnusLoop
	)
end)
FanFunnel:connect_one_way_entrance(Arachnus, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
FanFunnel:connect_one_way_entrance(Area2ExteriorMaintenanceTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeArachnusLoop
	)
end)
CritterPlaygroundTop:connect_one_way_entrance(RockIcicleCorridor) -- Normal Door
CritterPlaygroundTop:connect_one_way_entrance(Area2ExteriorInnerAlpha) -- Normal Door
CritterPlaygroundTop:connect_one_way_entrance(CritterPlaygroundMiddle)
CritterPlaygroundMiddle:connect_one_way_entrance(CritterPlaygroundTop, CanClimbWall)
CritterPlaygroundMiddle:connect_one_way_entrance(CritterPlaygroundPickup, function()
	return All(
		MetroidHatchling,
		CanClimbWall
	)
end)
CritterPlaygroundBottom:connect_one_way_entrance(CritterPlaygroundMiddle, OpenMorphTunnelDoor)
CritterPlaygroundBottom:connect_one_way_entrance(DamExteriorEast) -- Normal Door
CritterPlaygroundTunnel:connect_one_way_entrance(DamExteriorEast, OpenMorphTunnelDoor)
CritterPlaygroundTunnel:connect_one_way_entrance(CritterPlaygroundPickup, function()
	return All(
		OpenMorphTunnelDoor,
		CanClimbWall,
		CanBombBlock
	)
end)
CritterPlaygroundPickup:connect_one_way_entrance(CritterPlaygroundTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
CritterPlaygroundPickup:connect_one_way_entrance(CritterPlaygroundMiddle, function()
	return All(
		OpenMorphTunnelDoor,
		MetroidHatchling
	)
end)

Area2ExteriorCavernsEntrance:connect_one_way_entrance(DamExteriorWest) -- Normal Door
-- Area2ExteriorCavernsEntrance:connect_one_way_entrance(Area2ExteriorAmmoRechargeAccess) - Normal Door
Area2ExteriorCavernsEntrance:connect_one_way_entrance(DamExteriorBottom) -- Normal Door
Area2ExteriorCavernsEntrance:connect_one_way_entrance(SpikeRavineUpper, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area2ExteriorCavernsEntrance:connect_one_way_entrance(SpikeRavineLower, OpenMorphTunnelDoor)
Area2ExteriorCavernsEntrance:connect_one_way_entrance(Area2ExteriorCavernsSaveStation) -- Normal Door
Area2ExteriorCavernsEntrance:connect_one_way(Area2ExteriorCavernsEntrancePickup, function()
	return All(
		Any(
			CanSpider,
			PhaseDrift,
			MovementSimple
		),
		Any(
			MetroidHatchling,
			SuperMissile
		),
		CanBombBlock
	)
end)
SpikeRavineUpper:connect_one_way_entrance(Area2ExteriorCavernsEntrance, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
SpikeRavineUpper:connect_one_way_entrance(SpikeRavineLower)
SpikeRavineUpper:connect_one_way_entrance(SpikeRavinePickup, function()
	return All(
		GrappleBeam,
		CanSpiderBoost
	)
end)
SpikeRavineLower:connect_one_way_entrance(Area2ExteriorCavernsEntrance, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
SpikeRavineLower:connect_one_way_entrance(SpikeRavineUpper, CanClimbWall)
SpikeRavineLower:connect_two_ways_entrance(SpikeRavinePickup, CanSpiderBoost)
SpikeRavinePickup:connect_one_way_entrance(SpikeRavineLower)
SpikeRavinePickup:connect_one_way(SpikeRavinePickupPickup, function() return Has(MorphBall) end)
-- Area2ExteriorAmmoRechargeAccess:connect_one_way_entrance(Area2ExteriorCavernsEntrance) - Normal Door; no logical effect
-- Area2ExteriorAmmoRechargeAccess:connect_one_way_entrance(Area2ExteriorCavernsAmmoRecharge) - Normal Door; no logical effect

Area2ExteriorCavernsMaze:connect_one_way_entrance(Area2ExteriorCavernsSaveStation, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
Area2ExteriorCavernsMaze:connect_one_way(Area2ExteriorCavernsMazePickup, CanBombBlock)
Area2ExteriorCavernsSaveStation:connect_one_way_entrance(Area2ExteriorCavernsEntrance) -- Normal Door
Area2ExteriorCavernsSaveStation:connect_one_way_entrance(Area2ExteriorCavernsMaze, function()
	return All(
		OpenMorphTunnelDoor,
		CanBomb
	)
end)
Area2ExteriorCavernsSaveStation:connect_one_way_entrance(Area2ExteriorCavernsAlphaNw) -- Normal Door
Area2ExteriorCavernsSaveStation:connect_one_way_entrance(Area2ExteriorCavernsAlphaEAccessLeft)
Area2ExteriorCavernsAlphaNw:connect_one_way_entrance(Area2ExteriorCavernsSaveStation, CanClimbWall) -- Normal Door
Area2ExteriorCavernsAlphaNw:connect_one_way_entrance(Area2ExteriorCavernsLobby, function()
	return All(
		OpenChargeDoor,
		CanClimbWall
	)
end)
Area2ExteriorCavernsAlphaNw:connect_one_way(Area2ExteriorCavernsAlphaNwAlpha, CanDamageMetroid)
Area2ExteriorCavernsLobby:connect_one_way_entrance(Area2ExteriorCavernsAlphaNw, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
Area2ExteriorCavernsLobby:connect_one_way_entrance(Area2ExteriorCavernsAlphaSw, function()
	return All(
		OpenTaramargaDoor,
		VariaSuit
	)
end)
Area2ExteriorCavernsLobby:connect_one_way_entrance(Area2ExteriorCavernsTeleporterLeft, function() return Has(VariaSuit) end) -- Normal Door
Area2ExteriorCavernsAlphaSw:connect_one_way_entrance(Area2ExteriorCavernsLobby, function() return Has(VariaSuit) end) -- Normal Door
Area2ExteriorCavernsAlphaSw:connect_one_way(Area2ExteriorCavernsAlphaSwAlpha, function()
	return All(
		VariaSuit,
		CanDamageMetroid
	)
end)
Area2ExteriorCavernsAlphaEAccessLeft:connect_one_way_entrance(Area2ExteriorCavernsSaveStation)
Area2ExteriorCavernsAlphaEAccessLeft:connect_one_way_entrance(Area2ExteriorCavernsAlphaEAccessRight, function()
	return All(
		OpenMorphTunnelDoor,
		Any(
			CanPowerBomb,
			All(
				SpringBall,
				CanBomb
			)
		)
	)
end)
Area2ExteriorCavernsAlphaEAccessRight:connect_one_way_entrance(Area2ExteriorCavernsAlphaEAccessLeft, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area2ExteriorCavernsAlphaEAccessRight:connect_one_way_entrance(Area2ExteriorCavernsAlphaE, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeCavernsAlphaEast
	)
end)
Area2ExteriorCavernsTeleporterLeft:connect_one_way_entrance(Area2ExteriorCavernsLobby) -- Normal Door
Area2ExteriorCavernsTeleporterLeft:connect_one_way_entrance(Area2ExteriorCavernsTeleporterRight, function()
	return All(
		CanAnyMissile,
		Any(
			HighJumpBoots,
			SpaceJump
		),
		Any(
			IceBeam,
			SpaceJump,
			CanSpider
		)
	)
end)
Area2ExteriorCavernsTeleporterLeft:connect_one_way(Area2ExteriorCavernsTeleporterLeftPickup, function()
	return All(
		CanBlobthrower,
		CanBombBlock
	)
end)
Area2ExteriorCavernsTeleporterRight:connect_one_way_entrance(Area2ExteriorCavernsTeleporterLeft, function()
	return All(
		CanAnyMissile,
		Any(
			IceBeam,
			SpaceJump,
			MorphBall
		)	
	)
end)
Area2ExteriorCavernsTeleporterRight:connect_one_way_entrance(Area2ExteriorCavernsAlpha2) -- Normal Door
Area2ExteriorAlpha2:connect_one_way_entrance(DamExteriorAlphaLedge) -- Normal Door
Area2ExteriorAlpha2:connect_one_way_entrance(SereneShelter, OpenSuperDoor)
Area2ExteriorAlpha2:connect_one_way(Area2ExteriorAlpha2Alpha, CanDamageMetroid)
SereneShelter:connect_one_way_entrance(Area2ExteriorAlpha2, OpenSuperDoor)
SereneShelter:connect_one_way(SereneShelterPickup, function()
	return All(
		CanClimbShaft,
		Any(
			CanBomb,
			All(
				MovementSimple,
				CanPowerBomb
			)
		)
	)
end)
Area2ExteriorCavernsAlpha2:connect_one_way_entrance(Area2ExteriorCavernsTeleporterRight) -- Normal Door
Area2ExteriorCavernsAlpha2:connect_one_way(Area2ExteriorCavernsAlpha2Alpha, CanDamageMetroid)
Area2ExteriorInnerAlpha:connect_one_way_entrance(CritterPlaygroundTop) -- Normal Door
Area2ExteriorInnerAlpha:connect_one_way(Area2ExteriorInnerAlphaAlpha, CanDamageMetroid)
RockIcicleCorridor:connect_one_way_entrance(DamExteriorWest) -- Normal Door
RockIcicleCorridor:connect_one_way_entrance(CritterPlaygroundTop) -- Normal Door
Area2ExteriorMaintenanceTunnel:connect_one_way_entrance(FanFunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
Area2ExteriorMaintenanceTunnel:connect_one_way_entrance(DamExteriorInner, CanEscapeArachnusLoop) -- Normal Door
-- Area2ExteriorCavernsAmmoRecharge:connect_one_way_entrance(Area2ExteriorAmmoRechargeAccess) - Normal Door; no logical effect
Area2ExteriorCavernsAlphaE:connect_one_way_entrance(Area2ExteriorCavernsAlphaEAccessRight, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeCavernsAlphaEast
	)
end)
Area2ExteriorCavernsAlphaE:connect_one_way(Area2ExteriorCavernsAlphaEAlpha, CanDamageMetroid)

-- Interior
WaveBeamNorthwest:connect_one_way_entrance(DamExteriorWest) -- Elevator
WaveBeamNorthwest:connect_two_ways_entrance(WaveBeamSouth, CanEscapeWaveChamber)
WaveBeamSouth:connect_one_way_entrance(LavaGenerator, OpenChargeDoor)
WaveBeamSouth:connect_one_way_entrance(GeneratorAccessUpper, OpenChargeDoor)
WaveBeamSouth:connect_one_way_entrance(WaveBeamNortheast, function()
	return All(
		OpenMorphTunnelDoor,
		Any(
			LightningArmor,
			CanDamageToughEnemy
		),
		CanClimbWall
	)
end)
WaveBeamSouth:connect_one_way_entrance(WaveBeamEast, OpenMorphTunnelDoor)
WaveBeamSouth:connect_two_ways_entrance(WaveBeamSoutheast, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeWavetoVaria
	)
end)
WaveBeamSoutheast:connect_one_way_entrance(WallfireCorridor) -- Normal Door
WaveBeamEast:connect_one_way_entrance(WaveBeamSouth, OpenMorphTunnelDoor)
WaveBeamEast:connect_one_way_entrance(Area2InteriorIntersectionNorthChamber, OpenTaramargaDoor)
WaveBeamNortheast:connect_one_way_entrance(WaveBeamSouth, OpenMorphTunnelDoor)
WaveBeamNortheast:connect_one_way_entrance(Area2InteriorIntersectionSideTunnel, OpenTaramargaDoor)
WaveBeamChamber:connect_one_way_entrance(Area2InteriorIntersectionNorthChamber, OpenMissileDoor)

Area2InteriorIntersectionSideTunnel:connect_one_way_entrance(Area2InteriorIntersectionSoutheast)
Area2InteriorIntersectionSideTunnel:connect_one_way_entrance(WaveBeamNortheast, OpenTaramargaDoor)
Area2InteriorIntersectionSideTunnel:connect_one_way_entrance(Area2InteriorIntersectionSouthTunnel, function() return Has(ScrewAttack) end)
Area2InteriorIntersectionSoutheast:connect_one_way_entrance(Area2InteriorIntersectionSideTunnel, CanHighLedge)
Area2InteriorIntersectionSoutheast:connect_one_way_entrance(WhimsicalWaterwheels) -- Normal Door
Area2InteriorIntersectionSouthTunnel:connect_one_way_entrance(Area2InteriorIntersectionSouth, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInteriorGammaArenatoIntersectionTerminal
	)
end)		
Area2InteriorIntersectionSouthTunnel:connect_one_way_entrance(Area2InteriorIntersectionNorthTunnel, CanClimbWall)
Area2InteriorIntersectionNorthTunnel:connect_one_way_entrance(Area2InteriorIntersectionSouthTunnel)
Area2InteriorIntersectionNorthTunnel:connect_one_way_entrance(Area2InteriorIntersectionSouthChamber, function() return Has(ScrewAttack) end)
Area2InteriorIntersectionNorthTunnel:connect_one_way_entrance(Area2InteriorIntersectionSideTunnel, function() return Has(ScrewAttack) end)
Area2InteriorIntersectionNorthTunnel:connect_one_way_entrance(Area2InteriorIntersectionNorthChamber, OpenMorphTunnelDoor)
Area2InteriorIntersectionSouthChamber:connect_one_way_entrance(Area2InteriorIntersectionSouthTunnel, function() return Has(ScrewAttack) end)
Area2InteriorIntersectionSouthChamber:connect_one_way_entrance(GeneratorAccessNortheast, OpenChargeDoor)
Area2InteriorIntersectionSouthChamber:connect_one_way_entrance(WallfireCorridor, OpenMissileDoor)
Area2InteriorIntersectionSouthChamber:connect_one_way(Area2InteriorIntersectionSouthChamberTunnelPickup, function() return Has(ScrewAttack) end)
Area2InteriorIntersectionSouth:connect_one_way_entrance(Area2InteriorIntersectionSouthTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeInteriorGammaArenatoIntersectionTerminal
	)
end)
Area2InteriorIntersectionSouth:connect_one_way_entrance(Area2InteriorGamma) -- Normal Door
Area2InteriorIntersectionNorthChamber:connect_one_way_entrance(Area2InteriorIntersectionNorthTunnel, function()
	return All(
		OpenMorphTunnelDoor,
		CanBeamBlockThroughFanTunnel
	)
end)
Area2InteriorIntersectionNorthChamber:connect_one_way_entrance(WaveBeamEast, OpenTaramargaDoor)
Area2InteriorIntersectionNorthChamber:connect_one_way_entrance(WaveBeamChamber, OpenMissileDoor)

LavaGenerator:connect_one_way_entrance(WaveBeamSouth, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
LavaGenerator:connect_one_way_entrance(GeneratorAccessLower, function() return Has(VariaSuit) end) -- Normal Door
LavaGenerator:connect_one_way_entrance(CrumbleCavern, function()
	return All(
		OpenPowerBombDoor,
		VariaSuit
	)
end)
LavaGenerator:connect_one_way_entrance(Area2InteriorGamma, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
LavaGenerator:connect_one_way(LavaGeneratorPickup, function()
	return All(
		VariaSuit,
		Any(
			All(
				CanSpider,
				CanBombBlock
			),
			All(
				CanDamageToughEnemy,
				Any(
					CanPowerBomb,
					CanIBJDouble,
					All(
						MovementSimple,
						Any(
							WallJumpSimple,
							CanHighJump
						)
					)
				)
			)
		)
	)
end)

CrumbleCavern:connect_one_way_entrance(LavaGenerator, function()
	return All(
		OpenPowerBombDoor,
		VariaSuit
	)
end)
CrumbleCavern:connect_one_way(CrumbleCavernPickup, function()
	return All(
		VariaSuit,
		GrappleBeam,
		PhaseDrift,
		ScrewAttack,
		MorphBall
	)
end)
WhimsicalWaterwheels:connect_one_way_entrance(Area2InteriorIntersectionSoutheast) -- Normal Door
WhimsicalWaterwheels:connect_two_ways_entrance(Area2InteriorTeleporterUpper, OpenMorphTunnelDoor)
Area2InteriorTeleporterUpper:connect_two_ways_entrance(Area2InteriorTeleporterLower, CanEscapeInteriorTeleporter)
Area2InteriorTeleporterLower:connect_one_way_entrance(HighJumpBootsAccess, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeHiJumpAccess
	)
end)
Area2InteriorTeleporterLower:connect_one_way_entrance(FleechFireContainmentUpper, OpenTaramargaDoor)
Area2InteriorTeleporterLower:connect_one_way_entrance(Area2InteriorTeleporterStorage, OpenGryncoreDoor)
FleechFireContainmentUpper:connect_one_way_entrance(Area2InteriorTeleporterLower, OpenTaramargaDoor)
FleechFireContainmentUpper:connect_two_ways_entrance(FleechFireContainmentLower, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeFleechFireContainment
	)
end)
FleechFireContainmentLower:connect_two_ways_entrance(DamBasementLower) -- Normal Door
DamBasementUpper:connect_one_way_entrance(GulluggHideout, OpenMorphTunnelDoor)
GulluggHideout:connect_one_way_entrance(HighJumpBootsLower, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
GulluggHideout:connect_one_way_entrance(DamBasementUpper, function()
	return All(
		OpenMorphTunnelDoor,
		CanHighJump
	)
end)
HighJumpBootsUpper:connect_one_way_entrance(HighJumpBootsAccess, OpenMissileDoor)
HighJumpBootsUpper:connect_two_ways_entrance(HighJumpBootsLower, CanBombBlock)
HighJumpBootsLower:connect_one_way_entrance(GulluggHideout, function()
	return All(
		OpenMorphTunnelDoor,
		CanBombBlock
	)
end)
HighJumpBootsAccess:connect_one_way_entrance(Area2InteriorTeleporterLower, function()
	return All(
		OpenMorphTunnelDoor,
		CanEscapeHiJumpAccess
	)
end)
HighJumpBootsAccess:connect_one_way_entrance(HighJumpBootsUpper, OpenMissileDoor)
WallfireCorridor:connect_one_way_entrance(WaveBeamSoutheast) -- Normal Door
WallfireCorridor:connect_one_way_entrance(Area2InteriorIntersectionSouthChamber, OpenMissileDoor)
Area2InteriorTeleporterStorage:connect_one_way_entrance(Area2InteriorTeleporterLower, OpenGryncoreDoor)
Area2InteriorTeleporterStorage:connect_one_way(Area2InteriorTeleporterStoragePickup, function()
	return All(
		MissileLauncher,
		CanBombBlock
	)
end)
Area2InteriorGamma:connect_one_way_entrance(LavaGenerator, OpenChargeDoor)
Area2InteriorGamma:connect_one_way_entrance(Area2InteriorIntersectionSouth, OpenChargeDoor)
Area2InteriorGamma:connect_one_way(Area2InteriorGammaGamma, CanDamageMetroid)
-- VariaSuitChamber:connect_one_way_entrance() - may be unused
GeneratorAccessUpper:connect_one_way_entrance(WaveBeamSouth, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
GeneratorAccessUpper:connect_two_ways_entrance(GeneratorAccessLower, function()
	return All(
		OpenMorphTunnelDoor,
		VariaSuit
	)
end)
GeneratorAccessUpper:connect_two_ways_entrance(GeneratorAccessNortheast, function()
	return All(
		ScrewAttack,
		VariaSuit
	)
end)
GeneratorAccessLower:connect_one_way_entrance(LavaGenerator, function()
	return All(
		OpenChargeDoor,
		VariaSuit
	)
end)
GeneratorAccessNortheast:connect_one_way_entrance(Area2InteriorIntersectionSouthChamber, function()
	return All(
		OpenChargeDoor,
		VariaSuit,
		ScrewAttack
	)
end)

-- Entryway
TransportAreas1And3Area1:connect_one_way_entrance(TransportSurfaceArea2Area2) -- Elevator
-- TransportAreas1And3Area1:connect_one_way_entrance(Area2EntrywayTeleporterUpper) - locked
TransportAreas1And3Area1:connect_two_ways_entrance(TransportAreas1And3Seal, OpenMorphTunnelDoor)
TransportAreas1And3Seal:connect_one_way_entrance(Area2EntrywayTeleporterLower, OpenMorphTunnelDoor)
TransportAreas1And3Seal:connect_one_way_entrance(TransportAreas1And3Area3, function()
	return All(
		OpenMorphTunnelDoor,
		CanBeamBlockThroughTunnel
	)
end)
TransportAreas1And3Seal:connect_one_way(TransportAreas1And3SealPlantsPickup, function()
	return All(
		LightningArmor,
		CanBombBlock
	)
end)
TransportAreas1And3Seal:connect_one_way(TransportAreas1And3SealTunnelPickup, function()
	return Any(
		CanPowerBomb,
		All(
			MetroidHatchling,
			CanBomb
		)
	)
end)
TransportAreas1And3Area3:connect_one_way_entrance(TransportAreas1And3Seal, OpenMorphTunnelDoor)
TransportAreas1And3Area3:connect_one_way_entrance(TransportArea2Upper) -- Elevator
Area2EntrywayTeleporterLower:connect_one_way_entrance(TransportAreas1And3Seal) -- Normal Door
Area2EntrywayTeleporterLower:connect_one_way_entrance(Area2EntrywayTeleporterUpper, CanHighLedge)
Area2EntrywayTeleporterUpper:connect_one_way_entrance(Area2EntrywayTeleporterLower)
-- Area2EntrywayTeleporterUpper:connect_one_way_entrance(TransportAreas1And3Area1, function() return Has(MorphBall) end) - Normal Door; no logical effect; subregion "Upper" doesn't exist?
Area2EntrywayTeleporterUpper:connect_one_way_entrance(Area2EntrywayAlpha2Arena) -- Normal Door
Area2EntrywayTeleporterUpper:connect_one_way(Area2EntrywayTeleporterUpperPickup, function() return Has(MorphBall) end)
LightningArmorLower:connect_one_way_entrance(Area2TransportAccessLower) -- Normal Door
LightningArmorLower:connect_two_ways_entrance(LightningArmorTutorial, OpenMorphTunnelDoor)
LightningArmorLower:connect_one_way(LightningArmorLowerPickup, function() return Has(MorphBall) end)
LightningArmorTutorial:connect_one_way(LightningArmorTutorialPickup, function() return Has(LightningArmor) end)
-- Some event for opening a door from the bottom?
LightningArmorUpper:connect_one_way_entrance(Area2TransportAccessUpper) -- Normal Door
LightningArmorUpper:connect_one_way_entrance(DamExteriorEast) -- Elevator
-- Some event for opening a door from the top?
Area2TransportAccessUpper:connect_one_way_entrance(Area2EntrywayAlpha2Exit)
Area2TransportAccessUpper:connect_one_way_entrance(LightningArmorUpper, function() 
	return
	CanReach(LightningArmorTutorial)
end,
{LightningArmorTutorial}) -- Normal Door; involves events created earlier
Area2TransportAccessUpper:connect_two_ways_entrance(Area2TransportAccessLower, CanEscapeTransportAccess)
Area2TransportAccessLower:connect_one_way_entrance(FleechSwarmFloodway, CanHighLedge)
Area2TransportAccessLower:connect_one_way_entrance(LightningArmorLower) -- Normal Door
FleechSwarmFloodway:connect_one_way_entrance(Area2TransportAccessLower)
FleechSwarmFloodway:connect_one_way(FleechSwarmFloodwayPickup, CanFleechSwarm)
Area2EntrywayAlpha2Arena:connect_one_way_entrance(Area2EntrywayTeleporterUpper) -- Normal Door
Area2EntrywayAlpha2Arena:connect_two_ways_entrance(Area2EntrywayAlpha2Exit, function()
	return All(
		OpenMorphTunnelDoor,
		CanAnyMissile
	)
end)
Area2EntrywayAlpha2Arena:connect_one_way(Area2EntrywayAlpha2ArenaAlpha, CanDamageMetroid)
Area2EntrywayAlpha2Exit:connect_one_way_entrance(Area2TransportAccessUpper)

