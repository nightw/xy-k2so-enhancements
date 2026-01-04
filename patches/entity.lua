-- always
-- buff tesla weapons since theyre untouched by K2 and are therefore powercrept
-- if theres power creep its easier to just keep going with it than to stop it
-- if the player is interested in challenges, armored biters or other mods are always a "fun" option
data.raw['electric-turret']['tesla-turret'].attack_parameters.range = 40 -- from 30; this falls out of line with the other range buffs but wtv
data.raw['electric-turret']['tesla-turret'].attack_parameters.cooldown = 100 -- from 120
data.raw['electric-turret']['tesla-turret'].energy_source.drain = '500kW' -- from 1 mw
data.raw['electric-turret']['tesla-turret'].energy_source.input_flow_limit = '7.7MW' -- from 7 mw

data.raw['gun']['teslagun'].attack_parameters.range = 32
data.raw['gun']['teslagun'].attack_parameters.cooldown = 45
data.raw['ammo']['tesla-ammo'].magazine_size = 20 -- not exactly expensive but makes personal-use tesla gun less of a hassle, and it shoots faster now also

if settings.startup['xy-adv-chem-plant-rebalance'].value and mods['Paracelsin'] then
    local acp = data.raw['assembling-machine']['kr-advanced-chemical-plant']
    local ep = data.raw['assembling-machine']['electrochemical-plant']

    data.raw['item']['kr-advanced-chemical-plant'].weight = 100 * kg
    acp.energy_usage = '3.72MW'
    acp.crafting_speed = 4
    acp.energy_source.emissions_per_minute.pollution = 15
    acp.energy_source.drain = '120kW'
    acp.effect_receiver.base_effect.productivity = .25

    data.raw.recipe['kr-advanced-chemical-plant'].ingredients = {
        {type = 'item', name = 'processing-unit', amount = 15},
        {type = 'item', name = 'kr-imersium-beam', amount = 20},
        {type = 'item', name = 'kr-rare-metals', amount = 50},
        {type = 'item', name = 'kr-electronic-components', amount = 30},
        {type = 'item', name = 'kr-steel-pipe', amount = 10},
        {type = 'item', name = 'carbon-fiber', amount = 10},
        {type = 'item', name = 'chemical-plant', amount = 2},
    }
    

    ep.energy_usage = '4.96MW'
    ep.crafting_speed = 8
    ep.energy_source.emissions_per_minute.pollution = 35
    ep.energy_source.drain = '160kW'
    ep.effect_receiver.base_effect.productivity = .5

    data.raw.recipe['electrochemical-plant'].ingredients = {
        {type = 'item', name = 'copper-cable', amount = 25},
        {type = 'item', name = 'processing-unit', amount = 40},
        {type = 'item', name = 'tungsten-plate', amount = 30},
        {type = 'item', name = 'zinc-solder', amount = 30},
        {type = 'item', name = 'kr-advanced-chemical-plant', amount = 1},
    }
end

if settings.startup['xy-hydro-plant-runs-fuel-ref-recipes'].value and mods['maraxsis'] then
    table.insert(data.raw['assembling-machine']['maraxsis-hydro-plant'].crafting_categories, 'kr-fuel-refinery')

end
