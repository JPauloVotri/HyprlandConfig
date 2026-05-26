local terminal = "kitty"
local fileManager = "nautilus"
local menu = "$HOME/.config/rofi/scripts/launcher/script.sh"
local fonts = "$HOME/.config/rofi/scripts/fonts/script.sh"
local power = "$HOME/.config/rofi/scripts/powermenu/script.sh"
local print = "hyprshot -m active -m output"
local screenshot = "$HOME/.config/rofi/scripts/screenshot/script.sh"

local mod = "SUPER+"
local modShift = mod .. "SHIFT+"
local modAlt = mod .. "ALT+"
local scripts = "$HOME/.local/bin/scripts/"

local function bindMod(key, action, opts)
  return hl.bind(mod .. tostring(key), action, opts)
end

local function bindModShift(key, action, opts)
  return hl.bind(modShift .. tostring(key), action, opts)
end

local function bindModAlt(key, action, opts)
  return hl.bind(modAlt .. tostring(key), action, opts)
end

-- Executar aplicações
bindMod("Return", hl.dsp.exec_cmd(terminal))
bindMod("E", hl.dsp.exec_cmd(fileManager))
bindMod("Space", hl.dsp.exec_cmd(menu))
bindModShift("F", hl.dsp.exec_cmd(fonts))
bindModShift("Escape", hl.dsp.exec_cmd(power))
bindMod("L", hl.dsp.exec_cmd("hyprlock"))

-- Controle das janelas
bindModShift("C", hl.dsp.window.close())
bindMod("V", hl.dsp.window.float({ action = "toggle" }))
bindMod("F", hl.dsp.window.fullscreen({ action = "toggle" }))
bindModAlt("P", hl.dsp.window.pin())

-- Tamanho da divisão de janelas
bindMod("Comma", hl.dsp.layout("splitratio -0.1"), { repeating = true })
bindMod("Period", hl.dsp.layout("splitratio +0.1"), { repeating = true })

-- Mover o foco nas janelas
for i = 1, 4 do
  local keys = { 44, 45, 46, 47 } --- l, d, u, r
  local focusdir = { "l", "d", "u", "r" }

  bindMod("code:" .. keys[i],
          hl.dsp.focus({ direction = focusdir[i] }),
          { description = "Window: Focus " .. keys[i] })
end

for i = 1, 10 do
  bindMod(i % 10, hl.dsp.focus({ workspace = i }))
  bindModShift(i % 10, hl.dsp.window.move({ workspace = i }))
end

-- Mover Workspace de monitor
bindModShift("Tab", hl.dsp.workspace.move({ monitor = "-1" }))
bindMod("Tab", hl.dsp.workspace.move({ monitor = "+1" }))

-- Abre e fecha a Waybar
bindMod("Escape", hl.dsp.exec_cmd("killall waybar || waybar"))

-- Mover/redimensionar janelas
bindMod("mouse:272", hl.dsp.window.drag())
bindMod("mouse:273", hl.dsp.window.resize())

-- Mutimídia
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        scripts .. "volume.sh up || " ..
        "(pactl set-sink-mute @DEFAULT_SINK@ 0 && " ..
        "pactl set-sink-volume @DEFAULT_SINK@ +5%)"
    ),
    { repeating = true }
)
hl.bind(
    "SHIFT+XF86AudioRaiseVolume",
    hl.dsp.exec_cmd(
        scripts .. "volume.sh up high ||" ..
        "(pactl set-sink-mute @DEFAULT_SINK@ 0 && " ..
        "pactl set-sink-volume @DEFAULT_SINK@ +10%)"
    ),
    { repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        scripts .. "volume.sh down || " ..
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    ),
    { repeating = true }
)
hl.bind(
    "SHIFT+XF86AudioLowerVolume",
    hl.dsp.exec_cmd(
        scripts .. "volume.sh down high ||" ..
        "pactl set-sink-volume @DEFAULT_SINK@ -10%"
    ),
    { repeating = true }
)
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd(
        scripts .. "volume.sh mute ||" ..
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )
)
hl.bind("XF86AudioMicMute",
        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))

-- Brilho
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(scripts .. "brightness.sh up || brightnessctl set 10%+"),
    { repeating = true }
)
hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(scripts .. "brightness.sh down || brightnessctl set 10%-"),
    { repeating = true }
)
hl.bind(
    "SHIFT+XF86MonBrightnessUp",
    hl.dsp.exec_cmd(scripts .. "brightness.sh up low || brightnessctl set 5%+"),
    { repeating = true }
)
hl.bind(
    "SHIFT+XF86MonBrightnessDown",
    hl.dsp.exec_cmd(
        scripts .. "brightness.sh down low || brightnessctl set 5%-"
    ),
    { repeating = true }
)

-- Outros
hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"))
hl.bind("Print", hl.dsp.exec_cmd(print))
bindModShift("S", hl.dsp.exec_cmd(screenshot))

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock & systemctl suspend"))
