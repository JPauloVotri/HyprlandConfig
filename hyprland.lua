require("hyprland.lib")
require("hyprland.services")

-- Variáveis de ambiente
require("hyprland.env")
if IsFileExists(HOME .. "/.config/hypr/custom/env.lua") then
  require("custom.env")
end

-- Configurações Padrão
require("hyprland.execs")
require("hyprland.general")
require("hyprland.rules")
require("hyprland.visual")
require("hyprland.keybinds")

-- Configurações Personalizadas
if IsFileExists(HOME .. "/.config/hypr/custom/execs.lua") then
  require("custom.execs")
end

if IsFileExists(HOME .. "/.config/hypr/custom/general.lua") then
  require("custom.general")
end

if IsFileExists(HOME .. "/.config/hypr/custom/rules.lua") then
  require("custom.rules")
end

if IsFileExists(HOME .. "/.config/hypr/custom/visual.lua") then
  require("custom.visual")
end

if IsFileExists(HOME .. "/.config/hypr/custom/keybinds.lua") then
  require("custom.keybinds")
end