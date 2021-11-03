local script = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/main.lua"
local installer = "https://raw.githubusercontent.com/Black-Mesas/player-logger/main/src/download.lua"
local name = "logger.lua"

shell.run("rm download.lua")
shell.run(string.format("wget %s download.lua",installer))

shell.run(string.format("rm %s",name))
shell.run(string.format("wget %s %s",script,name))

if not fs.exists("/distance") then
	local distance = io.output("/distance")
	
	print("making distance file")
	print("edit /distance to set the range of the player detector.")
	distance:write("16")
	distance:close()
end

if not fs.exists("/owner") then
	local owner = io.output("/owner")
	
	print("making owner file")
	print("you need to add your name to /owner for this to work!")
	owner:close()
end
