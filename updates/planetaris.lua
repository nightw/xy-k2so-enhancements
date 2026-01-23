local util = require('util.util')
local loader_graphics = require('__Krastorio2-spaced-out__.prototypes.buildings.loader-graphics')
if mods['planetaris-arig'] and true then
    local to_replace = {
        'kr-superior-transport-belt',
        'kr-superior-underground-belt',
        -- loader here
    }
    for _,r in pairs(to_replace) do
        util.replace_ingred_name(r, 'turbo-transport-belt', 'planetaris-hyper-transport-belt')
    end
    -- Patch so that turbo (green) -> hyper (white) -> superior (purple) belts
    util.tech_remove_preqs('kr-logistic-5', {'turbo-transport-belt'})
    util.tech_add_preqs('kr-logistic-5', {'planetaris-hyper-transport-belt'})
    -- Hyper belt rep, the base recipe is fine so just alter superior belt to require it instead of turbo
    -- done above
    -- Hyper Underground belt rep, upgrade length and change its ingreds to fit k2
    data.raw['underground-belt']['planetaris-hyper-underground-belt'].max_distance = 30 -- turbo is 20, sup is 40
    data.raw.recipe['planetaris-hyper-underground-belt'].ingredients = {
        {type = 'item', name = 'planetaris-hyper-transport-belt', amount = 30},
        {type = 'item', name = 'turbo-underground-belt', amount = 2},
        {type = 'item', name = 'planetaris-raw-diamond', amount = 4},
        {type = 'item', name = 'planetaris-silica', amount = 5},
    }
    -- Hyper splitter rep
    util.replace_ingred_name('kr-superior-splitter', 'turbo-splitter', 'planetaris-hyper-splitter')
    --- Create hyper loader
    local belt_anim = data.raw["transport-belt"]['planetaris-hyper-transport-belt'].belt_animation_set
    data:extend({
        {
            type = 'recipe',
            name = 'xy-hyper-loader',
            category = 'electromagnetics',
            energy_required = 2,
            enabled = false,
            ingredients = {
                {type = 'item', name = 'planetaris-hyper-transport-belt', amount = 1},
                {type = 'item', name = 'kr-advanced-loader', amount = 2},
                {type = 'item', name = 'planetaris-raw-diamond', amount = 3},
                {type = 'item', name = 'planetaris-silica', amount = 4},
            },
            results = {{type = 'item', name = 'xy-hyper-loader', amount = 1}}
        },
        {
            type = 'item',
            name = 'xy-hyper-loader',
            icon = '__xy-k2so-enhancements__/icons/hyper-loader.png',
            subgroup = 'belt',
            order = 'd[loader]-a5[xy-hyper-loader]',
            place_result = 'xy-hyper-loader',
            stack_size = 50,
            weight = 40*kg,
        },
        {
            type = 'loader-1x1',
            name = 'xy-hyper-loader',
            icon = '__xy-k2so-enhancements__/icons/hyper-loader.png',
            flags = {'placeable-neutral', 'player-creation'},
            minable = {mining_time = .25, result = 'xy-hyper-loader'},
            fast_replaceable_group = 'transport_belt',
            collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
            selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            max_belt_stack_size = 4,
            adjustable_belt_stack_size = true,
            container_distance = 0.75,
            filter_count = 5,
            energy_source = {
                type = "electric",
                usage_priority = "secondary-input",
                drain = "1.25kW",
            },
            speed = 0.15625,
            energy_per_item = "9kJ",
            max_health = 300,
            heating_energy = "50kW",
            corpse = "small-remnants",
            resistances = { { type = "fire", percent = 90 } },
            open_sound = sounds.machine_open,
            close_sound = sounds.machine_close,
            belt_animation_set = belt_anim,
            animation_speed_coefficient = 32,
            icon_draw_specification = {scale = 0.7},
            structure = loader_graphics.structure({220,220,220}),
            structure_render_layer = loader_graphics.structure_render_layer,
            circuit_wire_max_distance = default_circuit_wire_max_distance,
        }
    })
end