if not mods['outer-rim'] then return end
local util = require('util.util')
data.extend({ 
    {
        type = 'item',
        name = 'xy-cryochemical-research-data',
        icon = '__xy-k2so-enhancements__/icons/cryochemical-research-data.png',
        subgroup = 'science-pack',
        order = 'ao20[cryoch',
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = 'paracelsin',
        
        localised_name = {'item-name.xy-cryochemical-research-data'},
    },
    {
        type = 'item',
        name = 'xy-insulation-research-data',
        icon = '__xy-k2so-enhancements__/icons/insulation-research-data.png',
        subgroup = 'science-pack',
        order = 'ao21[insu',
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = 'paracelsin',
        
        localised_name = {'item-name.xy-insulation-research-data'},
    },
    {
        type = 'item',
        name = 'xy-thermodynamic-research-data',
        icon = '__xy-k2so-enhancements__/icons/thermodynamic-research-data.png',
        subgroup = 'science-pack',
        order = 'ao19[thermodyn',
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = 'aquilo',
        
        localised_name = {'item-name.xy-thermodynamic-research-data'},
    },
    {
        type = 'item',
        name = 'xy-spacecraft-research-data',
        icon = '__xy-k2so-enhancements__/icons/spacecraft-research-data.png',
        subgroup = 'science-pack',
        order = 'ao22[thermodyn',
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = 'aquilo',
        
        localised_name = {'item-name.xy-spacecraft-research-data'},
    },
})
--- Convert science packs into tech cards
local to_convert = {
    'cryochemical',
    'insulation',
    'thermodynamic',
    'spacecraft'
}
for _,pack in pairs(to_convert) do
    local or_name = 'outer-rim-'..pack..'-science-pack'
    local r = data.raw.recipe[or_name]
    local research_data_recipe = table.deepcopy(r)
    r.energy_required = 20
    r.category = 'kr-tech-cards'
    r.additional_categories = nil
    r.surface_conditions = nil
    r.ingredients = {
        {type = 'item', name = 'kr-blank-tech-card', amount = 5},
        {type = 'item', name = 'xy-'..pack..'-research-data', amount = 5},
    }
    r.results = {{type = 'item', name = or_name, amount = 5},}
    r.always_show_products = true
    r.show_amount_in_title = false
    r.localised_name = {'item-name.xy-'..pack..'-tech-card'}
    r.icon = '__xy-k2so-enhancements__/icons/'..pack..'-tech-card.png'

    research_data_recipe.name = 'xy-'..pack..'-research-data'
    data:extend({research_data_recipe})
    local original_amount = research_data_recipe.results[1].amount -- terrible
    research_data_recipe.results = {
        {type = 'item', name = research_data_recipe.name, amount = original_amount}
    }
    research_data_recipe.main_product = research_data_recipe.name
    table.insert(data.raw.technology[or_name].effects, {
        type = 'unlock-recipe', recipe = research_data_recipe.name
    })
end
--- Tech card changes
local strip_cards = {
    'transport-belt-capacity-3-Secretas',
    'hyper-inserter',
    'efficiency-module-4-S',
    'quality-module-4-S',
    'speed-module-4-S',
    'productivity-module-4-S',
    'module-finale',
    'pentapod-egg-unrestricted',
    'galvanized-steel',
    'zinc-piping',
    'elevated-pipe',
    'advanced-repair-device',
    'gold-railgun-turret',
    'spaceship-scrap-recycling-productivity',
    'gold-plate-productivity',
    'vaterite-processing-productivity',
    'concrete-productivity',
    'long-dstance-transmission',-- why
    'workers-robot-storage-4',
    'workers-robot-storage-5',
    'workers-robot-storage-6',
    'workers-robot-storage-7',
    'workers-robot-storage-8',
    -- why
    'ftl_Fed_Scout_tech',
    'ftl_Bomber_tech',
    'ftl_Kestrel_tech',
    'ftl_Stealth_tech',
    'ftl_Fed_Cruiser_tech',
}
for _,tech in pairs(strip_cards) do
    util.tech_remove_cards(tech, {'logistic-science-pack','military-science-pack','automation-science-pack'})
end