-- control.lua

script.on_event(defines.events.on_tick, function (e)
  if not game.players[1].gui.top.dayx_flow then
    game.players[1].gui.top.add{
      type="flow",
      name="dayx_flow",
      direction="vertical",
      style="dayx-flow-style"
    }
    game.players[1].gui.top.dayx_flow.add{
      type="label",
      name="day_label",
      style="dayx-label-style",
      caption="day"
    }
    game.players[1].gui.top.dayx_flow.add{
      type="label",
      name="time_label",
      style="dayx-label-style",
      caption="time"
    }
  end

  time_float = game.tick / game.surfaces[1].ticks_per_day + 1.5
  day_int = math.floor(time_float)
  time_h = time_float % 1 * 24
  time_m = time_h % 1 * 60
  game.players[1].gui.top.dayx_flow.day_label.caption = {"day-x", day_int}
  game.players[1].gui.top.dayx_flow.time_label.caption = string.format("%02d:%02d", time_h, time_m)
end)
