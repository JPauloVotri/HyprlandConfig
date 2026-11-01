function GetWaybarArgs()
  local profile = os.getenv("WAYBAR_PROFILE")
  local base = HOME .. "/.config/waybar/"

  if profile and profile ~= "" then
    local configPath = base .. profile .. ".jsonc"
    local stylePath = base .. profile .. ".css"

    if IsFileExists(configPath) and IsFileExists(stylePath) then
      return " -c " .. configPath .. " -s " .. stylePath
    end

    hl.exec_cmd("notify-send 'Waybar' 'Perfil \"" .. profile .. "\" não encontrado. Usando o padrão.'")
  end

  return ""
end

hl.on("hyprland.start", function ()
  -- Utilitários
  hl.exec_cmd("waybar" .. GetWaybarArgs())
  hl.exec_cmd("systemctl --user start hyprpaper")
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
  hl.exec_cmd("dbus-update-activation-environment --all")
  hl.exec_cmd("sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP") -- Some fix idk

  -- Network Manager
  hl.exec_cmd("nm-applet --indicator")

  -- Clipboard
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  hl.exec_cmd("hyprctl setcursor breeze_cursors 24")
end)
