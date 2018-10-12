script.on_event({defines.events.on_player_main_inventory_changed, defines.events.on_player_cursor_stack_changed},
  function (e)
    game.players[e.player_index].remove_item({ name = "biter-baiter-shot", count = 100 })
  end
)

script.on_event({defines.events.on_tick},
  function (e)
    if e.tick % 600 == 0 then
      local nauvis = game.surfaces["nauvis"]
      local bbs = nauvis.find_entities_filtered({name = "biter-baiter"})
      local unitp = function(ent) return pcall(function () return ent.spawner end) end
      local wanderingp = function(ent) return unitp(ent) and ent.spawner == nil and ent.unit_group == nil end
      for i, b in pairs(bbs) do
        if b.get_item_count("biter-baiter-shot") >= 1 then
          local techlevel = b.force.technologies["artillery-shell-range-1"].level - 1
          local techdistance = 224 * (techlevel * 0.3 + 1)
          local distance = techdistance * 1.1
          local area = {
            { b.position.x - distance, b.position.y - distance },
            { b.position.x + distance, b.position.y + distance }
          }

          local biters = nauvis.find_entities_filtered({ force = "enemy", area = area })

          local important_biters = {}
          for _k, biter in pairs(biters) do
            if (wanderingp(biter) and
                  (b.position.x - biter.position.x)*(b.position.x - biter.position.x)
                  + (b.position.y - biter.position.y)*(b.position.y - biter.position.y)
                <= distance*distance) then
              important_biters[#important_biters+1] = biter
            end
          end

          if (#important_biters > 0) then
            if settings.global["biter-baiter-debug-setting"].value then
              b.force.print("Baiting: x: " .. tostring(b.position.x) .. ", y: " .. tostring(b.position.y) .. ", distance: " .. tostring(distance) .. ", n: " .. tostring(#important_biters))
            end
            b.remove_item("biter-baiter-shot")
            for _k, biter in pairs(important_biters) do
              -- b.force.print("Baiting a real biter: " .. tostring(biter))
              biter.set_command({ type = defines.command.attack_area, destination = b.position, radius = 10, distraction = defines.distraction.by_anything })
            end
          else
            if settings.global["biter-baiter-debug-setting"].value then
              b.force.print("Nothing to bait: x: " .. tostring(b.position.x) .. ", y: " .. tostring(b.position.y) .. ", distance: " .. tostring(distance))
            end
          end
        end
      end
    end
  end
)
