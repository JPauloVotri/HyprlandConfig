require("hyprland.colors")

local gaps_active = false

function ToggleGaps()
  if gaps_active then
    hl.config({
      general = {
        gaps_in = 0,
        gaps_out = 0,
        border_size = 1,
      },
      decoration = {
        rounding = 0,
      },
    })
    gaps_active = false
  else
    hl.config({
      general = {
        gaps_in = 8,
        gaps_out = 16,
        border_size = 2,
      },
      decoration = {
        rounding = 8,
      },
    })
    gaps_active = true
  end
end

hl.config({
  general = {
    col = {
      active_border = {
        colors = { primary, secondary },
        angle = 45,
      },
    },
    resize_on_border = true,
  },

  dwindle = {
    preserve_split = true,
    smart_split = false,
    smart_resizing = false,
  },

  decoration = {
    rounding_power = 4,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = false,
      range = 16,
      render_power = 16,
      color = primary,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,

      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Curvas
hl.curve("expressiveFastSpatial", {
  type = "bezier",
  points = { { 0.42, 1.67 }, { 0.21, 0.90 } }
})
hl.curve("expressiveSlowSpatial", {
  type = "bezier",
  points = { { 0.39, 1.29 }, { 0.35, 0.98 } }
})
hl.curve("expressiveDefaultSpatial", {
  type = "bezier",
  points = { { 0.38, 1.21 }, { 0.22, 1.00 } }
})
hl.curve("emphasizedDecel", {
  type = "bezier",
  points = { { 0.05, 0.7 }, { 0.1, 1 } }
})
hl.curve("emphasizedAccel", {
  type = "bezier",
  points = { { 0.3, 0 }, { 0.8, 0.15 } }
})
hl.curve("standardDecel", {
  type = "bezier",
  points = { { 0, 0 }, { 0, 1 } }
})
hl.curve("menu_decel", {
  type = "bezier",
  points = { { 0.1, 1 }, { 0, 1 } }
})
hl.curve("menu_accel", {
  type = "bezier",
  points = { { 0.52, 0.03 }, { 0.72, 0.08 } }
})
hl.curve("stall", {
  type = "bezier",
  points = { { 1, -0.1 }, { 0.7, 0.85 } }
})

-- Animações
hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 3,
  bezier = "emphasizedDecel",
  style = "popin 80%"
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 2,
  bezier = "emphasizedDecel",
  style = "popin 90%"
})
hl.animation({
  leaf = "windowsMove",
  enabled = true,
  speed = 3,
  bezier = "emphasizedDecel",
  style = "slide"
})
hl.animation({
  leaf = "layersIn",
  enabled = true,
  speed = 2.7,
  bezier = "emphasizedDecel",
  style = "popin 93%"
})
hl.animation({
  leaf = "layersOut",
  enabled = true,
  speed = 2.4,
  bezier = "menu_accel",
  style = "popin 94%"
})
hl.animation({
  leaf = "fadeIn",
  enabled = true,
  speed = 3,
  bezier = "emphasizedDecel"
})
hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 2,
  bezier = "emphasizedDecel"
})
hl.animation({
  leaf = "fadeLayersIn",
  enabled = true,
  speed = 0.5,
  bezier = "menu_decel"
})
hl.animation({
  leaf = "fadeLayersOut",
  enabled = true,
  speed = 2.7,
  bezier = "stall"
})
hl.animation({
  leaf = "border",
  enabled = true,
  speed = 10,
  bezier = "emphasizedDecel"
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 7,
  bezier = "menu_decel",
  style = "slide"
})

ToggleGaps()
