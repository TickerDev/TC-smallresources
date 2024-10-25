# TC-smallresources
Base scripts for ESX Framework :building_construction:
I changed it to work for me, it has less than qb-smallresources because I have alternatives.

## Dependencies
- [ESX](https://github.com/esx-framework/esx-core)
- [OXLIB](https://github.com/overextended/ox_lib)
## Features
- Removal of GTA's default weapons drops
- Removal of GTA's default vehicle spawns (planes, helicopters, emergency vehicles etc.)
- Removal of GTA's default emergency service npcs
- Removal of GTA's default wanted system
- Taking hostage
- Pointing animation with finger (by pressing "B")
- Calm AI (adjusting npc/gang npc aggresiveness)
- Adjusting npc/vehicle/parked vehicle spawn rates
- Infinite ammo for fire extinguisher and petrol can
- Removal of GTA's default huds (weapon wheel, cash etc.)
- Crouch and prone



## Installation
### Manual
- Download the script and put it in the `[esx-addons]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure es_extnded
ensure ox_lib
ensure qb-smallresources
```

## Configuration
Each feature has a different file name correlative with its function. You can configure each one by its own.
