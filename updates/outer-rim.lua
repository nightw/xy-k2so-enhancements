if not mods['outer-rim'] then return end
data.extend({ 
    {
        type = 'item',
        name = 'xy-cryochemical-research-data',
        icon = '__xy-k2so-enhancements__/icons/cryochemical-research-data.png',
        subgroup = 'science-pack',
        order = 'ao10[cryoch',
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
        order = 'ao11[insu',
        stack_size = 200,
        weight = 1 * kg,
        default_import_location = 'paracelsin',
        
        localised_name = {'item-name.xy-insulation-research-data'},
    },
})
local to_convert = {
    'cryochemical',
    'insulation',
    --'thermodynamic',
    --'spacecraft'
}
for _,pack in pairs(to_convert) do
    local or_name = 'outer-rim-'..pack..'-science-pack'
    local r = data.raw.recipe[or_name]
    local research_data_recipe = table.deepcopy(r)
    r.energy_required = 20
    r.category = 'kr-tech-cards'
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
