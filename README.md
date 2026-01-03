# xyrc's Krastorio 2 Spaced Out Enhancements
Laundry list of tweaks, fixes, and overall enhancements to [Krastorio 2 Spaced Out](https://mods.factorio.com/mod/Krastorio2-spaced-out), focused on compatability with other mods, consistency changes, and balancing.
Recommended usage with [Null's tweaks](https://mods.factorio.com/mod/nulls-k2so-tweaks), which adds a similar suite of changes

Most changes done by this mod can be toggled in the mod settings on startup, though the majority of them are intended to be left enabled and are done so by default.
***
# Changes
## Built-in
### Vehicles & Equipment
- Vehicles and trains from external mods are now properly supported by K2's equipment system
  - Supported: Muluna's rocket buggy, SE Space Trains, Maraxsis' submarines
  - Stats such as weight and weapon range are also fixed and consume the proper fuels
- Solar panel from silicon cell recipe is now an bulk recipe
  - Uses more ingredients to output 4 solar panels at once, consuming more aluminum to do so
## Toggleable
### General
- Decrease the weight of many intermediates, making them easier to ship via rocket
  - This is primarily targetted and ingredients such as inserter parts or automation cores, to promote in-situ assembly of buildings
- Processing unit altnerative recipe rebalance
  - Bio processing unit recipe ratios fixed and is made in biochamber instead of EM plant
  - Cerys' processing unit from nitric acid ratios changed and is locked to Cerys
  - Paracelsin's processing unit from nitric acid changed; notably requires one less advanced circuit
### Paracelsin
- Adds "new" galvanization tech card, replacing the galvanization science pack as seen in the thumbnail
  - Similar to other Space Age tech cards, galvanization tech cards must be produced on Paracelsin (through the same recipe as previously) before being combined with blank tech cards anywhere to produce the end product
  - Adjacent recipes such as "tech card with cooling" and tech card vessels exist as well
- Galvanization tech cards can be toggled to be required for endgame research (post-promethium)
- Rebalance K2's advanced chemical plant and Paracelsin's electrochemical plant
  - Adv. chemical plants are slightly cheaper overall to craft, crafting speed and bonus productivity halved (to 4x and +25%), energy usage slightly reduced, 10 can be shipped per rocket instead of 5
  - Electrochemical plants have quadruple the crafting speed and bonus productivity (to 8x and +50%), energy usage increased
  - Adv. chemical plants require two chemical plants to craft, and the electrochemical plant requires one adv. chemical plant
### Lab changes
- Move all lab buildings to the science category if the [Science group](https://mods.factorio.com/mod/science-tab) mod is installed without needing to meet the ten lab requirement
- The singularity lab requires Muluna's cryolab instead of biolabs in its recipe. If Muluna isn't installed, quantum processors will be added to its recipe instead in order to require more Space Age materials (outside of Gleba)
- If Paracelsin is installed, Muluna's cryolab requires galvanization tech cards (if enabled) and requires electric coils among other changes in its recipe
- Biolabs rocket capacity increased from 1 to 5
### Moshine
- Extends the distance from Vulcanus and Nauvis to Moshine to 10000 km and 25000 km respectively.
- Add a connection from Moshine to Maraxsis which is 15000 km long
