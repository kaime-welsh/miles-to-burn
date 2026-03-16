# Miles to Burn
## Goal
The ozone has disappeared and now, where the sun isn't the world freezes, and where it is burns.
So, you've built a vehicle to withstand it; problem now is keeping up the fuel and parts to keep the vehicle running.
Keep your RV running, scavenge for supplies on the road, replace broken parts and maintain your fuel, and barter with other survivors, and most importantly, KEEP MOVING.

## Multi-phase gameplay:
  1. The Driving Phase
    - Stay within the "goldilocks zone"
      - Going to slowly begins to freeze the RV
      - Going to fast begins to burn the RV
      - Both can damage the parts in different ways
    - Control the RV throttle to control the speed at which you move
      - Faster speeds drain fuel and wear parts quicker
    - Manage resources
    - Fill the gas tank
    - Managage engine temperature
    - Manage machines
    - Craft resources and upgrades
      - 3x3 crafting grid
      - 3 differents types of base crafting materials at least
        - metal scrap
        - electrical components
        - biological material
      - Combine these materials in the crafitng interface to make items
      - Craft upgrades
        - Mitigators: Will reduce resource drain by a small amount, a limited amount can be installed
        - Generators: Automate the collection of raw resources
        - Modifiers: Provide permanent tags to the RV itself that can be used for events, a limited amount can be installed but they can be swapped out.
  2. Event Resolution
    - Intermittently obstacles will arise
    - Events cause the RV to stop, with time still ticking so react fast
    - Events have a specific penalty listed, i.e. -30 hull -20 fuel, and a list of tags [Heavy], [Cold], [Tool], for example
    - Items also have tags and can be used if the tag matches
    - For each matched tag, mitigate a ratio of tags matched, i.e. for 1/3 -> take only -20 hull and -10 fuel
  3. The Pit Stop
    - Willingly sacrifice time at any point to stop the RV and install any upgrades, perform repairs, etc.

## Milestones:
After a certain amount of miles the world shifts and gets more difficult.
  - Sun speed increases, resource draw is increased
  - Event densitiy increased
  - Loot drop rates are increased, including Generator collection
  - Event penalties are multiplied for each milestone
  - Tags begin to "stack", i.e. what used to require just [Heat] now requires [Heat]x2
    - Crafting system should allow combining items of the same "tier" to create heigher tier items
  - At the end of every milestone a boss event is reached, these bosses will temporarily break the rules, i.e., [Electronic] items played are destroyed.

## Resources used
### Libraries
- [SUIT](https://github.com/vrld/SUIT)
- [PUSH](https://github.com/Ulydev/push)
### Assets
- [Micro Chat 5x5 font](https://v3x3d.itch.io/micro-chat)
