# xyrc's Krastorio 2 Spaced Out Enhancements
Laundry list of tweaks, fixes, and overall enhancements to [Krastorio 2 Spaced Out](https://mods.factorio.com/mod/Krastorio2-spaced-out), focused on compatability with other mods, consistency changes, and balancing.
Recommended usage with [Null's tweaks](https://mods.factorio.com/mod/nulls-k2so-tweaks), which adds a similar suite of changes.

Most of this mod is currently untested. Feedback and suggestions are welcomed.

Most changes done by this mod can be toggled in the mod settings on startup, though the majority of them are intended to be left enabled and are done so by default.
The mods settings are detailed more in game, including effects on existing saves and recommendations.
***
# Changes
## Built-in
### Vehicles & Equipment
- Vehicles and trains from external mods are now properly supported by K2's equipment system
  - Supported: Muluna's rocket buggy, SE Space Trains, Maraxsis' submarines
  - Stats such as weight and weapon range are also fixed and consume the proper fuels
- Solar panel from silicon cell recipe is now an bulk recipe, uses more ingredients to output 4 solar panels at once
- Range and firerate of tesla turret and tesla gun buffed; tesla turret draws half the power passively
## Toggleable
All settings in this category can be enabled or disabled in the mod settings!
### General
- Decrease the weight of many intermediates, making them easier to ship via rocket
  - This is primarily targetted and ingredients such as inserter parts or automation cores, to promote in-situ assembly of buildings
- Processing unit altnerative recipe rebalance
  - Bio processing unit recipe ratios fixed and is made in biochamber instead of EM plant
  - Cerys' processing unit from nitric acid ratios changed and is locked to Cerys
  - Paracelsin's processing unit from nitric acid changed; notably requires one less advanced circuit
- (Default off) Starting after the first four vanilla planets, all non-upgrade techs begin to use signifcantly more tech cards to complete, increasing later in the game. This is supposed to make the player use the tools K2, Space Age, and other mods add in order to build a "kilobase". The multiplier can be further adjusted in mod settings. **It is highly recommended to enable this setting**
- Reorganizes tech cards and research data from K2 and other mods into a more digestable format if [Science group](https://mods.factorio.com/mod/science-tab) is installed
- (Default off) Spidertron recipe requires raw fish again
- (Default off) K2's Advanced Tank locked behind science from Vulcanus, Gleba, & Fulgora to encourage usage of combat spidertrons
### Paracelsin
- Adds "new" galvanization tech card, replacing the galvanization science pack as seen in the thumbnail
  - Similar to other Space Age tech cards, galvanization tech cards must be produced on Paracelsin (through the same recipe as previously) before being combined with blank tech cards anywhere to produce the end product
  - Adjacent recipes such as "tech card with cooling" and tech card vessels exist as well
- Galvanization tech cards can be toggled to be required for endgame research (post-promethium)
- Rebalance K2's advanced chemical plant and Paracelsin's electrochemical plant
  - Adv. chemical plants are slightly cheaper overall to craft, crafting speed and bonus productivity halved (to 4x and +25%), energy usage slightly reduced, 10 can be shipped per rocket instead of 5
  - Electrochemical plants have quadruple the crafting speed and bonus productivity (to 8x and +50%), energy usage increased
  - Adv. chemical plants require two chemical plants to craft, and the electrochemical plant requires one adv. chemical plant
- Mechanical plant can run a lot more recipes
### Secretas & Frozeta
- Adds "new" auric tech card, replacing the golden science pack, as well as auric research data
- Polishes the mod overall, including tweaking tech requirements and making recipes less insane
### Corrundum
- Adds electrochemical tech card, replacing the electrochemical science pack, as well as electrochemical research data
### Outer Rim
- Tech card replacements for all of the tech cards, with sprites and corresponding research data
- Removes early game tech cards from Outer Rim affected researches
### Moshine
- Extends the distance from Vulcanus and Nauvis to Moshine to 10000 km and 25000 km respectively.
### Maraxsis
- Hydro plant can run fuel refinery recipes; this may put the cryo plant out of a job
- (Default off) Add a connection from Moshine to Maraxsis which is 15000 km long
### Lab changes
- Move all lab buildings to the science category if the Science group mod is installed without needing to meet the ten lab requirement
- The singularity lab requires Muluna's cryolab instead of biolabs in its recipe and inherits the cryolab's quality drain modifier. If Muluna isn't installed, quantum processors will be added to its recipe instead in order to require more Space Age materials (outside of Gleba)
- If Paracelsin is installed, Muluna's cryolab requires galvanization tech cards (if enabled) and requires electric coils among other changes in its recipe
- Biolabs rocket capacity increased from 1 to 5
***
Credits to Krastorio 2 as research data and tech card sprites were edited to create the assets in this mod.
