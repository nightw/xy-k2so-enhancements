--- Adding Research datas with their recipe
--- Eventually refactor this so that the recipe clones the ingredients of the original science pack recipe
if mods['Paracelsin'] then
    data.extend({ 
        {
            type = 'item',
            name = 'xy-galvanization-research-data',
            icon = '__xy-k2so-enhancements__/icons/galvanization-research-data.png',
            subgroup = 'science-pack',
            order = 'ao07[galv',
            stack_size = 200,
            weight = 1 * kg,
            default_import_location = 'paracelsin',
            
            localised_name = {'item-name.xy-galvanization-research-data'},
        },
        {
            type = 'recipe',
            name = 'xy-galvanization-research-data',
            enabled = false,
            energy_required = 10,
            ingredients = {
                {type = 'item', name = 'electric-coil', amount = 2},
                {type = 'fluid', name = 'nitric-acid', amount = 50},
                {type = 'item', name = 'concrete', amount = 10},
                {type = 'item', name = 'vaterite', amount = 2},
            },
            results = {
                {type = 'item', name = 'xy-galvanization-research-data', amount = 1},
            },
            category = 'electrochemistry',
            allow_productivity = true,
            surface_conditions = {
                {
                    property = 'pressure', min = 5300, max = 5300
                }
            },
            
            always_show_products = true,
            show_amount_in_title = false,
            localised_name = {'item-name.xy-galvanization-research-data'}
        }
    })
end
if mods['secretas'] then
    data.extend({ 
        {
            type = 'item',
            name = 'xy-golden-research-data',
            icon = '__xy-k2so-enhancements__/icons/golden-research-data.png',
            subgroup = 'science-pack',
            order = 'ao08[gold',
            stack_size = 200,
            weight = 1 * kg,
            default_import_location = 'frozeta',
            
            localised_name = {'item-name.xy-golden-research-data'},
        },
        {
            type = 'recipe',
            name = 'xy-golden-research-data',
            enabled = false,
            energy_required = 20,
            ingredients = { -- probably make this recipe less stupid eventually
                {type = 'item', name = 'solid-fuel', amount = 7},
                {type = 'item', name = 'gold-plate', amount = 14},
                {type = 'item', name = 'arithmetic-combinator', amount = 14},
                {type = 'item', name = 'steam-turbine', amount = 2},
                {type = 'fluid', name = 'steam', amount = 250},
            },
            results = {
                {type = 'item', name = 'xy-golden-research-data', amount = 8},
            },
            category = 'metallurgy-or-assembling',
            allow_productivity = true,
            surface_conditions = {
                {
                    property = 'pressure', min = 200, max = 280
                }
            },
            
            always_show_products = true,
            show_amount_in_title = false,
            localised_name = {'item-name.xy-golden-research-data'}
        }
    })
end
if mods['corrundum'] then
    data.extend({
        {
            type = 'item',
            name = 'xy-electrochemical-research-data',
            icon = '__xy-k2so-enhancements__/icons/electrochemical-research-data.png',
            subgroup = 'science-pack',
            order = 'ao09[elec',
            stack_size = 200,
            weight = 1 * kg,
            default_import_location = 'corrundum',

            localised_name = {'item-name.xy-electrochemical-research-data'},
        },
        {
            type = 'recipe',
            name = 'xy-electrochemical-research-data',
            enabled = false,
            energy_required = 15,
            ingredients = {
                {type = 'item', name = 'sulfur', amount = 2},
                {type = 'item', name = 'platinum-plate', amount = 1},
                {type = 'fluid', name = 'sulfuric-acid', amount = 100},
            },
            results = {
                {type = 'item', name = 'xy-electrochemical-research-data', amount = 1},
            },
            category = 'catalytic-chemistry',
            allow_productivity = true,
            surface_conditions = {
                {property = 'pressure', min = 6000, max = 6000},
                {property = 'magnetic-field', min = 99, max = 99}
            },

            always_show_products = true,
            show_amount_in_title = false,
            localised_name = {'item-name.xy-electrochemical-research-data'}
        }
    })
