-- Ignora evento de maximizar
hl.window_rule({
  match = {
    title = ".*"
  },
  suppress_event = "maximize",
})

-- Corrige problemas ao arrastar com XWayland
hl.window_rule({
  match = {
    title = "^$",
    class = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

-- Picture-in-Picture
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
  },
  float = true
})
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
  },
  keep_aspect_ratio = true
})
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
  },
  move = { "(monitor_w*0.73)", "(monitor_h*0.72)" }
})
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
  },
  size = { "(monitor_w*0.25)", "(monitor_h*0.25)" }
})
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  float = true
})
hl.window_rule({
  match = {
    title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  pin = true
})

-- Regras de Aplicações
hl.window_rule({
  match = {
    class = "^(org.pulseaudio.pavucontrol)$" },
  size = { "(monitor_w*0.45)", "(monitor_h*0.45)" },
  float = true,
  center = true,
  pin = true,
})
hl.window_rule({
  match = {
    class = "^(org.gnome.Calculator)$" },
  float = true,
  center = true,
})
