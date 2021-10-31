local script = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/main.lua"
local name = "logger.lua"

shell.run(string.format("rm %s",name))
shell.run(string.format("wget %s %s",script,name))
