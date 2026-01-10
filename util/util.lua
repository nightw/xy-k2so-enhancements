local utils = {}

local t = data.raw.technology

local function add_preqs(tech, preqs)
    if t[tech] then
        for _,v in pairs(preqs) do
            table.insert(t[tech].prerequisites, v)
        end
    else
        log(tech..' - Tech does not exist!')
    end
end
utils.tech_add_preqs = add_preqs

local function remove_preqs(tech, preqs_to_remove) -- Should be used before add_preqs() if both are needed
    if t[tech] then
        for _,to_remove in pairs(preqs_to_remove) do
            for i,existing_preq in pairs(t[tech].prerequisites) do
                if existing_preq == to_remove then
                    table.remove(t[tech].prerequisites, i)
                end
            end
        end
    else
        log(tech..' - Tech does not exist!')
    end
end
utils.tech_remove_preqs = remove_preqs

local function remove_cards(tech, cards_to_remove) -- Should be used before add_preqs() if both are needed
    if t[tech] then
        for _,to_remove in pairs(cards_to_remove) do
            for i,existing_card in pairs(t[tech].unit.ingredients) do
                if existing_card[1] == to_remove then
                    table.remove(t[tech].unit.ingredients, i)
                end
            end
        end
    else
        log(tech..' - Tech does not exist!')
    end
end
utils.tech_remove_cards = remove_cards

local function order_from_index(list, prototype, lead)
    local lead = lead or 'z'
    for index,item in pairs(list) do
        local v = data.raw[prototype][item]
        if v then 
            local extra = ''
            if index < 10 then extra = '0' end
            v.order = lead..extra..tostring(index)
        end
    end
end
utils.order_from_index = order_from_index

return utils
