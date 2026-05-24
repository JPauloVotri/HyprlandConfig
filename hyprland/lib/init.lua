HOME = os.getenv("HOME")

function IsFileExists(path)
  local file = io.open(path, "r")

  if file then
    io.close(file)
    return true
  else
    return false
  end
end

function CreateIfNotExists(path)
  if not IsFileExists(path) then
    os.execute("mkdir -p \"$(dirname \"" .. path .. "\")\"")
    os.execute(
      "echo '-- Este arquivo não será sobrescrito durante as atualizações " ..
      "do dots-hyprland.\n" ..
      "-- O nome do arquivo existe apenas para organização e não importa.\n" ..
      "-- Veja os arquivos correspondentes em ~/.config/hypr/hyprland como " ..
      "exemplo.' > \"" ..
      path ..
      "\"")
    return true
  end
  return false
end

function WorkspaceInGroup(i)
  local curr = hl.get_active_workspace().id
  local groupBase = math.floor((curr - 1) / workspaceGroupSize) * workspaceGroupSize
  local newVal = groupBase + i
  -- hl.notification.create({ text = "curr " .. curr .. " floor " .. math.floor(curr / 10) .. " new " .. newVal, duration = 5000 })
  return newVal
end