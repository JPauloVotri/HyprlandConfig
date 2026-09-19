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
  size = {
    "(monitor_h * 0.25 * 16/9)",
    "(monitor_h * 0.25)"
  },
  move = { 
    "(monitor_w - 18 - monitor_h * 0.25 * 16/9)",
    "(monitor_h - 18 - monitor_h * 0.25)"
  },
  float = true,
  keep_aspect_ratio = true,
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
