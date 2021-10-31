local args = { ... }

local script = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/main.lua"
local installer = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/download.lua"
local name = "logger.lua"

local owner = args[1]

local function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

if not fs.exists("/owner") and owner == nil then
    error("No owner found!")
else
    local ownerFile = io.open("/owner", "w")
    ownerFile:write(trim(owner))
    ownerFile:close()
end

shell.run("rm download.lua")
shell.run(string.format("wget %s download.lua",installer))

shell.run(string.format("rm %s",name))
shell.run(string.format("wget %s %s",script,name))
