# Metroid: Samus Returns Poptracker Pack

This a PopTracker pack for lilDavid's Archipelago implementation of Metroid: Samus Returns.

Download the samus_returns_pack.zip from the appropriate release, and put it in the packs folder in your PopTracker directory. Alternatively, starting with v0.2.0, PopTracker should prompt you to update automatically when I release a new version.

Some of the maps are kinda big, but you can zoom in using the scroll wheel on your mouse as of v0.34.0 of PopTracker - I highly recommend having at least this version so you can take advantage of this feature.

## Known Issues

- Autotracking DNA Available doesn't work yet.
- My division of Surface East/West is different than the division the game uses; as such, the pack will not autotab to Surface West when climbing the cliff to the west of the ship. I am unsure on what I will do about this.
- Area 8 is considered one region in game, so despite there being two tabs for it, only the Lower tab will be autotabbed to.

## Next Steps

- Fine-tune some of the location placements
- Make locations you could obtain with higher trick levels appear yellow
- Make locations you can see but not obtain appear blue
- Create the framework for blast shield/elevator rando (if I have time)

## Special Thanks

This is the first time I've done anything even remotely close to coding in 10 years, so I needed a lot of help to put this together. Special thanks to all of the following people for helping me through this:

- lilDavid, for creating the AP implementation this is based on, writing most of the autotracking code, providing the overview map image, and helping with some location placements and other things related to the pack
- Dyceron, for giving me permission to use the maps Randovania uses for its Data Visualizer
- Everyone on else that worked on the Samus Returns Randovania implementation, because without that, there would be no need for a tracker
- Cyb3RGER and everyone that created the template pack, which I initially forked to get the general file structure of my pack
- StripesOO7 and everyone that worked on the pack builder scripts, for the scripts that generated the text-based settings in the settings menu and mapped the item/location ids
- OmegaZeron, for directing me towards the Oracle of Seasons Poptracker pack, which I based my logic structure off of, as well as writing some logging in the lua functions to help diagnose when things went wrong, and helping me troubleshoot the autotracking/autotabbing functions... and helping me figure out auto-update (they're practically a co-author of the pack)
- OnlySpaghettiCode, for helping me through publishing the github repository and creating a license, as well as helping with some questions I had regarding pack creation and guiding me through adding auto-update to the pack
- Everyone else on the PopTracker discord server for answering other questions I had regarding pack creation
- BMS for cropping a bunch of the item images for me
- You, for using this pack :)
