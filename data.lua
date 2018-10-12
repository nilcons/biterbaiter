-- technology
data:extend({
    {
      type = "technology",
      name = "biter-baiting",
      icon_size = 128,
      icon = "__BiterBaiter__/graphics/biter-research-icon.png",
      effects =
        {
          {
            type = "unlock-recipe",
            recipe = "biter-baiter"
          }
        },
      prerequisites = {"artillery"},
      unit =
        {
          count = 2000,
          ingredients =
            {
              {"science-pack-1", 1},
              {"science-pack-2", 1},
              {"science-pack-3", 1},
              {"military-science-pack", 1},
              {"high-tech-science-pack", 1},
              {"production-science-pack", 1},
              {"space-science-pack", 1}
            },
          time = 60
        },
      order = "e-k-d"
    }
})


-- entities
data:extend({
    {
      type = "assembling-machine",
      name = "biter-baiter",
      icon = "__BiterBaiter__/graphics/biter-baiter-machine-icon.png",
      icon_size = 32,
      flags = { "not-rotatable", "placeable-player", "player-creation", "hide-alt-info", "breaths-air" },
      crafting_categories = { "biter-baiter-crafting" },
      ingredient_count = 1,
      crafting_speed = 1,
      module_specification = { module_slots = 4, module_info_icon_shift = {0, 4.3 } },
      fixed_recipe = "biter-baiter-shot",
      allowed_effects = { "pollution", "consumption" },
      minable = { hardness = 0.2, mining_time = 0.5, result = "biter-baiter" },
      max_health = 1000,
      corpse = "big-remnants",
      dying_explosion = "medium-explosion",
      collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      energy_source = { type = "electric", usage_priority = "secondary-input", drain = "50MW" },
      energy_usage = "50MW",
      working_sound =
         {
            sound =
               {
                  {
                     filename = "__BiterBaiter__/sounds/biter-baiter-bubbles.ogg"
                  }
               },
            apparent_volume = 2
        },
      animation =
        {
          layers =
            {
              {
                filename = "__BiterBaiter__/graphics/biter-radar.png",
                priority = "low",
                width = 98,
                height = 127,
                apply_projection = false,
                direction_count = 64,
                frame_count = 64,
                line_length = 8,
                shift = util.by_pixel(1, -16),
                hr_version =
                  {
                    filename = "__BiterBaiter__/graphics/hr-biter-radar.png",
                    priority = "low",
                    width = 196,
                    height = 254,
                    apply_projection = false,
                    direction_count = 64,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(1, -16),
                    scale = 0.5
                  }
              },
              {
                filename = "__BiterBaiter__/graphics/biter-radar-shadow.png",
                priority = "low",
                width = 171,
                height = 93,
                apply_projection = false,
                direction_count = 64,
                frame_count = 64,
                line_length = 8,
                shift = util.by_pixel(39,3),
                draw_as_shadow = true,
                hr_version =
                  {
                    filename = "__BiterBaiter__/graphics/hr-biter-radar-shadow.png",
                    priority = "low",
                    width = 343,
                    height = 186,
                    apply_projection = false,
                    direction_count = 64,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(39.25,3),
                    draw_as_shadow = true,
                    scale = 0.5
                  }
              }
            }
        },
      idle_animation =
        {
          layers =
            {
              {
                filename = "__BiterBaiter__/graphics/biter-radar-idle.png",
                priority = "low",
                width = 98,
                height = 127,
                apply_projection = false,
                direction_count = 64,
                frame_count = 64,
                line_length = 8,
                shift = util.by_pixel(1, -16),
                hr_version =
                  {
                    filename = "__BiterBaiter__/graphics/hr-biter-radar-idle.png",
                    priority = "low",
                    width = 196,
                    height = 254,
                    apply_projection = false,
                    direction_count = 64,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(1, -16),
                    scale = 0.5
                  }
              },
              {
                filename = "__BiterBaiter__/graphics/biter-radar-shadow.png",
                priority = "low",
                width = 171,
                height = 93,
                apply_projection = false,
                direction_count = 64,
                frame_count = 64,
                line_length = 8,
                shift = util.by_pixel(39,3),
                draw_as_shadow = true,
                hr_version =
                  {
                    filename = "__BiterBaiter__/graphics/hr-biter-radar-shadow.png",
                    priority = "low",
                    width = 343,
                    height = 186,
                    apply_projection = false,
                    direction_count = 64,
                    frame_count = 64,
                    line_length = 8,
                    shift = util.by_pixel(39.25,3),
                    draw_as_shadow = true,
                    scale = 0.5
                  }
              }
            }
        }
    }
})

-- items
data:extend({
    {
      type = "item",
      name = "biter-baiter",
      icon = "__BiterBaiter__/graphics/biter-baiter-machine-icon.png",
      icon_size = 32,
      flags = {"goes-to-main-inventory"},
      subgroup = "defensive-structure",
      order = "b[turret]-e[biter-baiter]",
      place_result = "biter-baiter",
      stack_size = 10
    },
    {
      type = "item",
      name = "biter-baiter-shot",
      icon = "__BiterBaiter__/graphics/biter-baiter-shot.png",
      icon_size = 32,
      flags = { "hidden" },
      order = "z[biter-baiter-shot]",
      stack_size = 1,
    }
})

-- recipes
data:extend({
    {
      type = "recipe-category",
      name = "biter-baiter-crafting"
    }
})

data:extend({
    {
      type = "recipe",
      name = "biter-baiter",
      energy_required = 60,
      enabled = false,
      ingredients = {
        {"steel-plate", 100},
        {"concrete", 100},
        {"iron-gear-wheel", 100},
        {"processing-unit", 100},
        {"pipe", 100},
        {"effectivity-module-3", 10},
      },
      result = "biter-baiter"
    },
    {
      type = "recipe",
      name = "biter-baiter-shot",
      category = "biter-baiter-crafting",
      energy_required = 60,
      ingredients = {},
      hidden = true,
      result = "biter-baiter-shot"
    }
})
