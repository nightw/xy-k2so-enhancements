if mods['planet-muluna'] and mods['Moshine'] then
    -- Rework "Solar panel from silicon cell" recipe to be more effective instead of just being the same thing but with aluminum
    -- 5 silicon replaced with 1 silicon cell, steel plate replaced with aluminum electronic circuit requirement removed,
    -- Crafting time and most inputs 3x, but output 4x
    data.raw['recipe']['muluna-silicon-solar-panel'].enabled = true
    data.raw['recipe']['muluna-silicon-solar-panel'].energy_required = 30
    data.raw['recipe']['muluna-silicon-solar-panel'].ingredients = {
        {type = 'item', name = 'silicon-cell', amount = 4},
        {type = 'item', name = 'kr-iron-beam', amount = 12},
        {type = 'item', name = 'aluminum-plate', amount = 15},
        {type = 'item', name = 'glass', amount = 30},
    }
    data.raw['recipe']['muluna-silicon-solar-panel'].results = {
        {type = 'item', name = 'solar-panel', amount = 4},
    }
end

-- Processing unit alt recipes
--[[data:extend{{ -- For usage on Vulcanus
    type = 'recipe',
    name = 'xy-copper-processing-unit',
    enabled = false,
    energy_required = 12,
    category = 'electronics-or-assembling',
    allow_productivity = true,
    ingredients = {
        {type = 'item', name = 'copper-cable', amount = 144}, -- at base 50% prod, two foundry can feed one EM plant
        {type = 'item', name = 'advanced-circuit', amount = 6},
        {type = 'fluid', name = 'sulfuric-acid', amount = 10},
    },
    results = {
        {type = 'item', name = 'processing-unit', amount = 2},
    },
    surface_conditions = {
        {property = 'pressure',
        min = 2000,
        max = 4000,}
    },

    order = 'b[circuits]-c',
    icons = {
        {icon = '__base__/graphics/icons/processing-unit.png'},
        {icon = '__base__/graphics/icons/copper-cable.png', scale = 0.26, shift = {-8, -8}},
    },
}}]]

if settings.startup['xy-processing-unit-alt'].value then
    --[[table.insert(data.raw['technology']['foundry'].effects, {
        type = 'unlock-recipe',
        recipe = 'xy-copper-processing-unit',
    })]]
    if mods['Cerys-Moon-of-Fulgora'] then
        data.raw['recipe']['cerys-processing-units-from-nitric-acid'].energy_required = 12
        data.raw['recipe']['cerys-processing-units-from-nitric-acid'].surface_conditions = {
            {property = 'magnetic-field',
            min = 100,}
        }
        data.raw['recipe']['cerys-processing-units-from-nitric-acid'].ingredients = {
            {type = 'item', name = 'electronic-circuit', amount = 3}, 
            {type = 'item', name = 'advanced-circuit', amount = 6},
            {type = 'fluid', name = 'nitric-acid', amount = 10},
        }
        data.raw['recipe']['cerys-processing-units-from-nitric-acid'].results = {
            {type = 'item', name = 'processing-unit', amount = 2},
        }
    end
    if mods['Paracelsin'] then -- This recipe is supposed to be an upgrade to the rare metals recipe isntead of being forced usage, so reduced time and adv circuits
        data.raw['recipe']['paracelsin-processing-units-from-nitric-acid'].energy_required = 10
        data.raw['recipe']['paracelsin-processing-units-from-nitric-acid'].ingredients = {
            {type = 'item', name = 'zinc-solder', amount = 3}, 
            {type = 'item', name = 'advanced-circuit', amount = 5},
            {type = 'fluid', name = 'nitric-acid', amount = 10},
        }
        data.raw['recipe']['cerys-processing-units-from-nitric-acid'].results = {
            {type = 'item', name = 'processing-unit', amount = 2},
        }
    end

    data.raw['recipe']['kr-bio-processing-circuit'].ingredients = {
        {type = 'item', name = 'advanced-circuit', amount = 6}, -- use more
        {type = 'item', name = 'pentapod-egg', amount = 1},
        {type = 'fluid', name = 'sulfuric-acid', amount = 10},
    }
    data.raw['recipe']['kr-bio-processing-circuit'].category = 'organic-or-assembling' -- changed from EM plant
end
if settings.startup['xy-lab-recipe-changes'].value then
    data.raw['item']['biolab'].weight = 200 * kg
    local sing_lab_recipe = data.raw.recipe['kr-singularity-lab']
    if mods['planet-muluna'] then
        for _,v in pairs(sing_lab_recipe.ingredients) do
            if v.name == 'biolab' then
                v.name = 'cryolab'
                v.amount = 2
            end
        end
    else
        table.insert(sing_lab_recipe.ingredients, {type = 'item', name = 'quantum-processor', amount = 50})
    end

    if mods['Paracelsin'] and mods['planet-muluna'] then
        data.raw.recipe['cryolab'].ingredients = {
            {type = 'item', name = 'aluminum-plate', amount = 200},
            {type = 'item', name = 'quantum-processor', amount = 25},
            {type = 'item', name = 'electric-coil', amount = 25},
            {type = 'item', name = 'pentapod-egg', amount = 5},
            {type = 'item', name = 'biolab', amount = 3},
            {type = 'fluid', name = 'fluoroketone-cold', amount = 250},
        }
    end
end
if settings.startup['xy-spidertron-fish'].value then
    table.insert(data.raw.recipe['spidertron'].ingredients, {type = 'item', name = 'raw-fish', amount = 1})
end