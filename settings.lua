data:extend({
    {
        type = 'bool-setting',
        name = 'xy-hydro-plant-runs-fuel-ref-recipes',
        setting_type = 'startup',
        default_value = true,

        order = 'marax-a',

        localised_name = {'mod-setting-name.xy-hydro-plant-runs-fuel-ref-recipes'},
    },
    {
        type = 'bool-setting',
        name = 'xy-paracelsin-tech-card',
        setting_type = 'startup',
        default_value = true,

        order = '1-parac',

        localised_name = {'mod-setting-name.xy-paracelsin-tech-card'},
    },
    {
        type = 'bool-setting',
        name = 'xy-paracelsin-tech-card-endgame',
        setting_type = 'startup',
        default_value = true,

        order = 'parac-a',

        localised_name = {'mod-setting-name.xy-paracelsin-tech-card-endgame'},
        localised_description = {'mod-setting-description.xy-paracelsin-tech-card-endgame'},
    },
    {
        type = 'bool-setting',
        name = 'xy-secretas-tech-card',
        setting_type = 'startup',
        default_value = true,

        order = '1-secre',

        localised_name = {'mod-setting-name.xy-secretas-tech-card'},
    },
    {
        type = 'bool-setting',
        name = 'xy-secretas-polish',
        setting_type = 'startup',
        default_value = true,

        order = 'secre-a',

        localised_name = {'mod-setting-name.xy-secretas-polish'},
        localised_description = {'mod-setting-description.xy-secretas-polish'},
    },
    {
        type = 'bool-setting',
        name = 'xy-lab-recipe-changes',
        setting_type = 'startup',
        default_value = true,

        order = 'x-a',

        localised_name = {'mod-setting-name.xy-lab-recipe-changes'},
        localised_description = {'mod-setting-description.xy-lab-recipe-changes'},
    },
    {
        type = 'bool-setting',
        name = 'xy-item-weight',
        setting_type = 'startup',
        default_value = true,

        order = 'x-b',

        localised_name = {'mod-setting-name.xy-item-weight'},
        localised_description = {'mod-setting-description.xy-item-weight'},
    },
    {
        type = 'bool-setting',
        name = 'xy-move-lab-category',
        setting_type = 'startup',
        default_value = true,

        order = 'x-x',

        localised_name = {'mod-setting-name.xy-move-lab-category'},
        localised_description = {'mod-setting-description.xy-move-lab-category'},
    },
    {
        type = 'bool-setting',
        name = 'xy-moshine-connection-length',
        setting_type = 'startup',
        default_value = true,

        order = 'mosh-a',

        localised_name = {'mod-setting-name.xy-moshine-connection-length'},
        localised_description = {'mod-setting-description.xy-moshine-connection-length'},
    },
    {
        type = 'bool-setting',
        name = 'xy-processing-unit-alt',
        setting_type = 'startup',
        default_value = true,

        order = 'x-d',

        localised_name = {'mod-setting-name.xy-processing-unit-alt'},
        localised_description = {'mod-setting-description.xy-processing-unit-alt'},
    },
    {
        type = 'bool-setting',
        name = 'xy-adv-chem-plant-rebalance',
        setting_type = 'startup',
        default_value = true,

        order = 'parac-b',

        localised_name = {'mod-setting-name.xy-adv-chem-plant-rebalance'},
        localised_description = {'mod-setting-description.xy-adv-chem-plant-rebalance'},
    },
    -- Default off
    {
        type = 'bool-setting',
        name = 'xy-maraxsis-moshine-connection',
        setting_type = 'startup',
        default_value = false,

        order = 'marax-b',

        localised_name = {'mod-setting-name.xy-maraxsis-moshine-connection'},
        localised_description = {'mod-setting-description.xy-maraxsis-moshine-connection'},
    },
    {
        type = 'bool-setting',
        name = 'xy-advanced-tank-expensive-research',
        setting_type = 'startup',
        default_value = false,

        order = 'y-c',

        localised_name = {'mod-setting-name.xy-advanced-tank-expensive-research'},
        localised_description = {'mod-setting-description.xy-advanced-tank-expensive-research'},
    },
    {
        type = 'bool-setting',
        name = 'xy-spidertron-fish',
        setting_type = 'startup',
        default_value = false,

        order = 'x-e',

        localised_name = {'mod-setting-name.xy-spidertron-fish'},
    },
    {
        type = 'bool-setting',
        name = 'xy-tech-inflation',
        setting_type = 'startup',
        default_value = false,

        order = 'y-a',

        localised_name = {'mod-setting-name.xy-tech-inflation'},
        localised_description = {'mod-setting-description.xy-tech-inflation'},
    },
    {
        type = 'string-setting',
        name = 'xy-tech-inflation-scale',
        setting_type = 'startup',
        default_value = '100%',
        allowed_values = {'50%','75%','100%'},

        order = 'y-b',

        localised_name = {'mod-setting-name.xy-tech-inflation-scale'},
        localised_description = {'mod-setting-description.xy-tech-inflation-scale'},
    },
})