end
--- Actual implentation of Tech Card + Research Data
if settings.startup['xy-paracelsin-tech-card'].value and mods['Paracelsin'] then
    local gsp_recipe = data.raw['recipe']['galvanization-science-pack']

    gsp_recipe.energy_required = 20
    gsp_recipe.category = 'kr-tech-cards'
    gsp_recipe.surface_conditions = nil
    gsp_recipe.ingredients = {
        {type = 'item', name = 'kr-blank-tech-card', amount = 5},
        {type = 'item', name = 'xy-galvanization-research-data', amount = 5},
    }
    gsp_recipe.results = {
        {type = 'item', name = 'galvanization-science-pack', amount = 5},
    }

    gsp_recipe.always_show_products = true
    gsp_recipe.show_amount_in_title = false
    gsp_recipe.localised_name = {'item-name.xy-galvanization-tech-card'}
    gsp_recipe.icon = '__xy-k2so-enhancements__/icons/galvanization-tech-card.png'

    -- change the science pack name and icon to the right assets
    local gsp = data.raw['tool']['galvanization-science-pack']
    gsp.localised_name = {'item-name.xy-galvanization-tech-card'}
    gsp.icon = '__xy-k2so-enhancements__/icons/galvanization-tech-card.png'

    -- add to research and change assets
    local gsp_research = data.raw['technology']['galvanization-science-pack']
    gsp_research.icon = '__xy-k2so-enhancements__/icons/galvanization-tech-card-research.png'
    gsp_research.localised_name = {'item-name.xy-galvanization-tech-card'}
    
    table.insert(gsp_research.effects, {
        type = 'unlock-recipe',
        recipe = 'xy-galvanization-research-data',
    })
end

if settings.startup['xy-secretas-tech-card'].value and mods['secretas'] then
    local t = data.raw['recipe']['golden-science-pack']

    t.energy_required = 20
    t.category = 'kr-tech-cards'
    t.surface_conditions = nil
    t.ingredients = {
        {type = 'item', name = 'kr-blank-tech-card', amount = 5},
        {type = 'item', name = 'xy-golden-research-data', amount = 5},
    }
    t.results = {
        {type = 'item', name = 'golden-science-pack', amount = 5},
    }

    t.always_show_products = true
    t.show_amount_in_title = false
    t.localised_name = {'item-name.xy-golden-tech-card'}
    t.icon = '__xy-k2so-enhancements__/icons/golden-tech-card.png'

    -- change the science pack name and icon to the right assets
    data.raw['tool']['golden-science-pack'].localised_name = {'item-name.xy-golden-tech-card'}
    data.raw['tool']['golden-science-pack'].icon = '__xy-k2so-enhancements__/icons/golden-tech-card.png'

    -- add to research and change assets
    data.raw['technology']['golden-science-pack'].icons = nil
    data.raw['technology']['golden-science-pack'].icon = '__xy-k2so-enhancements__/icons/golden-tech-card-research.png'
    data.raw['technology']['golden-science-pack'].localised_name = {'item-name.xy-golden-tech-card'}
    
    table.insert(data.raw['technology']['golden-science-pack'].effects, {
        type = 'unlock-recipe',
        recipe = 'xy-golden-research-data',
    })
end

if settings.startup['xy-corrundum-tech-card'].value and mods['corrundum'] then
    local t = data.raw['recipe']['electrochemical-science-pack']

    t.energy_required = 20
    t.category = 'kr-tech-cards'
    t.surface_conditions = nil
    t.ingredients = {
        {type = 'item', name = 'kr-blank-tech-card', amount = 5},
        {type = 'item', name = 'xy-electrochemical-research-data', amount = 5},
    }
    t.results = {
        {type = 'item', name = 'electrochemical-science-pack', amount = 5},
    }

    t.always_show_products = true
    t.show_amount_in_title = false
    t.localised_name = {'item-name.xy-electrochemical-tech-card'}
    t.icon = '__xy-k2so-enhancements__/icons/electrochemical-tech-card.png'

    -- change the science pack name and icon to the right assets
    data.raw['tool']['electrochemical-science-pack'].localised_name = {'item-name.xy-electrochemical-tech-card'}
    data.raw['tool']['electrochemical-science-pack'].icon = '__xy-k2so-enhancements__/icons/electrochemical-tech-card.png'

    -- add to research and change assets
    data.raw['technology']['electrochemical-science-pack'].icon = '__xy-k2so-enhancements__/icons/electrochemical-tech-card-research.png'
    data.raw['technology']['electrochemical-science-pack'].localised_name = {'item-name.xy-electrochemical-tech-card'}

    table.insert(data.raw['technology']['electrochemical-science-pack'].effects, {
        type = 'unlock-recipe',
        recipe = 'xy-electrochemical-research-data',
    })
end