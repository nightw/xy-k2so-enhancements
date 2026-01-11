-- More reasonable scaling; make quality labs helpful, not OP; quality should not be "required"
if settings.startup['xy-lab-recipe-changes'].value then
    data.raw.quality.uncommon.science_pack_drain_multiplier = .975
    data.raw.quality.rare.science_pack_drain_multiplier = .95
    data.raw.quality.epic.science_pack_drain_multiplier = .925
    data.raw.quality.legendary.science_pack_drain_multiplier = .875
end
