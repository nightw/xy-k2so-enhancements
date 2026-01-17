-- Patches vehicles from unpatched mods to use the correct K2 equipment grids
if mods['maraxsis'] then
    data.raw['equipment-grid']['maraxsis-diesel-submarine-equipment-grid'].equipment_categories = { "kr-vehicle", "kr-vehicle-motor", "kr-vehicle-roboport" }
    data.raw['equipment-grid']['maraxsis-nuclear-submarine-equipment-grid'].equipment_categories = { "kr-vehicle", "kr-vehicle-motor", "kr-vehicle-roboport" }
end

if mods['planet-muluna'] then
    data.raw['car']['muluna-rocket-buggy'].equipment_grid = 'kr-car-grid'
    -- Fix the rocket launcher stats to the same as the K2 Spidertron
    data.raw['gun']['muluna-rocket-buggy-rocket-launcher'].attack_parameters.cooldown = 90
    data.raw['gun']['muluna-rocket-buggy-rocket-launcher'].attack_parameters.range = 40
    -- Use Krastorio fuels and add pollution consumption
    data.raw['car']['muluna-rocket-buggy'].energy_source.fuel_categories = {'kr-vehicle-fuel'}
    data.raw['car']['muluna-rocket-buggy'].energy_source.emissions_per_minute = {pollution = 12.5}
end
-- Patch SE space trains overall to mirror the K2 adjusted Locomotive and give equipment grid; slightly reduced weight since no engines and stuff
if mods['se-space-trains'] then
    data.raw['locomotive']['space-locomotive'].weight = 8000
    data.raw['locomotive']['space-locomotive'].equipment_grid = 'kr-locomotive-grid'

    data.raw['cargo-wagon']['space-cargo-wagon'].weight = 1750
    data.raw['cargo-wagon']['space-cargo-wagon'].equipment_grid = 'kr-wagons-grid'

    data.raw['fluid-wagon']['space-fluid-wagon'].weight = 1750
    data.raw['fluid-wagon']['space-fluid-wagon'].equipment_grid = 'kr-wagons-grid'
end

if mods['rubia'] then
    data.raw['locomotive']['rubia-armored-locomotive'].weight = 20000
    data.raw['locomotive']['rubia-armored-locomotive'].equipment_grid = 'kr-locomotive-grid'
    table.insert(data.raw['locomotive']['rubia-armored-locomotive'].energy_source.fuel_categories, 'kr-vehicle-fuel')

    data.raw['cargo-wagon']['rubia-armored-cargo-wagon'].weight = 5000
    data.raw['cargo-wagon']['rubia-armored-cargo-wagon'].equipment_grid = 'kr-wagons-grid'

    data.raw['fluid-wagon']['rubia-armored-fluid-wagon'].weight = 5000
    data.raw['fluid-wagon']['rubia-armored-fluid-wagon'].equipment_grid = 'kr-wagons-grid'
end

