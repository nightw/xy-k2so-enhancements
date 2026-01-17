local function reformat(original_name, short_name, import_location)
    -- The actual name of the science pack, the "relevant" part of the science pack name, import location
    -- Ex: 'cryogenic-science-pack', 'cryogenic', 'aquilo'
    -- The first arg exists cause some mods will start their items with "kr-" for example
    local research_data_name = short_name..'-research-data'
    -- Create research data item
    data.extend({ 
        {
            type = 'item',
            name = 'xy-'..research_data_name,
            icon = '__xy-k2so-enhancements__/icons/'..research_data_name..'.png',
            subgroup = 'science-pack',
            order = 'zzz', -- This should be overridden by patches.category
            stack_size = 200,
            weight = 1 * kg,
            default_import_location = import_location,
            
            localised_name = {'item-name.xy-'..research_data_name},
        },
    })

    local r = data.raw.recipe[original_name]
    local research_data_recipe = table.deepcopy(r)
    -- Replace the science pack recipe with a tech card recipe from research data
    r.energy_required = 20
    r.category = 'kr-tech-cards'
    r.additional_categories = nil
    r.surface_conditions = {}
    r.ingredients = {
        {type = 'item', name = 'kr-blank-tech-card', amount = 5},
        {type = 'item', name = 'xy-'..research_data_name, amount = 5},
    }
    r.results = {{type = 'item', name = original_name, amount = 5},}
    r.always_show_products = true
    r.show_amount_in_title = false
    r.localised_name = {'item-name.xy-'..short_name..'-tech-card'}
    r.icon = '__xy-k2so-enhancements__/icons/'..short_name..'-tech-card.png'
    -- Clone the original science pack recipe and make it yield research datas
    research_data_recipe.name = 'xy-'..research_data_name
    data:extend({research_data_recipe})
    for _,result in pairs(research_data_recipe.results) do
        if result.name == original_name then
            result.name = 'xy-'..research_data_name
        end
    end
    research_data_recipe.main_product = research_data_recipe.name
    -- Change research data icon and loc
    local i = data.raw.tool[original_name]
    i.icon = '__xy-k2so-enhancements__/icons/'..short_name..'-tech-card.png'
    i.localised_name = {'item-name.xy-'..short_name..'-tech-card'}
    -- Finally, change the technology to give research data recipe + change its icons and loc
    local t = data.raw.technology[original_name]
    table.insert(t.effects, {
        type = 'unlock-recipe', recipe = research_data_recipe.name
    })
    t.icons = nil
    t.icon = '__xy-k2so-enhancements__/icons/'..short_name..'-tech-card-research.png'
    r.localised_name = {'item-name.xy-'..short_name..'-tech-card'}
end

---

for _,card_data in pairs(require('fixes.tech_cards_list')) do
    if mods[card_data.mod] and card_data.setting then
        reformat(card_data['original_name'], card_data['short_name'], card_data['import_location'])
    end
end