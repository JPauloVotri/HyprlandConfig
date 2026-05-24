hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1.0,
})

hl.gesture({
  fingers = 4,
  direction = "horizontal",
  action = "workspace"
})

hl.config({
  input = {
    kb_layout = "br,us",
    kb_variant = "nativo,intl",
    kb_model = "",
    kb_options = "ctrl:swapcaps,grp:alt_space_toggle",
    kb_rules = "",

    repeat_rate = 32,
    repeat_delay = 256,

    follow_mouse = 1,

    sensitivity = 0,
    accel_profile = "flat",
    force_no_accel = true,
    numlock_by_default = true,

    touchpad = {
      natural_scroll = true,
    }
  }
})