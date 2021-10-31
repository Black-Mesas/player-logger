local chat = peripheral.find("chatBox")
local players = peripheral.find("playerDetector")

assert(chat,"No chatbox.")
assert(players,"No player detector.")

local owner = "THKY"
local range = 16
local last = {}

local function message(text,name)
    local settings = chat.getConfiguration()
    local time = settings.chatMessage.cooldown
    
    sleep(time / 1000)
    chat.sendMessageToPlayer(text,name)
end

local function log(text)
    local file = io.open("/log","a")
    
    if not file then
        file = io.output("/log")
    end
    
    file:write(os.date() .. "\n")
    file:write(text .. "\n\n")
    file:close()
    
    print(text)
end

--log("machine started")
message("running",owner)

while true do
    local near = players.getPlayersInRange(range)
    
    for _,player in pairs(near) do
        local pass = true
        
        if player == "THKY" then
            pass = false
        end
        
        for _,inside in pairs(last) do
            if player == inside then
                pass = false
                break
            end
        end
        
        if pass then
            log(player .. " detected")
            
            --message("Detected",player)
            message(player .. " is near your home.",owner)
        end
    end
    
    last = near
end