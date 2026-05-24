require("hyprland.lib")

hl.on("hyprland.start", function()
   local homeDir = os.getenv("HOME")
   if not homeDir or string.len(homeDir) == 0 then
      return
   end
   local baseCustomDir = homeDir .. "/.config/hypr/custom"
   local files = {
      baseCustomDir .. "/env.lua",
      baseCustomDir .. "/execs.lua",
      baseCustomDir .. "/general.lua",
      baseCustomDir .. "/rules.lua",
      baseCustomDir .. "/visual.lua",
      baseCustomDir .. "/keybinds.lua",
   }
   local createdFiles = 0
   for _, file in ipairs(files) do
      if not IsFileExists(file) then
         CreateIfNotExists(file)
         createdFiles = createdFiles + 1
      end
   end

   if createdFiles > 0 then
      -- hl.exec_cmd("notify-send 'Hyprland config' 'Created " .. createdFiles .. " custom Hyprland config files in " .. baseCustomDir .. "' -a 'Hyprland'")
      -- hl.exec_cmd("hyprctl reload")
   end
end)