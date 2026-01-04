local t = data.raw.technology
if settings.startup['xy-paracelsin-tech-card'].value then
    if settings.startup['xy-paracelsin-tech-card-endgame'].value and mods['Paracelsin'] then
        table.insert(t['kr-singularity-lab'].unit.ingredients, {'galvanization-science-pack', 1})
        table.insert(t['kr-antimatter-ammo'].unit.ingredients, {'galvanization-science-pack', 1})
        table.insert(t['kr-antimatter-reactor'].unit.ingredients, {'galvanization-science-pack', 1})
        table.insert(t['kr-antimatter-reactor-equipment'].unit.ingredients, {'galvanization-science-pack', 1})
        table.insert(t['kr-intergalactic-transceiver'].unit.ingredients, {'galvanization-science-pack', 1})
    end

    if settings.startup['xy-lab-recipe-changes'].value then
        table.insert(t['cryolab'].unit.ingredients, {'galvanization-science-pack', 1})
    end
end

if settings.startup['xy-advanced-tank-expensive-research'].value then
    t['kr-advanced-tank'].unit.count = 2500
    table.insert(t['kr-advanced-tank'].unit.ingredients, {'metallurgic-science-pack', 1})
    table.insert(t['kr-advanced-tank'].unit.ingredients, {'electromagnetic-science-pack', 1})
    table.insert(t['kr-advanced-tank'].unit.ingredients, {'agricultural-science-pack', 1})
end

-- recode this entire setting eventually (this will never happen)
if settings.startup['xy-tech-inflation'].value then
    -- increase the cost of all mid-late-endgame techs, starting after the first three vanilla planets
    -- does not affect Moshine as that is unrelated
    local hardcoded_multi = { -- overrides the sweeping changes
        ['planet-discovery-aquilo'] = 10,
        ['planet-discovery-maraxsis'] = 10,
        ['planet-discovery-paracelsin'] = 9,
        ['planet-discovery-moshine'] = 4,
        ['planet-discovery-secretas'] = 30,
        ['legendary-quality'] = 15,
        ['quantum-processor'] = 15,
        ['kr-intergalactic-transceiver'] = 50, -- vanilla megabase could still do this in 5 minutes lol
        ['kr-advanced-card'] = 2,
    }
    local multi_adv = 2
    local multi_MAE = 5
    local multi_cryo_galv_hydr = 7
    local multi_matt = 10
    local multi_sing = 15
    local multi_gold = 20
    local multi_prometh = 40

    for _,tech in pairs(t) do
        if tech.upgrade then goto continue end

        if hardcoded_multi[tech.name] then
            tech.unit.count = tech.unit.count * hardcoded_multi[tech.name]
        else
            -- general application
            local used_cards = {}
            for _,card in tech.unit.ingredients do
                table.insert(used_cards, card[1]) -- 1-indexed lists
            end
            if used_cards['promethium-science-pack'] then
                tech.unit.count = tech.unit.count * multi_prometh
            elseif used_cards['golden-science-pack'] then
                tech.unit.count = tech.unit.count * multi_gold
            elseif used_cards['kr-singularity-tech-card'] then
                tech.unit.count = tech.unit.count * multi_sing
            elseif used_cards['kr-matter-tech-card'] then
                tech.unit.count = tech.unit.count * multi_matt
            elseif used_cards['cryogenic-science-pack'] or used_cards['galvanization-science-pack'] or used_cards['hydraulic-science-pack'] then
                tech.unit.count = tech.unit.count * multi_cryo_galv_hydr
            elseif used_cards['metallurgic-science-pack'] and used_cards['electromagnetic-science-pack'] and used_cards['agricultural-science-pack'] then
                tech.unit.count = tech.unit.count * multi_MAE
            elseif used_cards['kr-advanced-tech-card'] then
                tech.unit.count = tech.unit.count * multi_adv
            end
        end
        ::continue::
    end
end