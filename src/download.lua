local args = { ... }

local script = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/main.lua"
local name = "logger.lua"

local owner = args[1]

if !fs.exists("/owner") and owner == nil then
    error("No owner found!")
else
    local ownerFile = fs.open("/owner", "w")
    ownerFile.write(owner)
    ownerFile.close()
end

shell.run(string.format("rm %s",name))
shell.run(string.format("wget %s %s",script,name))
