local lib = loadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/uilib.lua"))() 
local FlagsManager = loadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/Backup/Backend/ObfuscatedConfigSource"))()
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...) return(...) end;
    LPH_NO_VIRTUALIZE = function(...) return(...) end;
    LPH_CRASH = function(...) while task.wait() do game:GetService("ScriptContext"):SetTimeout(math.huge);while true do while true do while true do while true do while true do while true do while true do while true do print("noob") end end end end end end end end end end;
    LRM_UserNote = "Owner" -- Debugging Purpose Only
    LRM_ScriptVersion = "v0030" -- Debugging Purpose Only
    ClonedPrint = print
end

if LPH_OBFUSCATED then
    ClonedPrint = print
    print = function(...)end
    warn = function(...)end

    local PreventSkidsToMakeGayThings = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/InfiniX/a40a158d22fd4f4733beb2f67379866ccb17906f/Library/Anti/AntiDebug/main.lua", true))()

    if not (type(PreventSkidsToMakeGayThings) == "table") then
    LPH_CRASH()
    end
end

if not isfile('Lunor_Trans.png') then
    writefile("Lunor_Trans.png", game:HttpGet('https://github.com/Just3itx/Backup/blob/main/Lunor_Trans.png?raw=true'))
end

--[[Please Commnet When you are about to upload]]--
function RoleChecker()
    if string.find(LRM_UserNote, "Ad Reward") then
        return "Free Version"
    elseif string.find(LRM_UserNote, "Premium") then
        return "Premium Version"
    elseif string.find(LRM_UserNote, "Owner") then
        return "Dev Version"
    elseif string.find(LRM_UserNote, "nylt") then
        return "nylts stupidity" -- he paid 5k robux for this title..
    else
        return "No Role Assigned"
    end
end


function formatVersion(version)
    local formattedVersion = "v" .. version:sub(2):gsub(".", "%0.") -- Keep 'v' and add dot between digits
    return formattedVersion:sub(1, #formattedVersion - 1) -- Remove last dot
end

local function interpolate_color(color1, color2, t)
    local r = math.floor((1 - t) * color1[1] + t * color2[1])
    local g = math.floor((1 - t) * color1[2] + t * color2[2])
    local b = math.floor((1 - t) * color1[3] + t * color2[3])
    return string.format("#%02x%02x%02x", r, g, b)
end

local function hex_to_rgb(hex)
    return {
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16)
    }
end

local function gradient(word)
    if not word or #word == 0 then
        return "Error"
    end

    if getgenv().GradientColor == nil then
        start_color = hex_to_rgb("ea00ff")
        end_color = hex_to_rgb("5700ff") -- 08B3FF
    else
        -- print(getgenv().GradientColor.startingColor, getgenv().GradientColor.endingColor)
        start_color = hex_to_rgb(getgenv().GradientColor.startingColor)
        end_color = hex_to_rgb(getgenv().GradientColor.endingColor)
    end

    local gradient_word = ""
    local word_len = #word
    local step = 1.0 / math.max(word_len - 1, 1)

    for i = 1, word_len do
        local t = step * (i - 1)
        local color = interpolate_color(start_color, end_color, t)
        gradient_word = gradient_word .. string.format('<font color="%s">%s</font>', color, word:sub(i, i))
    end

    return gradient_word
end

-- Example usage
-- print(gradient("Hello"))
function getLunorIcon()
    local asset
    local success, product = pcall(function()
        return getcustomasset(readfile('Lunor_Trans2.png'))
    end)

    if not success or identifyexecutor():find("Cryptic") then
        asset = "http://www.roblox.com/asset/?id=115594743966251"
    else
        asset = product
    end
    return asset
end

local main = lib:Load({
    Title = 'Fisch '..formatVersion(LRM_ScriptVersion)..' | ' .. gradient("discord.gg/lunor").. " | ".. RoleChecker(),
    KeyAuth = "3itx_9e91x3",
    ToggleButton = getLunorIcon()
})



local tabs = {
    Main = main:AddTab("Main"),
    AutoFarm = main:AddTab("Auto Farm"),
    Items = main:AddTab("Items"),
    Teleporation = main:AddTab("Teleports"),
    Misc = main:AddTab("Misc"),
    Webhook = main:AddTab("Webhook"),
    Visuals = main:AddTab("Visuals"),
    Config = main:AddTab("Configs")
}
main:SelectTab()



local sections = {
    Welcome = tabs.Main:AddSection({Defualt = true , Locked = true}),
    FishPremium = tabs.AutoFarm:AddSection({Title = gradient("Premium - Rod Exploit"), Description = "", Defualt = false , Locked = false}),
    Fish = tabs.AutoFarm:AddSection({Title = gradient("Auto Fishing"), Description = "", Defualt = true , Locked = false}),
    FishPlus = tabs.AutoFarm:AddSection({Title = gradient("Advanced Auto Fish"), Description = "", Defualt = false , Locked = false}),
    FishBait = tabs.AutoFarm:AddSection({Title = gradient("Baits"), Description = "", Defualt = false , Locked = false}),
    -- FishSell = tabs.AutoFarm:AddSection({Title = gradient("Selling"), Description = "", Defualt = false , Locked = false}),
    Webhook1 = tabs.Webhook:AddSection({Title = gradient(""), Description = "", Defualt = true , Locked = true}),
    Webhook2 = tabs.Webhook:AddSection({Title = gradient("Webhook Settings"), Description = "", Defualt = true , Locked = false}),
    Webhook3 = tabs.Webhook:AddSection({Title = gradient("Start Webhooks"), Description = "", Defualt = true , Locked = false}),
    FishSettings = tabs.AutoFarm:AddSection({Title = gradient("Auto Fish Settings"), Description = "", Defualt = false , Locked = false}),
    Item0 = tabs.Items:AddSection({Defualt = true , Locked = true}),
    Item = tabs.Items:AddSection({Title = gradient("Purchase"), Description = "", Defualt = false , Locked = false}),
    Item5 = tabs.Items:AddSection({Title = gradient("Selling & Favouriting"), Description = "", Defualt = false , Locked = false}),
    Item1 = tabs.Items:AddSection({Title = gradient("Appraise"), Description = "", Defualt = false , Locked = false}),
    Item2 = tabs.Items:AddSection({Title = gradient("Enchant"), Description = "", Defualt = false , Locked = false}),
    Item3 = tabs.Items:AddSection({Title = gradient("Totems"), Description = "", Defualt = false , Locked = false}),
    Item4 = tabs.Items:AddSection({Title = gradient("Treasures"), Description = "", Defualt = false , Locked = false}),
    Item6 = tabs.Items:AddSection({Title = gradient("Crab Cages"), Description = "", Defualt = false , Locked = false}),
    Tele = tabs.Teleporation:AddSection({Defualt = true , Locked = true}),
    Tele1 = tabs.Teleporation:AddSection({Title = gradient("Teleports"), Description = "", Defualt = false , Locked = false}),
    Tele2 = tabs.Teleporation:AddSection({Title = gradient("Advanced Teleports"), Description = "", Defualt = false , Locked = false}),
    Misc = tabs.Misc:AddSection({Title = gradient("Character"), Description = "", Defualt = false , Locked = false}),
    Misc1 = tabs.Misc:AddSection({Title = gradient("Anti Staff"), Description = "", Defualt = false , Locked = false}),
    Misc3 = tabs.Misc:AddSection({Title = gradient("Platform"), Description = "", Defualt = false , Locked = false}),
    Misc2 = tabs.Misc:AddSection({Title = gradient("Gifting"), Description = "", Defualt = false , Locked = false}),
    Misc4 = tabs.Misc:AddSection({Title = gradient("Boats"), Description = "", Defualt = false , Locked = false}),
    Misc5 = tabs.Misc:AddSection({Title = gradient("Servers"), Description = "", Defualt = false , Locked = false}),
    Misc6 = tabs.Misc:AddSection({Title = gradient("Exploits"), Description = "", Defualt = false , Locked = false}),
    Visuals = tabs.Visuals:AddSection({Title = gradient("Visuals"), Description = "", Defualt = false , Locked = false}),
    Visuals1 = tabs.Visuals:AddSection({Title = gradient("FPS"), Description = "", Defualt = false , Locked = false}),
    Visuals2 = tabs.Visuals:AddSection({Title = gradient("Hide Identity"), Description = "", Defualt = false , Locked = false}),
    Visuals3 = tabs.Visuals:AddSection({Title = gradient("ESP"), Description = "", Defualt = false , Locked = false}),
    Visuals4 = tabs.Visuals:AddSection({Title = gradient("Rod Skin"), Description = "", Defualt = false , Locked = false}),
    Gradient = tabs.Config:AddSection({Title = gradient("Gradient"), Description = "", Defualt = false , Locked = false}),
    ImpExp = tabs.Config:AddSection({Title = gradient("Import/Export Configs"), Description = "", Defualt = false , Locked = false}),
}

local variables = {
    autoSellDelay = 0,
    autoselling = false,
    TweenMethod = false,
    TeleportMethod = true,
    AutoCast = false,
    AutoShake = false,
    AutoCatch = false,
    AlreadyRequested = false,
    AutoToggleRadar = false,
    ShakeMethod = "Navigation",
    Coords = "",
    AutoCastZone = false,
    baits = {},
    SelectedBait = nil,
    AutoPredictor = false,
    AutoDrop = false
}
-- replaced var's with this for proper closing when script gets closed..
local var = {
}
var.WelcomeParagraph  = sections.Welcome:AddParagraph({Title = gradient("Loading..."), Description = "Please wait..\nIf you've been stuck on this for a long time please join our discord and report it.\nYou could also try:\n- Re-execute\n- Rejoin"})
data = loadstring(game:HttpGet("https://you.whimper.xyz/sources/lunor/data.lua"))()


function prompt(npc)
    local promptInstance = npc:FindFirstChild("dialogprompt")
    if promptInstance then

        local player = game:GetService("Players").LocalPlayer
        local char = player.Character
        local oldParent = promptInstance.Parent
        local oldDistance = promptInstance.MaxActivationDistance

        promptInstance.MaxActivationDistance = math.huge
        promptInstance.Parent = char

        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                obj:InputHoldBegin()
                task.wait(0.01) -- Adjust this as needed for reliability
                obj:InputHoldEnd()
            end
        end

        promptInstance.Parent = oldParent
        promptInstance.MaxActivationDistance = oldDistance
    end
end



-- lib:Notification("Loading", "Begin", 5)
-- local dialog = game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("dialog") -- Gato if u reading this don't remove this cuz this will prevent breaking the NPC
LPH_JIT_MAX(function()
if not getgenv().LunorDependencies then
    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll.Parent = game:GetService("ReplicatedStorage").playerstats
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local workspaceService = game:GetService("Workspace")
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local virtualUser = game:GetService("VirtualUser")
    
    player.Idled:Connect(function()
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end)

    -- pcall(function()
    --     local Players = game:GetService("Players")
    --     local ReplicatedStorage = game:GetService("ReplicatedStorage")
    --     local LocalPlayer = Players.LocalPlayer
    --     local inventory = LocalPlayer.PlayerGui.hud.safezone.backpack.inventory

    --     -- Function to handle the Visible property change
    --     local function onInventoryVisibilityChanged()
    --         if inventory.Visible then
    --             pcall(function()
    --                 ReplicatedStorage.playerstats.scroll.Parent = inventory
    --             end)
    --         else
    --             pcall(function()
    --                 inventory.scroll.Parent = ReplicatedStorage.playerstats
    --             end)
    --         end
    --     end
    --     -- connect
    --     inventory:GetPropertyChangedSignal("Visible"):Connect(onInventoryVisibilityChanged)
    --     -- startup
    --     onInventoryVisibilityChanged()
    -- end)

    -- dialog.Disabled = true

    -- lib:Notification("Loading", "Stage 0", 5)

    local npcData = {
        {name = "Marc Merchant", position = Vector3.new(466, 151, 224)},
        {name = "Appraiser", position = Vector3.new(453.182373046875, 150.50003051757812, 206.90878295898438)},
        {name = "Merlin", position = Vector3.new(-928.0328369140625, 223.7000274658203, -998.7449951171875)},
        {name = "Jack Marrow", position = Vector3.new(-2829.855712890625, 212.09266662597656, 1517.4398193359375)},
        {name = "Mods Latern Keeper", position = Vector3.new(-39, -247, 196)},
        {name = "Terrapin Shipwright", position = Vector3.new(5869.421875, 143.49795532226562, 7.101318359375)}
    }

    for _, npcInfo in ipairs(npcData) do
        player:RequestStreamAroundAsync(npcInfo.position, 1/0)
        local npc = workspaceService.world.npcs:FindFirstChild(npcInfo.name)
        if npc then
            npc.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            prompt(npc)
        end
    end

    -- lib:Notification("Loading", "Stage 1", 5)

    -- Rename Fisch Dev Mistake
    if workspace.world.npcs:FindFirstChild("Terrapin Shipwright") then
        pcall(function()
            workspace.world.npcs:FindFirstChild("Terrapin Shipwright").Name = "Ancient Shipwright"
        end)
    end

    player:GetPropertyChangedSignal("GameplayPaused"):Connect(function()
        if player.GameplayPaused then
            player.GameplayPaused = false
        end
    end)

    -- Anti Death Screen
    local deathGui = player.PlayerGui:FindFirstChild("death")
    if deathGui then
        deathGui.ResetOnSpawn = true
        deathGui:GetPropertyChangedSignal("Enabled"):Connect(function()
            if deathGui.Enabled then
                deathGui.Enabled = false
            end
        end)
    end
    pcall(function()
        if game:GetService("ReplicatedStorage"):FindFirstChild("GameAnalyticsError") then
            game:GetService("ReplicatedStorage").GameAnalyticsError:Destroy()
        end

        if game:GetService("ReplicatedStorage"):FindFirstChild("GameAnalyticsRemoteConfigs") then
            game:GetService("ReplicatedStorage").GameAnalyticsRemoteConfigs:Destroy()
        end

        local ReplacedRemote1 = Instance.new("RemoteEvent",game:GetService("ReplicatedStorage"))
        ReplacedRemote1.Name = "GameAnalyticsError"


        local ReplacedRemote2 = Instance.new("RemoteEvent",game:GetService("ReplicatedStorage"))
        ReplacedRemote2.Name = "GameAnalyticsRemoteConfigs"
    end)
    -- File Setup
    if not isfolder("Lunor/Fisch") then
        makefolder("Lunor/Fisch")
    else
    end
    if not isfile("Lunor/Fisch/saved_teleports.json") then
        writefile("Lunor/Fisch/saved_teleports.json", "{}")
    end
     
    if workspace.zones.fishing:FindFirstChild("Brine Pool Water") then
        workspace.zones.fishing:FindFirstChild("Brine Pool Water"):Destroy()
    end

    -- lib:Notification("Loading", "Stage 2", 5)

    player:RequestStreamAroundAsync(Vector3.new(-1969.1385498046875, 312.765869140625, 255.92677307128906),1/0)
    if workspace.world.map["Roslit Bay"]:FindFirstChild("Lava") then
        for _,v in pairs(workspace.world.map["Roslit Bay"].Lava:GetDescendants()) do
            if v.Name == "Lava" then
                v:Destroy()
            end
        end
    end
    pcall(function()
        player:RequestStreamAroundAsync(Vector3.new(1288.759765625, -899.0166015625, -191.36984252929688),1/0)
        if workspace.world.map:FindFirstChild("Enchant Room") then
            for _,v in pairs(workspace.world.map["Enchant Room"]:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    v.Parent:Destroy()
                end
            end
        end

        player:RequestStreamAroundAsync(Vector3.new(-3081, -821, 1913),1/0)
        for _,v in next, workspace.world.map["Ancient Archives"]:GetDescendants() do
            if v:IsA("Script") and v.Name == "voidkiller" then
                v.Parent:Destroy()
            end
        end

        player:RequestStreamAroundAsync(Vector3.new(-1556, -235, -2884),1/0)
        for _,v in next, workspace.world.map["Desolate Deep"].MainCave.Interactive:GetDescendants() do
            if v:IsA("Model") and v.Name == "SeaMine" then
                v.Hitbox:Destroy()
            end
        end
    end)


    -- lib:Notification("Loading", "Stage 3", 5)

    pcall(function()
        LPH_JIT_MAX(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local plrs = game:GetService("Players")

            local plr = plrs.LocalPlayer
            local pgui = plr.PlayerGui
            local safezone = pgui.hud:FindFirstChild("safezone")


            local inv = safezone.backpack.inventory
            local Sell = inv:FindFirstChild("Sell")
            local Appraise = inv:FindFirstChild("Appraise")

            function fakebuttons()
                Sell:Destroy()
                Appraise:Destroy()
            
                Sell = Instance.new("TextButton")
                local l = Instance.new("ImageLabel")
                local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
                local hover = Instance.new("ImageLabel")
                local stroke = Instance.new("UIStroke")
                local UIStroke = Instance.new("UIStroke")
                Appraise = Instance.new("TextButton")
                local l_2 = Instance.new("ImageLabel")
                local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
                local hover_2 = Instance.new("ImageLabel")
                local stroke_2 = Instance.new("UIStroke")
                local UIStroke_2 = Instance.new("UIStroke")
            
                -- Properties:
            
                Sell.Name = math.random(1,100)
                Sell.Parent = inv
                Sell.AnchorPoint = Vector2.new(0.5, 1)
                Sell.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Sell.BackgroundTransparency = 0.450
                Sell.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Sell.BorderSizePixel = 0
                Sell.Position = UDim2.new(0.0946180522, 0, -0.140387669, 0)
                Sell.Size = UDim2.new(0, 103, 0, 18)
                Sell.Font = Enum.Font.SourceSansBold
                Sell.Text = "Sell Inventory"
                Sell.TextColor3 = Color3.fromRGB(168, 255, 149)
                Sell.TextScaled = true
                Sell.TextSize = 14.000
                Sell.TextWrapped = true
                print(Sell:GetFullName())
            
                l.Name = "l"
                l.Parent = Sell
                l.AnchorPoint = Vector2.new(0, 0.5)
                l.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                l.BackgroundTransparency = 1.000
                l.BorderColor3 = Color3.fromRGB(0, 0, 0)
                l.BorderSizePixel = 0
                l.Position = UDim2.new(0.0450000018, 0, 0.5, 0)
                l.Size = UDim2.new(0.0989992097, 0, 1.20258296, 0)
                l.Visible = false
                l.Image = "rbxassetid://18976601788"
                l.ImageColor3 = Color3.fromRGB(15, 15, 15)
                l.ImageTransparency = 0.270
            
                UIAspectRatioConstraint.Parent = l
            
                hover.Name = "hover"
                hover.Parent = Sell
                hover.AnchorPoint = Vector2.new(0.5, 0.5)
                hover.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
                hover.BackgroundTransparency = 1.000
                hover.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hover.BorderSizePixel = 0
                hover.Position = UDim2.new(0.5, 0, 0.5, 0)
                hover.Size = UDim2.new(1.01999998, 0, 1.20000005, 0)
                hover.ZIndex = 3
                hover.Image = "rbxassetid://16803461543"
                hover.ImageColor3 = Color3.fromRGB(168, 255, 149)
                hover.ScaleType = Enum.ScaleType.Slice
                hover.SliceCenter = Rect.new(12, 12, 88, 88)
                hover.SliceScale = 0.400
            
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                stroke.Color = Color3.fromRGB(168, 255, 149)
                stroke.Transparency = 0.36000001430511475
                stroke.Name = "stroke"
                stroke.Parent = Sell
            
                UIStroke.Transparency = 0.47999998927116394
                UIStroke.Parent = Sell
            
                Appraise.Name = math.random(1,100)
                Appraise.Parent = inv
                Appraise.AnchorPoint = Vector2.new(0.5, 1)
                Appraise.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Appraise.BackgroundTransparency = 0.450
                Appraise.BorderColor3 = Color3.fromRGB(0, 0, 0)
                Appraise.BorderSizePixel = 0
                Appraise.Position = UDim2.new(0.300008476, 0, -0.140387923, 0)
                Appraise.Size = UDim2.new(0, 104, 0, 18)
                Appraise.Font = Enum.Font.SourceSansBold
                Appraise.Text = "Appraise Fish"
                Appraise.TextColor3 = Color3.fromRGB(168, 255, 149)
                Appraise.TextScaled = true
                Appraise.TextSize = 14.000
                Appraise.TextWrapped = true
            
                l_2.Name = "l"
                l_2.Parent = Appraise
                l_2.AnchorPoint = Vector2.new(0, 0.5)
                l_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                l_2.BackgroundTransparency = 1.000
                l_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                l_2.BorderSizePixel = 0
                l_2.Position = UDim2.new(0.0450000018, 0, 0.5, 0)
                l_2.Size = UDim2.new(0.0989992097, 0, 1.20258296, 0)
                l_2.Visible = false
                l_2.Image = "rbxassetid://18976601788"
                l_2.ImageColor3 = Color3.fromRGB(15, 15, 15)
                l_2.ImageTransparency = 0.270
            
                UIAspectRatioConstraint_2.Parent = l_2
            
                hover_2.Name = "hover"
                hover_2.Parent = Appraise
                hover_2.AnchorPoint = Vector2.new(0.5, 0.5)
                hover_2.BackgroundColor3 = Color3.fromRGB(170, 170, 170)
                hover_2.BackgroundTransparency = 1.000
                hover_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hover_2.BorderSizePixel = 0
                hover_2.Position = UDim2.new(0.5, 0, 0.5, 0)
                hover_2.Size = UDim2.new(1.01999998, 0, 1.20000005, 0)
                hover_2.ZIndex = 3
                hover_2.Image = "rbxassetid://16803461543"
                hover_2.ImageColor3 = Color3.fromRGB(168, 255, 149)
                hover_2.ScaleType = Enum.ScaleType.Slice
                hover_2.SliceCenter = Rect.new(12, 12, 88, 88)
                hover_2.SliceScale = 0.400
            
                stroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                stroke_2.Color = Color3.fromRGB(168, 255, 149)
                stroke_2.Transparency = 0.36000001430511475
                stroke_2.Name = "stroke"
                stroke_2.Parent = Appraise
            
                UIStroke_2.Transparency = 0.47999998927116394
                UIStroke_2.Parent = Appraise
            
                return Sell, Appraise
            end
            fakebuttons()

            Sell.MouseButton1Click:Connect(function()
                pcall(function()
                    ReplicatedStorage.events.SellAll:InvokeServer()
                end)
            end)

            Appraise.MouseButton1Click:Connect(function()
                pcall(function()
                    local validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
                    if validFish then
                        task.spawn(function()
                            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                        end)
                    end
                end)
            end)
        end)()
    end)

    -- lib:Notification("Loading", "Stage 4", 5)

    if setfpscap then
        setfpscap(240)
    end
    
    game:GetService("Players").LocalPlayer.PlayerGui.death.Enabled = false
    getgenv().LunorDependencies = true
    game:GetService("ReplicatedStorage").events.anno_localthought:Fire([[<b><font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font> Has Been loaded</b>]],5,nil,game:GetService("ReplicatedStorage").resources.sounds.sfx.event.firefly,"Exotic")end
end)()
-- dialog.Enabled = true
lib:Notification("Loaded!","Anti AFK and more have been loaded.", 5)
-- lib:Notification("Loading", "Stage 5", 5)

local Players = game:GetService('Players')
local CoreGui = game:GetService("StarterGui")
local GuiService = game:GetService('GuiService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local VIM = Instance.new("VirtualInputManager")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Enabled = false
local Rod = false
local Progress = false
local Finished = false

local PlayerStats = ReplicatedStorage:WaitForChild("playerstats")[LocalPlayer.Name].Stats
local character = LocalPlayer.Character

function CreatePrice(Path, Price)
    _G.existingLabel = Path:FindFirstChild("STOP SKIDDING >:(")
    if _G.existingLabel then
        _G.existingLabel.Text = tostring(Price) .. "C$"
    else
        _G.itemPrice = Instance.new("TextLabel", Path)
        _G.itemPrice.Position = UDim2.new(0, 1, 0, 0)
        _G.itemPrice.Size = UDim2.new(1, 0, 0.183, 0)
        _G.itemPrice.ZIndex = 99999
        _G.itemPrice.Transparency = 1
        _G.itemPrice.Text = tostring(Price) .. "C$"
        _G.itemPrice.TextXAlignment = Enum.TextXAlignment.Left
        _G.itemPrice.Name = "STOP SKIDDING >:("
        _G.itemPrice.TextSize = 14
        _G.itemPrice.TextScaled = false
        _G.itemPrice.Font = Enum.Font.SourceSans

        _G.uiStroke = Instance.new("UIStroke", _G.itemPrice)
        _G.uiStroke.Color = Color3.fromRGB(255, 255, 255)
        _G.uiStroke.Thickness = 0
        _G.uiStroke.Transparency = 0

        _G.uiGradient = Instance.new("UIGradient", _G.uiStroke)
        _G.uiGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0.000, Color3.new(0.137255, 1.000000, 0.525490)),
            ColorSequenceKeypoint.new(1.000, Color3.new(0.243137, 0.678431, 0.376471))
        }
    end
end


function isSunkenChestActive()
    local uptimeSeconds = game:GetService("ReplicatedStorage").world.uptime.Value
    local totalMinutes = math.floor(uptimeSeconds / 60)

    local cycleTime = 70
    local activeDuration = 10

    local modValue = (totalMinutes - 60 + 1) % cycleTime

    return modValue >= 0 and modValue < (activeDuration + 1)
end

function checkMeteor()
    local meteorItems = workspace:FindFirstChild("MeteorItems")

    if meteorItems and #meteorItems:GetChildren() > 0 then
        return meteorItems:GetChildren()[1].Name
    end

    return false
end



function getFishInventorySetting(fishName)
    _G.playerName = game.Players.LocalPlayer.Name
    _G.playerInventory = ReplicatedStorage.playerstats:FindFirstChild(_G.playerName).Inventory
    _G.fishItem = _G.playerInventory:FindFirstChild(tostring(fishName))

    if _G.fishItem then
        _G.fishSettings = {}
        _G.fishSettings["Name"] = _G.fishItem.Value

        for _, child in ipairs(_G.fishItem:GetChildren()) do
            if child:IsA("ValueBase") then 
                _G.fishSettings[child.Name] = child.Value
            end
        end

        return _G.fishSettings
    else
        return nil
    end
end

function reel(power, perfect)
    if power == nil then power = 100 end
    if perfect == nil then perfect = var.PerfectCatch end

    print("Power:", power, "Perfect:", perfect) -- Debugging
    local reelfinished = ReplicatedStorage.events:FindFirstChild("reelfinished ")
    if var.selectedPassive == 'ROTZ' and autoPassive then
        local args = {
            [1] = {
                ["mutationMultiplier"] = 10,
                ["isCanceled"] = false
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ZenithMinigameStatus"):FireServer(unpack(args))    
    end
    reelfinished:FireServer(power, perfect)
    if var.selectedPassive == 'ROTZ' and autoPassive and not autoReelEnabled then 
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
    end
end




function GetBackPackItemValue(Name)
    local fishSettings = getFishInventorySetting(Name)
    
    if type(fishSettings) ~= "table" then
        return fishSettings or 0
    end
    
    if not fishSettings.Weight then
        return 0
    end
    
    local fishData = data.Fish[fishSettings.Name]
    if not fishData then
        return 0
    end
    
    -- Calculate base price
    local weightPool = fishData.WeightPool
    local basePrice = fishData.Price
    local price = math.ceil((basePrice / weightPool[2]) * fishSettings.Weight * 10)
    
    -- Apply modifiers
    if fishSettings.Shiny then
        price = price * 1.85
    end
    
    if fishSettings.Sparkling then
        price = price * 1.85
    end
    
    if fishSettings.Mutation then
        local mutation = data.Mutations[tostring(fishSettings.Mutation)]
        price = price * (mutation and mutation.PriceMultiply or 1)
    end
    
    if fishSettings.Stack then
        price = price * fishSettings.Stack
    end
    
    return math.ceil(price)
end

function UpdatePrice(item)
    _G.itemValue = item.Value
    _G.price = GetBackPackItemValue(_G.itemValue)
    if _G.price then
        CreatePrice(item.Parent, _G.price)
    end
end

function clearPriceLabels()
    for _, descendant in ipairs(game.Players.LocalPlayer.PlayerGui.hud.safezone:WaitForChild("backpack"):GetDescendants()) do
        if descendant:IsA("TextLabel") and descendant.Name == "STOP SKIDDING >:(" then
            descendant:Destroy()
        end
    end
end


_G.connections = {}
_G.running = false
var.AutoPriceCheck = false
function monitorBackpack()
    _G.running = true 

    _G.backpack = game.Players.LocalPlayer.PlayerGui.hud.safezone:WaitForChild("backpack")

    function processItem(descendant)
        if not _G.running then return end
        if descendant:IsA("ValueBase") and descendant.Name == "item" then
            _G.price = GetBackPackItemValue(descendant.Value)
            if _G.price and _G.price ~= 0 then
                CreatePrice(descendant.Parent, _G.price)
            end
        end
    end

    _G.descendantAddedConnection = _G.backpack.DescendantAdded:Connect(function(descendant)
        if not _G.running then return end
        task.defer(function()
            processItem(descendant)
        end)
    end)
    table.insert(_G.connections, _G.descendantAddedConnection)


    for _, descendant in ipairs(_G.backpack:GetDescendants()) do
        processItem(descendant)
        if descendant:IsA("ValueBase") and descendant.Name == "item" then
            _G.propertyChangedConnection = descendant:GetPropertyChangedSignal("Value"):Connect(function()
                if not _G.running then return end
                processItem(descendant)
            end)
            table.insert(_G.connections, _G.propertyChangedConnection)
        end
    end
end


function ChangePlayerCFrame(X, Y, Z)
    if variables.TweenMethod then
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") then
                for _, obj in pairs(model:GetDescendants()) do
                    if obj:IsA("Seat") then
                        obj.Disabled = true
                    end
                end
            end
        end

        local TargetTween = game:GetService("TweenService"):Create(
            LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
            TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
            {CFrame = CFrame.new(X, Y, Z) + CFrame.new(0, 5, 0)}
        )
        TargetTween:Play()
        TargetTween.Completed:Connect(function()
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") then
                    for _, obj in pairs(model:GetDescendants()) do
                        if obj:IsA("Seat") then
                            obj.Disabled = false
                        end
                    end
                end
            end
        end)
    elseif variables.TeleportMethod == true then
        LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(X, Y + 3, Z)
    end
end


function clickButton()
    if LocalPlayer.PlayerGui:FindFirstChild("shakeui") then
        if LocalPlayer.PlayerGui:FindFirstChild("shakeui"):WaitForChild("safezone",1) then
            if LocalPlayer.PlayerGui:FindFirstChild("shakeui"):WaitForChild("safezone",1):WaitForChild("button",1) then
                local buttonPosition = LocalPlayer.PlayerGui:WaitForChild("shakeui",1):WaitForChild("safezone",1):WaitForChild("button",1).AbsolutePosition
                local buttonSize = LocalPlayer.PlayerGui:WaitForChild("shakeui",1):WaitForChild("safezone",1):WaitForChild("button",1).AbsoluteSize

                VIM:SendMouseButtonEvent(
                    buttonPosition.X + buttonSize.X / 2,
                    buttonPosition.Y + buttonSize.Y / 2,
                    0,
                    true,
                    LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone"):FindFirstChild("button"),
                    1
                )

                VIM:SendMouseButtonEvent(
                    buttonPosition.X + buttonSize.X / 2,
                    buttonPosition.Y + buttonSize.Y / 2,
                    0,
                    false,
                    LocalPlayer.PlayerGui:FindFirstChild("shakeui"):FindFirstChild("safezone"):FindFirstChild("button"),
                    1
                )
            end
        end
    end
end


-- function click(button)
--     local buttonPosition = button.AbsolutePosition
--     local buttonSize = button.AbsoluteSize
--     VIM:SendMouseButtonEvent(
--         buttonPosition.X + buttonSize.X / 2,
--         buttonPosition.Y + buttonSize.Y / 2,
--         0,
--         true,
--         button,
--         1
--     )
--     VIM:SendMouseButtonEvent(
--         buttonPosition.X + buttonSize.X / 2,
--         buttonPosition.Y + buttonSize.Y / 2,
--         0,
--         false,
--         button,
--         1
--     )
-- end



local function brightFunc()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

local function getEquippedRod()
    return ReplicatedStorage.playerstats[tostring(LocalPlayer)].Stats.rod.Value
end

local function equipRod()
    local rodName = getEquippedRod()
    if rodName and not LocalPlayer.Character:FindFirstChild(rodName) then
        local rod = LocalPlayer.Backpack:FindFirstChild(rodName)
        if rod then rod.Parent = LocalPlayer.Character end
    end
end

local function determineBestBait()
    local bestBait = nil
    local bestValue = -math.huge

    if var.SelectedBait == "Most" or var.SelectedBait == "Least" then
        -- Handle "Most" and "Least"
        for _, baitName in ipairs(availableBaits) do
            local baitStat = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait:FindFirstChild("bait_" .. baitName)
            if baitStat then
                local baitValue = baitStat.Value
                if var.SelectedBait == "Most" then
                    if baitValue > bestValue then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                elseif var.SelectedBait == "Least" then
                    if baitValue < bestValue or bestValue == -math.huge then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                end
            end
        end
    else
        -- Handle other cases based on the selected bait property
        for _, baitName in ipairs(availableBaits) do
            if data.Bait[baitName] then
                local baitData = data.Bait[baitName]
                local baitValue = baitData[var.SelectedBait]
                if baitValue then
                    baitValue = tonumber(baitValue)
                    if baitValue and baitValue > bestValue then
                        bestValue = baitValue
                        bestBait = baitName
                    end
                end
            end
        end
    end

    -- Equip the best bait
    if bestBait then
        if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait.Value ~= bestBait then
            if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") then
                repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
            end
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            LocalPlayer.Backpack["Equipment Bag"].Parent = LocalPlayer.Character
            game:GetService("ReplicatedStorage").packages.Net["RE/Bait/Equip"]:FireServer(bestBait)
            LocalPlayer.Character["Equipment Bag"].Parent = LocalPlayer.Backpack
            -- Get the rarity of the best bait
            local baitData = data.Bait[bestBait]
            local baitRarity = baitData and baitData.Rarity or "Unknown"
            local baitLureSpeed = baitData and baitData.LureSpeed or "Unknown"
            local baitLuck = baitData and baitData.Luck or "Unknown"
            local baitGeneralLuck = baitData and baitData.GenerelLuck or "Unknown"
            local baitResilience = baitData and baitData.Resilience or "Unknown"

            -- Notify the player about the bait and its rarity
            lib:Notification("Auto Bait", "Equipped " .. bestBait, 5)
            

            -- Paragraph part.. very overkill, I know.
            local rarityColors = {
                Common = "<font color='rgb(142, 187, 191)'>Common</font>",
                Uncommon = "<font color='rgb(161, 255, 169)'>Uncommon</font>",
                Rare = "<font color='rgb(119, 108, 181)'>Rare</font>",
                Legendary = "<font color='rgb(240, 181, 109)'>Legendary</font>",
                Mythical = "<font color='rgb(255, 62, 120)'>Mythical</font>",
                Unusual = "<font color='rgb(192, 135, 198)'>Unusual</font>",
                Unknown = "<font color='rgb(255, 255, 255)'>Unknown</font>"
            }

            -- Function to determine the rich text color based on the value
            local function getValueColor(value)
                if value == "Unknown" then
                    return value -- If the value is unknown, return it as is
                elseif tonumber(value) then
                    local numValue = tonumber(value)
                    if numValue > 0 then
                        return "<font color='rgb(0, 255, 0)'>" .. value .. "</font>" -- Green for positive numbers
                    elseif numValue < 0 then
                        return "<font color='rgb(255, 0, 0)'>" .. value .. "</font>" -- Red for negative numbers
                    elseif numValue == 0 then
                        return "<font color='rgb(255, 255, 255)'>" .. value .. "</font>" -- White for 0
                    end
                end
                return value -- Return as is if it's not a number
            end

            -- Safely update the UI with rich text formatting
            pcall(function()
                local baitRarityColor = rarityColors[baitRarity] or rarityColors.Unknown
            
                -- Apply the rarity color to the best bait name
                local bestBaitColor = baitRarityColor:gsub("Common", bestBait)
                    :gsub("Uncommon", bestBait)
                    :gsub("Rare", bestBait)
                    :gsub("Legendary", bestBait)
                    :gsub("Mythical", bestBait)
                    :gsub("Unusual", bestBait)
                    :gsub("Unknown", bestBait)
            
                local baitLureSpeedColor = getValueColor(baitLureSpeed)
                local baitLuckColor = getValueColor(baitLuck)
                local baitGeneralLuckColor = getValueColor(baitGeneralLuck)
                local baitResilienceColor = getValueColor(baitResilience)
            
                var.BaitParagraph:SetTitle("Optimal Bait: " .. bestBaitColor)
                var.BaitParagraph:SetDesc("Lure Speed: " .. baitLureSpeedColor .. " | Luck: " .. baitLuckColor .. " | General Luck: " .. baitGeneralLuckColor .. " | Resilience: " .. baitResilienceColor)
            end)

        end
    else
        lib:Notification("Auto Bait", "No suitable baits found.", 5)
        var.AutoBaitToggle:Set(false)
    end
end


local function DestroyGhostItems()
    for i,v in pairs(LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("link") then
            if v.link.Value and v.link.Value:IsDescendantOf(game) then
                continue
            else
                v:Destroy()
            end
        end
    end
    for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("link") then
            if v.link.Value and v.link.Value:IsDescendantOf(game) then
                continue
            else
                v:Destroy()
            end
        end
    end
    for _, child in ipairs(LocalPlayer.PlayerGui.hud.safezone.backpack.inventory.scroll:GetChildren()) do
        local item = child:FindFirstChild("item")
        if item and item.Value == nil then
            child:Destroy()
        end
    end
end



local function formatPrice(price)
    return string.format("%s$", tostring(price):reverse():gsub("%d%d%d", "%0,"):reverse():gsub("^,", ""))
end

local function unformatPrice(formattedPrice)
    local cleanPrice = formattedPrice:gsub("[^0-9]", "")
    return tonumber(cleanPrice)
end

local function rgbToRichText(rgbString, text)
    -- Split the RGB string into individual components
    local r, g, b = rgbString:match("([^,]+),([^,]+),([^,]+)")
    r, g, b = tonumber(r), tonumber(g), tonumber(b)

    -- Return the text in rich text format with the specified RGB color
    return string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", r * 255, g * 255, b * 255, text)
end



local function gift(user, item)
    local checkFish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local inventoryItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[tostring(checkFish.link.Value)]

    if var.ExcludeFavourite then
        if inventoryItem:FindFirstChild("Favourited") then
        else
            pcall(function()
                local args = {
                    [1] = Players:WaitForChild(user)
                }
            
                LocalPlayer.Character[item].offer:FireServer(unpack(args))
            end)
        end
    else
        pcall(function()
            local args = {
                [1] = Players:WaitForChild(user)
            }
        
            LocalPlayer.Character[item].offer:FireServer(unpack(args))
        end)
    end
end    

local function validToolCheck()
    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    
    if tool and tool:FindFirstChild("offer") then
        return true
    else
        return false
    end
end

local function giftAll()
    for i, v in pairs(LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and v:FindFirstChild("offer") then
            v.Parent = LocalPlayer.Character
            gift(var.SelectedPlayer, v.Name) 
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            wait()
        end
    end
end

function formatNumber(number)
    return tostring(number):reverse():gsub("(%d%d%d)", "%1,"):gsub(",$", ""):reverse()
end

if RoleChecker() == "Free Version" or RoleChecker() == "No Role Assigned" then
    sections.Premium = tabs.Main:AddSection({Defualt = true , Locked = true})
    sections.Premium:AddParagraph({Title = '<font color="rgb(255,0,0)">Tired of the key system?</font>', Description = "Buy premium by joining our Discord."})
    sections.Premium:AddButton({
        Title = "Copy Discord Invite",
        Callback = function()
            setclipboard("https://discord.gg/lunor")
            lib:Notification("Discord","Copied invite to clipboard, just paste it.", 5)
        end,
    })
end
-- lib:Notification("Loading", "Stage 6", 5)
-- sections.Welcome:AddParagraph({Title = '<font color="#ea00ff" size="30">W</font><font color="#d500ff" size="30">e</font><font color="#c000ff" size="30">l</font><font color="#aa00fe" size="30">c</font><font color="#9600ff" size="30">o</font><font color="#8100ff" size="30">m</font><font color="#6c00ff" size="30">e</font><font color="#5700ff" size="30">!</font>', 
--                                Description = "Here's what's new:\n-\n-\n-"})

var.WelcomeParagraph:SetTitle(gradient("Welcome!"))
var.WelcomeParagraph:SetDesc([[<font color="rgb(255,255,255)">Here's what's new:</font>
[+] Brought back auto reel v1 & its settings due to popular demand
[+] Hide Caught (Visuals->FPS)
[/] Performance improvements
[/] Hide Inventory turned into "Dynamic Inventory"


<b><font color='rgb(255, 255, 255)'>----------------------------------------[Features]--------------------------------------</font></b>]])

--[+] Auto Passive
-- [+] Auto Favourite: Sparkling, Shiny, Big/Giant

var.eventTrackerToggle = sections.Welcome:AddToggle("EventTracker", {
    Title = "Event Tracker",
    Default = false,
    Description = "This will Send a webhook in Lunor for everyone to join on Events",
    Callback = function(isEnabled)
        var.eventTrackerAllow = isEnabled
        if var.eventTrackerAllow then
            if game:GetService("RobloxReplicatedStorage").GetServerType:InvokeServer() == "VIPServer" then
                lib:Notification("Event Tracker", "Thanks for trying to contribute but you're in a VIP server..", 8)
                var.eventTrackerToggle:Set(false)
            end
        end
    end
})

-- now dynamically gets hidden, refer to lunordependencies
sections.Welcome:AddToggle("HideInventory", {
    Title = "Dynamic Inventory",
    Default = true,
    Description = "This increases FPS by a lot.",
    Callback = function(isEnabled)
        var.HideInventoryUI = isEnabled

        pcall(function()
            local Players = game:GetService("Players")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local LocalPlayer = Players.LocalPlayer
            local inventory = LocalPlayer.PlayerGui.hud.safezone.backpack.inventory

            -- Store the connection so we can disconnect it later
            if var.connection then
                var.connection:Disconnect()
                var.connection = nil
            end

            if isEnabled then
                -- Function to handle the Visible property change
                local function onInventoryVisibilityChanged()
                    if inventory.Visible then
                        pcall(function()
                            ReplicatedStorage.playerstats.scroll.Parent = inventory
                        end)
                    else
                        pcall(function()
                            inventory.scroll.Parent = ReplicatedStorage.playerstats
                        end)
                    end
                end

                -- Connect to the Visible property change
                var.connection = inventory:GetPropertyChangedSignal("Visible"):Connect(onInventoryVisibilityChanged)

                -- Initial call to set the correct state
                onInventoryVisibilityChanged()
            else
                -- If the toggle is off, ensure the inventory is visible and the scroll is in the correct place
                pcall(function()
                    ReplicatedStorage.playerstats.scroll.Parent = inventory
                end)
            end
        end)
    end
})


sections.Welcome:AddToggle(
    "BloxstrapRPC",
    {
        Title = "Disable BloxStrap RPC",
        Default = false,
        Description = "Gives you a cool RPC if your using bloxstrap",
        Callback = function(isEnabled)
            if isEnabled then
                ClonedPrint('[BloxstrapRPC] {"command":"SetRichPresence","data":{"state":"by Fisching","largeImage":{"hoverText":"3itx Was Here!","assetId":113346078866256,"reset":true},"details":"'..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)..'","smallImage":{"reset":true},"timeStart":1738530972,"timeEnd":3477061945}}')
            else
                ClonedPrint('[BloxstrapRPC] {"command":"SetRichPresence","data":{"state":"discord.gg/Lunor","largeImage":{"hoverText":"3itx Was Here!","assetId":113346078866256},"details":"|| Fisch || Lunor ||","smallImage":{"clear":true},"timeStart":1738531370,"timeEnd":3477062741}}')
            end
        end
    }
)

-- lib:Notification("Loading", "Stage 7", 5)
var.FishPremiumParagraph = sections.FishPremium:AddParagraph({Title = 'Original Rod & Enchant:', Description = "Rod: Will update after 'Use Rod'\nEnchant: Will update after 'Use Enchant'"})

local rodNamesExploit = {}
for name, _ in pairs(data.Rods) do
    table.insert(rodNamesExploit, name)
end

sections.FishPremium:AddDropdown("RodsList", {
    Title = "Rods List",
    Description = "",
    Options = rodNamesExploit,
    Default = "",
    PlaceHolder = "Select Rod",
    Multiple = false,
    Callback = function(selectRod)
        var.selectedExploitRod = selectRod
    end,
})


sections.FishPremium:AddDropdown("EnchantsList", {
    Title = "Enchants List",
    Description = "",
    Options = {"Resilient", "Quality", "Mystical", "Controlled", "Wobbly", "Steady"},
    Default = "",
    PlaceHolder = "Select Enchant",
    Multiple = false,
    Callback = function(selectEnchant)
        var.selectedExploitEnchant = selectEnchant
    end,
})


local exploitGroupButton = sections.FishPremium:AddGroupButton()

exploitGroupButton:AddButton({
    Title = "Use Original",
    Variant = "Outline",
    Callback = function()
        if var.realRod ~= nil then
            if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(var.latestRod) then
                game:GetService("Players").LocalPlayer.Backpack[var.latestRod].Name = var.realRod
            else
                game:GetService("Players").LocalPlayer.Character[var.latestRod].Name = var.realRod
            end
        end
        if var.realEnchant ~= nil then
            game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[var.lastKnownRod or getEquippedRod()].Value = var.realEnchant
        end
    end
})

exploitGroupButton:AddButton({
    Title = "Use Rod",
    Variant = "Primary",
    Callback = function()
        if var.realRod == nil then
            var.realRod = tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Stats.rod.Value)
        end
        var.lastKnownRod = tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Stats.rod.Value)
        game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Stats.rod.Value = var.selectedExploitRod
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(var.lastKnownRod) then
            game:GetService("Players").LocalPlayer.Backpack[var.lastKnownRod].Name = var.selectedExploitRod
            var.latestRod = var.selectedExploitRod
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(var.lastKnownRod) then
            game:GetService("Players").LocalPlayer.Character[var.lastKnownRod].Name = var.selectedExploitRod
            var.latestRod = var.selectedExploitRod
        end
        var.FishPremiumParagraph:SetDesc(
            "Rod: " .. (var.realRod or "Will update after 'Use Rod'") .. 
            "\nEnchant: " .. (var.realEnchant or "Will update after 'Use Enchant'")
        )
    end,
})

exploitGroupButton:AddButton({
    Title = "Use Enchant",
    Variant = "Primary",
    Callback = function()
        print(var.lastKnownRod)
        print(tostring(var.latestRod))
        print(tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Stats.rod.Value))
        local currentRod = var.latestRod or tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Stats.rod.Value)
        if var.realEnchant == nil then
            if var.lastKnownRod ~= nil then
                var.realEnchant = tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[var.lastKnownRod].Value)
            else
                var.realEnchant = tostring(game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[currentRod].Value)
            end
        end
        if var.lastKnownRod ~= nil then
            if game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods:FindFirstChild(var.lastKnownRod) then
                game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[var.lastKnownRod].Value = var.selectedExploitEnchant
            else
                game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[var.latestRod].Value = var.selectedExploitEnchant
            end
        else
            game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods[currentRod].Value = var.selectedExploitEnchant
        end
        var.FishPremiumParagraph:SetDesc(
            "Rod: " .. (var.realRod or "Will update after 'Use Rod'") .. 
            "\nEnchant: " .. (var.realEnchant or "Will update after 'Use Enchant'")
        )
    end,
})


sections.Fish:AddToggle("AutoEquipRod", {
    Title = "Auto Equip Rod",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.AutoEquipRod = isEnabled
        
        spawn(function()
            while variables.AutoEquipRod do
                if not var.TotemInUse and not submittingAnglerQuest then
                    equipRod()
                end
                task.wait(0.1)
            end
        end)
    end)
})


variables.Caster = sections.Fish:AddToggle("Auto Cast", {
    Title = "Auto Cast",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.AutoCast = isEnabled

        spawn(function()
            local failCount = 0

            while variables.AutoCast do
                local character = LocalPlayer.Character
                if character then
                    local equippedRod = character:FindFirstChild(getEquippedRod())
                    if equippedRod and game:GetService("Players").LocalPlayer.PlayerGui.Cutscene.Top.Position == UDim2.new(0.5, 0, -2, 0) then
                        local bobber = equippedRod:FindFirstChild("bobber")
                        if not bobber and not var.TotemInUse and not submittingAnglerQuest then
                            equippedRod.events.cast:FireServer(variables.autoCastPower, 1)
                            task.wait(variables.AutoCastDelay)
                            failCount = failCount + 1
                            if failCount >= 10 then
                                local humanoid = character:FindFirstChildOfClass("Humanoid")
                                if humanoid then
                                    humanoid:UnequipTools()
                                end
                                failCount = 0
                            end
                        else
                            failCount = 0
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end)
})


-- variables.Caster = sections.Fish:AddToggle("AutoCast", {
--     Title = "Auto Cast",
--     Default = false,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         variables.AutoCast = isEnabled

--         spawn(function()
--             while variables.AutoCast do
--                 local character = LocalPlayer.Character
--                 if character then
--                     local equippedRod = character:FindFirstChild(getEquippedRod())
--                     if equippedRod and game:GetService("Players").LocalPlayer.PlayerGui.Cutscene.Top.Position == UDim2.new(0.5, 0, -2, 0) then
--                         local bobber = equippedRod:FindFirstChild("bobber")
--                         if not bobber and not var.TotemInUse and not submittingAnglerQuest then
--                             equippedRod.events.cast:FireServer(variables.autoCastPower, 1)
--                             task.wait(variables.AutoCastDelay)
--                         end
--                     end
--                 end
--                 task.wait(0.1)
--             end
--         end)
--     end)
-- })



local connection

sections.Fish:AddToggle("AutoShake", {
    Title = "Auto Shake",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.AutoShake = isEnabled
        local renderConnection
        
        if variables.AutoShake then
            lib:Notification("Auto Shake", "Adjust the speed to your liking in the settings.", 4)
            
            renderConnection = RunService.PreRender:Connect(function()
                GuiService.SelectedObject = nil
            end)
        end
        
        while variables.AutoShake do
            task.wait(variables.AutoShakeDelay)
            
            local success = pcall(function()
                if not LocalPlayer.PlayerGui:FindFirstChild("shakeui") then return end
                
                if variables.ShakeMethod == "Navigation" then
                    local button = LocalPlayer.PlayerGui:WaitForChild("shakeui", 1):WaitForChild("safezone", 1):WaitForChild("button", 1)

                    if button then
                        button.Selectable = true
                        GuiService.SelectedObject = button
                        
                        if GuiService.SelectedObject == button then
                            VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                            VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                        end
                    end
                elseif variables.ShakeMethod == "Click" then
                    pcall(function()
                        local VirtualUser =  game:GetService("VirtualUser")
                        local button = LocalPlayer.PlayerGui:WaitForChild("shakeui", 1):WaitForChild("safezone", 1):WaitForChild("button", 1)
                        if not button then return end
                        button.Size = UDim2.new(1001, 0, 1001, 0)
                        VirtualUser:Button1Down(Vector2.new(1, 1))
                        VirtualUser:Button1Up(Vector2.new(1, 1))
                    end)
                elseif variables.ShakeMethod == "ReplicateSignal" then
                    if not LocalPlayer:FindFirstChild("PlayerGui") or not LocalPlayer.PlayerGui:FindFirstChild("shakeui") then return end
                       local button = LocalPlayer.PlayerGui:WaitForChild("shakeui", 1)
                            :WaitForChild("safezone", 1)
                            :WaitForChild("button", 1)
                        if button then
                            replicatesignal(button.MouseButton1Click)
                        end
                end
            end)
        end
        
        if renderConnection then
            renderConnection:Disconnect()
            GuiService.SelectedObject = nil
        end
    end)
})

sections.Fish:AddToggle("AutoDropper", {
   Title = "Auto Drop Bobber",
   Default = false,
   Description = "",
   Callback = LPH_JIT_MAX(function(isEnabled)
       variables.AutoDrop = isEnabled
       variables.CurrentRod = PlayerStats.rod.Value

       if variables.autoDropConnection then
           variables.autoDropConnection:Disconnect()
       end

       if isEnabled then
           local function setupRodConnection()
               local rod = character:WaitForChild(variables.CurrentRod)
               
               variables.autoDropConnection = rod.ChildAdded:Connect(function(child)
                   if child.Name == "bobber" then
                       local function tpToWater()
                           if LocalPlayer.PlayerGui:FindFirstChild("reel") then return end
                           
                           local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                           local rayOrigin = Vector3.new(humanoidRootPart.Position.X, humanoidRootPart.Position.Y + 100, humanoidRootPart.Position.Z)
                           local rayDirection = Vector3.new(0, -200, 0)

                           local raycastParams = RaycastParams.new()
                           raycastParams.FilterDescendantsInstances = {workspace.Terrain}
                           raycastParams.FilterType = Enum.RaycastFilterType.Whitelist

                           local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                           if rayResult and rayResult.Material == Enum.Material.Water then
                               child.CFrame = CFrame.new(rayResult.Position)
                           end

                           if not LocalPlayer.PlayerGui:FindFirstChild("reel") then
                               task.wait()
                               tpToWater()
                           end
                       end

                       tpToWater()
                   end
               end)
           end

           setupRodConnection()

           variables.rodChangedConnection = PlayerStats.rod:GetPropertyChangedSignal("Value"):Connect(function()
               if variables.autoDropConnection then
                   variables.autoDropConnection:Disconnect()
               end
               
               variables.CurrentRod = PlayerStats.rod.Value
               setupRodConnection()
           end)
       else
           if variables.autoDropConnection then
               variables.autoDropConnection:Disconnect()
           end
           
           if variables.rodChangedConnection then
               variables.rodChangedConnection:Disconnect()
           end
       end
   end)
})

local function generateRandomNumber(min, max)
    return math.random() * (max - min) + min
end



PassiveHelper = {}
local currentCoroutine = nil
local reeling = false  -- Debounce flag

local function matchesRarity(fishRarity, triggerRarity)
    if type(triggerRarity) == "table" then
        for _, rarity in ipairs(triggerRarity) do
            if fishRarity == rarity then
                return true
            end
        end
        return false
    else
        return fishRarity == triggerRarity
    end
end


sections.Fish:AddToggle("AutoCatch", {
    Title = "Auto Reel",
    Default = false,
    IgnoreFirst = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.AutoCatch = isEnabled

        if not isEnabled then
            variables.AutoCatch = false
            if currentCoroutine then
                coroutine.close(currentCoroutine)
                currentCoroutine = nil
            end
            return
        end

        if LocalPlayer.PlayerGui:FindFirstChild("reel") then
            reel()
        end

        variables.AlreadyRequested = false
        
        currentCoroutine = coroutine.create(function()
            while variables.AutoCatch do
                if variables.ReelMethod3 then
                    local connection
                    if var.QuickCatch then
                        connection = game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
                            if child.Name == "reel" then
                                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                            end
                        end)
                    end
                    
                    reel()
                    task.wait(0.1)
                    print("yep")
                    
                    if not variables.AutoCatch or not variables.ReelMethod3 then 
                        if connection then
                            connection:Disconnect()
                        end
                        break
                    end
                else
                    task.wait()

                    local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                    if not (reelGui and reelGui.Enabled) then
                        continue
                    end
                    print("loopping wait")
                    repeat 
                        task.wait() 
                        local fishObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
                        if not fishObj or not fishObj:FindFirstChild("bar") or not fishObj.bar:FindFirstChild("fish") then
                            warn("Reel bar disappeared! Breaking loop.")
                            break
                        end
                    until fishObj.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
                    
                    print("completed wait")
                    local bar = reelGui:FindFirstChild("bar")
                    local playerBar = bar and bar:FindFirstChild("playerbar")
                    local fish = bar and bar:FindFirstChild("fish")
                    if not bar or not playerBar or not fish then
                        continue
                    end
                    print("2nd wait done")

                    if variables.ReelMethod1 then
                        print("wait for bar")
    
                        local bar = playerBar
                        if not bar then
                            warn("Bar not found! Exiting early.")
                            return
                        end
                    
                        local barRemovedConnection
                        barRemovedConnection = bar:GetPropertyChangedSignal("Parent"):Connect(function()
                            if not bar.Parent then
                                warn("Reel bar disappeared! Breaking wait.")
                                barRemovedConnection:Disconnect()
                            end
                        end)
                    
                        bar:GetPropertyChangedSignal("AbsolutePosition"):Wait()
                        
                        if barRemovedConnection then
                            barRemovedConnection:Disconnect()
                        end
                        
                        print("dtc")


                        local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
                        if autoPassive and var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
                            print("yep")
                            if PassiveHelper.ROTFF < 3 then
                                print("first")
                                reel()
                                PassiveHelper.ROTFF += 1
                                print("done " .. PassiveHelper.ROTFF)
                                repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                continue
                            elseif matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                                print("2")
                                reel()
                                PassiveHelper.ROTFF = 0
                                repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                continue
                            elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                                print("3")
                                reel()
                                PassiveHelper.ROTFF = 0
                                repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                continue
                            else
                                print("4")
                                reel(generateRandomNumber(-0.05, 0.1), false)
                                repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                continue
                            end
                        else
                            AutoPassive:Set(false)
                        end

                        print("ROTEK MODEEE..")
                        -- Auto ROTEK
                        if autoPassive and var.selectedPassive == 'ROTEK' and getEquippedRod() == 'Rod Of The Eternal King' then
                        print("ROTEK active")
                        if matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                            print("2")
                            reel(generateRandomNumber(-0.05, 0.1), false)
                            -- PassiveHelper.ROTFF = 0
                            repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                            continue
                        elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                            print("3")
                            reel(generateRandomNumber(-0.05, 0.1), false)
                            -- PassiveHelper.ROTFF = 0
                            repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                            continue
                        else
                            print("4")
                            reel()
                            repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                            continue
                        end
                    else
                        AutoPassive:Set(false)
                    end

                    print("shouldnt be here")
                    if variables.snapChance and math.random(1, 100) <= variables.snapChance then
                        if var.ignoreSnapRarities ~= nil then
                            if type(var.ignoreSnapRarities) ~= "table" then
                                var.ignoreSnapRarities = {}
                            end
                            local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
                            for _, rarity in ipairs(var.ignoreSnapRarities) do
                                if data.Fish[fishValueObj.Value].Rarity == rarity then
                                    reel()
                                    if var.QuickCatch then
                                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                    end
                                end
                            end
                        end
                        
                        print("snap reel")
                        reel(generateRandomNumber(-0.05, 0.1), false)
                        print("snap reel done")
                        if var.QuickCatch then
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        end
                    else
                        print("perf catch")
                        reel()
                        print('perf catch done')
                        if var.QuickCatch then
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        end
                    end

                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                    elseif variables.ReelMethod2 then
                        repeat
                            task.wait()
                            local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                            local bar = reelGui and reelGui:FindFirstChild("bar")
                            local playerBar = bar and bar:FindFirstChild("playerbar")
                            local fish = bar and bar:FindFirstChild("fish")
                            
                            if playerBar and fish then
                                playerBar.Position = fish.Position
                            else
                                break
                            end
                        until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                    end
                end
            end
        end)
        
        coroutine.resume(currentCoroutine)
    end)
})




local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
local autoReelEnabled = false
local reelConnection

local function onReelChildAdded(child)
    if child.Name ~= "reel" then return end

    coroutine.wrap(function()
        local reelGui = playerGui:WaitForChild("reel", 1)
        if not reelGui then return end

        local barContainer = reelGui:WaitForChild("bar", 1)
        if not barContainer then return end

        local reelContainer = barContainer:WaitForChild("reel", 1)
        if not reelContainer then return end

        local fishValueObj = reelContainer:WaitForChild("fish", 1)
        if not fishValueObj then return end

        local bar = child:WaitForChild("bar", 9e9)
        if not bar or not autoReelEnabled then return end

        local playerBar = bar:WaitForChild("playerbar", 9e9)
        if not playerBar or not autoReelEnabled then return end


        task.wait(.75)
        if not autoReelEnabled then return end

        local normalReel = true

        if variables and variables.snapChance and variables.snapChance > 0 then
            if math.random(1, 100) <= variables.snapChance then
                normalReel = false
                local ignoreSnapRarities = {}
                if var.ignoreSnapRarities then
                    for _, rarity in ipairs(var.ignoreSnapRarities) do
                        ignoreSnapRarities[rarity] = true
                    end
                end

                local fishData = data and data.Fish and data.Fish[fishValueObj.Value]
                if fishData and ignoreSnapRarities[fishData.Rarity] then
                    normalReel = true
                else
                    print("Snap reel")
                    reel(generateRandomNumber(-0.05, 0.1), false)
                    print("Snap reel done")
                end
            end
        end

        if normalReel then
            local currentRod = getEquippedRod()
            reel()
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end

            local netRodEquip = game:GetService("ReplicatedStorage")
                :WaitForChild("packages")
                :WaitForChild("Net")
                :WaitForChild("RE/Rod/Equip")
            netRodEquip:FireServer(currentRod)

            local hum = player.Character and (player.Character:FindFirstChildOfClass("Humanoid") or player.Character:FindFirstChildOfClass("AnimationController"))
            if hum then
                for _, animTrack in ipairs(hum:GetPlayingAnimationTracks()) do
                    if animTrack.Animation.AnimationId == "rbxassetid://121544683887361" then
                        animTrack.TimePosition = 0.9 * animTrack.Length
                    elseif animTrack.Animation.AnimationId == "rbxassetid://113972107465696" then
                        animTrack:Stop()
                    end
                end
            end

            if reelGui then
                reelGui:Destroy()
            end
        end

        if var.QuickCatch then
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:UnequipTools()
            end
        end
    end)()
end



local reelConnection
local reelConnection2
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

sections.Fish:AddToggle("AutoCatchV2", {
    Title = "Auto Reel V2",
    Default = false,
    IgnoreFirst = true,
    Description = "Support Instant Mode and Super Mode with Snap & Quick Cast",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoReelEnabled = isEnabled

        if isEnabled then
            -- Check if "reel" exists and perform initial reel action if true
            if LocalPlayer.PlayerGui:FindFirstChild("reel") then
                reel()
            end

            -- Instant Mode logic
            if var.ReelMethod == "Instant" then
                reelConnection = player.PlayerGui.ChildAdded:Connect(function(child)
                    coroutine.wrap(function()
                        if child.Name == "reel" and var.autoReelEnabled then
                            local Character = player.Character
                            Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
                            local reelGui = player.PlayerGui:WaitForChild("reel", 2)
                            local barContainer = reelGui and reelGui:WaitForChild("bar", 2)
                            local reelContainer = barContainer and barContainer:WaitForChild("reel", 2)
                            local fishValueObj = reelContainer and reelContainer:WaitForChild("fish", 2)
                            local bar = child:WaitForChild("bar", 9e9)
                            if not bar then return end
                            local playerBar = bar:WaitForChild("playerbar", 9e9)
                            if not playerBar then return end
                            playerBar:GetPropertyChangedSignal("Position"):Wait()
                            if var.autoReelEnabled then
                                local normalReel = true

                                -- Your ROTFF logic goes here
                                if autoPassive and var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
                                    print("yep")
                                    if PassiveHelper.ROTFF < 3 then
                                        print("first")
                                        reel()
                                        PassiveHelper.ROTFF += 1
                                        print("done " .. PassiveHelper.ROTFF)
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    elseif matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                                        print("2")
                                        reel()
                                        PassiveHelper.ROTFF = 0
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                                        print("3")
                                        reel()
                                        PassiveHelper.ROTFF = 0
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    else
                                        print("4")
                                        reel(generateRandomNumber(-0.05, 0.1), false)
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    end
                                -- Your ROTEK logic goes here
                                elseif autoPassive and var.selectedPassive == 'ROTEK' and getEquippedRod() == 'Rod Of The Eternal King' then
                                    print("ROTEK active")
                                    if matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                                        print("2")
                                        reel(generateRandomNumber(-0.05, 0.1), false)
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                                        print("3")
                                        reel(generateRandomNumber(-0.05, 0.1), false)
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    else
                                        print("4")
                                        reel()
                                        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                        return
                                    end
                                else

                                    if variables and variables.snapChance and variables.snapChance > 0 then
                                        if math.random(1, 100) <= variables.snapChance then
                                            normalReel = false
                                            local ignoreSnapRarities = {}
                                            if var.ignoreSnapRarities then
                                                for _, rarity in ipairs(var.ignoreSnapRarities) do
                                                    ignoreSnapRarities[rarity] = true
                                                end
                                            end
                                            local fishData = data and data.Fish and data.Fish[fishValueObj.Value]
                                            if fishData and ignoreSnapRarities[fishData.Rarity] then
                                                normalReel = true
                                            else
                                                print("Snap reel")
                                                reel(generateRandomNumber(-0.05, 0.1), false)
                                                print("Snap reel done")
                                            end
                                        end
                                    end
                                    
                                    -- Default reel logic for "Instant" mode
                                    reel()
                                end
                                if var.QuickCatch then
                                    Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                end
                            end
                        end
                    end)()
                end)

            -- Super Mode logic
            elseif var.ReelMethod == "SuperMode" then
                local function onReelingChanged(character)
                    local function checkReeling()
                        if not var.autoReelEnabled then return end
                        if character:GetAttribute("Reeling") == false then
                            character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
                            local reelGui = player.PlayerGui:FindFirstChild("reel")
                            local barContainer = reelGui and reelGui:FindFirstChild("bar")
                            local reelContainer = barContainer and barContainer:FindFirstChild("reel")
                            local fishValueObj = reelContainer and reelContainer:FindFirstChild("fish")

                            local normalReel = true
                            if variables.snapChance and math.random(1, 100) <= variables.snapChance then
                                local fishData = fishValueObj and data.Fish[fishValueObj.Value]
                                if not (fishData and var.ignoreSnapRarities and var.ignoreSnapRarities[fishData.Rarity]) then
                                    normalReel = false
                                    reel(generateRandomNumber(-0.05, 0.1), false)
                                end
                            end

                            -- Your ROTFF & ROTEK logic goes here for SuperMode
                            if autoPassive and var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
                                print("yep")
                                if PassiveHelper.ROTFF < 3 then
                                    print("first")
                                    reel()
                                    PassiveHelper.ROTFF += 1
                                    print("done " .. PassiveHelper.ROTFF)
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                elseif matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                                    print("2")
                                    reel()
                                    PassiveHelper.ROTFF = 0
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                                    print("3")
                                    reel()
                                    PassiveHelper.ROTFF = 0
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                else
                                    print("4")
                                    reel(generateRandomNumber(-0.05, 0.1), false)
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                end
                            elseif autoPassive and var.selectedPassive == 'ROTEK' and getEquippedRod() == 'Rod Of The Eternal King' then
                                print("ROTEK active")
                                if matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
                                    print("2")
                                    reel(generateRandomNumber(-0.05, 0.1), false)
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
                                    print("3")
                                    reel(generateRandomNumber(-0.05, 0.1), false)
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
                                    return
                                else
                                    print("4")
                                    reel()
                                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel") 
                                    return
                                end
                            else

                                if variables and variables.snapChance and variables.snapChance > 0 then
                                    if math.random(1, 100) <= variables.snapChance then
                                        normalReel = false
                                        local ignoreSnapRarities = {}
                                        if var.ignoreSnapRarities then
                                            for _, rarity in ipairs(var.ignoreSnapRarities) do
                                                ignoreSnapRarities[rarity] = true
                                            end
                                        end
                                        local fishData = data and data.Fish and data.Fish[fishValueObj.Value]
                                        if fishData and ignoreSnapRarities[fishData.Rarity] then
                                            normalReel = true
                                        else
                                            print("Snap reel")
                                            reel(generateRandomNumber(-0.05, 0.1), false)
                                            print("Snap reel done")
                                        end
                                    end
                                end

                                
                                -- Default reel logic for "SuperMode"
                                reel()
                            end

                            if var.QuickCatch then
                                player.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                            end
                        end
                    end

                    character:GetAttributeChangedSignal("Reeling"):Connect(checkReeling)
                    checkReeling()
                end

                local function handleCharacter(character)
                    if character and var.autoReelEnabled then
                        onReelingChanged(character)
                    end
                end

                if not reelConnection2 then
                    reelConnection2 = player.CharacterAdded:Connect(handleCharacter)
                end

                if player.Character then
                    handleCharacter(player.Character)
                end
            -- end
            -- Follow Bar logic
            elseif var.ReelMethod == "Follow Bar" then
                reelConnection = player.PlayerGui.ChildAdded:Connect(function(child)
                    coroutine.wrap(function()
                        if child.Name == "reel" and var.autoReelEnabled then
                            local Character = player.Character
                            if Character then
                                local Humanoid = Character:FindFirstChildOfClass('Humanoid')
                                if Humanoid then
                                    Humanoid.WalkSpeed = 16
                                end
                            end

                            local reelGui = player.PlayerGui:WaitForChild("reel", 2)
                            local bar = reelGui:WaitForChild("bar", 2)
                            local playerBar = bar and bar:WaitForChild("playerbar", 2)
                            local fish = bar and bar:WaitForChild("fish", 2)

                            local function followFish()
                                playerBar.Position = fish.Position
                            end

                            local function movePlayerBarAway()
                                local parentBarWidth = bar.AbsoluteSize.X -- Width of the parent bar in pixels
                                local fishScale = fish.Position.X.Scale -- Fish position in scale (0-1)
                                local fishWidthScale = fish.AbsoluteSize.X / parentBarWidth -- Fish width in scale
                                local playerBarWidthScale = playerBar.AbsoluteSize.X / parentBarWidth -- PlayerBar width in scale
                                local moveDistance = fishWidthScale + playerBarWidthScale
                                local newXScale = fishScale + moveDistance
                                if newXScale > 1 then
                                    newXScale = 1 - playerBarWidthScale
                                end
                            
                                -- Move the playerBar
                                playerBar.Position = UDim2.new(newXScale, 0, fish.Position.Y.Scale, 0)
                            end

                            
                            if var.PerfectCatch then
                                repeat
                                    followFish()
                                    task.wait()
                                until not reelGui.Parent or not bar.Parent or not playerBar.Parent or not fish.Parent
                            else
                                -- Wait for playerBar's Position to change
                                playerBar:GetPropertyChangedSignal("Position"):Wait()
            
                                -- Store the old size
                                local OldPlayerSize = playerBar.Size
                                print("Old Size:", OldPlayerSize)
            
                                playerBar.Size = UDim2.new(0.2, 0, 1.3, 0)
                                print("New Size:", playerBar.Size)
                                task.wait()
                                movePlayerBarAway()
                                task.wait(0.1)
                                playerBar.Size = OldPlayerSize
                                print("Restored Size:", playerBar.Size)
                                repeat
                                    followFish()
                                    task.wait()
                                until not reelGui.Parent or not bar.Parent or not playerBar.Parent or not fish.Parent
                            end
                        end
                    end)()
                end)
            end
        else
            var.autoReelEnabled = false

            if reelConnection then
                reelConnection:Disconnect()
                reelConnection = nil
            end
            if reelConnection2 then
                reelConnection2:Disconnect()
                reelConnection2 = nil
            end
        end
    end)
})



-- local reelConnection
-- local reelConnection2
-- local Players = game:GetService("Players")
-- local player = Players.LocalPlayer
-- local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- sections.Fish:AddToggle("AutoCatchV2", {
--     Title = "Auto Reel V2",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "Support Instant Mode and Super Mode with Snap & Quick Cast",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         var.autoReelEnabled = isEnabled

--         if isEnabled then
--             if player.PlayerGui:FindFirstChild("reel") then
--                 reel()
--             end

--             if var.ReelMethod == "Instant" then
--                 reelConnection = player.PlayerGui.ChildAdded:Connect(function(child)
--                     coroutine.wrap(function()
--                         if child.Name == "reel" and var.autoReelEnabled then
--                             local Character = player.Character
--                             Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
                            
--                             local reelGui = player.PlayerGui:WaitForChild("reel", 2)
--                             local barContainer = reelGui and reelGui:WaitForChild("bar", 2)
--                             local reelContainer = barContainer and barContainer:WaitForChild("reel", 2)
--                             local fishValueObj = reelContainer and reelContainer:WaitForChild("fish", 2)

--                             local bar = child:WaitForChild("bar", 9e9)
--                             if not bar then return end
--                             local playerBar = bar:WaitForChild("playerbar", 9e9)
--                             if not playerBar then return end

--                             playerBar:GetPropertyChangedSignal("Position"):Wait()

                            
--                             if variables and variables.snapChance and variables.snapChance > 0 then
--                                 if math.random(1, 100) <= variables.snapChance then
--                                     normalReel = false
--                                     local ignoreSnapRarities = {}
--                                     if var.ignoreSnapRarities then
--                                         for _, rarity in ipairs(var.ignoreSnapRarities) do
--                                             ignoreSnapRarities[rarity] = true
--                                         end
--                                     end
                                
--                                     local fishData = data and data.Fish and data.Fish[fishValueObj.Value]
--                                     if fishData and ignoreSnapRarities[fishData.Rarity] then
--                                         normalReel = true
--                                     else
--                                         print("Snap reel")
--                                         reel(generateRandomNumber(-0.05, 0.1), false)
--                                         print("Snap reel done")
--                                     end
--                                 end
--                             end
                            
--                             if var.autoReelEnabled then
--                                 local normalReel = true
--                                 reel()
--                             end
--                         end
--                     end)()
--                 end)
--             elseif var.ReelMethod == "SuperMode" then
--                 local function onReelingChanged(character)
--                     local function checkReeling()
--                         if not var.autoReelEnabled then return end
--                         if character:GetAttribute("Reeling") == false then
--                             character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
--                             reel()
--                         end
--                     end

--                     character:GetAttributeChangedSignal("Reeling"):Connect(checkReeling)
--                     checkReeling()
--                 end

--                 local function handleCharacter(character)
--                     if character and var.autoReelEnabled then
--                         onReelingChanged(character)
--                     end
--                 end

--                 if not reelConnection2 then
--                     reelConnection2 = player.CharacterAdded:Connect(handleCharacter)
--                 end

--                 if player.Character then
--                     handleCharacter(player.Character)
--                 end
--             elseif var.ReelMethod == "Follow Bar" then
--                 reelConnection = player.PlayerGui.ChildAdded:Connect(function(child)
--                     coroutine.wrap(function()
--                         if child.Name == "reel" and var.autoReelEnabled then
--                             local Character = player.Character
--                             if Character then
--                                 local Humanoid = Character:FindFirstChildOfClass('Humanoid')
--                                 if Humanoid then
--                                     Humanoid.WalkSpeed = 16
--                                 end
--                             end

--                             local reelGui = player.PlayerGui:WaitForChild("reel", 2)
--                             local bar = reelGui:WaitForChild("bar", 2)
--                             local playerBar = bar and bar:WaitForChild("playerbar", 2)
--                             local fish = bar and bar:WaitForChild("fish", 2)

--                             local function followFish()
--                                 playerBar.Position = fish.Position
--                             end

--                             local function movePlayerBarAway()
--                                 local parentBarWidth = bar.AbsoluteSize.X -- Width of the parent bar in pixels
--                                 local fishScale = fish.Position.X.Scale -- Fish position in scale (0-1)
--                                 local fishWidthScale = fish.AbsoluteSize.X / parentBarWidth -- Fish width in scale
--                                 local playerBarWidthScale = playerBar.AbsoluteSize.X / parentBarWidth -- PlayerBar width in scale
--                                 local moveDistance = fishWidthScale + playerBarWidthScale
--                                 local newXScale = fishScale + moveDistance
--                                 if newXScale > 1 then
--                                     newXScale = 1 - playerBarWidthScale
--                                 end
                            
--                                 -- Move the playerBar
--                                 playerBar.Position = UDim2.new(newXScale, 0, fish.Position.Y.Scale, 0)
--                             end

                            
--                             if var.PerfectCatch then
--                                 repeat
--                                     followFish()
--                                     task.wait()
--                                 until not reelGui.Parent or not bar.Parent or not playerBar.Parent or not fish.Parent
--                             else
--                                 -- Wait for playerBar's Position to change
--                                 playerBar:GetPropertyChangedSignal("Position"):Wait()
            
--                                 -- Store the old size
--                                 local OldPlayerSize = playerBar.Size
--                                 print("Old Size:", OldPlayerSize)
            
--                                 playerBar.Size = UDim2.new(0.2, 0, 1.3, 0)
--                                 print("New Size:", playerBar.Size)
--                                 task.wait()
--                                 movePlayerBarAway()
--                                 task.wait(0.1)
--                                 playerBar.Size = OldPlayerSize
--                                 print("Restored Size:", playerBar.Size)
--                                 repeat
--                                     followFish()
--                                     task.wait()
--                                 until not reelGui.Parent or not bar.Parent or not playerBar.Parent or not fish.Parent
--                             end
--                         end
--                     end)()
--                 end)
--             end
--         else
--             var.autoReelEnabled = false

--             if reelConnection then
--                 reelConnection:Disconnect()
--                 reelConnection = nil
--             end
--             if reelConnection2 then
--                 reelConnection2:Disconnect()
--                 reelConnection2 = nil
--             end
--         end
--     end)
-- })


sections.Fish:AddToggle("InstantReel", {
    Title = "Instant Reel",
    Default = false,
    IgnoreFirst = true,
    Description = "It completely a different reel",
    Callback = LPH_JIT_MAX(function(isEnabled)
        autoReelEnabled = isEnabled
        if isEnabled then
            lib:Notification("Instant Reel", "Adjust auto cast delay in Auto Fish Settings for quicker.", 5)
            reelConnection = playerGui.ChildAdded:Connect(onReelChildAdded)
        else
            if reelConnection then
                reelConnection:Disconnect()
                reelConnection = nil
            end
        end
    end)
})







-- sections.Fish:AddToggle("AutoCatchV2", {
--     Title = "Auto Reel V2",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "Support Instant Mode and Super Mode with Snap & Quick Cast",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         var.autoReelEnabled = isEnabled

--         if isEnabled then
--             if LocalPlayer.PlayerGui:FindFirstChild("reel") then
--                 reel()
--             end

--             if var.ReelMethod == "Instant" then
--                 reelConnection = player.PlayerGui.ChildAdded:Connect(function(child)
--                     coroutine.wrap(function()
--                         if child.Name == "reel" and var.autoReelEnabled then
--                             local Character = player.Character
--                             Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
--                             local reelGui = player.PlayerGui:WaitForChild("reel", 2)
--                             local barContainer = reelGui and reelGui:WaitForChild("bar", 2)
--                             local reelContainer = barContainer and barContainer:WaitForChild("reel", 2)
--                             local fishValueObj = reelContainer and reelContainer:WaitForChild("fish", 2)
--                             local bar = child:WaitForChild("bar", 9e9)
--                             if not bar then return end
--                             local playerBar = bar:WaitForChild("playerbar", 9e9)
--                             if not playerBar then return end
--                             playerBar:GetPropertyChangedSignal("Position"):Wait()
--                             if var.autoReelEnabled then
--                                 local normalReel = true

                                
--                                 if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                                     normalReel = false
--                                     local fishData = fishValueObj and data.Fish[fishValueObj.Value]
--                                     if not (fishData and var.ignoreSnapRarities and var.ignoreSnapRarities[fishData.Rarity]) then
--                                         reel(generateRandomNumber(-0.05, 0.1), false)
--                                     else
--                                         normalReel = true
--                                     end
--                                 end
--                                 if normalReel then
--                                     reel()
--                                 end
--                                 if var.QuickCatch then
--                                     Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                             end
--                         end
--                     end)()
--                 end)
--         elseif var.ReelMethod == "SuperMode" then
--             local function onReelingChanged(character)
--                 local function checkReeling()
--                     if not var.autoReelEnabled then return end
--                     if character:GetAttribute("Reeling") == false then
--                         character:FindFirstChildOfClass('Humanoid').WalkSpeed = 16
--                         local reelGui = player.PlayerGui:FindFirstChild("reel")
--                         local barContainer = reelGui and reelGui:FindFirstChild("bar")
--                         local reelContainer = barContainer and barContainer:FindFirstChild("reel")
--                         local fishValueObj = reelContainer and reelContainer:FindFirstChild("fish")

--                         local normalReel = true
--                         if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                             local fishData = fishValueObj and data.Fish[fishValueObj.Value]
--                             if not (fishData and var.ignoreSnapRarities and var.ignoreSnapRarities[fishData.Rarity]) then
--                                 normalReel = false
--                                 reel(generateRandomNumber(-0.05, 0.1), false)
--                             end
--                         end
                        
--                         if normalReel then
--                             reel()
--                         end

--                         if var.QuickCatch then
--                             player.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                         end
--                     end
--                 end

--                 character:GetAttributeChangedSignal("Reeling"):Connect(checkReeling)
--                 checkReeling()
--             end

--             local function handleCharacter(character)
--                 if character and var.autoReelEnabled then
--                     onReelingChanged(character)
--                 end
--             end

--             if not reelConnection2 then
--                 reelConnection2 = player.CharacterAdded:Connect(handleCharacter)
--             end

--             if player.Character then
--                 handleCharacter(player.Character)
--             end
--         elseif var.ReelMethod == "Follow Bar" then
--             repeat
--                 task.wait()
--                 local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                 local bar = reelGui and reelGui:FindFirstChild("bar")
--                 local playerBar = bar and bar:FindFirstChild("playerbar")
--                 local fish = bar and bar:FindFirstChild("fish")
                
--                 if playerBar and fish then
--                     playerBar.Position = fish.Position
--                 else
--                     break
--                 end
--             until not LocalPlayer.PlayerGui:FindFirstChild("reel") or not var.autoReelEnabled or var.ReelMethod ~= "Follow Bar"
--         end
--         else
--             var.autoReelEnabled = false

--             if reelConnection then
--                 reelConnection:Disconnect()
--                 reelConnection = nil
--             end
--             if reelConnection2 then
--                 reelConnection2:Disconnect()
--                 reelConnection2 = nil
--             end
--         end
--     end)
-- })


--[[
HEY THERE YOU IT ME 3itx IM STILL WORKING ON FOLLOWBAR

]]--


-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         variables.AutoCatch = isEnabled

--         if not isEnabled then
--             variables.AutoCatch = false
--             if currentCoroutine then
--                 coroutine.close(currentCoroutine)
--                 currentCoroutine = nil
--             end
--             return
--         end

--         if LocalPlayer.PlayerGui:FindFirstChild("reel") then
--             reel()
--         end

--         variables.AlreadyRequested = false
        
--         currentCoroutine = coroutine.create(function()
--             while variables.AutoCatch do
--                 if variables.ReelMethod3 then
--                     local connection
--                     if var.QuickCatch then
--                         connection = game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
--                             if child.Name == "reel" then
--                                 game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             end
--                         end)
--                     end
--                     reel()
--                     task.wait()
--                     print("yep")
                    
--                     if not variables.AutoCatch or not variables.ReelMethod3 then 
--                         if connection then
--                             connection:Disconnect()
--                         end
--                         break
--                     end
--                 else
--                     task.wait()

--                     local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     if not (reelGui and reelGui.Enabled) then
--                         continue
--                     end
--                     print("loopping wait")
--                     repeat 
--                         task.wait() 
--                         local fishObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if not fishObj or not fishObj:FindFirstChild("bar") or not fishObj.bar:FindFirstChild("fish") then
--                             warn("Reel bar disappeared! Breaking loop.")
--                             break
--                         end
--                     until fishObj.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
                    
--                     print("completed wait")
--                     local bar = reelGui:FindFirstChild("bar")
--                     local playerBar = bar and bar:FindFirstChild("playerbar")
--                     local fish = bar and bar:FindFirstChild("fish")
--                     if not bar or not playerBar or not fish then
--                         continue
--                     end
--                     print("2nd wait done")

--                     if variables.ReelMethod1 then
--                         print("wait for bar")

--                         local bar = playerBar
--                         if not bar then
--                             warn("Bar not found! Exiting early.")
--                             return
--                         end

--                         -- Use a single connection reference
--                         local barRemovedConnection
--                         barRemovedConnection = bar:GetPropertyChangedSignal("Parent"):Connect(function()
--                             if not bar.Parent then
--                                 warn("Reel bar disappeared! Breaking wait.")
--                                 barRemovedConnection:Disconnect()
--                             end
--                         end)

--                         -- Wait for position change or bar removal
--                         bar:GetPropertyChangedSignal("AbsolutePosition"):Wait()
--                         if barRemovedConnection then
--                             barRemovedConnection:Disconnect()
--                         end

--                         print("dtc")

--                         -- Optimized GUI element access
--                         local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
--                         local reelGui = playerGui:FindFirstChild("reel") or playerGui:WaitForChild("reel", 2)
--                         local barContainer = reelGui and (reelGui:FindFirstChild("bar") or reelGui:WaitForChild("bar", 2))
--                         local reelContainer = barContainer and (barContainer:FindFirstChild("reel") or barContainer:WaitForChild("reel", 2))
--                         local fishValueObj = reelContainer and (reelContainer:FindFirstChild("fish") or reelContainer:WaitForChild("fish", 2))

--                         if not fishValueObj then
--                             warn("Fish value object not found!")
--                             return
--                         end

--                         -- Cache frequently accessed values
--                         local autoPassive = autoPassive  -- Assuming this is defined elsewhere
--                         local genv = var
--                         local selectedPassive = genv.selectedPassive
--                         local equippedRod = getEquippedRod()

--                         -- Create event-based wait function
--                         local function waitForReelRemoval()
--                             local reelGui = playerGui:FindFirstChild("reel")
--                             if reelGui then
--                                 local connection
--                                 connection = reelGui.AncestryChanged:Connect(function()
--                                     if not reelGui:IsDescendantOf(game) then
--                                         connection:Disconnect()
--                                     end
--                                 end)
--                                 reelGui.Destroying:Wait()
--                                 if connection then
--                                     connection:Disconnect()
--                                 end
--                             end
--                         end

--                         -- Optimized ROTFF handling
--                         if autoPassive and selectedPassive == 'ROTFF' and equippedRod == 'Rod Of The Forgotten Fang' then
--                             print("ROTEK active")
--                             local fishData = data.Fish[fishValueObj.Value]
--                             local fishRarity = fishData and fishData.Rarity

--                             if PassiveHelper.ROTFF < 3 then
--                                 print("First stage")
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 PassiveHelper.ROTFF += 1
--                                 print("Done " .. PassiveHelper.ROTFF)
--                                 waitForReelRemoval()
--                             elseif fishRarity and matchesRarity(fishRarity, var.triggerRarityFish) then
--                                 print("Rarity match")
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 PassiveHelper.ROTFF = 0
--                                 waitForReelRemoval()
--                             else
--                                 print("Random reel")
--                                 -- reel(generateRandomNumber(-0.05, 0.1), false)
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 waitForReelRemoval()
--                             end
--                         else
--                             PassiveHelper:Set(false)
--                         end


--                         -- Auto ROTEK
--                         if autoPassive and selectedPassive == 'ROTEK' and equippedRod == 'Rod Of The Eternal King' then
--                             print("ROTEK active")
--                             local fishData = data.Fish[fishValueObj.Value]
--                             local fishRarity = fishData and fishData.Rarity

--                             -- if PassiveHelper.ROTFF < 3 then
--                             --     print("First stage")
--                             --     reel()
--                             --     if var.QuickCatch then
--                             --         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             --     end
--                             --     PassiveHelper.ROTFF += 1
--                             --     print("Done " .. PassiveHelper.ROTFF)
--                             --     waitForReelRemoval()
--                             if fishRarity and matchesRarity(fishRarity, var.triggerRarityFish) then
--                                 print("Rarity match")
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 -- PassiveHelper.ROTFF = 0
--                                 waitForReelRemoval()
--                             else
--                                 print("Random reel")
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 waitForReelRemoval()
--                             end
--                         else
--                             PassiveHelper:Set(false)
--                         end


--                         -- Optimized snap chance handling
--                         if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                             local ignoreSnapRarities = {}
--                             if genv.ignoreSnapRarities then
--                                 for _, rarity in ipairs(genv.ignoreSnapRarities) do
--                                     ignoreSnapRarities[rarity] = true
--                                 end
--                             end

--                             local fishData = data.Fish[fishValueObj.Value]
--                             if fishData and ignoreSnapRarities[fishData.Rarity] then
--                                 reel()
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                             else
--                                 print("Snap reel")
--                                 reel(generateRandomNumber(-0.05, 0.1), false)
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                                 print("Snap reel done")
--                             end
--                         else
--                             print("perf catch")
--                             reel()
--                             if var.QuickCatch then
--                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             end
--                             print('perf catch done')
--                         end

--                         repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     elseif variables.ReelMethod2 then
--                         repeat
--                             task.wait()
--                             local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                             local bar = reelGui and reelGui:FindFirstChild("bar")
--                             local playerBar = bar and bar:FindFirstChild("playerbar")
--                             local fish = bar and bar:FindFirstChild("fish")
                            
--                             if playerBar and fish then
--                                 if not var.PerfectCatch then
--                                     playerBar.Position = fish.Position
--                                 else
--                                     -- Check if this is the first time we're positioning the bar
--                                     if not var.InitialPositionSet then
--                                         -- Set initial position 30 units above fish
--                                         playerBar.Position = UDim2.new(
--                                             fish.Position.X.Scale,
--                                             fish.Position.X.Offset,
--                                             fish.Position.Y.Scale,
--                                             fish.Position.Y.Offset - 30
--                                         )
--                                         -- Mark that we've set the initial position
--                                         var.InitialPositionSet = true
--                                     else
--                                         -- After initial position, just follow the fish exactly
--                                         playerBar.Position = fish.Position
--                                     end
--                                 end
--                             else
--                                 break
--                             end
--                         until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     end
--                 end
--             end
--         end)
        
--         coroutine.resume(currentCoroutine)
--     end)
-- })



-- PassiveHelper = {}
-- local currentCoroutine = nil  -- Store reference to current coroutine

-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         variables.AutoCatch = isEnabled

--         -- If disabling, make sure we stop all automation
--         if not isEnabled then
--             variables.AutoCatch = false
--             if currentCoroutine then
--                 coroutine.close(currentCoroutine)
--                 currentCoroutine = nil
--             end
--             return
--         end

--         -- Initial reel if needed
--         if LocalPlayer.PlayerGui:FindFirstChild("reel") then
--             reel()
--         end

--         variables.AlreadyRequested = false
        
--         -- Create new coroutine and store reference
--         currentCoroutine = coroutine.create(function()
--             while variables.AutoCatch do
--                 if variables.ReelMethod3 then
--                     local connection
--                     if var.QuickCatch then
--                         connection = game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
--                             if child.Name == "reel" then
--                                 game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             end
--                         end)
--                     end
                    
--                     reel()
--                     task.wait(0.1)
--                     print("yep")
                    
--                     if not variables.AutoCatch or not variables.ReelMethod3 then 
--                         if connection then
--                             connection:Disconnect()
--                         end
--                         break
--                     end
--                 else
--                     task.wait()

--                     local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     if not (reelGui and reelGui.Enabled) then
--                         continue
--                     end
--                     print("loopping wait")
--                     repeat 
--                         task.wait() 
--                         local fishObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if not fishObj or not fishObj:FindFirstChild("bar") or not fishObj.bar:FindFirstChild("fish") then
--                             warn("Reel bar disappeared! Breaking loop.")
--                             break
--                         end
--                     until fishObj.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
                    
--                     print("completed wait")
--                     local bar = reelGui:FindFirstChild("bar")
--                     local playerBar = bar and bar:FindFirstChild("playerbar")
--                     local fish = bar and bar:FindFirstChild("fish")
--                     if not bar or not playerBar or not fish then
--                         continue
--                     end
--                     print("2nd wait done")

--                     if variables.ReelMethod1 then
--                         print("wait for bar")
--                         playerBar:GetPropertyChangedSignal('AbsolutePosition'):Wait()
--                         print("dtc")

--                         local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")

--                         print("got here " ..  PassiveHelper.ROTFF)
--                         if var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
--                             print("yep")
--                             if PassiveHelper.ROTFF < 3 then
--                                 print("first")
--                                 reel()
--                                 PassiveHelper.ROTFF += 1
--                                 print("done " .. PassiveHelper.ROTFF)
--                                 repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                                 continue
--                             elseif matchesRarity(data.Fish[fishValueObj.Value].Rarity, var.triggerRarityFish) then
--                                 print("2")
--                                 reel()
--                                 PassiveHelper.ROTFF = 0
--                                 repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                                 continue
--                             elseif matchesRarity(fishValueObj.Value, var.triggerRarityFish) then
--                                 print("3")
--                                 reel()
--                                 PassiveHelper.ROTFF = 0
--                                 repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                                 continue
--                             else
--                                 print("4")
--                                 reel(generateRandomNumber(-0.05, 0.1), false)
--                                 repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                                 continue
--                             end
--                         else
--                             PassiveHelper:Set(false)
--                         end

--                         if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                             if var.ignoreSnapRarities ~= nil then
--                                 if type(var.ignoreSnapRarities) ~= "table" then
--                                     var.ignoreSnapRarities = {}
--                                 end
--                                 local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                                 for _, rarity in ipairs(var.ignoreSnapRarities) do
--                                     if data.Fish[fishValueObj.Value].Rarity == rarity then
--                                         reel()
--                                         if var.QuickCatch then
--                                             LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                         end
--                                     end
--                                 end
--                             end
                            
--                             print("snap reel")
--                             reel(generateRandomNumber(-0.05, 0.1), false)
--                             print("snap reel done")
--                             if var.QuickCatch then
--                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             end
--                         else
--                             print("perf catch")
--                             reel()
--                             print('perf catch done')
--                             if var.QuickCatch then
--                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             end
--                         end

--                         repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     elseif variables.ReelMethod2 then
--                         repeat
--                             task.wait()
--                             local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                             local bar = reelGui and reelGui:FindFirstChild("bar")
--                             local playerBar = bar and bar:FindFirstChild("playerbar")
--                             local fish = bar and bar:FindFirstChild("fish")
                            
--                             if playerBar and fish then
--                                 playerBar.Position = fish.Position
--                             else
--                                 break
--                             end
--                         until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     end
--                 end
--             end
--         end)
        
--         -- Start the coroutine
--         coroutine.resume(currentCoroutine)
--     end)
-- })

-- PassiveHelper = {}

-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         variables.AutoCatch = isEnabled
--         -- local reelfinished = ReplicatedStorage.events:FindFirstChild('reelfinished ')
        
--         if isEnabled then
--             if LocalPlayer.PlayerGui:FindFirstChild("reel") then
--                 reel()
--                 -- if var.QuickCatch then
--                 --     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                 -- end
--             end

--             variables.AlreadyRequested = false
--             coroutine.wrap(function()
--                 while variables.AutoCatch do
--                     if variables.ReelMethod3 then
--                         while variables.ReelMethod3 do
--                             -- Create connection only if QuickCatch is enabled
--                             local connection
--                             if var.QuickCatch then
--                                 connection = game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
--                                     if child.Name == "reel" then
--                                         -- Unequip tools when reel GUI appears
--                                         game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     end
--                                 end)
--                             end
                            
--                             reel()
--                             task.wait(0.1)
--                             print("yep")
                            
--                             -- Clean up connection when breaking loop or ReelMethod3 disabled
--                             if not variables.AutoCatch or not variables.ReelMethod3 then 
--                                 if connection then -- Only disconnect if connection exists
--                                     connection:Disconnect()
--                                 end
--                                 break 
--                             end
--                         end
--                     else
--                         task.wait()

--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if not (reelGui and reelGui.Enabled) then
--                             continue
--                         end
--                         print("loopping wait")
--                         repeat 
--                             task.wait() 
--                             local fishObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
--                             if not fishObj or not fishObj:FindFirstChild("bar") or not fishObj.bar:FindFirstChild("fish") then
--                                 warn("Reel bar disappeared! Breaking loop.")
--                                 break
--                             end
--                         until fishObj.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
                        
--                         print("completed wait")
--                         local bar = reelGui:FindFirstChild("bar")
--                         local playerBar = bar and bar:FindFirstChild("playerbar")
--                         local fish = bar and bar:FindFirstChild("fish")
--                         if not bar or not playerBar or not fish then
--                             continue -- Skip if essential components are missing
--                         end
--                         print("2nd wait done")
--                         if variables.ReelMethod1 then
--                             -- -- Wait for bar to move before firing the event
--                             -- playerBar:GetPropertyChangedSignal('Position'):Wait()
--                             print("wait for bar")
--                             playerBar:GetPropertyChangedSignal('AbsolutePosition'):Wait()
--                             print("dtc")

--                             local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")

--                             -- if var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
--                             --     if PassiveHelper.ROTFF < 3 then
--                             --         -- snap = false
--                             --         -- perfect = true
--                             --         reel()
--                             --         PassiveHelper.ROTFF += 1
--                             --     elseif rarity == 'Mythical' or rarity == 'Exotic' then
--                             --         -- snap = false
--                             --         -- perfect = false
--                             --         reel()
--                             --         PassiveHelper.ROTFF = 0
--                             --     else
--                             --         snap = true
--                             --     end
--                             -- else
--                             --     PassiveHelper:Set(false)
--                             -- end
--                             print("got here " ..  PassiveHelper.ROTFF)
--                             if var.selectedPassive == 'ROTFF' and getEquippedRod() == 'Rod Of The Forgotten Fang' then
--                                 print("yep")
--                                 if PassiveHelper.ROTFF < 3 then
--                                     print("first")
--                                     reel()
--                                     PassiveHelper.ROTFF += 1
--                                     print("done " .. PassiveHelper.ROTFF)
--                                     break
--                                 elseif data.Fish[fishValueObj.Value].Rarity == var.triggerRarityFish then
--                                     print("2")
--                                     reel()
--                                     PassiveHelper.ROTFF = 0
--                                     break
--                                 elseif fishValueObj.Value == var.triggerRarityFish then
--                                     print("3")
--                                     reel()
--                                     PassiveHelper.ROTFF = 0
--                                     break
--                                 else
--                                     print("4")
--                                     local args = {generateRandomNumber(-0.05, 0.1), false}
--                                     reelfinished:FireServer(unpack(args))
--                                     break
--                                 end
--                             else
--                                 PassiveHelper:Set(false)
--                             end
--                             print("doesnt get here")
                            
--                             -- local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                             -- if data.Fish[fishValueObj.Value].Rarity == var.triggerRarityFish then
--                             --     reelfinished:FireServer(100, true)
--                             --     if var.QuickCatch then
--                             --         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             --     end
--                             --     PassiveHelper.ROTFF = 0
--                             --     return
--                             -- elseif fishValueObj.Value == var.triggerRarityFish then
--                             --     reelfinished:FireServer(100, true)
--                             --     if var.QuickCatch then
--                             --         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             --     end
--                             --     PassiveHelper.ROTFF = 0
--                             --     return
--                             -- else
--                             --     local args = {generateRandomNumber(-0.05, 0.1), false}
--                             --     reelfinished:FireServer(unpack(args))
--                             --     return
--                             -- end

--                             -- if autoPassive then
--                             --     local completed = 0
                                
--                             --     if completed < passiveTriggerNumber then
--                             --         print("should finish")
--                             --         reelfinished:FireServer(100, true)
--                             --         completed = completed + 1
--                             --         return
--                             --     end
                                
--                             --     if completed > passiveTriggerNumber then
--                             --         local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                             --         if data.Fish[fishValueObj.Value].Rarity == var.triggerRarityFish then
--                             --             reelfinished:FireServer(100, true)
--                             --             if var.QuickCatch then
--                             --                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             --             end
--                             --             completed = 0
--                             --             return
--                             --         elseif fishValueObj.Value == var.triggerRarityFish then
--                             --             reelfinished:FireServer(100, true)
--                             --             if var.QuickCatch then
--                             --                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             --             end
--                             --             completed = 0
--                             --             return
--                             --         else
--                             --             local args = {generateRandomNumber(-0.05, 0.1), false}
--                             --             reelfinished:FireServer(unpack(args))
--                             --             return
--                             --         end
--                             --     end
--                             -- end

--                             if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                                 -- else
--                                 if var.ignoreSnapRarities ~= nil then
--                                     if type(var.ignoreSnapRarities) ~= "table" then
--                                         var.ignoreSnapRarities = {} -- Ensure it's a table
--                                     end
--                                     local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                                     for _, rarity in ipairs(var.ignoreSnapRarities) do
--                                         if data.Fish[fishValueObj.Value].Rarity == rarity then
--                                             reel()
--                                             if var.QuickCatch then
--                                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                             end
--                                         end
--                                     end
--                                 end
                                
--                                 print("snap reel")
--                                 reel(generateRandomNumber(-0.05, 0.1), false)
--                                 print("snap reel done")
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                             else
--                                 print("perf catch")
--                                 reel()
--                                 print('perf catch done')
--                                 if var.QuickCatch then
--                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 end
--                             end

--                             repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         elseif variables.ReelMethod2 then
--                             -- Follow Bar Method
--                             repeat
--                                 task.wait()
--                                 local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                                 local bar = reelGui and reelGui:FindFirstChild("bar")
--                                 local playerBar = bar and bar:FindFirstChild("playerbar")
--                                 local fish = bar and bar:FindFirstChild("fish")
                                
--                                 -- Ensure components exist
--                                 if playerBar and fish then
--                                     playerBar.Position = fish.Position
--                                 else
--                                     break
--                                 end
--                             until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         end
--                     end
--                 end
--             end)()
--         else
--             variables.AutoCatch = false
--         end
--     end)
-- })

-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         variables.AutoCatch = isEnabled
--         local reelfinished = ReplicatedStorage.events:FindFirstChild('reelfinished ')
--         if isEnabled then
--             if LocalPlayer.PlayerGui:FindFirstChild("reel") then
--                 reelfinished:FireServer(100, true)
--                 -- if var.QuickCatch then
--                 --     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                 -- end
--             end

--             variables.AlreadyRequested = false
--             coroutine.wrap(function()
--                 while variables.AutoCatch do
--                     if variables.ReelMethod3 then
--                         while variables.ReelMethod3 do
--                             -- Create connection only if QuickCatch is enabled
--                             local connection
--                             if var.QuickCatch then
--                                 connection = game:GetService("Players").LocalPlayer.PlayerGui.ChildRemoved:Connect(function(child)
--                                     if child.Name == "reel" then
--                                         -- Unequip tools when reel GUI appears
--                                         game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     end
--                                 end)
--                             end
                            
--                             reelfinished:FireServer(100, true)
--                             task.wait(0.1)
--                             print("yep")
                            
--                             -- Clean up connection when breaking loop or ReelMethod3 disabled
--                             if not variables.AutoCatch or not variables.ReelMethod3 then 
--                                 if connection then -- Only disconnect if connection exists
--                                     connection:Disconnect()
--                                 end
--                                 break 
--                             end
--                          end
--                     else
--                         task.wait()

--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if not (reelGui and reelGui.Enabled) then
--                             continue
--                         end
                        

--                         -- print("enabled")
--                         -- print("making sure of position..")
--                         repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.reel.bar.fish.Position == UDim2.new(0.5, 0, 0.5, 0)
--                         -- print("correct position")
--                         local bar = reelGui:FindFirstChild("bar")
--                         local playerBar = bar and bar:FindFirstChild("playerbar")
--                         local fish = bar and bar:FindFirstChild("fish")
--                         if not bar or not playerBar or not fish then
--                             continue -- Skip if essential components are missing
--                         end
--                         -- print("found bar, waiting for move")
--                         if variables.ReelMethod1 then
--                             -- -- Wait for bar to move before firing the event
--                             -- playerBar:GetPropertyChangedSignal('Position'):Wait()
--                             -- -- print("moved!")
--                             -- Wait for bar to move before firing the event
--                             playerBar:GetPropertyChangedSignal('Position'):Wait()
--                             -- print("moved!")

--                             if autoPassive then
--                                 local completed = 0
                                
--                                 if completed < passiveTriggerNumber then
--                                     reelfinished:FireServer(100, true)
--                                     completed = completed + 1
--                                     return
--                                 end
--                                 if completed > passiveTriggerNumber then
--                                     local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                                         if data.Fish[fishValueObj.Value].Rarity == var.triggerRarityFish then
--                                             reelfinished:FireServer(100, true)
--                                             if var.QuickCatch then
--                                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                             end
--                                             local completed = 0
--                                             return
--                                         elseif fishValueObj.Value == var.triggerRarityFish then
--                                             reelfinished:FireServer(100, true)
--                                             if var.QuickCatch then
--                                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                             end
--                                             local completed = 0
--                                             return
--                                         else
--                                             local args = {generateRandomNumber(-0.05, 0.1), false}
--                                             reelfinished:FireServer(unpack(args))
--                                             return
--                                         end
--                                     end
--                                 end
--                             end

--                             if variables.snapChance and math.random(1, 100) <= variables.snapChance then
--                                 -- else
--                                     if var.ignoreSnapRarities ~= nil then
--                                         -- local bobber = character:FindFirstChild(PlayerStats.rod.Value):FindFirstChild("bobber")
--                                         -- for _, child in ipairs(bobber:GetChildren()) do
--                                         --     if child:IsA("Model") and child.Name ~= PlayerStats.bait.Value and child.Name ~= PlayerStats.bobber.Value then
--                                         --         if currentModel ~= child.Name then
--                                         --             for _, rarity in ipairs(var.ignoreSnapRarities) do
--                                         --                 if data.Fish[child.Name].Rarity == rarity then
--                                         --                     reelfinished:FireServer(100, true)
--                                         --                     if var.QuickCatch then
--                                         --                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                         --                     end
--                                         --                 end
--                                         --             end
--                                         --         end
--                                         --     end
--                                         -- end
--                                         local fishValueObj = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel"):WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish")
--                                         for _, rarity in ipairs(var.ignoreSnapRarities) do
--                                             if data.Fish[fishValueObj.Value].Rarity == rarity then
--                                                 reelfinished:FireServer(100, true)
--                                                 if var.QuickCatch then
--                                                     LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                                 end
--                                             end
--                                         end
--                                     end
--                                     local args = {generateRandomNumber(-0.05, 0.1), false}
--                                     -- print("nuh uh")
--                                     reelfinished:FireServer(unpack(args))
--                                     if var.QuickCatch then
--                                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     end
--                                 -- end
--                             else
--                                 -- print('remote.')
--                                 if var.PerfectCatch then
--                                     -- LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     reelfinished:FireServer(100, true)
--                                     if var.QuickCatch then
--                                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     end
--                                 else
--                                     reelfinished:FireServer(100, false)
--                                     if var.QuickCatch then
--                                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                     end
--                                 end
--                             end

--                             repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         elseif variables.ReelMethod2 then
--                             -- Follow Bar Method
--                             repeat
--                                 task.wait()
--                                 if playerBar and fish then
--                                     playerBar.Position = fish.Position
--                                 else
--                                     break
--                                 end
--                             until not LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         end
--                     end
--                 end
--             end)()
--         else
--             variables.AutoCatch = false
--         end
--     end)
-- })






-- sections.Fish:AddToggle("AutoCatch", {
--     Title = "Auto Reel",
--     Default = false,
--     IgnoreFirst = true,
--     Description = "",
--     Callback = function(isEnabled)
--         variables.AutoCatch = isEnabled
        
--         if isEnabled then
--             variables.AlreadyRequested = false

--             -- Check the method type
--             if not variables.Method1 then
--                 -- Method 1: Auto Reel
--                 spawn(function()
--                     while variables.AutoCatch do
--                         task.wait()
--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if reelGui and not variables.AlreadyRequested then
--                             variables.AlreadyRequested = true
                            
--                             -- Fire server event
--                             local reelfinished = ReplicatedStorage:WaitForChild("events"):FindFirstChild("reelfinished")
--                             if reelfinished then
--                                 reelfinished:FireServer(100, true)
--                             end

--                             -- Adjust GUI bar properties
--                             local playerBar = LocalPlayer.PlayerGui:FindFirstChild("reel"):FindFirstChild("bar"):FindFirstChild("playerbar")
--                             if playerBar then
--                                 playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                                 playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                             end

--                             variables.AlreadyRequested = false
--                         end
--                     end
--                 end)
--             else
--                 -- Method 2: Match Bar Position
--                 spawn(function()
--                     while variables.AutoCatch do
--                         task.wait()
--                         local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         if reelGui and reelGui:FindFirstChild("bar") then
--                             local playerBar = reelGui.bar:FindFirstChild("playerbar")
--                             local fishBar = reelGui.bar:FindFirstChild("fish")
--                             if playerBar and fishBar then
--                                 playerBar.Position = fishBar.Position
--                             end
--                         end
--                     end
--                 end)
--             end
--         else
--             -- Disable AutoCatch
--             variables.AutoCatch = false
--         end
--     end
-- })


sections.Fish:AddToggle("FreezeCharacter", {
    Title = "Freeze Character",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.FreezeCharacter = isEnabled
        local oldpos = nil

        while variables.FreezeCharacter do
            local player = LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
            if oldpos == nil then
                oldpos = humanoidRootPart.CFrame
            end
        
            humanoidRootPart.CFrame = oldpos
            humanoidRootPart.Velocity = Vector3.zero
        
            task.wait() 
        end
    end)
})



local Connections2
sections.Fish:AddToggle("AutoBalanceNuke", {
    Title = "Auto Balance Nuke",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoBalanceNuke = isEnabled
        
        local StartMinigame

        if var.getgc then
        task.spawn(function()
            for i, v in pairs(getgc(true)) do
                if type(v) == "function" then
                    local name = debug.info(v, "n")

                    if name == "StartMinigame" then
                        task.spawn(function()
                            -- v()
                        end)

                        StartMinigame = v
                    elseif name == "LoopMinigame" then
                        if debug.setupvalue then
                            task.spawn(function()
                                while var.AutoBalanceNuke do
                                    if true then -- Toggle to balance nuke : )
                                        local success, result = pcall(function()
                                            debug.setupvalue(v, 13, os.clock() - 10)
                                        end)

                                        if not success then
                                            break
                                        end
                                    end

                                    task.wait()
                                end
                            end)
                        end
                    end
                end
            end
    end)
        else
            local LocalPlayer = game.Players.LocalPlayer
            if var.AutoBalanceNuke then
                task.wait(1)
                if LocalPlayer.PlayerGui:FindFirstChild("NukeMinigame") then
                    Connections2.AutoBalanceNuke = LocalPlayer.PlayerGui.NukeMinigame.Center.Marker.Pointer.Frame:GetPropertyChangedSignal("AbsoluteRotation"):Connect(function()
                        local rot = LocalPlayer.PlayerGui.NukeMinigame.Center.Marker.Pointer.Frame.AbsoluteRotation
                        if rot < -35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        elseif rot > 35 then
                            VIM:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                            VIM:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
                        end
                    end)
                end
            else
                if Connections2.AutoBalanceNuke then
                    Connections2.AutoBalanceNuke:Disconnect()
                    Connections2.AutoBalanceNuke = nil
                end
            end
        end
    end)
})


-- sections.FishPlus:AddParagraph({Title = '<font color="#ea00ff">A</font><font color="#e100ff">d</font><font color="#d800ff">v</font><font color="#d000ff">a</font><font color="#c700ff">n</font><font color="#be00fe">c</font><font color="#b600ff">e</font><font color="#ad00ff">d</font><font color="#a400ff"> </font><font color="#9c00ff">A</font><font color="#9300ff">u</font><font color="#8a00ff">t</font><font color="#8200ff">o</font><font color="#7900ff"> </font><font color="#7000ff">F</font><font color="#6800ff">a</font><font color="#5f00ff">r</font><font color="#5700ff">m</font>', Description = "Usage:\n- Select Zone\n- Create Safe Zone\n- Freeze Character\n- Auto Cast and others.."})

local zoneNames = {}
for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
    if descendant:FindFirstChild("CrabZone") and not table.find(zoneNames, descendant.Name) then
        table.insert(zoneNames, descendant.Name)
    end
end
table.insert(zoneNames, "Ashfall Pool")
table.sort(zoneNames)
var.selectedEventOverrides = {}
sections.FishPlus:AddDropdown("FishingZones", {
    Title = "Fishing Zone",
    Description = "",
    Options = zoneNames,
    PlaceHolder = "Select Zone",
    Multiple = false,
    Callback = function(selectedZone)
        var.selectedZone = selectedZone
    end,
})

sections.FishPlus:AddDropdown("FishOverridesZones", {
    Title = "Event Overrides",
    Description = "",
    Options = {"Whales Pool","Forsaken Veil - Scylla", "Orcas Pool","The Kraken Pool", "The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Bluefin Tuna Abundance", "Arapaima Abundance", "Swordfish Abundance", "Chinook Salmon Abundance", "Amberjack Abundance", "Mackerel Abundance","Nuclear"},
    Default = "",
    PlaceHolder = "Select Zone",
    Multiple = true,
    Callback = function(selectedEvents)
    if selectedEvents then
        var.selectedEventOverrides = selectedEvents
    else
        var.selectedEventOverrides = {}
    end
    end,
})

sections.FishPlus:AddDropdown("FishZoneSpot", {
    Title = "Zone Spots",
    Description = "To Set to Center just remove the Selected one",
    Options = {"Top Left","Top Right","Bottom Right","Bottom Left"},
    Default = "This feature is a WIP, it will work in the next few days!",
    PlaceHolder = "Select Area",
    Multiple = false,
    Callback = function(IWasAlwaysHere3itx)
        var.ZoneSpot = IWasAlwaysHere3itx
    end,
})

sections.FishPlus:AddToggle("FishOnSurface", {
    Title = "Top Mode",
    Default = false,
    Description = "<font color=\"rgb(255, 255, 0)\">Unsafe, people can see you floating.</font>",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.Top = isEnabled
    end)
})

print("here 1")
-- wait(10))

var.RunningFishZone = false

local function checkOverrides()
    -- Guard clause for if selectedEventOverrides isn't set
    if not var.selectedEventOverrides then
        return nil
    end

    local fishingZones = workspace.zones.fishing
    if not fishingZones then
        return nil
    end

    -- Priority checks for specific zones

    local priorityChecks = {
        {name = "Whales Pool", alternates = {}},

        {name = "Forsaken Veil - Scylla", alternates = {}},

        {name = "The Kraken Pool", alternates = {"Ancient Kraken Pool"}},

        {name = "Orcas Pool", alternates = {"Ancient Orcas Pool"}},

        {name = "The Depths - Serpent", alternates = {}},
    }

    -- Check priority zones first
    for _, check in ipairs(priorityChecks) do
        if table.find(var.selectedEventOverrides, check.name) then
            local zone = fishingZones:FindFirstChild(check.name)
            if zone then
                return zone
            end
            -- Check alternates
            for _, altName in ipairs(check.alternates) do
                zone = fishingZones:FindFirstChild(altName)
                if zone then
                    return zone
                end
            end
        end
    end

    -- Helper function to normalize strings for comparison
    local function normalizeString(str)
        return string.lower(string.gsub(str, "%s+", ""))
    end

    -- Check all fishing zones
    for _, zone in ipairs(fishingZones:GetChildren()) do
        -- Check for beacon and POIHeader
        if zone:FindFirstChild("beacon") then
            local poiHeader = zone:FindFirstChild("POIHeader")
            if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                local titleText = poiHeader.title.Text
                
                for _, overrideEvent in ipairs(var.selectedEventOverrides) do
                    -- Normalize both strings for comparison
                    local normalizedTitle = normalizeString(titleText)
                    local normalizedOverride = normalizeString(overrideEvent)
                    
                    if string.find(normalizedTitle, normalizedOverride) then
                        return zone
                    end
                    
                    -- Special case for "The Depths"
                    if string.find(normalizedOverride, "thedepths") and 
                       string.find(normalizeString(zone.Name), "thedepths%-serpent") then
                        return zone
                    end
                end
            end
        end

        -- Check abundance properties
        local abundance = zone:FindFirstChild("Abundance")
        if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
            for _, overrideEvent in ipairs(var.selectedEventOverrides) do
                if string.find(normalizeString(zone.Name), normalizeString(overrideEvent)) then
                    return zone
                end
            end
        end
    end

    return nil
end

print("here is it this chat")
-- wait(10))


var.FishinZone = sections.FishPlus:AddToggle("AutoFishInZones", {
    Title = "Auto Fish In Zone",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.RunningFishZone = isEnabled
        local player = LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        local head = character:WaitForChild("Head")
        local workspace = game:GetService("Workspace")
        local oldPos = rootPart.CFrame
        local lastEventZone = nil
        local wasInEventZone = false
        local previousRod = nil
        
        -- Function to get position offset based on selected spot
        local function getSpotOffset(size, selectedSpot)
            local offsetX, offsetZ = 0, 0
            local margin = 2 -- Distance from the edge
            
            if selectedSpot == "Top Right" then
                offsetX = (size.X / 2) - margin
                offsetZ = (size.Z / 2) - margin
            elseif selectedSpot == "Top Left" then
                offsetX = -(size.X / 2) + margin
                offsetZ = (size.Z / 2) - margin
            elseif selectedSpot == "Bottom Right" then
                offsetX = (size.X / 2) - margin
                offsetZ = -(size.Z / 2) + margin
            elseif selectedSpot == "Bottom Left" then
                offsetX = -(size.X / 2) + margin
                offsetZ = -(size.Z / 2) + margin
            end
            -- Center position uses default offsets of 0,0
            
            return offsetX, offsetZ
        end

        -- Function to get height offset based on Top setting
        local function getHeightOffset(size)
            if var.Top then
                return (size.Y / 2) + 9
            else
                return -(size.Y / 2) - 9 
            end
        end

        if isEnabled ~= false and (var.selectedZone == "" or var.selectedZone == nil) then
            lib:Notification("Error", "Please Select a Default Zone", 2)
            -- if FishinZone then
                print("should set false..")
                var.FishinZone:Set(false)
            -- end
            return
        end

        while var.RunningFishZone do
            task.wait()
            
            -- Check if the character is dead
            if humanoid.Health <= 0 then
                var.RunningFishZone = false
                break
            end

            rootPart.Velocity = Vector3.zero
            workspace.FallenPartsDestroyHeight = 0/0
            humanoid.PlatformStand = true

            for _,v in next, character:GetDescendants() do 
                if v:IsA("BasePart") and v.CanCollide ~= false then 
                    v.CanCollide = false 
                end 
            end

            local eventZone = checkOverrides()
            local targetZone = eventZone or workspace.zones.fishing:FindFirstChild(var.selectedZone)

            if targetZone then
                local position = targetZone.Position
                local size = targetZone.Size
                
                -- Get position offsets based on selected spot
                local offsetX, offsetZ = getSpotOffset(size, var.ZoneSpot or "Center")
                local heightOffset = getHeightOffset(size)

                if eventZone and eventZone ~= lastEventZone then
                    if var.eventOverrideRod ~= nil then
                        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") then
                            repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
                        end
                        previousRod = getEquippedRod()
                        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(var.eventOverrideRod)
                    end
                    lastEventZone = eventZone
                    wasInEventZone = true
                end

                -- Handle returning to normal zone
                if not eventZone and wasInEventZone then
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") then
                        repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
                    end
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(previousRod)
                    wasInEventZone = false
                end

                -- Position the character with offset
                rootPart.CFrame = CFrame.new(
                    position.X + offsetX,
                    position.Y + heightOffset,
                    position.Z + offsetZ
                )
                
                local rod = character:FindFirstChild(PlayerStats.rod.Value)
                if rod then
                    local bobber = rod:FindFirstChild("bobber")
                    if bobber then
                        -- Adjust bobber height based on Top setting
                        local bobberHeight = var.Top and (position.Y + (size.Y / 2) - 2) or (position.Y - (size.Y / 2) + (eventZone and 0 or 2))
                        bobber.CFrame = CFrame.new(
                            position.X + offsetX,
                            bobberHeight,
                            position.Z + offsetZ
                        )
                    end
                end
            else
                humanoid.PlatformStand = false
                workspace.FallenPartsDestroyHeight = -50000
                for _,v in next, character:GetDescendants() do 
                    if v:IsA("BasePart") and v.CanCollide ~= true then 
                        v.CanCollide = true 
                    end 
                end
            end
        end

        humanoid.PlatformStand = false
        workspace.FallenPartsDestroyHeight = -50000
        if oldPos then
            rootPart.CFrame = oldPos
        end
    end)
})


local player = game:GetService("Players").LocalPlayer

-- Function to handle character death
local function onCharacterDeath()
    if var.FishinZone.Value == true then
        deathstuff = true
        lib:Notification("Auto Fish In Zone", "Detected death, automatic retoggling triggered, awaiting respawn..", 5)
        var.FishinZone:Set(false) -- Turn off the fishing toggle
    end
end

-- Function to handle character respawn
local function onCharacterRespawn()
    wait(3)
    if var.FishinZone.Value == true or deathstuff then
        lib:Notification("Auto Fish In Zone", "Detected respawn, toggling on..", 5)
        var.FishinZone:Set(true) -- Turn on the fishing toggle
        deathstuff = false
    end
end

-- Function to set up death detection
local function setupDeathDetection(character)
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid then
        -- Connect to the Died event
        humanoid.Died:Connect(onCharacterDeath)
    else
        -- If Humanoid doesn't exist yet, wait for it
        humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(onCharacterDeath)
    end
end

-- Initial setup
local character = player.Character
if character then
    setupDeathDetection(character)
else
    -- If the character doesn't exist yet, wait for it
    character = player.CharacterAdded:Wait()
    setupDeathDetection(character)
end

-- Detect respawns
player.CharacterAdded:Connect(function(newCharacter)
    onCharacterRespawn() -- Handle respawn logic
    setupDeathDetection(newCharacter) -- Reconnect death detection for the new character
end)


-- sections.FishPlus:AddButton({
--     Title = "enable",
--     Callback = function()
--         var.FishinZone:Set(true)
--     end,
-- })


-- local FishinZone
-- FishinZone = sections.FishPlus:AddToggle("AutoFishInZones", {
--     Title = "Auto Fish In Zone",
--     Default = false,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         var.RunningFishZone = isEnabled
--         local player = LocalPlayer
--         local character = player.Character or player.CharacterAdded:Wait()
--         local humanoid = character:WaitForChild("Humanoid")
--         local rootPart = character:WaitForChild("HumanoidRootPart")
--         local head = character:WaitForChild("Head")
--         local workspace = game:GetService("Workspace")
--         local oldPos = rootPart.CFrame
--         local lastEventZone = nil
--         local wasInEventZone = false
--         local previousRod = nil
        
        
--         -- Function to get position offset based on selected spot
--         local function getSpotOffset(size, selectedSpot)
--             local offsetX, offsetZ = 0, 0
--             local margin = 2 -- Distance from the edge
            
--             if selectedSpot == "Top Right" then
--                 offsetX = (size.X / 2) - margin
--                 offsetZ = (size.Z / 2) - margin
--             elseif selectedSpot == "Top Left" then
--                 offsetX = -(size.X / 2) + margin
--                 offsetZ = (size.Z / 2) - margin
--             elseif selectedSpot == "Bottom Right" then
--                 offsetX = (size.X / 2) - margin
--                 offsetZ = -(size.Z / 2) + margin
--             elseif selectedSpot == "Bottom Left" then
--                 offsetX = -(size.X / 2) + margin
--                 offsetZ = -(size.Z / 2) + margin
--             end
--             -- Center position uses default offsets of 0,0
            
--             return offsetX, offsetZ
--         end

--         -- Function to get height offset based on Top setting
--         local function getHeightOffset(size)
--             if var.Top then
--                 return (size.Y / 2) + 9
--             else
--                 return -(size.Y / 2) - 9 
--             end
--         end

--         if isEnabled ~= false and (var.selectedZone == "" or var.selectedZone == nil) then
--             lib:Notification("Error", "Please Select a Default Zone", 2)
--             if FishinZone then
--                 FishinZone:Set(false)
--             end
--             return
--         end

--         while var.RunningFishZone do
--             task.wait()
--             rootPart.Velocity = Vector3.zero
--             workspace.FallenPartsDestroyHeight = 0/0
--             humanoid.PlatformStand = true

--             for _,v in next, character:GetDescendants() do 
--                 if v:IsA("BasePart") and v.CanCollide ~= false then 
--                     v.CanCollide = false 
--                 end 
--             end

--             local eventZone = checkOverrides()
--             local targetZone = eventZone or workspace.zones.fishing:FindFirstChild(var.selectedZone)

--             if targetZone then
--                 local position = targetZone.Position
--                 local size = targetZone.Size
                
--                 -- Get position offsets based on selected spot
--                 local offsetX, offsetZ = getSpotOffset(size, var.ZoneSpot or "Center")
--                 local heightOffset = getHeightOffset(size)

--                 if eventZone and eventZone ~= lastEventZone then
--                     if var.eventOverrideRod ~= nil then
--                         if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") then
--                             repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
--                         end
--                         previousRod = getEquippedRod()
--                         game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(var.eventOverrideRod)
--                     end
--                     lastEventZone = eventZone
--                     wasInEventZone = true
--                 end

--                 -- Handle returning to normal zone
--                 if not eventZone and wasInEventZone then
--                     if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel") then
--                         repeat task.wait() until not game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("reel")
--                     end
--                     game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(previousRod)
--                     wasInEventZone = false
--                 end

--                 -- Position the character with offset
--                 rootPart.CFrame = CFrame.new(
--                     position.X + offsetX,
--                     position.Y + heightOffset,
--                     position.Z + offsetZ
--                 )
                
--                 local rod = character:FindFirstChild(PlayerStats.rod.Value)
--                 if rod then
--                     local bobber = rod:FindFirstChild("bobber")
--                     if bobber then
--                         -- Adjust bobber height based on Top setting
--                         local bobberHeight = var.Top and (position.Y + (size.Y / 2) - 2) or (position.Y - (size.Y / 2) + (eventZone and 0 or 2))
--                         bobber.CFrame = CFrame.new(
--                             position.X + offsetX,
--                             bobberHeight,
--                             position.Z + offsetZ
--                         )
--                     end
--                 end
--             else
--                 humanoid.PlatformStand = false
--                 workspace.FallenPartsDestroyHeight = -50000
--                 for _,v in next, character:GetDescendants() do 
--                     if v:IsA("BasePart") and v.CanCollide ~= true then 
--                         v.CanCollide = true 
--                     end 
--                 end
--             end
--         end

--         humanoid.PlatformStand = false
--         workspace.FallenPartsDestroyHeight = -50000
--         if oldPos then
--             rootPart.CFrame = oldPos
--         end
--     end)
-- })



print("here 2")
-- wait(10))


var.AutoBestiaryParagraph = sections.FishPlus:AddParagraph({
    Title = gradient("Auto Bestiary"),
    Description = "<font color=\"rgb(255, 0, 0)\">NOTE: Auto Bestiary was rushed, expect bugs. You need to use reinforced rod.</font>"
})

sections.FishPlus:AddToggle("AutoBestiary", {
    Title = "Auto Bestiary",
    Default = false,
    Description = "Automatically complete the bestiary by fishing in required zones.",
    Callback = function(isEnabled)
        var.AutoBestiaryEnabled = isEnabled

        if var.AutoBestiaryEnabled then
            coroutine.wrap(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local rootPart = character:WaitForChild("HumanoidRootPart")
                local workspace = game:GetService("Workspace")
                local replicatedStorage = game:GetService("ReplicatedStorage")
                local bestiary = replicatedStorage.playerstats[player.Name].Bestiary

                local allFish = {}

                if type(data.Fish) == "table" then
                    for fishName, fishData in pairs(data.Fish) do
                        if fishData.Rarity ~= "Trash" and fishData.Rarity ~= "Limited" then
                            allFish[fishName] = fishData.From or "Unknown"
                        end
                    end
                end
                

                -- Zone Failsafe Map
                local zoneFailsafeMap = {
                    Snowcap = "Snowcap Ocean",
                    Terrapin = "Terrapin Ocean",
                    Roslit = "Roslit Bay Clam",
                    ["Roslit Volcano"] = "Lava",
                    Mushgrove = "Mushgrove Water",
                    Moosewood = "Moosewood Ocean",
                    ["Ancient Isle"] = "Ancient Isle Ocean",
                    Atlantis = "Atlantis Ocean",
                }

                local function getUncompletedFish()
                    local completedFish = {}
                    for _, entry in ipairs(bestiary:GetChildren()) do
                        completedFish[entry.Name] = true
                    end

                    local uncompletedFish = {}
                    for fishName, zone in pairs(allFish) do
                        -- Skip fish with "N/A" zone
                        if not completedFish[fishName] and zone ~= "N/A" then
                            table.insert(uncompletedFish, { name = fishName, zone = zone })
                        end
                    end

                    return uncompletedFish
                end

                local function findZone(zoneName)
                    -- Check for zone and fallback
                    local zone = workspace.zones.fishing:FindFirstChild(zoneName)
                    if not zone and zoneFailsafeMap[zoneName] then
                        zone = workspace.zones.fishing:FindFirstChild(zoneFailsafeMap[zoneName])
                    end
                    return zone
                end

                local function freezeCharacter(position)
                    humanoid.PlatformStand = true
                    rootPart.Velocity = Vector3.zero
                    rootPart.CFrame = CFrame.new(position)
                end

                while var.AutoBestiaryEnabled do
                    task.wait()

                    local uncompletedFish = getUncompletedFish()
                    if #uncompletedFish == 0 then
                        print("All bestiary entries are completed!")
                        break
                    end

                    -- Get the next fish to complete
                    local nextFish = uncompletedFish[1]
                    print("Fishing for: " .. nextFish.name .. " in zone: " .. nextFish.zone)
                    var.AutoBestiaryParagraph:SetDesc("<font color=\"rgb(255, 0, 0)\">NOTE: Auto Bestiary is new and was rushed, expect bugs. </font>\n<font color=\"rgb(255, 255, 255)\">Fishing for: </font>" .. nextFish.name .. "\n<font color=\"rgb(255, 255, 255)\">Zone: </font>" .. nextFish.zone)


                    -- Find the required zone
                    local targetZone = findZone(nextFish.zone)
                    if targetZone then
                        local targetPosition = targetZone.Position
                        local targetSize = targetZone.Size
                        local zonePosition = Vector3.new(
                            targetPosition.X,
                            targetPosition.Y + (targetSize.Y / 2) - 9, 
                            targetPosition.Z
                        )

                        -- Move to zone and freeze
                        rootPart.CFrame = CFrame.new(zonePosition)
                        task.wait(1) -- Allow some time for positioning
                        freezeCharacter(zonePosition)

                        while var.AutoBestiaryEnabled and #getUncompletedFish() > 0 do
                            task.wait()

                            local rod = character:FindFirstChild(getEquippedRod())
                            if rod then
                                local bobber = rod:FindFirstChild("bobber")
                                if bobber then
                                    -- Simulate casting the rod

                                    local targetPosition2 = targetZone.Position

                                    local targetSize2 = targetZone.Size
    
                                    bobber.CFrame = CFrame.new(targetPosition2.X, targetPosition2.Y - (targetSize2.Y / 2) + 2,targetPosition2.Z)
                                end
                            end

                            -- Ensure character stays in place
                            freezeCharacter(zonePosition)
                        end
                    else
                        warn("Zone not found for: " .. nextFish.zone)
                    end
                end

                -- Reset character state when Auto Bestiary stops
                humanoid.PlatformStand = false
                print("Auto Bestiary completed or stopped.")
            end)()
        else
            -- Disable Auto Bestiary
            var.AutoBestiaryEnabled = false
            print("Auto Bestiary disabled.")
        end
    end
})

sections.FishPlus:AddParagraph({
    Title = gradient("Auto Angler"),
    Description = "Still in testing, please report bugs in the discord server."
})

function checkAndSubmitQuest()
    local quests = game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Quests:GetChildren()
    local oldRod = getEquippedRod()
    local hasAnglerQuest = false
    
    for _, quest in ipairs(quests) do
        if string.find(quest.Name, "Angler Quest") then
            hasAnglerQuest = true  -- Mark that we found an "Angler Quest"
    
            local questChildren = quest:GetChildren()
            for _, child in ipairs(questChildren) do
                if string.find(child.Name, "_Goal") then
                    local targetFish = string.gsub(child.Name, "_Goal", "")
                    print(targetFish)
                    if LocalPlayer.Backpack:FindFirstChild(targetFish) then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        task.wait()
                        LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack[targetFish])
                        task.wait()
                        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("The Depths Angler"):WaitForChild("angler"):WaitForChild("questCompleted"):InvokeServer()
                        wait(1)
                        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("The Depths Angler"):WaitForChild("angler"):WaitForChild("giveQuest"):InvokeServer()
                        game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(oldRod)

                    else
                        print("no hab. lol")
                    end
                end
            end
        end
    end
    
    -- If no "Angler Quest" was found, trigger the fallback once
    if not hasAnglerQuest then
        print("fallback")
        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("The Depths Angler"):WaitForChild("angler"):WaitForChild("giveQuest"):InvokeServer()
    end      
end

function getAnglerQuestFish()
    local quests = game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Quests:GetChildren()
    for _, quest in ipairs(quests) do
        if string.find(quest.Name, "Angler Quest") then
            hasAnglerQuest = true  -- Mark that we found an "Angler Quest"
    
            local questChildren = quest:GetChildren()
            for _, child in ipairs(questChildren) do
                if string.find(child.Name, "_Goal") then
                    local targetFish = string.gsub(child.Name, "_Goal", "")
                    return targetFish
                end
            end
        end
    end
end

print("here 3")
-- wait(10))
sections.FishPlus:AddToggle("SpecificFishing", {
    Title = "Auto Angler Fishing",
    Default = false,
    Description = "Enable this and auto angler.",
    Callback = function(isEnabled)
        var.SpecificFishingEnabled = isEnabled

        if var.SpecificFishingEnabled then
            coroutine.wrap(function()
                local player = game:GetService("Players").LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local humanoid = character:WaitForChild("Humanoid")
                local rootPart = character:WaitForChild("HumanoidRootPart")

                -- Specific target coordinates
                local targetPosition = Vector3.new(961.9736328125, -770.3114624023438, 1414.6876220703125)

                local function freezeCharacter(position)
                    humanoid.PlatformStand = true
                    rootPart.Velocity = Vector3.zero
                    rootPart.CFrame = CFrame.new(position)
                end

                -- Move to position and freeze
                rootPart.CFrame = CFrame.new(targetPosition)
                task.wait(1) -- Allow time for positioning
                freezeCharacter(targetPosition)

                while var.SpecificFishingEnabled do
                    task.wait()

                    local rod = character:FindFirstChild(getEquippedRod())
                    if rod then
                        local bobber = rod:FindFirstChild("bobber")
                        if bobber then
                            -- Position the bobber slightly above the target position
                            local bobberPosition = Vector3.new(
                                targetPosition.X,
                                targetPosition.Y + 2, -- Adjust this offset if needed
                                targetPosition.Z
                            )
                            bobber.CFrame = CFrame.new(bobberPosition)
                        end
                    end

                    -- Ensure character stays in place
                    freezeCharacter(targetPosition)
                end

                -- Reset character state when fishing stops
                humanoid.PlatformStand = false
                print("Specific location fishing stopped.")
            end)()
        else
            -- Disable specific fishing
            var.SpecificFishingEnabled = false
            print("Specific location fishing disabled.")
        end
    end
})




FishinZone = sections.FishPlus:AddToggle("AutoAngler", {
    Title = "Auto Angler",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoAngler = isEnabled
        if var.autoAngler then
            -- LOAD ANGLER
            if not var.anglerLoaded then

                -- loads angler so u can talk to him and shii
                LocalPlayer:RequestStreamAroundAsync(Vector3.new(981.8839111328125, -702.6148681640625, 1232.17529296875))
                if workspace.world.npcs:FindFirstChild("The Depths Angler") then
                    workspace.world.npcs:FindFirstChild("The Depths Angler").ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                    workspace.world.npcs:FindFirstChild("The Depths Angler").dialogprompt.Parent = LocalPlayer.Character
                    for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
                        if obj:IsA("ProximityPrompt") then
                            obj.HoldDuration = 0
                            obj:InputHoldBegin()
                            task.wait(0.01)
                            obj:InputHoldEnd()
                            obj.Parent = workspace.world.npcs["The Depths Angler"]
                        end
                    end
                    print("here 1")
                    -- initializing, this part makes sure the user has a quest, if not, it gives them a quest.
                    local quests = game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Quests:GetChildren()
                        
                    local hasAnglerQuest = false
                        
                    for _, quest in ipairs(quests) do
                        if string.find(quest.Name, "Angler Quest") then
                            hasAnglerQuest = true
                        end
                    end
                    if not hasAnglerQuest then
                        print("fallback")
                        workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("The Depths Angler"):WaitForChild("angler"):WaitForChild("giveQuest"):InvokeServer()
                    end 
                    print("here 2")
                    var.anglerLoaded = true
                else
                    lib:Notification("Auto Angler", "Failed to load Angler, try toggling on again..", 5)
                end
            end
            print("here 3")
            -- done!
            while var.autoAngler do
                print("here 4")
                if LocalPlayer.Backpack:FindFirstChild(getAnglerQuestFish()) then
                    submittingAnglerQuest = true
                    repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild("reel") and not LocalPlayer.PlayerGui:FindFirstChild("shakeui")
                    if not var.autoAngler then break end
                    print("this")
                    checkAndSubmitQuest()
                    wait(1)
                else
                    submittingAnglerQuest = false
                    print("this 2")
                
                    local requiredFish = getAnglerQuestFish()
                    local fishObtained = false  -- Flag to track when fish is added
                
                    local fishAddedConnection
                    fishAddedConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                        if child.Name == requiredFish then
                            print("got the fish :)")
                            fishObtained = true  -- Set flag to true
                            fishAddedConnection:Disconnect() -- Disconnect to avoid multiple prints
                        end
                    end)
                
                
                    -- Wait until the required fish is obtained
                    repeat task.wait(0.1) until fishObtained
                    submittingAnglerQuest = true
                    wait(1)
                
                    print("Fish acquired, resuming process!")
                end
                
                task.wait(1)
            end
        end
    end)
})


-- sections.FishPlus:AddButton({
--     Title = "Create Safe Zone",
--     Variant = "Primary",
--     Callback = function()
--         local SafeZone = Instance.new("Part")
--         SafeZone.Size = Vector3.new(15, 1, 15)
--         SafeZone.Position = Vector3.new(math.random(-2000,2000), math.random(50000,90000), math.random(-2000,2000))
--         SafeZone.Anchored = true
--         SafeZone.BrickColor = BrickColor.new("Royal purple")
--         SafeZone.Material = Enum.Material.ForceField
--         SafeZone.Parent = game.Workspace
--         LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 5, 0)
--     end,
-- })

print("here 4")
-- wait(10))
var.BaitParagraph = sections.FishBait:AddParagraph({
    Title = gradient("Optimal Bait:"),
    Description = "Info"
})

sections.FishBait:AddDropdown("FishBait", {
    Title = "Prioritized Bait",
    Description = "Most & Least uses the baits you have the most or least of.",
    Options = {"Most", "Least", "Lure Speed", "Luck", "Universal Luck", "Resilience"},
    Default = "",
    PlaceHolder = "Select Bait",
    Multiple = false,
    Callback = function(selectedBait)
        var.SelectedBait = selectedBait
        if var.SelectedBait == "Lure Speed" then
            var.SelectedBait = "LureSpeed"
        elseif var.SelectedBait == "Universal Luck" then
            var.SelectedBait = "GenerelLuck"
        end
    end
})


-- sections.FishBait:AddDropdown("FishBait", {
--     Title = "Bait Event Overrides",
--     Description = "The bait used whilst event override is active.",
--     Options = {"Most", "Least", "Lure Speed", "Luck", "Universal Luck", "Resilience"},
--     Default = "",
--     PlaceHolder = "Select Bait",
--     Multiple = false,
--     Callback = function(selectedBait)
--         var.SelectedBait = selectedBait
--         if var.SelectedBait == "Lure Speed" then
--             var.SelectedBait = "LureSpeed"
--         elseif var.SelectedBait == "Universal Luck" then
--             var.SelectedBait = "GenerelLuck"
--         end
--     end
-- })



var.AutoBaitToggle = sections.FishBait:AddToggle("Auto Bait", {
    Title = "Auto Bait",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoBait = isEnabled
        while var.AutoBait do
            local bait = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait
            availableBaits = {}

            for _, child in ipairs(bait:GetChildren()) do
                if child.Value ~= 0 then
                    local baitName = string.sub(child.Name, 6) -- Remove the "bait_" prefix
                    table.insert(availableBaits, baitName)
                end
            end

            determineBestBait()
            wait(1)
        end
    end)
})

-- local giantBarConnection

-- sections.FishSettings:AddToggle("GiantBar", {
--     Title = "Giant Reel Bar",
--     Default = false,
--     Description = "Broken",
--     Callback = function(isEnabled)
--         var.GiantBar = isEnabled

--         if giantBarConnection then
--             giantBarConnection:Disconnect()
--             giantBarConnection = nil
--         end

--         if isEnabled then
--             local playerGui = LocalPlayer.PlayerGui
--             giantBarConnection = playerGui.ChildAdded:Connect(function(child)
--                 if child.Name == "reel" then
--                     local playerBar = child:FindFirstChild("bar") and child.bar:FindFirstChild("playerbar")
--                     if playerBar then
--                         task.wait(0.3)
--                         playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                         playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                     end
--                 end
--             end)

--             -- Apply changes to existing reel, if any
--             local reel = playerGui:FindFirstChild("reel")
--             if reel then
--                 local playerBar = reel:FindFirstChild("bar") and reel.bar:FindFirstChild("playerbar")
--                 if playerBar then
--                     playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--                     playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
--                 end
--             end
--         end
--     end
-- })


-- local playerBar = LocalPlayer.PlayerGui:FindFirstChild("reel"):FindFirstChild("bar"):FindFirstChild("playerbar")
-- if playerBar then
--     playerBar.Size = UDim2.new(1, 0, 1.3, 0)
--     playerBar.Position = UDim2.new(0.5, 0, 0.5, 0)
-- end

sections.FishSettings:AddToggle("PerfectCatch", {
    Title = "Perfect Catch",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        var.PerfectCatch = isEnabled
    end
})

sections.FishSettings:AddToggle("NoCutscene", {
    Title = "Remove Cutscene",
    Default = false,
    Description = "Irreversable, gotta rejoin, it's a toggle so people can use config.",
    Callback = function(isEnabled)
        var.removeCutscene = isEnabled
        if var.removeCutscene then
            pcall(function()
                ReplicatedStorage.events.LocalCutscene:Destroy()
                ReplicatedStorage.packages.Net["RE/RequestCutscene"]:Destroy()
                ReplicatedStorage.packages.Net["RE/RequestCutsceneSync"]:Destroy()
            end)
        end
    end
})

-- sections.FishSettings:AddButton({
--     Title = "Exploit Rod",
--     Callback = function()
--         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--     end,
-- })


sections.FishSettings:AddToggle("QuickCast", {
    Title = "Quick Cast",
    Default = false,
    Description = "Premium Feature",
    Callback = function(isEnabled)
        var.QuickCatch = isEnabled
    end,
})

sections.FishSettings:AddButton({
    Title = "Exploit Rod",
    Callback = function()
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
    end,
})


sections.FishSettings:AddSlider("AutoShakeDelay", {
    Title = "Auto Shake Delay",
    Description = "Set this to 0 if you want super fast.",
    Default = 0,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.AutoShakeDelay = value * 0.001
        -- print(variables.AutoShakeDelay)
    end,
})

sections.FishSettings:AddSlider("AutoCastPower", {
    Title = "Auto Cast Power",
    Description = "",
    Default = 100,
    Min = 1,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.autoCastPower = value
    end,
})

sections.FishSettings:AddSlider("AutoCastDelay", {
    Title = "Auto Cast Delay",
    Description = "This is in 100ms increments (0.1s)",
    Default = 5,
    Min = 0,
    Max = 20,
    Increment = 1,
    Callback = function(value)
        variables.AutoCastDelay = value * 0.1
        -- print(variables.AutoShakeDelay)
    end,
})

local ShakeOptions = {"Navigation","Click"}

if replicatesignal then
table.insert(ShakeOptions,"ReplicateSignal")
end

sections.FishSettings:AddDropdown("FischShakeMethod", {
    Title = "Auto Shake Method",
    Description = "",
    Options = ShakeOptions,
    Default = "Navigation",
    PlaceHolder = "Select Method",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Navigation" then
            variables.ShakeMethod = selectedOptions
        elseif selectedOptions == "Click" then
            variables.ShakeMethod = selectedOptions
        elseif selectedOptions == "ReplicateSignal" then
            variables.ShakeMethod = selectedOptions
        end
    end
})

sections.FishSettings:AddDropdown("FischCatchMethod", {
    Title = "Auto Reel Method",
    Description = "",
    Options = {"Instant","Follow Bar", "Super Mode"},
    Default = "Instant",
    PlaceHolder = "Select Method",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Instant" then
            variables.ReelMethod1 = true
            variables.ReelMethod2 = false
            variables.ReelMethod3 = false
        elseif selectedOptions == "Follow Bar" then
            variables.ReelMethod2 = true
            variables.ReelMethod1 = false
            variables.ReelMethod3 = false
        elseif selectedOptions == "Super Mode" then
            variables.ReelMethod3 = true
            variables.ReelMethod1 = false
            variables.ReelMethod2 = false
        end
    end
})

sections.FishSettings:AddDropdown("FischCatchMethod2", {
    Title = "Auto Reel V2 Method",
    Description = "",
    Options = {"Instant","SuperMode", "Follow Bar"},
    Default = "Instant",
    PlaceHolder = "Select Method",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "Instant" then
            var.ReelMethod = selectedOptions
        elseif selectedOptions == "Follow Bar" then
            var.ReelMethod = selectedOptions
        elseif selectedOptions == "SuperMode" then
            var.ReelMethod = selectedOptions
        end
    end
})



local availablePlayerRods = {}
for _, rod in ipairs(ReplicatedStorage.playerstats[LocalPlayer.Name].Rods:GetChildren()) do
    table.insert(availablePlayerRods, rod.Name) -- Add each child to the playerRods table
end

sections.FishSettings:AddDropdown("RodOnEventOverride", {
    Title = "Event Override - Rod",
    Description = "",
    Options = availablePlayerRods,
    Default = "",
    PlaceHolder = "Select Rod",
    Multiple = false,
    Callback = function(selectedRod)
        var.eventOverrideRod = selectedRod
    end
})

sections.FishSettings:AddSlider("SnapChance", {
    Title = "Snap Chance",
    Description = "",
    Default = 0,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        variables.snapChance = value
    end,
})

local raritiesList = {}
for name, _ in pairs(data.Rarities) do
    table.insert(raritiesList, name)
end

sections.FishSettings:AddDropdown("IgnoreSnapRarity", {
    Title = "Ignore Snap Rarity",
    Description = "",
    Options = raritiesList,
    Default = "",
    PlaceHolder = "Select Rarity",
    Multiple = true,
    Callback = function(selectedRarities)
        var.ignoreSnapRarities = selectedRarities
    end
})

sections.FishSettings:AddParagraph({
    Title = gradient("Auto Passive"),
    Description = "Please do not use with snap chance/ignore snap rarity, compatibility issues.\n<font color=\"rgb(255, 0, 0)\">Only works on 'Instant' Auto Reel Method</font>\n<font color=\"rgb(255, 255, 0)\">THIS FEATURE UTLIZES SNAPPING, BECAREFUL WITH YOUR STREAKS!!</font>"
})

sections.FishSettings:AddDropdown('PassiveDropDown', {
    Title = 'Select Passive',
    Description = '',
    Options = {'None', 'ROTZ', 'ROTFF', 'ROTEK'},
    Multiple = false,
    Default = 'None',
    Callback = function(Value)
        var.selectedPassive = Value
    end
})


-- sections.FishSettings:AddSlider("PassiveTriggerNumber", {
--     Title = "Passive Trigger",
--     Description = "How many times until your passive triggers. Ex: ROTFF - 3",
--     Default = 3,
--     Min = 1,
--     Max = 10,
--     Increment = 1,
--     Callback = function(Value)
--         passiveTriggerNumber = Value
--     end,
-- })

local allFish_Rarity = {}

for name, _ in pairs(data.Rarities) do
    table.insert(allFish_Rarity, name)
end


if type(data.Fish) == "table" then
    for fishName, fishData in pairs(data.Fish) do
        table.insert(allFish_Rarity, fishName)
    end
end


sections.FishSettings:AddDropdown("TriggerRarityOrFish", {
    Title = "Trigger Rarity/Fish",
    Description = "",
    Options = allFish_Rarity,
    Default = "",
    PlaceHolder = "Select Rarity/Fish | Leave unselected if all.",
    Multiple = true,
    Callback = function(Value)
        var.triggerRarityFish = Value
    end
})

AutoPassive = sections.FishSettings:AddToggle("AutoPassiveToggle", {
    Title = "Auto Passive",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        autoPassive = isEnabled
        if var.selectedPassive == 'ROTFF' and autoPassive then 
            if getEquippedRod() ~= 'Rod Of The Forgotten Fang' then
                lib:Notification("Passive Helper", "You do not have this rod equipped!", 5)
                AutoPassive:Set(false)
                return
            end
            local currentRod = getEquippedRod()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer("Flimsy Rod")
            task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(currentRod)
            PassiveHelper.ROTFF = 0
        end
        if var.selectedPassive == 'ROTEK' and autoPassive then 
            if getEquippedRod() ~= 'Rod Of The Eternal King' then
                lib:Notification("Passive Helper", "You do not have this rod equipped!", 5)
                AutoPassive:Set(false)
                return
            end
            local currentRod = getEquippedRod()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer("Flimsy Rod")
            task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(currentRod)
            -- tracking isn't needed for rotek ig
            -- PassiveHelper.ROTEK = 0
        end
        if var.selectedPassive == 'ROTZ' and autoPassive then 
            if getEquippedRod() ~= 'Rod Of The Zenith' then
                lib:Notification("Passive Helper", "You do not have this rod equipped!", 5)
                AutoPassive:Set(false)
                return
            end
            local currentRod = getEquippedRod()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer("Flimsy Rod")
            task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(currentRod)
            lib:Notification("Auto Passive", "ROTZ is a bit weird, first few casts are gonna be glitchy, but after that should be fine.", 8)
            -- tracking isn't needed for rotek ig
            -- PassiveHelper.ROTEK = 0
        end
    end
})









-- game:GetService("Players").LocalPlayer.Backpack

var.InventoryValue = sections.Item0:AddParagraph({
    Title = gradient("Inventory Information"),
    Description = "You have <font color=\"rgb(255,0,0)\">___</font> total fish, <font color=\"rgb(255,0,0)\">___</font> favourited, and <font color=\"rgb(255,0,0)\">___</font> of the held fish.\nInventory Value: <font color=\"rgb(255,0,0)\">Offline</font>\nHeld Item Value: <font color=\"rgb(255,0,0)\">Offline</font>"
})


sections.Item0:AddToggle("CheckValue", {
    Title = "Check Info",
    Default = false,
    Description = "Off by default because performance.",
    Callback = function(isEnabled)
        var.CheckValue = isEnabled
    end,
})


function calculateInventoryValue()
    _G.totalValue = 0
    _G.handValue = 0
    _G.backpackItems = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory:GetChildren()

    for _, v in ipairs(_G.backpackItems) do
        _G.itemValue = GetBackPackItemValue(v)
        if _G.itemValue then
            _G.totalValue += _G.itemValue
        end
    end

    local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("link") then
        _G.handValue = GetBackPackItemValue(tool.link.Value)
    end

    local favourited = 0
    local totalFish = 0
    for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if not item:FindFirstChild("link") then continue end
        local link = item.link.Value
    
        if link:FindFirstChild("Favourited") then
            favourited += 1
        end
        if link:FindFirstChild("Stack") then
            totalFish += link.Stack.Value
        end
    end

    -- Calculate total held fish with default value for ItemName
    local totalHeldFish = 0
    local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local ItemName = tool and tool.Name or "Flimsy Rod"

    for _, v in next, game:GetService("ReplicatedStorage").playerstats[game:GetService("Players").LocalPlayer.Name].Inventory:GetChildren() do
        if string.find(v.Name, ItemName) and v:FindFirstChild("Stack") then
            totalHeldFish = totalHeldFish + v.Stack.Value
        end
    end

    -- print("totalHeldFish:", totalHeldFish)

    pcall(function()
        var.InventoryValue:SetDesc(string.format(
            'You have <font color="#FFFFFF">%s</font> total fish, <font color="#FFFF00">%s</font> favourited, and <font color="#FFFFFF">%s</font> of the held fish.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
            formatNumber(totalFish),  -- Total fish in white
            formatNumber(favourited), -- Favourited in yellow
            formatNumber(totalHeldFish),
            formatPrice(_G.totalValue),
            formatPrice(_G.handValue)
        ))
    end)
    pcall(function()
        var.InventoryValueGift:SetDesc(string.format(
            'You have <font color="#FFFFFF">%s</font> total fish, <font color="#FFFF00">%s</font> favourited, and <font color="#FFFFFF">%s</font> of the held fish.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
            formatNumber(totalFish),  -- Total fish in white
            formatNumber(favourited), -- Favourited in yellow
            formatNumber(totalHeldFish),
            formatPrice(_G.totalValue),
            formatPrice(_G.handValue)
        ))
    end)
    return formatPrice(_G.totalValue)
end
-- function calculateInventoryValue()
--     _G.totalValue = 0
--     _G.handValue = 0
--     _G.backpackItems = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory:GetChildren()

--     for _, v in ipairs(_G.backpackItems) do
--         _G.itemValue = GetBackPackItemValue(v)
--         if _G.itemValue then
--             _G.totalValue += _G.itemValue
--         end
--     end

--     local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--     if tool and tool:FindFirstChild("link") then
--         _G.handValue = GetBackPackItemValue(tool.link.Value)
--     end

--     local favourited = 0
--     local totalFish = 0
--     for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
--         if not item:FindFirstChild("link") then continue end
--         local link = item.link.Value
    
--         if link:FindFirstChild("Favourited") then
--             favourited += 1
--         end
--         if link:FindFirstChild("Stack") then
--             totalFish += link.Stack.Value
--         end
--     end


--     local totalHeldFish = 0
--     local ItemName = LocalPlayer.Character:FindFirstChildOfClass("Tool").Name

--     for _, v in next, game:GetService("ReplicatedStorage").playerstats[game:GetService("Players").LocalPlayer.Name].Inventory:GetChildren() do
--         if string.find(v.Name, ItemName) then
--             totalHeldFish = totalHeldFish + v:FindFirstChild("Stack").Value
--         end
--     end

--     print(totalHeldFish)

--     pcall(function()
--     var.InventoryValue:SetDesc(string.format(
--         'You have <font color="#FFFFFF">%s</font> total fish, <font color="#FFFF00">%s</font> favourited, and <font color="#FFFFFF">%s</font> of the held fish.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
--         formatNumber(totalFish),  -- Total fish in white
--         formatNumber(favourited), -- Favourited in yellow
--         formatNumber(totalHeldFish),
--         formatPrice(_G.totalValue),
--         formatPrice(_G.handValue)
--         ))
--     end)
--     pcall(function()
--         var.InventoryValueGift:SetDesc(string.format(
--             'You have <font color="#FFFFFF">%s</font> total fish, <font color="#FFFF00">%s</font> favourited, and <font color="#FFFFFF">%s</font> of the held fish.\nInventory Value: <font color="#FFFDE4">%s</font>\nHeld Item Value: <font color="#FFFDE4">%s</font>',
--             formatNumber(totalFish),  -- Total fish in white
--             formatNumber(favourited), -- Favourited in yellow
--             formatNumber(totalHeldFish),
--             formatPrice(_G.totalValue),
--             formatPrice(_G.handValue)
--         ))
--     end)
--     return formatPrice(_G.totalValue)
-- end

function getInventoryValue()
    local totalValue = 0
    local backpackItems = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory:GetChildren()

    for _, v in ipairs(backpackItems) do
        local itemValue = GetBackPackItemValue(v)
        if itemValue then
            totalValue = totalValue + itemValue  -- Use the = operator for addition
        end
    end

    return totalValue
end



task.spawn(LPH_JIT_MAX(function()
    while task.wait(1) do
        if var.CheckValue then
            calculateInventoryValue()
        end
    end
end))

print("here inf")
-- wait(10))

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Store ESP text objects
local espTexts = {}
local zoneESPTexts = {}

-- ESP Settings
var.PlayerESP = false
var.ESPColor = Color3.new(1, 1, 1)
var.selectedZoneESP = {}

-- Function to check zones
sections.Visuals3:AddColorpicker("ESPColor", {
    Title = "Player ESP Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(selectedColor)
        var.ESPColor = selectedColor
        -- Update color for all existing ESP texts
        for _, espInfo in pairs(espTexts) do
            if espInfo.text then
                espInfo.text.Color = selectedColor
            end
        end
        -- Update color for all zone ESP texts
        for _, text in pairs(zoneESPTexts) do
            if text then
                text.Color = selectedColor
            end
        end
        -- Update glow color if enabled
        if var.ESPGlow then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local highlight = player.Character:FindFirstChild("ESP_GlowEffect")
                    if highlight then
                        highlight.OutlineColor = selectedColor
                    end
                end
            end
        end
    end,
})

local espTexts = {}
local activeCorners = {}
var.PlayerESP = false
var.ESPGlow = false
var.CornerESP = false
var.ESPColor = Color3.new(1, 1, 1)
var.CornerRotation = 0

-- Corner ESP creation function
local createCornerESP = LPH_JIT_MAX(function(character)
    if activeCorners[character] then return end
    activeCorners[character] = true

    local bill = Instance.new("BillboardGui", character)
    bill.Name = "Corner ESP"
    bill.AlwaysOnTop = true
    bill.ResetOnSpawn = false
    bill.Size = UDim2.new(4, 0, 5, 0)

    local espImage = Instance.new("ImageLabel", bill)
    espImage.Name = "Image"
    espImage.BackgroundTransparency = 1
    espImage.Size = UDim2.new(1, 0, 1, 0)
    espImage.Image = "http://www.roblox.com/asset/?id=118343380464232"
    espImage.ImageColor3 = var.ESPColor

    local gradient = Instance.new("UIGradient", espImage)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, var.ESPColor)
    })
    gradient.Rotation = 90

    spawn(function()
        local direction = 1
        while character and character.Parent and activeCorners[character] do
            var.CornerRotation = var.CornerRotation + direction
            espImage.Rotation = var.CornerRotation
            if var.CornerRotation >= 360 then
                direction = -1
            elseif var.CornerRotation <= 0 then
                direction = 1
            end
            task.wait()
        end
        activeCorners[character] = nil
        if bill then
            bill:Destroy()
        end
    end)
end)

sections.Visuals3:AddToggle("TogglePlayerESP", {
    Title = "Player ESP",
    Default = false,
    Description = "Display information above players",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.PlayerESP = isEnabled
        
        while var.PlayerESP do
            -- Clean up ESP texts for players who left
            for userId, espInfo in pairs(espTexts) do
                if not Players:GetPlayerByUserId(userId) then
                    if espInfo.text then
                        espInfo.text:Remove()
                    end
                    espTexts[userId] = nil
                end
            end
            
            -- Update ESP for all players
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local character = player.Character
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoidRootPart and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local camera = workspace.CurrentCamera
                        local screenPosition, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
                        
                        -- Calculate distance
                        local distance = (LocalPlayer.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
                        
                        -- Get or create ESP text for this player
                        if not espTexts[player.UserId] then
                            espTexts[player.UserId] = {
                                text = Drawing.new("Text")
                            }
                            local text = espTexts[player.UserId].text
                            text.Size = 20
                            text.Color = var.ESPColor
                            text.Center = true
                            text.Outline = true
                            text.OutlineColor = Color3.new(0, 0, 0)
                            text.Visible = true
                        end
                        
                        local text = espTexts[player.UserId].text
                        
                        if onScreen then
                            text.Position = Vector2.new(screenPosition.X, screenPosition.Y - 50)
                            text.Text = string.format(player.Name .. " | " .. math.round(distance) .. "m")
                            text.Visible = true
                        else
                            text.Visible = false
                        end
                    end
                end
            end
            
            task.wait()
        end
        
        -- Clean up all ESP texts when disabled
        if not var.PlayerESP then
            for _, espInfo in pairs(espTexts) do
                if espInfo.text then
                    espInfo.text:Remove()
                end
            end
            espTexts = {}
        end
    end)
})

sections.Visuals3:AddToggle("TogglePlayerGlow", {
    Title = "Player Glow",
    Default = false,
    Description = "Make players glow",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.ESPGlow = isEnabled
        
        while var.ESPGlow do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local highlight = player.Character:FindFirstChild("ESP_GlowEffect")
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Name = "ESP_GlowEffect"
                        highlight.FillTransparency = 1
                        highlight.OutlineColor = var.ESPColor
                        highlight.Parent = player.Character
                    end
                end
            end
            task.wait()
        end
        
        -- Clean up glow effects when disabled
        if not var.ESPGlow then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local highlight = player.Character:FindFirstChild("ESP_GlowEffect")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end)
})

sections.Visuals3:AddToggle("ToggleCornerESP", {
    Title = "Corner ESP",
    Default = false,
    Description = "Display spinning corners around players",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.CornerESP = isEnabled
        
        while var.CornerESP do
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    createCornerESP(player.Character)
                end
            end
            task.wait()
        end
        
        -- Clean up corner ESP when disabled
        if not var.CornerESP then
            for character, _ in pairs(activeCorners) do
                activeCorners[character] = nil
                local cornerESP = character:FindFirstChild("Corner ESP")
                if cornerESP then
                    cornerESP:Destroy()
                end
            end
        end
    end)
})

local zoneESPTexts = {}
local zoneGlowEffects = {}
local activeZoneCorners = {}
var.ZoneESP = false
var.ZoneGlowESP = false
var.ZoneCornerESP = false
var.ZoneESPRotation = 0

-- Helper function to create or update corner ESP
local function createZoneCornerESP(zone, zoneName)
    if not zone or activeZoneCorners[zone] then return end
    activeZoneCorners[zone] = true

    local bill = Instance.new("BillboardGui")
    bill.Name = "Zone Corner ESP"
    bill.AlwaysOnTop = true
    bill.ResetOnSpawn = false
    bill.Size = UDim2.new(10, 0, 10, 0)
    bill.Parent = zone

    local espImage = Instance.new("ImageLabel")
    espImage.Name = "Image"
    espImage.BackgroundTransparency = 1
    espImage.Size = UDim2.new(1, 0, 1, 0)
    espImage.Image = "http://www.roblox.com/asset/?id=118343380464232"
    espImage.ImageColor3 = var.ESPColor
    espImage.Parent = bill

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, var.ESPColor)
    })
    gradient.Rotation = 90
    gradient.Parent = espImage

    spawn(function()
        local direction = 1
        while zone and zone.Parent and activeZoneCorners[zone] and var.ZoneCornerESP do
            var.ZoneESPRotation = var.ZoneESPRotation + direction
            espImage.Rotation = var.ZoneESPRotation
            if var.ZoneESPRotation >= 360 then
                direction = -1
            elseif var.ZoneESPRotation <= 0 then
                direction = 1
            end
            task.wait()
        end
        activeZoneCorners[zone] = nil
        if bill and bill.Parent then
            bill:Destroy()
        end
    end)
end

-- Helper function to create or update text ESP
local function updateZoneESP(zone, zoneName)
    if not zone or not zoneName then return end
    
    local camera = workspace.CurrentCamera
    local position = zone:IsA("BasePart") and zone.Position or zone:GetPivot().Position
    local screenPosition, onScreen = camera:WorldToViewportPoint(position)
    
    -- Create or get text ESP
    if not zoneESPTexts[zoneName] and var.ZoneESP then
        zoneESPTexts[zoneName] = Drawing.new("Text")
        zoneESPTexts[zoneName].Size = 20
        zoneESPTexts[zoneName].Center = true
        zoneESPTexts[zoneName].Outline = true
        zoneESPTexts[zoneName].Color = var.ESPColor
        zoneESPTexts[zoneName].OutlineColor = Color3.new(0, 0, 0)
    end
    
    -- Update text ESP
    if zoneESPTexts[zoneName] then
        if onScreen and var.ZoneESP then
            local distance = (workspace.CurrentCamera.CFrame.Position - position).Magnitude
            local displayText = zoneName
            
            -- Add abundance info if available
            local abundance = zone:FindFirstChild("Abundance")
            if abundance then
                local chance = abundance:FindFirstChild("Chance")
                local mutation = abundance:FindFirstChild("Mutation")
                if chance and mutation then
                    displayText = string.format("%s\nChance: %d%% | Mutation: %d%%", 
                        zoneName, 
                        math.round(chance.Value * 100),
                        math.round(mutation.Value * 100))
                end
            end
            
            zoneESPTexts[zoneName].Position = Vector2.new(screenPosition.X, screenPosition.Y)
            zoneESPTexts[zoneName].Text = displayText .. string.format("\nDistance: %dm", math.round(distance))
            zoneESPTexts[zoneName].Visible = true
        else
            zoneESPTexts[zoneName].Visible = false
        end
    end
    
    -- Create or update glow ESP
    if var.ZoneGlowESP then
        if not zoneGlowEffects[zoneName] then
            local highlight = Instance.new("Highlight")
            highlight.Name = "Zone_GlowEffect"
            highlight.FillTransparency = 1
            highlight.OutlineColor = var.ESPColor
            highlight.Parent = zone
            zoneGlowEffects[zoneName] = highlight
        end
    elseif zoneGlowEffects[zoneName] then
        zoneGlowEffects[zoneName]:Destroy()
        zoneGlowEffects[zoneName] = nil
    end
    
    -- Create or update corner ESP
    if var.ZoneCornerESP then
        createZoneCornerESP(zone, zoneName)
    end
end

sections.Visuals3:AddDropdown("FishZonesESPDropDown", {
    Title = "Fish Zones",
    Description = "",
    Options = {"Orcas Pool","The Kraken Pool", "The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Bluefin Tuna Abundance", "Arapaima Abundance", "Swordfish Abundance", "Chinook Salmon Abundance", "Amberjack Abundance", "Mackerel Abundance", "Nuclear"},
    Default = "",
    PlaceHolder = "Select Zones",
    Multiple = true,
    Callback = function(selectedZoneESP)
        var.selectedZoneESP = selectedZoneESP
    end,
})

sections.Visuals3:AddToggle("ToggleZoneESP", {
    Title = "Zone ESP",
    Default = false,
    Description = "Display text above selected zones",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.ZoneESP = isEnabled
        
        if not isEnabled then
            for _, text in pairs(zoneESPTexts) do
                if text then text:Remove() end
            end
            zoneESPTexts = {}
        end
    end)
})

sections.Visuals3:AddToggle("ToggleZoneGlow", {
    Title = "Zone Glow",
    Default = false,
    Description = "Make selected zones glow",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.ZoneGlowESP = isEnabled
        
        if not isEnabled then
            for _, highlight in pairs(zoneGlowEffects) do
                if highlight then highlight:Destroy() end
            end
            zoneGlowEffects = {}
        end
    end)
})

sections.Visuals3:AddToggle("ToggleZoneCorners", {
    Title = "Zone Corners",
    Default = false,
    Description = "Display spinning corners around selected zones",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.ZoneCornerESP = isEnabled
        
        if not isEnabled then
            for zone, _ in pairs(activeZoneCorners) do
                activeZoneCorners[zone] = nil
                local cornerESP = zone:FindFirstChild("Zone Corner ESP")
                if cornerESP then cornerESP:Destroy() end
            end
        end
    end)
})

-- Main update loop
spawn(function()
    while true do
        if var.ZoneESP or var.ZoneGlowESP or var.ZoneCornerESP then
            -- Check for specific zones first
            if table.find(var.selectedZoneESP or {}, "The Depths - Serpent") then
                local zone = workspace.zones.fishing:FindFirstChild("The Depths - Serpent")
                if zone then updateZoneESP(zone, "The Depths - Serpent") end
            end
            
            if table.find(var.selectedZoneESP or {}, "The Kraken Pool") then
                local zone = workspace.zones.fishing:FindFirstChild("The Kraken Pool") or workspace.zones.fishing:FindFirstChild("Ancient Kraken Pool")
                if zone then updateZoneESP(zone, "The Kraken Pool") end
            end

            if table.find(var.selectedZoneESP or {}, "Orcas Pool") then
                local zone = workspace.zones.fishing:FindFirstChild("Orcas Pool")
                if zone then updateZoneESP(zone, "Orcas Pool") end
            end
            
            -- Check for other zones
            for _, child in ipairs(workspace.zones.fishing:GetChildren()) do
                -- Check beacon zones
                if child:FindFirstChild("beacon") then
                    local poiHeader = child:FindFirstChild("POIHeader")
                    if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                        local titleText = poiHeader.title.Text
                        for _, zoneName in ipairs(var.selectedZoneESP or {}) do
                            if string.find(titleText, zoneName) then
                                updateZoneESP(child, zoneName)
                            end
                        end
                    end
                end
                
                -- Check abundance zones
                local abundance = child:FindFirstChild("Abundance")
                if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
                    for _, zoneName in ipairs(var.selectedZoneESP or {}) do
                        if string.find(child.Name, zoneName) then
                            updateZoneESP(child, zoneName)
                        end
                    end
                end
            end
        end
        task.wait()
    end
end)
-- Helper function to update zone ESP
function updateZoneESP(zone, zoneName)
    if not zone then return end
    
    local camera = workspace.CurrentCamera
    local zonePosition = zone:GetPivot().Position
    local screenPosition, onScreen = camera:WorldToViewportPoint(zonePosition)
    
    if not zoneESPTexts[zoneName] then
        zoneESPTexts[zoneName] = Drawing.new("Text")
        local text = zoneESPTexts[zoneName]
        text.Size = 20
        text.Color = var.ESPColor
        text.Center = true
        text.Outline = true
        text.OutlineColor = Color3.new(0, 0, 0)
        text.Visible = true
    end
    
    local text = zoneESPTexts[zoneName]
    
    if onScreen then
        -- Calculate distance to zone
        local distance = 0
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            distance = (LocalPlayer.Character.HumanoidRootPart.Position - zonePosition).Magnitude
        end
        
        text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
        text.Text = string.format("%s\n%.1f studs", zoneName, distance)
        text.Visible = true
    else
        text.Visible = false
    end
end


local text
local currentModel2
var.BobberVisuals = false
var.BobberGlow = false
var.LunorESP = false
var.BobberColor = Color3.new(1, 1, 1)
var.LunorESPRotation = 0
local activeBobbers = {}

-- Single color picker for all bobber effects
sections.Visuals3:AddColorpicker("BobberColor", {
    Title = "Bobber ESP Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(selectedColor)
        var.BobberColor = selectedColor
        
        -- Update text color if active
        if text and var.BobberVisuals then
            text.Color = selectedColor
        end
        
        -- Update glow color if active
        if var.BobberGlow then
            local player = game:GetService("Players").LocalPlayer
            local bobberName = game:GetService("ReplicatedStorage").playerstats[tostring(player.Name)].Stats.bobber.Value
            local character = player.Character or player.CharacterAdded:Wait()
            local rod = character:FindFirstChild(PlayerStats.rod.Value)

            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    local bobberBobber = bobber:FindFirstChild(bobberName)
                    if bobberBobber then
                        local glowEffect = bobberBobber:FindFirstChild("Lunor_GlowEffect")
                        if glowEffect then
                            glowEffect.OutlineColor = selectedColor
                        end
                    end
                end
            end
        end
        
        -- Update ESP color if active
        if var.LunorESP then
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rod = character:FindFirstChild(PlayerStats.rod.Value)

            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    local bobberESP = bobber:FindFirstChild("Lunor ESP")
                    if bobberESP then
                        local imageLabel = bobberESP:FindFirstChild("Image")
                        if imageLabel then
                            imageLabel.ImageColor3 = selectedColor
                            local gradient = imageLabel:FindFirstChild("UIGradient")
                            if gradient then
                                gradient.Color = ColorSequence.new({
                                    ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
                                    ColorSequenceKeypoint.new(1, selectedColor)
                                })
                            end
                        end
                    end
                end
            end
        end
    end,
})


print("here 3")
-- wait(10))

sections.Visuals3:AddToggle("ToggleBobberVisuals", {
    Title = "Bobber Visuals",
    Default = false,
    Description = "Display Cool info on your bobber",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.BobberVisuals = isEnabled
        while var.BobberVisuals do
            local PlayerStats = game:GetService("ReplicatedStorage").playerstats[tostring(game:GetService("Players").LocalPlayer.Name)].Stats
            local character = game.Players.LocalPlayer.Character
            local rod = character:FindFirstChild(PlayerStats.rod.Value)

            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    local camera = workspace.CurrentCamera
                    local screenPosition, onScreen = camera:WorldToViewportPoint(bobber.Position)
                    
                    if onScreen then
                        if not text then
                            text = Drawing.new("Text")
                            text.Size = 20
                            text.Color = var.BobberColor
                            text.Center = true
                            text.Outline = true
                            text.OutlineColor = Color3.new(0, 0, 0)
                            text.Visible = true
                        end

                        local reelGui = LocalPlayer.PlayerGui:FindFirstChild("reel")
                        if reelGui then
                            local bar = reelGui:FindFirstChild("bar")
                            if bar then
                                local reel = bar:FindFirstChild("reel")
                                if reel then
                                    local fishValueObj = reel:FindFirstChild("fish")
                                    if fishValueObj then
                                        currentModel2 = fishValueObj.Value
                                    else
                                        currentModel2 = nil
                                    end
                                end
                            end
                        end

                        local lureText
                        if rod.values.lure.Value == 100 then
                            lureText = "Catching: " .. (currentModel2 or "Unknown")
                        else
                            lureText = "Lure: " .. string.format("%.3f", rod.values.lure.Value) .. "%"
                        end

                        text.Text = "Bobber | Zone: " .. tostring(rod.values.bobberzone.Value) .. " | " .. lureText
                        text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
                    else
                        if text then
                            text:Remove()
                            text = nil
                        end
                    end
                else
                    if text then
                        text:Remove()
                        text = nil
                    end
                end
            else
                if text then
                    text:Remove()
                    text = nil
                end
            end
            
            task.wait() 
        end
        if text and not var.BobberVisuals then
            text:Remove()
            text = nil
        end
    end)
})

sections.Visuals3:AddToggle("ToggleBobberGlow", {
    Title = "Bobber Glow",
    Default = false,
    Description = "Make your Bobber Glow",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.BobberGlow = isEnabled
        while var.BobberGlow do
            local player = game:GetService("Players").LocalPlayer
            local playerStats = game:GetService("ReplicatedStorage").playerstats[tostring(player.Name)].Stats
            local character = player.Character or player.CharacterAdded:Wait()
            local rodName = playerStats.rod.Value
            local bobberName = playerStats.bobber.Value

            local rod = character:FindFirstChild(rodName)
            if rod then
                local bobber = rod:FindFirstChild("bobber")
                if bobber then
                    local bobberPart = bobber:FindFirstChild(bobberName)
                    if bobberPart and not bobberPart:FindFirstChild("Lunor_GlowEffect") then
                        local glow = Instance.new("Highlight", bobberPart)
                        glow.Name = "Lunor_GlowEffect"
                        glow.FillTransparency = 1
                        glow.OutlineColor = var.BobberColor
                    end
                end
            end

            task.wait()
        end
    end)
})

local createBobberESP = LPH_JIT_MAX(function(bobber)
    if activeBobbers[bobber] then return end
    activeBobbers[bobber] = true

    local bill = Instance.new("BillboardGui", bobber)
    bill.Name = "Lunor ESP"
    bill.AlwaysOnTop = true
    bill.ResetOnSpawn = false
    bill.Size = UDim2.new(2, 0, 2, 0)

    local espImage = Instance.new("ImageLabel", bill)
    espImage.Name = "Image"
    espImage.BackgroundTransparency = 1
    espImage.Size = UDim2.new(1, 0, 1, 0)
    espImage.Image = "http://www.roblox.com/asset/?id=118343380464232"
    espImage.ImageColor3 = var.BobberColor

    local gradient = Instance.new("UIGradient", espImage)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
        ColorSequenceKeypoint.new(1, var.BobberColor)
    })
    gradient.Rotation = 90

    spawn(function()
        local direction = 1
        while bobber and bobber.Parent and activeBobbers[bobber] do
            var.LunorESPRotation = var.LunorESPRotation + direction
            espImage.Rotation = var.LunorESPRotation
            if var.LunorESPRotation >= 360 then
                direction = -1
            elseif var.LunorESPRotation <= 0 then
                direction = 1
            end
            task.wait()
        end
        activeBobbers[bobber] = nil
        if bill then
            bill:Destroy()
        end
    end)
end)

sections.Visuals3:AddToggle("BobberESP", {
    Title = "Bobber ESP",
    Default = false,
    Description = "Spinning Corners",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.LunorESP = isEnabled
        while var.LunorESP do
            local rod = ReplicatedStorage.playerstats[tostring(LocalPlayer)].Stats.rod.Value
            local bobber = LocalPlayer.Character:FindFirstChild(rod)

            if bobber then
                local bobber2 = bobber:FindFirstChild("bobber")
                if bobber2 then
                    createBobberESP(bobber2)
                end
            end

            task.wait()
        end
    end)
})


-- sections.Visuals3:AddToggle("Inventory Value", {
--     Title = "Exact Inventory Value",
--     Default = true,
--     Description = "Displays a text showing the total value of items",
--     Callback = function(isEnabled)
--         if isEnabled then
--                 function calculateInventoryValue()
--                 _G.totalValue = 0
--                 _G.backpackItems = LocalPlayer.PlayerGui.hud.safezone.backpack:GetDescendants()

--                 for _, v in ipairs(_G.backpackItems) do
--                     if v:IsA("ValueBase") and v.Name == "item" then
--                         print(v)
--                         _G.itemValue = GetBackPackItemValue(v.Value)
--                         if _G.itemValue then
--                             _G.totalValue += _G.itemValue
--                         end
--                     end
--                 end

--                 var.InventoryValue:SetDesc(string.format("Inventory Value: %s", _G.totalValue.."C$"))
--             end

--             calculateInventoryValue()
--             task.spawn(function()
--                 while isEnabled do
--                     calculateInventoryValue()
--                     task.wait(1)
--                 end
--             end)
--         else
--             var.InventoryValue:SetDesc("Inventory Value: Offline")
--         end
--     end,
-- })


AutoOpenItem = sections.Item:AddToggle("AutoOpenItem", {
    Title = "Auto Open Held Item",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoOpenItem = isEnabled
        while var.AutoOpenItem do
            local item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if item then
                item:Activate()
            else
                lib:Notification("Auto Open Item", "No item found to activate.", 5)
                var.AutoOpenItem = false
                AutoOpenItem:Set(false)
                return
            end
            task.wait()
        end
    end)
})


var.SkinCrateToggle = sections.Item:AddToggle("AutoOpenSkinCrate", {
    Title = "Auto Open Held Skin Crate",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.AutoOpenSkinCrate = isEnabled
        if var.AutoOpenSkinCrate then
            local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            
            if tool then
                if tool.Name == "Skin Crate" then
                    local skinLink = tostring(tool.link.Value)
                    local stackValue = tonumber(ReplicatedStorage.playerstats[game.Players.LocalPlayer.Name].Inventory[skinLink].Stack.Value)

                    for i = 1, stackValue do
                        ReplicatedStorage.packages.Net["RF/SkinCrates/RequestSpin"]:InvokeServer()
                        task.wait(8)

                        if not var.AutoOpenSkinCrate then
                            break
                        end
                    end

                    var.SkinCrateToggle:Set(false)
                    lib:Notification("Auto Open Skin Crate", "Completed", 5)

                else
                    lib:Notification("Auto Open Skin Crate", "You're not holding a Skin Crate...", 5)
                    var.SkinCrateToggle:Set(false)
                end
            else
                lib:Notification("Auto Open Skin Crate", "You're not holding a Skin Crate...", 5)
                var.SkinCrateToggle:Set(false)
            end
        end
    end,
})


local validItems = {}
if type(data.Items) == "table" then
    for itemName, itemData in pairs(data.Items) do
        if itemData.Price ~= "inf" and itemData.Price ~= "No Price" then
            local formattedPrice = formatPrice(itemData.Price)
            table.insert(validItems, itemName .. " - " .. formattedPrice)
        end
    end
end

-- Add the valid items to the dropdown
sections.Item:AddDropdown("PurchaseItem", {
    Title = gradient("Items"),
    Description = "",
    Options = validItems,  -- Use the formatted item names and prices
    Default = "",
    PlaceHolder = "Select Item",
    Multiple = false,
    Callback = function(selectedItem)
        -- print("Selected Item:", selectedItem)
        var.SelectedPurchaseItem = selectedItem
    end,
})


sections.Item:AddTextbox({
    Title = "Items - Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(purchaseAmount)
        var.PurchaseItemAmount = tonumber(purchaseAmount)
        -- print(purchaseAmount)
    end
})

sections.Item:AddButton({
    Title = "Purchase - Item(s)",
    Callback = function()
        local itemName, formattedPrice = var.SelectedPurchaseItem:match("^(.-) %- (.+)$")
        local price = unformatPrice(formattedPrice)

        if var.PurchaseItemAmount == nil then
            var.PurchaseItemAmount = 1
        end

        -- Get the item type from data.Items
        local itemType = data.Items[itemName] and data.Items[itemName].Type or "Unknown"

        -- Check if the player has enough coins
        if price * var.PurchaseItemAmount > ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value then
            lib:Notification("Purchase - Item(s)", "Insufficient cash, you need " .. formatNumber(price * var.PurchaseItemAmount) .. "$ but you have only " .. formatNumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value)) .. "$", 5)
            return
        end
        -- Fire the purchase event
        game:GetService('ReplicatedStorage').events.purchase:FireServer(itemName, itemType, nil, var.PurchaseItemAmount)

        -- Notify successful purchase
        lib:Notification("Purchase - Item(s)", "Successfully purchased " .. var.PurchaseItemAmount .. " " .. itemName, 5)
    end,
})



local playerRods = ReplicatedStorage.playerstats[LocalPlayer.Name].Rods

local playerRodsSet = {}
for _, rod in ipairs(playerRods:GetChildren()) do
    playerRodsSet[rod.Name] = true
end

local validRods = {}

if type(data.Rods) == "table" then
    for rodName, rodData in pairs(data.Rods) do
        if not playerRodsSet[rodName] and type(rodData) == "table" and rodData.Price ~= "inf" and rodData.Price ~= "No Price" then
            local formattedPrice = formatPrice(rodData.Price)
            table.insert(validRods, rodName .. " - " .. formattedPrice)
        end
    end
end


local purchaseRodDropdown = sections.Item:AddDropdown("PurchaseRod", {
    Title = gradient("Rods"),
    Description = "",
    Options = validRods,  -- Use the formatted rod names and prices
    Default = "",
    PlaceHolder = "Select Rod",
    Multiple = false,
    Callback = function(selectedRod)
        -- print(selectedRod)
        variables.SelectedPurchaseRod = selectedRod
    end,
})

sections.Item:AddButton({
    Title = "Purchase - Rod",
    Callback = function()
        local rodName, formattedPrice = variables.SelectedPurchaseRod:match("^(.-) %- (.+)$")
        local price = unformatPrice(formattedPrice)

        -- Cash check
        if price > ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value then
            lib:Notification("Purchase - Rod", "Insufficient cash, you need " .. formatNumber(tonumber(price)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
            return -- Prevent purchase if not enough cash
        end
        -- i wrote this myself, fuck you if u said it's ai
        if rodName == "Ethereal Prism Rod" or rodName == "Rod Of The Zenith" or rodName == "Volcanic Rod" or rodName == "Challenger's Rod" or rodName == "Leviathan's Fang Rod" then
            local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            local rodLocationList = {
                ["Ethereal Prism Rod"] = Vector3.new(-4358.916015625, -11175.2587890625, 3715.754638671875),
                ["Rod Of The Zenith"] = Vector3.new(-13627.4052734375, -11037.708984375, 355.6826171875),
                ["Volcanic Rod"] = Vector3.new(-3178.24462890625, -2035.7508544921875, 4021.578857421875),
                ["Challenger's Rod"] = Vector3.new(738.9710083007812, -3357.44140625, -1529.938232421875),
                ["Leviathan's Fang Rod"] = Vector3.new(-2297.676513671875, -11185.3017578125, 7138.990234375)
            }
        
            local locationVector = rodLocationList[rodName]
            LocalPlayer:RequestStreamAroundAsync(locationVector)
            var.purchaseRodRunning = true
        
            local attempts = 0
        
            coroutine.wrap(function()
                while var.purchaseRodRunning do
                    local player = LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    humanoidRootPart.CFrame = CFrame.new(locationVector)
                    humanoidRootPart.Velocity = Vector3.zero
                    task.wait()
                end
            end)()
        
            while var.purchaseRodRunning do
                task.wait(1)
                game:GetService('ReplicatedStorage').events.purchase:FireServer(rodName, 'Rod', nil, 1)
                task.wait(4)
        
                attempts = attempts + 1
        
                if game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods:FindFirstChild(rodName) then
                    var.purchaseRodRunning = false
                    break
                end
        
                if attempts >= 5 then
                    lib:Notification("Purchase - Rod", "Failed to purchase the rod..", 5)
                    var.purchaseRodRunning = false
                    break
                end
            end
            LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
            return
        end


        -- Proceed with purchase
        game:GetService('ReplicatedStorage').events.purchase:FireServer(rodName, 'Rod', price, 1)
        lib:Notification("Purchase - Rod", "Successfully purchased " .. rodName, 5)

        -- Remove the rod from valid rods
        for i, rod in ipairs(validRods) do
            if rod:match("^" .. rodName) then
                table.remove(validRods, i)
                break
            end
        end

        -- Refresh the rod dropdown
        purchaseRodDropdown:Refresh(validRods, true)
        purchaseRodDropdown:Set(validRods)
    end,
})

-- lanternsTable = {}

-- for _, v in ipairs(ReplicatedStorage.resources.replicated.instances.lanterns:GetChildren()) do
--     table.insert(lanternsTable, v.Name)
-- end

-- for _, v in ipairs(ReplicatedStorage.playerstats[LocalPlayer.Name].Lanterns:GetChildren()) do
--     for i = #lanternsTable, 1, -1 do
--         if lanternsTable[i] == v.Name then
--             table.remove(lanternsTable, i)
--         end
--     end
-- end


-- local lanternSelected = nil

-- local LanternDropdown = sections.Item:AddDropdown("PurchaseLanter", {
--     Title = gradient("Lantern"),
--     Description = "",
--     Options = lanternsTable,  -- Use the formatted rod names and prices
--     Default = "",
--     PlaceHolder = "Select Lantern",
--     Multiple = false,
--     Callback = function(selectedRod)
--         lanternSelected = selectedRod
--     end,
-- })

-- sections.Item:AddTextbox({
--     Title = "Lantern - Amount",
--     Default = "",
--     Description = "",
--     PlaceHolder = "Input",
--     TextDisappear = false,
--     Callback = function(purchaseAmount)
--         var.PurchaseLanternAmount = tonumber(purchaseAmount)
--     end
-- })

-- sections.Item:AddButton({
--     Title = "Purchase - Lantern(s)",
--     Callback = function()
--         if  var.PurchaseLanternAmount == nil then
--             var.PurchaseLanternAmount = 1
--         end
--         if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < var.PurchaseLanternAmount * 500 then
--             lib:Notification(
--                 "Auto Buy Lantern",
--                 "Insufficient cash, you need " .. formatNumber(var.PurchaseLanternAmount * 500) .. "$ but you have only " .. formatNumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value)) .. "$",
--                 5
--             )
--             return
--         end

--         lib:Notification("Purchase - Item(s)", "Starting purchase of " .. var.PurchaseLanternAmount, 5)

--         for i = 1, var.PurchaseLanternAmount do
--             local success, err = pcall(function()
--                 workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mods Latern Keeper"):WaitForChild("mods lantern"):WaitForChild("purchase"):InvokeServer()
--             end)

--             if not success then
--                 lib:Notification("Purchase Error", "Failed to purchase lantern: " .. err, 5)
--                 return
--             end
--         end
--         lib:Notification("Purchase - Lantern(s)", "Successfully purchased " .. var.PurchaseLanternAmount, 5)
--     end,
-- })

-- var.AutoBuyLantern = sections.Item:AddToggle("AutoBuyLantern", {
--     Title = "Auto Buy Lantern Till Selected",
--     Default = false,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         while isEnabled do
--             if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 500 then
--                 lib:Notification("Auto Buy Lantern", "Insufficient cash, you need " .. formatNumber(tonumber(500)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
--                 var.AutoBuyLantern:Set(false)
--                 return
--             end

--             local lanterns = ReplicatedStorage.playerstats[LocalPlayer.Name].Lanterns:GetChildren()
--             local foundLantern = false
--             for _, v in ipairs(lanterns) do
--                 if v.Name == lanternSelected then
--                     foundLantern = true
--                     break
--                 end
--             end

--             if foundLantern then
--                 lib:Notification("Auto Buy Lantern", "Lantern '" .. lanternSelected .. "' has been successfully acquired.", 5)
--                 var.AutoBuyLantern:Set(false)
--                 break
--             end

--             if isEnabled then
--                 local success, err = pcall(function()
--                     workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mods Latern Keeper"):WaitForChild("mods lantern"):WaitForChild("purchase"):InvokeServer()
--                 end)

--                 if not success then
--                     lib:Notification("Purchase Error", "Failed to purchase lantern: " .. err, 5)
--                     var.AutoBuyLantern:Set(false)
--                     return
--                 end
--             else
--                 var.AutoBuyLantern:Set(false)
--             end

--             task.wait()
--         end
--     end)
-- })

local formattedOptions = {}

-- Format the options using the provided formatPrice function
for crateName, crateData in pairs(data.SkinCrates) do
    local formattedPrice = formatPrice(crateData.Price)
    table.insert(formattedOptions, crateName .. " - " .. formattedPrice)
end

local SelectedCrate = nil
local SelectedCrateAmount = 1

sections.Item:AddDropdown("PurchaseCrates", {
    Title = gradient("Skin Crates"),
    Description = "",
    Options = formattedOptions,  -- Use the formatted options from data.SkinCrates
    Default = "",
    PlaceHolder = "Select a Skin Crate ",
    Multiple = false,
    Callback = function(selectedRod)
        SelectedCrate = selectedRod:split(" - ")[1]
    end,
})

sections.Item:AddTextbox({
    Title = "Skin Crates - Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(purchaseAmount)
        SelectedCrateAmount = tonumber(purchaseAmount)
    end
})

sections.Item:AddButton({
    Title = "Purchase - Skin Crate(s)",
    Callback = function()
        if SelectedCrateAmount == nil then
            SelectedCrateAmount = 1
        end
        for i = 1, SelectedCrateAmount do
            local success, err = pcall(function()
                ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/SkinCrates/Purchase"):InvokeServer(SelectedCrate)
                task.wait(0.2)
            end)

            if not success then
                lib:Notification("Purchase Error", "Failed to purchase Skin Crates: " .. err, 5)
                return -- Exit the loop if there's an error
            end
        end

        lib:Notification("Purchase - Skin Crate(s)", "Successfully purchased " .. SelectedCrateAmount, 5)
    end,
})



sections.Item:AddDropdown("PurchaseMerlin", {
    Title = gradient("Merlin"),
    Description = "",
    Options = {"Enchant Relic","Luck"},
    Default = "",
    Multiple = false,
    PlaceHolder = "Select Magic",
    Callback = function(selectedMerlin)
        variables.SelectedPurchaseMerlin = selectedMerlin
    end
})



var.AutoBuyLuckToggle = sections.Item:AddToggle("AutoBuyMerlinLuck", {
    Title = "Auto Buy Luck",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.AutoBuyMerlinLuck = isEnabled
        if variables.AutoBuyMerlinLuck then
            local PlayerStats = game:GetService("ReplicatedStorage").playerstats
            if tonumber(PlayerStats[LocalPlayer.Name].Stats.level.Value) < 30 then
                var.AutoBuyLuckToggle:Set(false)
                lib:Notification('Auto Luck', 'You need to be level 30 to use Merlin.', 3)
                return
            elseif tonumber(PlayerStats[LocalPlayer.Name].Stats.coins.Value) < 5000 then
                var.AutoBuyLuckToggle:Set(false)
                lib:Notification('Auto Luck', 'Not enough coins!', 3)
                return
            end
            while variables.AutoBuyMerlinLuck do
                if not PlayerStats[LocalPlayer.Name].Stats:FindFirstChild('status_luck') then
                    if tonumber(PlayerStats[LocalPlayer.Name].Stats.coins.Value) < 5000 then
                        var.AutoBuyLuckToggle:Set(false)
                        lib:Notification('Auto Luck', 'Not enough coins!', 3)
                    else
                        pcall(function()
                            print("should buy it")
                            if LocalPlayer.Character:WaitForChild("Humanoid").health == 0 then
                                return
                            end
                            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
                        end)
                    end
                end
                task.wait(1)
                if not variables.AutoBuyMerlinLuck then break end
            end
        end
    end)
})

sections.Item:AddTextbox({
    Title = "Relic/Luck Amount",
    Default = "",
    Description = "",
    PlaceHolder = "Ex: 100",
    TextDisappear = false,
    Callback = function(relicLuckAmount)
        merlinAmount = tonumber(relicLuckAmount)
    end
})

sections.Item:AddParagraph({Title = 'Please use "Talk To Merlin" if purchasing does not work.'})

local MerlinGroupButton = sections.Item:AddGroupButton()



MerlinGroupButton:AddButton({
    Title = "Purchase - Merlin",
    Callback = function()
        if variables.SelectedPurchaseMerlin == "Enchant Relic" then
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 11000 then
                lib:Notification("Purchase - Merlin", "Insufficient cash, you need " .. formatNumber(tonumber(11000)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                return -- Prevent purchase if not enough cash
            end
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power"):InvokeServer()
        elseif variables.SelectedPurchaseMerlin == "Luck" then
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value < 5000 then
                lib:Notification("Purchase - Merlin", "Insufficient cash, you need " .. formatNumber(tonumber(5000)) .. "$ but you have only " .. formatNumber(tonumber(math.floor(ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value))) .. "$", 5)
                return -- Prevent purchase if not enough cash
            end
            workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
        end
        lib:Notification("Purchase - Merlin","Successfully purchased " .. variables.SelectedPurchaseMerlin, 5)
    end,
})

MerlinGroupButton:AddButton({
    Title = "Talk To Merlin",
    Variant = "Outline",
    Callback = function()
        LocalPlayer:RequestStreamAroundAsync(Vector3.new(-928.0328369140625, 223.7000274658203, -998.7449951171875))
        if workspace.world.npcs:FindFirstChild("Merlin") then
            workspace.world.npcs["Merlin"].dialogprompt.Parent = LocalPlayer.Character
            -- task.wait(1)
            local char = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = workspace.world.npcs["Merlin"]
                end
            end
            lib:Notification("Talk To Merlin", "Talked to Merlin", 5)
        else
            lib:Notification("Talk To Merlin", "Failed to find Merlin", 5)
        end
    end,
})


MerlinGroupButton:AddButton({
    Title = "Purchase - Relic",
    Variant = "Outline",
    Callback = function()
        for i = 1, merlinAmount do
            task.spawn(function()
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power"):InvokeServer()
            end)
        end
        lib:Notification("Purchase - Relic", "Completed..", 5)
    end,
})


MerlinGroupButton:AddButton({
    Title = "Purchase - Luck",
    Variant = "Outline",
    Callback = function()
        for i = 1, merlinAmount do
            task.spawn(function()
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("luck"):InvokeServer()
            end)
        end
        lib:Notification("Purchase - Luck", "Completed..", 5)
    end,
})

sections.Item5:AddParagraph({Title = gradient("Selling")})
sections.Item5:AddToggle("AutoSell", {
    Title = "Auto Sell",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.autoselling = isEnabled
        if isEnabled then
            coroutine.wrap(function()
                while variables.autoselling do
                    pcall(function()
                        ReplicatedStorage.events.SellAll:InvokeServer()
                    end)
                    task.wait(variables.autoSellDelay)
                    if not variables.autoselling then break end
                end
            end)()
        end
    end)
})



sections.Item5:AddSlider("Auto Sell Delay", {
    Title = "Auto Sell Delay [Seconds]",
    Description = "",
    Default = 60,
    Min = 0,
    Max = 600,
    Increment = 1,
    Callback = function(value)
        variables.autoSellDelay = value
    end,
})

local sellFishGroupButton = sections.Item5:AddGroupButton()

sellFishGroupButton:AddButton({
    Title = "Sell All",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.SellAll:InvokeServer()
    end,
})

sellFishGroupButton:AddButton({
    Title = "Sell Hand",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage.events.Sell:InvokeServer()
    end,
})

sections.Item5:AddToggle("AutoSellHand", {
    Title = "Auto Sell Held Item",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.autosellingHand = isEnabled
        while variables.autosellingHand do
            ReplicatedStorage.events.Sell:InvokeServer()
            task.wait()
            if not variables.autosellingHand then break end
        end
    end)
})

sections.Item5:AddParagraph({Title = gradient("Favouriting")})


local allMutations = {}
if type(data.Mutations) == "table" then
    for mutationNameFav, mutationNameData in pairs(data.Mutations) do
        -- Replace 'â€™' with '’' in the mutation name
        mutationNameFav = mutationNameFav:gsub("â€™", "’")
        
        -- Insert the fixed mutation name into allMutations table
        table.insert(allMutations, mutationNameFav)
    end
end


sections.Item5:AddDropdown("MutationFavSelectDropDown", {
    Title = "Select Mutation",
    Description = "",
    Options = allMutations,
    Default = "",
    PlaceHolder = "Select Mutation",
    Multiple = true,
    Callback = function(selectedFavMutation)
        var.selectedFavMutation = selectedFavMutation
    end,
})

sections.Item5:AddDropdown("MutationPlusFavSelectDropDown", {
    Title = "Select Mutation+",
    Description = "",
    Options = {"Sparkling", "Shiny", "Big", "Giant"},
    Default = "",
    PlaceHolder = "Select Mutation+",
    Multiple = true,
    Callback = function(selectedFavMutationPlus)
        var.selectedFavMutationPlus = selectedFavMutationPlus
    end,
})

sections.Item5:AddDropdown("RarityFavSelectDropDown", {
    Title = "Select Rarity",
    Description = "",
    Options = raritiesList,
    Default = "",
    PlaceHolder = "Select Rarities",
    Multiple = true,
    Callback = function(selectedFavRarities)
        var.selectedFavRarities = selectedFavRarities
    end,
})

local fishNames = {}
if type(data.Fish) == "table" then
    for fishName, fishData in pairs(data.Fish) do
        table.insert(fishNames, fishName)
    end
end
sections.Item5:AddDropdown("FishFavSelectDropDown", {
    Title = "Select Fishes",
    Description = "",
    Options = fishNames,
    Default = "",
    PlaceHolder = "Select Fish(s)",
    Multiple = true,
    Callback = function(selectedFishes)
        var.SelectedFishes = selectedFishes
        
        -- Convert the selectedFishes table to a string and print it
        local selectedFishesStr = table.concat(selectedFishes, ", ")
        print("Selected Fishes: " .. selectedFishesStr)
    end,
})


sections.Item5:AddDropdown("FishFavMode", {
    Title = "Select Criteria Mode",
    Description = "",
    Options = {"If Any", "If All"},
    Default = "If Any",
    PlaceHolder = "Select Mode",
    Multiple = false,
    Callback = function(selectedMode)
        var.SelectedMode = selectedMode
    end,
})

-- if var.selectedFavMutationPlus ~= nil then
--     -- can u make it handle there being only one as well, which, if there's only one, it'll be a string.
--     for _, mutation in ipairs(var.selectedFavMutationPlus) do
--         table.insert(criteria, mutation)
--         if mutation == "Sparkling" and not inventoryItem:FindFirstChild("Sparkling") then
--             meetsRequirements = false
--         elseif mutation == "Shiny" and not inventoryItem:FindFirstChild("Shiny") then
--             meetsRequirements = false
--         elseif mutation == "Big" or mutation == "Giant" then
--             local weight = tonumber(inventoryItem:FindFirstChild("Weight").Value)
--             local baseWeight = tonumber(data.Fish[child.Name].WeightPool[2] / 10)

--             local isBigMet = weight > baseWeight
--             local isGiantMet = weight > baseWeight * 1.99
--             local hasBothBigAndGiant = table.find(var.selectedFavMutationPlus, "Big") and table.find(var.selectedFavMutationPlus, "Giant")

--             if (hasBothBigAndGiant and isBigMet) or 
--                (mutation == "Big" and isBigMet) or 
--                (mutation == "Giant" and not hasBothBigAndGiant and isGiantMet) then
--                 table.insert(requirementsMet, mutation)
--             else
--                 meetsRequirements = false
--             end
--         end
--     end
-- end

local connection

sections.Item5:AddToggle("AutoFav", {
    Title = "Auto Favourite",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.AutoFav = isEnabled
        if connection then
            connection:Disconnect()
        end
        
        if var.AutoFav then
            connection = LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                -- Ensure child exists and has a link value
                if not child or not child:WaitForChild("link", 5) then return end
                
                local inventoryItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[tostring(child.link.Value)]
                if not inventoryItem then return end
                
                -- Check if already favorited
                if inventoryItem:FindFirstChild("Favourited") then
                    print("already fav")
                    return
                end

                -- Initialize condition checks
                local meetsSelectedFishes = false
                local meetsRarityCheck = false
                local meetsMutationCheck = false
                local meetsMutationPlusCheck = true -- Default to true for mutation plus checks
                local conditionsToCheck = 0
                
                -- Check selected fishes
                if var.SelectedFishes and #var.SelectedFishes > 0 then
                    conditionsToCheck = conditionsToCheck + 1
                    meetsSelectedFishes = table.find(var.SelectedFishes, child.Name) ~= nil
                end
                
                -- Check rarity
                if var.selectedFavRarities and #var.selectedFavRarities > 0 and data.Fish and data.Fish[child.Name] then
                    conditionsToCheck = conditionsToCheck + 1
                    meetsRarityCheck = table.find(var.selectedFavRarities, data.Fish[child.Name].Rarity) ~= nil
                end
                
                -- Check mutation
                if var.selectedFavMutation and #var.selectedFavMutation > 0 then
                    conditionsToCheck = conditionsToCheck + 1
                    local mutation = inventoryItem:FindFirstChild("Mutation")
                    if mutation then
                        meetsMutationCheck = table.find(var.selectedFavMutation, mutation.Value) ~= nil
                    end
                end

                -- Check mutation plus (Sparkling, Shiny, Big, Giant)
                if var.selectedFavMutationPlus and (type(var.selectedFavMutationPlus) == "table" or type(var.selectedFavMutationPlus) == "string") then
                    conditionsToCheck = conditionsToCheck + 1
                    local mutationPlusList = type(var.selectedFavMutationPlus) == "string" and { var.selectedFavMutationPlus } or var.selectedFavMutationPlus

                    for _, mutation in ipairs(mutationPlusList) do
                        if mutation == "Sparkling" and not inventoryItem:FindFirstChild("Sparkling") then
                            meetsMutationPlusCheck = false
                        elseif mutation == "Shiny" and not inventoryItem:FindFirstChild("Shiny") then
                            meetsMutationPlusCheck = false
                        elseif mutation == "Big" or mutation == "Giant" then
                            local weight = tonumber(inventoryItem:FindFirstChild("Weight").Value)
                            local baseWeight = tonumber(data.Fish[child.Name].WeightPool[2] / 10)

                            local isBigMet = weight > baseWeight
                            local isGiantMet = weight > baseWeight * 1.99
                            local hasBothBigAndGiant = table.find(mutationPlusList, "Big") and table.find(mutationPlusList, "Giant")

                            if (hasBothBigAndGiant and isBigMet) or 
                               (mutation == "Big" and isBigMet) or 
                               (mutation == "Giant" and not hasBothBigAndGiant and isGiantMet) then
                                -- Mutation requirement met
                            else
                                meetsMutationPlusCheck = false
                            end
                        end
                    end
                end
                
                -- Determine if we should favorite based on selected mode
                local shouldFavorite = false
                if conditionsToCheck > 0 then
                    if var.SelectedMode == "If Any" then
                        shouldFavorite = meetsSelectedFishes or meetsRarityCheck or meetsMutationCheck or meetsMutationPlusCheck
                    else -- "If All"
                        local conditionsMet = 0
                        if meetsSelectedFishes then conditionsMet = conditionsMet + 1 end
                        if meetsRarityCheck then conditionsMet = conditionsMet + 1 end
                        if meetsMutationCheck then conditionsMet = conditionsMet + 1 end
                        if meetsMutationPlusCheck then conditionsMet = conditionsMet + 1 end
                        shouldFavorite = conditionsMet == conditionsToCheck
                    end
                end

                -- Favorite if conditions are met
                if shouldFavorite then
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Favourite"):FireServer(child)
                    print("favourited.")
                end
            end)
        end
    end,
})
local favFishGroupButton = sections.Item5:AddGroupButton()

favFishGroupButton:AddButton({
    Title = "Fav All",
    Variant = "Primary",
    Callback = function()
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if not item:FindFirstChild("link") then continue end
            local link = item.link.Value
        
            if not link:FindFirstChild("Favourited") then
                game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Favourite"):FireServer(item)
            end
        end
    end,
})



favFishGroupButton:AddButton({
    Title = "Unfav All",
    Variant = "Primary",
    Callback = function()
        for _, item in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if not item:FindFirstChild("link") then continue end
            local link = item.link.Value
        
            if link:FindFirstChild("Favourited") then
                game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Favourite"):FireServer(item)
            end
        end
    end,
})



var.AppraiseParagraph = sections.Item1:AddParagraph({Title = "", Description = "Info"})

local mutationNames = {}

-- Assuming `Mutations` holds the mutation data
if type(data.Mutations) == "table" then
    for mutationName, mutationData in pairs(data.Mutations) do
        -- Debugging: Print the Chance value to check its format
        -- print(mutationName, mutationData.Chance)

        -- Check if the Chance value is not "0"
        if mutationData.Chance ~= "0" then
            -- Add mutation name to the list if Chance is not "0"
            table.insert(mutationNames, mutationName)
        end
    end
end

-- Function to convert RGB to rich text
local function rgbToRichText(rgbString, text)
    -- Split the RGB string into individual components
    local r, g, b = rgbString:match("([^,]+),([^,]+),([^,]+)")
    r, g, b = tonumber(r), tonumber(g), tonumber(b)

    -- Return the text in rich text format with the specified RGB color
    return string.format("<font color=\"rgb(%d,%d,%d)\">%s</font>", r * 255, g * 255, b * 255, text)
end

local function updateAppraiseDescription()
    local selectedMutation = var.SelectedMutation or {}
    local selectedMutationText = ""

    -- If there are multiple selected mutations, display them as "Name/Name" with colors
    if #selectedMutation > 0 then
        local coloredMutations = {}
        for _, mutationName in ipairs(selectedMutation) do
            local mutationData = data.Mutations[mutationName]
            local mutationColor = mutationData and mutationData.Color or "1,1,1" -- Default to white if no color is defined
            table.insert(coloredMutations, rgbToRichText(mutationColor, mutationName))
        end
        selectedMutationText = table.concat(coloredMutations, "/")
    end

    -- Calculate chance and value multiplier for the selected mutation
    local totalChance = 0
    for _, mutationName in pairs(mutationNames) do
        local mutation = data.Mutations[mutationName]
        if mutation and mutation.Chance and mutation.Chance ~= "0" then
            totalChance = totalChance + tonumber(mutation.Chance)
        end
    end
    local selectedMutationData = data.Mutations[selectedMutation[1]] -- Assume the first selected mutation for chance calculation
    local selectedChance = selectedMutationData and selectedMutationData.Chance or "0"
    local chancePercentage = tonumber(selectedChance) / totalChance * 100
    local formattedChance = string.format("%.2f", chancePercentage)
    local mutationPrice = selectedMutationData and selectedMutationData.PriceMultiply or "N/A"

    -- Build the `SelectedMutationPlus` description
    local result = {}
    local hasSparkling, hasShiny, hasBig, hasGiant = false, false, false, false

    -- Check if SelectedMutationPlus exists and is not empty
    if var.SelectedMutationPlus and #var.SelectedMutationPlus > 0 then
        for _, mutation in ipairs(var.SelectedMutationPlus) do
            if mutation == "Sparkling" then
                hasSparkling = true
            elseif mutation == "Shiny" then
                hasShiny = true
            elseif mutation == "Big" then
                hasBig = true
            elseif mutation == "Giant" then
                hasGiant = true
            end
        end

        if hasSparkling and hasShiny then
            table.insert(result, "<font color='#fff0bc'>Sparkling, Shiny</font>")
        elseif hasSparkling then
            table.insert(result, "<font color='#fff0bc'>Sparkling</font>")
        elseif hasShiny then
            table.insert(result, "<font color='#fff0bc'>Shiny</font>")
        end

        if hasBig and hasGiant then
            table.insert(result, "<font color='#8bff89'>Big/Giant</font>")
        elseif hasBig then
            table.insert(result, "<font color='#8bff89'>Big</font>")
        elseif hasGiant then
            table.insert(result, "<font color='#8bff89'>Giant</font>")
        end
    end

    -- Combine all parts of the description
    local descriptionParts = {}
    if selectedMutationText ~= "" then
        table.insert(descriptionParts, selectedMutationText)
    end
    if #result > 0 then
        table.insert(descriptionParts, table.concat(result, ", "))
    end

    local richDescription = table.concat(descriptionParts, ", ")

    -- Update the description in the UI
    var.AppraiseParagraph:SetDesc(richDescription)
end


-- SelectedMutation dropdown
var.SelectedMutationToggle = sections.Item1:AddDropdown("SelectedMutation", {
    Title = "Select Mutation",
    Description = "If you select multiple, it'll stop at any it gets.",
    Options = mutationNames,
    Default = "",
    PlaceHolder = "Select Mutation",
    Multiple = true,
    AllowNull = true,  -- Allow deselection
    Callback = function(selectedMutation)
        var.SelectedMutation = selectedMutation or ""  -- Handle null case
        updateAppraiseDescription()
    end,
})

-- SelectedMutationPlus dropdown
var.SelectedMutationPlusToggle = sections.Item1:AddDropdown("SelectedMutationPlus", {
    Title = "Select Mutation Plus",
    Description = "If you select both sparkling and shiny, it'll go until you get both. If you select both big and giant it'll stop at either one.",
    Options = {"Sparkling", "Shiny", "Big", "Giant"},
    Default = {},
    PlaceHolder = "Select Mutation Plus",
    Multiple = true,
    AllowNull = true,
    Callback = function(selectedMutationPlus)
        var.SelectedMutationPlus = selectedMutationPlus or {}  -- Handle null case
        updateAppraiseDescription()
    end,
})


var.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
    Title = "Auto Appraise",
    Default = false,
    Description = "This is slow now because of the game, not us.",
    Callback = function(isEnabled)
        var.AutoAppraise = isEnabled
        if var.AutoAppraise then
            validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
            if not validFish then
                lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
                var.AutoAppraiseToggle:Set(false)
                return
            elseif validFish then
                print("normal mode..")
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                local currentTool = tostring(tool:WaitForChild("link").Value)

                local inventoryConnection

                -- Check if the current fish already meets criteria
                local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                local criteria = {}
                local requirementsMet = {}
                local meetsRequirements = true

                if var.SelectedMutation and #var.SelectedMutation > 0 then
                    -- Add all selected mutations to criteria
                    for _, selectedMutation in ipairs(var.SelectedMutation) do
                        table.insert(criteria, selectedMutation)
                    end
                
                    -- Check if Mutation.Value exists in SelectedMutation
                    if inventory:FindFirstChild("Mutation") and table.find(var.SelectedMutation, inventory.Mutation.Value) then
                        table.insert(requirementsMet, inventory.Mutation.Value)
                    else
                        meetsRequirements = false
                    end
                end
                
                local selectedMutations = var.SelectedMutationPlus

                if type(selectedMutations) ~= "table" then
                    selectedMutations = {} -- Ensure it's always a table
                end                

                for _, mutation in ipairs(selectedMutations) do
                    table.insert(criteria, mutation)
                    if mutation == "Sparkling" and not inventory:FindFirstChild("Sparkling") then
                        meetsRequirements = false
                    elseif mutation == "Shiny" and not inventory:FindFirstChild("Shiny") then
                        meetsRequirements = false
                    elseif mutation == "Big" or mutation == "Giant" then
                        local weight = tonumber(inventory:FindFirstChild("Weight").Value)
                        local baseWeight = tonumber(data.Fish[tool.Name].WeightPool[2] / 10)
                        
                        local isBigMet = weight > baseWeight
                        local isGiantMet = weight > baseWeight * 1.99
                        local hasBothBigAndGiant = table.find(var.SelectedMutationPlus, "Big") and table.find(var.SelectedMutationPlus, "Giant")
                        
                        if (hasBothBigAndGiant and isBigMet) or 
                           (mutation == "Big" and isBigMet) or 
                           (mutation == "Giant" and not hasBothBigAndGiant and isGiantMet) then
                            table.insert(requirementsMet, mutation)
                        else
                            meetsRequirements = false
                        end
                    end
                end

                
                print("Criteria: " .. table.concat(criteria, ", "))
                print("Requirements met: " .. table.concat(requirementsMet, ", "))

                if meetsRequirements then
                    print("Current fish meets all criteria. No need to appraise.")
                    lib:Notification("Auto Appraise", "Your fish already meets conditions.", 5)
                    var.AutoAppraiseToggle:Set(false)
                    return
                end

                -- If not meeting criteria, appraise the fish
                task.spawn(function()
                    workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                end)

                inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
                    print("child added..", item.Name)
                    if not var.AutoAppraise then
                        if inventoryConnection then
                            inventoryConnection:Disconnect()
                            inventoryConnection = nil
                        end
                    end

                    if tostring(item:WaitForChild("link").Value) ~= currentTool then
                        print("new item", item.Name)
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                        item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        print("equipping")
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        task.wait()
                        print("eequipping")
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
                        task.wait(1)
                        currentTool = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):WaitForChild("link").Value)

                        -- Repeat criteria checks for the new item
                        inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                        criteria = {}
                        requirementsMet = {}
                        meetsRequirements = true

                        if var.SelectedMutation and #var.SelectedMutation > 0 then
                            -- Add all selected mutations to criteria
                            for _, selectedMutation in ipairs(var.SelectedMutation) do
                                table.insert(criteria, selectedMutation)
                            end
                        
                            -- Check if Mutation.Value exists in SelectedMutation
                            if inventory:FindFirstChild("Mutation") and table.find(var.SelectedMutation, inventory.Mutation.Value) then
                                table.insert(requirementsMet, inventory.Mutation.Value)
                            else
                                meetsRequirements = false
                            end
                        end
                        
                        
                        local selectedMutations = var.SelectedMutationPlus
                        if type(selectedMutations) ~= "table" then
                            selectedMutations = {} -- Ensure it's always a table
                        end                
                        for _, mutation in ipairs(selectedMutations) do
                            table.insert(criteria, mutation)
                            if mutation == "Sparkling" and not inventory:FindFirstChild("Sparkling") then
                                meetsRequirements = false
                            elseif mutation == "Shiny" and not inventory:FindFirstChild("Shiny") then
                                meetsRequirements = false
                            elseif mutation == "Big" or mutation == "Giant" then
                                local weight = tonumber(inventory:FindFirstChild("Weight").Value)
                                local baseWeight = tonumber(data.Fish[item.Name].WeightPool[2] / 10)
                                
                                local isBigMet = weight > baseWeight
                                local isGiantMet = weight > baseWeight * 1.99
                                local hasBothBigAndGiant = table.find(var.SelectedMutationPlus, "Big") and table.find(var.SelectedMutationPlus, "Giant")
                                
                                if (hasBothBigAndGiant and isBigMet) or 
                                   (mutation == "Big" and isBigMet) or 
                                   (mutation == "Giant" and not hasBothBigAndGiant and isGiantMet) then
                                    table.insert(requirementsMet, mutation)
                                else
                                    meetsRequirements = false
                                end
                            end
                        end

                        print("Criteria: " .. table.concat(criteria, ", "))
                        print("Requirements met: " .. table.concat(requirementsMet, ", "))

                        if meetsRequirements then
                            print("All requirements met! Stopping auto-appraise.")
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                            if inventoryConnection then
                                var.AutoAppraiseToggle:Set(false)
                                inventoryConnection:Disconnect()
                                inventoryConnection = nil
                                return
                            end
                        else
                            pcall(function()
                                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                            end)
                            repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        end
                    end
                end)
            end
        end
    end
})

sections.Item1:AddToggle("LoopAppraise", {
    Title = "Loop Appraise",
    Default = false,
    Description = "Doesn't check criteria, good for enchant relics.",
    Callback = function(isEnabled)
        var.loopAppraise = isEnabled
        
        -- Disconnect previous connection if it exists
        if inventoryConnection3 then
            inventoryConnection3:Disconnect()
        end
        
        if isEnabled then
            inventoryConnection3 = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
                -- set the item parent to character
                if item:IsA("Tool") then
                    item.Parent = LocalPlayer.Character
                end
            end)
            
            while var.loopAppraise do
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
                task.wait(1)
            end
        end
    end
})

sections.Item1:AddButton({
    Title = "Appraise Once",
    Variant = "Outline",
    Callback = function()
        validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
        if not validFish then
            lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
            var.AutoAppraiseToggle:Set(false)
            return
        else
            task.spawn(function()
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
            end)
            
            local tempConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
                if item:IsA("Tool") then
                    item.Parent = LocalPlayer.Character
                end
            end)
            
            -- Disconnect the connection immediately after
            task.delay(0.1, function()
                if tempConnection then
                    tempConnection:Disconnect()
                end
            end)
        end
    end,
})


-- var.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
--     Title = "Auto Appraise",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         var.AutoAppraise = isEnabled
--         if var.AutoAppraise then
--             validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
--             if not validFish then
--                 lib:Notification("Auto Appraise", "Not holding fish or invalid fish.", 5)
--                 var.AutoAppraiseToggle:Set(false)
--                 return
--             elseif validFish then
--                 print("normal mode..")
--                 local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                 local currentTool = tostring(tool:WaitForChild("link").Value)

--                 local inventoryConnection

--                 task.spawn(function()
--                     workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                 end)
                
--                 inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)
--                     if not var.AutoAppraise then
--                         if inventoryConnection then
--                             inventoryConnection:Disconnect()
--                             inventoryConnection = nil
--                         end
--                     end

--                     if tostring(item:WaitForChild("link").Value) ~= currentTool then
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                         task.wait()
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         currentTool = tostring(item:WaitForChild("link").Value)

--                         local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]
                        
--                         -- Build criteria string
--                         local criteria = {}
--                         if var.SelectedMutation and var.SelectedMutation ~= "" then
--                             table.insert(criteria, var.SelectedMutation)
--                         end
--                         for _, mutation in ipairs(var.SelectedMutationPlus or {}) do
--                             table.insert(criteria, mutation)
--                         end
--                         print("Criteria: " .. table.concat(criteria, ", "))
                        
--                         -- Track requirements met
--                         local requirementsMet = {}
--                         local meetsRequirements = true
                        
--                         -- Check regular mutation first
--                         if var.SelectedMutation and var.SelectedMutation ~= "" then
--                             if inventory:FindFirstChild("Mutation") and 
--                                inventory:FindFirstChild("Mutation").Value == var.SelectedMutation then
--                                 table.insert(requirementsMet, var.SelectedMutation)
--                             else
--                                 meetsRequirements = false
--                             end
--                         end
                        
--                         -- Check mutation plus requirements if any are selected and mutation requirement was met
--                         if meetsRequirements and #var.SelectedMutationPlus > 0 then
--                             -- Check Sparkling
--                             if table.find(var.SelectedMutationPlus, "Sparkling") then
--                                 if inventory:FindFirstChild("Sparkling") then
--                                     table.insert(requirementsMet, "Sparkling")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
                            
--                             -- Check Shiny
--                             if table.find(var.SelectedMutationPlus, "Shiny") then
--                                 if inventory:FindFirstChild("Shiny") then
--                                     table.insert(requirementsMet, "Shiny")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
                            
--                             -- Check Big/Giant
--                             local requiresBig = table.find(var.SelectedMutationPlus, "Big") ~= nil
--                             local requiresGiant = table.find(var.SelectedMutationPlus, "Giant") ~= nil
                            
--                             if requiresBig or requiresGiant then
--                                 local weight = tonumber(inventory:FindFirstChild("Weight").Value)
--                                 local baseWeight = tonumber(data.Fish[item.Name].WeightPool[2])
                                
--                                 if requiresGiant and weight > baseWeight * 1.99 then
--                                     table.insert(requirementsMet, "Giant")
--                                 elseif requiresBig and weight > baseWeight then
--                                     table.insert(requirementsMet, "Big")
--                                 else
--                                     meetsRequirements = false
--                                 end
--                             end
--                         end
                        
--                         -- Print current fish info
--                         if inventory:FindFirstChild("Mutation") then
--                             print("Current fish mutation: " .. inventory.Mutation.Value)
--                         end
--                         print("Requirements met: " .. table.concat(requirementsMet, ", "))
                        
--                         -- If all requirements are met, stop auto-appraising
--                         if meetsRequirements then
--                             print("All requirements met! Stopping auto-appraise.")
--                             LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                             if inventoryConnection then
--                                 var.AutoAppraiseToggle:Set(false)
--                                 inventoryConnection:Disconnect()
--                                 inventoryConnection = nil
--                                 return
--                             end
--                         else
--                             -- Continue appraising if requirements aren't met
--                             pcall(function()
--                                 workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                             end)
--                             repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         end
--                     end
--                 end)
--             end
--         end
--     end,
-- })

-- var.AutoAppraiseToggle = sections.Item1:AddToggle("AutoAppraise", {
--     Title = "Auto Appraise",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         var.AutoAppraise = isEnabled
--         if var.AutoAppraise then
--             validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
--             if not validFish then
--                 lib:Notification("Auto Appraise","Not holding fish or invalid fish.", 5)
--                 var.AutoAppraiseToggle:Set(false)
--                 return
--             elseif validFish then
--                 print("normal mode..")
--                 local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                 local currentTool = tostring(tool:WaitForChild("link").Value)


--                 local inventoryConnection

--                 task.spawn(function()
--                     workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                 end)
--                 inventoryConnection = LocalPlayer.Backpack.ChildAdded:Connect(function(item)

--                     if not var.AutoAppraise then
--                         if inventoryConnection then
--                             inventoryConnection:Disconnect()
--                             inventoryConnection = nil
--                         end
--                     end

--                     if tostring(item:WaitForChild("link").Value) ~= currentTool then

--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         item = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                         LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                         task.wait()
--                         game.Players.LocalPlayer.Character.Humanoid:EquipTool(item)
--                         currentTool = tostring(item:WaitForChild("link").Value)

--                         if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation") then
--                             -- print(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation").Value)
--                             -- print(var.SelectedMutation)
--                             if #var.SelectedMutationPlus > 0 then
--                                 -- if in there is sparkling then
--                                 if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Sparkling") ~= nil then
--                                     -- print("sparkling is in there")
--                                 end
--                                 -- if in there is shiny then
--                                 if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Shiny") ~= nil then
--                                     -- print("shiny is in there")
--                                 end
--                                 -- if in there is big then
--                                 if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Weight").Value) > tonumber(data.Fish[item.Name].WeightPool[2]) then
--                                     -- print("big")
--                                 end
--                                 if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Weight").Value) > tonumber(data.Fish[item.Name].WeightPool[2] * 1.99) then
--                                     -- print("giant")
--                                 end
--                                 -- and if it's big/giant then just use the big's threshold..

--                                 -- anyways, after that, move onto the next part below where it does the mutation check.


--                             if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[currentTool]:FindFirstChild("Mutation").Value == var.SelectedMutation then
--                                 LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
--                                 if inventoryConnection then
--                                     var.AutoAppraiseToggle:Set(false)
--                                     inventoryConnection:Disconnect()
--                                     inventoryConnection = nil
--                                     return
--                                 end
--                             end
--                         end
--                         pcall(function()
--                             workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
--                         end)
--                         repeat task.wait() until not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--                     end
--                 end
--                 end)
--             end
--         end
--     end,
-- })

var.EnchantParagraph = sections.Item2:AddParagraph({Title = "", Description = "Info"})


-- Populate the enchant names for the dropdown
local enchantNames = {}
if type(data.Enchants) == "table" then
    for enchantName, enchantData in pairs(data.Enchants) do
        -- Add enchant name to list
        table.insert(enchantNames, enchantName)
    end
end

-- Add the enchant dropdown
sections.Item2:AddDropdown("EnchantSelectDropDown", {
    Title = "Selected Enchant",
    Description = "",
    Options = enchantNames,  -- Populate with enchant names
    Default = "",
    PlaceHolder = "Select Enchant",
    Multiple = false,
    Callback = function(selectedEnchant)
    if selectedEnchant ~= "" then
        var.SelectedEnchant = selectedEnchant
        
        -- Fetch the description and color of the selected enchant
        local enchantDescription = data.Enchants[selectedEnchant] and data.Enchants[selectedEnchant].Description or "No description available"
        local enchantColor = data.Enchants[selectedEnchant] and data.Enchants[selectedEnchant].Color or "1,1,1"  -- Default to white if no color
        
        -- Convert the color and description to rich text format
        local coloredText = rgbToRichText(enchantColor, selectedEnchant)
        local richDescription = coloredText .. "\n" .. enchantDescription
        
        -- Update the description
        var.EnchantParagraph:SetDesc(richDescription)
    end
    end,
})

print("here 4")
-- wait(10))

var.AutoEnchantToggle = sections.Item2:AddToggle("AutoEnchantToggle", {
    Title = "Auto Enchant",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoEnchant = isEnabled
        
        if var.AutoEnchant then
            if data.Enchants[var.SelectedEnchant].IsSongOfTheDeep then
                if not workspace[LocalPlayer.Name]:FindFirstChild("Song of the Deep") then
                    lib:Notification("Auto Enchant","Please hold an Song of the Deep.", 5)
                    var.AutoEnchantToggle:Set(false)
                    return
                end
            elseif data.Enchants[var.SelectedEnchant].IsExalted then
                if not workspace[LocalPlayer.Name]:FindFirstChild("Exalted Relic") then
                    lib:Notification("Auto Enchant","Please hold an Exalted Relic.", 5)
                    var.AutoEnchantToggle:Set(false)
                    return
                end
            elseif not data.Enchants[var.SelectedEnchant].IsExalted then
                if not workspace[LocalPlayer.Name]:FindFirstChild("Enchant Relic") then
                    lib:Notification("Auto Enchant","Please hold an Enchant Relic.", 5)
                    var.AutoEnchantToggle:Set(false)
                    return
                end
            end
            if ReplicatedStorage.world.cycle.Value ~= "Night" then
                lib:Notification("Auto Enchant","It needs to be night time.", 5)
                var.AutoEnchantToggle:Set(false)
                return 
            end
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[getEquippedRod()].Value == var.SelectedEnchant then
                lib:Notification("Auto Enchant","You already have this enchant.", 5)
                var.AutoEnchantToggle:Set(false)
                return 
            end
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1310, -799, -82)
        end
        task.wait(1)
        while var.AutoEnchant do
            task.wait(0.1)
            if workspace.world.interactables:FindFirstChild("Enchant Altar"):FindFirstChild("ProximityPrompt").Enabled and var.AutoEnchant then
                if data.Enchants[var.SelectedEnchant].IsExalted then
                    if not workspace[LocalPlayer.Name]:FindFirstChild("Exalted Relic") then
                        lib:Notification("Auto Enchant","Please hold an Exalted Relic.", 5)
                        var.AutoEnchantToggle:Set(false)
                        return
                    end
                elseif not data.Enchants[var.SelectedEnchant].IsExalted then
                    if not workspace[LocalPlayer.Name]:FindFirstChild("Enchant Relic") then
                        lib:Notification("Auto Enchant","Please hold an Enchant Relic.", 5)
                        var.AutoEnchantToggle:Set(false)
                        return
                    end
                end

                -- fireproximityprompt(workspace.world.interactables["Enchant Altar"].ProximityPrompt, 0)
                workspace.world.interactables:FindFirstChild("Enchant Altar"):FindFirstChild("ProximityPrompt").Parent = LocalPlayer.Character
                local player = game:GetService("Players").LocalPlayer
                local char = player.Character

                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        obj.Parent = workspace.world.interactables:FindFirstChild("Enchant Altar")
                    end
                end              
                task.wait(0.5)
                if LocalPlayer.PlayerGui.over:FindFirstChild("prompt") then
                    local confirmButton = LocalPlayer.PlayerGui.over.prompt.confirm
                    confirmButton.Selectable = true
                    GuiService.SelectedObject = confirmButton
                    VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                    VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                    task.wait()
                    GuiService.SelectedObject = nil
                    -- if getconnections then
                    --     for i, v in pairs(getconnections(confirmButton.MouseButton1Click)) do
                    --         v.Function()
                    --     end
                    -- else
                    --     firesignal(confirmButton.MouseButton1Click)
                    -- end
                end                
            end
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Rods[getEquippedRod()].Value == var.SelectedEnchant then
                var.AutoEnchantToggle:Set(false)
            end
        end
    end)
})

-- sections.Item3:AddParagraph({Title = '<font color="#ea00ff">T</font><font color="#cc00ff">o</font><font color="#af00ff">t</font><font color="#9100ff">e</font><font color="#7400ff">m</font><font color="#5700ff">s</font>', Description = ""})

-- Create a list for totems
local totemItems = {}
if type(data.Items) == "table" then
    for itemName, itemData in pairs(data.Items) do
        if itemName:find("Totem") then
            -- Add items containing "Totem" to the totem list
            table.insert(totemItems, itemName)
        end
    end
end

-- Add the totems to the dropdown
sections.Item3:AddDropdown("DayTotem", {
    Title = "Totem - Day",
    Description = "",
    PlaceHolder = "Select Totem - Day",
    Options = totemItems,  -- Populate the dropdown with filtered totems
    Default = "",
    Multiple = false,
    Callback = function(SelectedTotem)
        var.SelectedDayTotem = SelectedTotem
    end,
})


sections.Item3:AddDropdown("NightTotem", {
    Title = "Totem - Night",
    Description = "",
    Options = totemItems,
    Default = "",
    PlaceHolder = "Select Totem - Night",
    Multiple = false,
    Callback = function(SelectedTotem)
        var.SelectedNightTotem = SelectedTotem
    end
})


var.LastCycle = nil
var.AutoPurchaseIfNone = false
var.TotemInUse = false -- Global flag

sections.Item3:AddToggle("AutoTotemToggle", {
    Title = "Auto Totem",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoTotemToggle = isEnabled
        while var.AutoTotemToggle do
            task.wait()
            local currentCycle = ReplicatedStorage.world.cycle.Value

            if currentCycle ~= var.LastCycle and (not LocalPlayer.PlayerGui:FindFirstChild("reel") and not LocalPlayer.PlayerGui:FindFirstChild("shakeui")) then
                var.TotemInUse = true -- Flag start
                local wasHoldingRod = LocalPlayer.Character:FindFirstChild(getEquippedRod())
                local totemName = currentCycle == "Day" and var.SelectedDayTotem or var.SelectedNightTotem

                if not LocalPlayer.Backpack:FindFirstChild(totemName) and var.AutoPurchaseIfNone then
                    game:GetService('ReplicatedStorage').events.purchase:FireServer(totemName, "Item", nil, 1)
                    task.wait(0.5) -- Increased wait for purchase
                end

                -- Improved equip logic
                local function equipTotem()
                    if LocalPlayer.Backpack:FindFirstChild(totemName) then
                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                        task.wait(0.2)
                        LocalPlayer.Backpack:FindFirstChild(totemName).Parent = LocalPlayer.Character
                        task.wait(0.5)
                    end
                end

                -- Enhanced activation flow
                equipTotem()
                local retries = 3
                while retries > 0 and not LocalPlayer.Character:FindFirstChild(totemName) do
                    task.wait(0.5)
                    equipTotem()
                    retries -= 1
                end

                if LocalPlayer.Character:FindFirstChild(totemName) then
                    workspace[LocalPlayer.Name][totemName]:Activate()
                    task.wait(0.5)
                end

                task.wait(1)
                if wasHoldingRod then
                    local rod = LocalPlayer.Backpack:FindFirstChild(getEquippedRod())
                    if rod then
                        var.TotemInUse = false 
                        rod.Parent = LocalPlayer.Character
                        task.wait(0.5) -- Ensure rod settles
                    end
                end

                var.LastCycle = currentCycle
                var.TotemInUse = false -- Flag end
            end
        end
    end)
})



sections.Item3:AddToggle("AutoPurchaseTotemToggle", {
    Title = "Auto Purchase Totem",
    Default = false,
    Description = " Auto Purcahse(s) Totem if you got none",
    Callback = function(isEnabled)
        var.AutoPurchaseIfNone = isEnabled
    end,
})

sections.Item3:AddParagraph({
    Title = gradient("Sundial"),
    Description = "Uses Sundial Totem until the event."
})

sections.Item3:AddDropdown("EventTotem", {
    Title = "Select Event",
    Description = "",
    Options = {"Whales Pool","Forsaken Veil - Scylla","Orcas","Kraken", "Megalodon", "Night of the Fireflies", "Night of the Luminous", "Shiny Surge", "Mutation Surge"},
    Default = "",
    PlaceHolder = "Select Event",
    Multiple = true,
    Callback = function(SelectedEvent)
        var.SelectedEvent = SelectedEvent
    end
})

sections.Item3:AddDropdown("EventTotem", {
    Title = "Totem - Event",
    Description = "",
    Options = totemItems,
    Default = "",
    PlaceHolder = "Select Totem - Event",
    Multiple = false,
    Callback = function(SelectedTotem)
        var.SelectedEventTotem = SelectedTotem
    end
})

if game:GetService("ReplicatedStorage").world.weather.Value ~= "Rain" then
    print("ye")
else
    print("na")
end



var.LastCycle = nil
var.AutoSundial = false
var.TotemInUse = false

var.AutoSundialToggle = sections.Item3:AddToggle("AutoSundialToggle", {
    Title = "Auto Sundial",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoSundial = isEnabled
        if var.AutoSundial then

            -- if this if and elseif is run
            if var.SelectedEvent[1] == "Whales Pool" and #var.SelectedEvent == 1 then
                lib:Notification("Auto Sundial", "Using special Whales Pool mode..", 5)
                if not LocalPlayer.Backpack:FindFirstChild("Tempest Totem") and not LocalPlayer.Character:FindFirstChild("Tempest Totem") then
                    lib:Notification("Auto Sundial - Whales Pool", "No Tempest Totem found", 5)
                    var.AutoSundialToggle:Set(false)
                    return
                end
                if not LocalPlayer.Backpack:FindFirstChild("Smokescreen Totem") and not LocalPlayer.Character:FindFirstChild("Smokescreen Totem") then
                    lib:Notification("Auto Sundial - Whales Pool", "No Smokescreen Totem found", 5)
                    var.AutoSundialToggle:Set(false)
                    return
                end
            elseif var.SelectedEvent[1] == "Whales Pool" and #var.SelectedEvent > 1 then
                lib:Notification("Auto Sundial", "Do not select anything else if you're doing Whales Pool.", 5)
                var.AutoSundialToggle:Set(false)
                return
            else
                -- then this one doesn't get run
                if not LocalPlayer.Backpack:FindFirstChild("Sundial Totem") and not LocalPlayer.Character:FindFirstChild("Sundial Totem") then
                    lib:Notification("Auto Sundial", "No Sundial Totem found", 5)
                    var.AutoSundialToggle:Set(false)
                    return
                end
            end
        end
        
        while var.AutoSundial do
            task.wait()
            if var.SelectedEvent[1] == "Whales Pool" and #var.SelectedEvent == 1 and (not LocalPlayer.PlayerGui:FindFirstChild("reel") and not LocalPlayer.PlayerGui:FindFirstChild("shakeui")) then
                local eventDetected = false
                print("hereeee")
                local wasHoldingRod = LocalPlayer.Character:FindFirstChild(getEquippedRod())
                local whalesPool = workspace.zones.fishing:FindFirstChild("Whales Pool")
                
                if whalesPool then
                    print("Whales Pool detected, waiting for it to end.")
                    eventDetected = true
                    if var.SelectedEventTotem then
                        var.TotemInUse = true
                        if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                            task.wait(0.2)
                            LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                            task.wait(0.5)
                        end
                        if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                            workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                            task.wait(0.5)
                        end
                    end

                    while var.AutoSundial and workspace.zones.fishing:FindFirstChild("Whales Pool") do
                        print("waiting")
                        task.wait(1)
                    end
                end

                -- Fallback behavior if no event detected
                if not eventDetected then
                    print("event not dtc")
                    if game:GetService("ReplicatedStorage").world.weather.Value ~= "Rain" then
                        var.TotemInUse = true
                        local function equipTempest()
                            if LocalPlayer.Backpack:FindFirstChild("Tempest Totem") then
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                task.wait(0.2)
                                LocalPlayer.Backpack:FindFirstChild("Tempest Totem").Parent = LocalPlayer.Character
                                task.wait(0.5)
                            end
                        end

                        equipTempest()
                        local retries = 3
                        while retries > 0 and not LocalPlayer.Character:FindFirstChild("Tempest Totem") do
                            task.wait(0.5)
                            equipTempest()
                            retries -= 1
                        end

                        if LocalPlayer.Character:FindFirstChild("Tempest Totem") then
                            workspace[LocalPlayer.Name]["Tempest Totem"]:Activate()
                            task.wait(0.5)
                        end
                    else
                        if game:GetService("ReplicatedStorage").world.weather.Value == "Rain" then
                            var.TotemInUse = true
                            local function equipSmokescreen()
                                if LocalPlayer.Backpack:FindFirstChild("Smokescreen Totem") then
                                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                    task.wait(0.2)
                                    LocalPlayer.Backpack:FindFirstChild("Smokescreen Totem").Parent = LocalPlayer.Character
                                    task.wait(0.5)
                                end
                            end
    
                            equipSmokescreen()
                            local retries = 3
                            while retries > 0 and not LocalPlayer.Character:FindFirstChild("Smokescreen Totem") do
                                task.wait(0.5)
                                equipSmokescreen()
                                retries -= 1
                            end
    
                            if LocalPlayer.Character:FindFirstChild("Smokescreen Totem") then
                                workspace[LocalPlayer.Name]["Smokescreen Totem"]:Activate()
                                task.wait(0.5)
                            end
                        end
                    end
                end

                -- Re-equip fishing rod if it was equipped before
                if wasHoldingRod then
                    local rod = LocalPlayer.Backpack:FindFirstChild(getEquippedRod())
                    if rod then
                        var.TotemInUse = false
                        rod.Parent = LocalPlayer.Character
                        task.wait(0.5)
                    end
                end

                var.TotemInUse = false
            else
                local currentCycle = ReplicatedStorage.world.cycle.Value

                if currentCycle ~= var.LastCycle and (not LocalPlayer.PlayerGui:FindFirstChild("reel") and not LocalPlayer.PlayerGui:FindFirstChild("shakeui")) then
                    local eventDetected = false
                    local wasHoldingRod = LocalPlayer.Character:FindFirstChild(getEquippedRod())

                    -- Kraken Event Handling
                    if table.find(var.SelectedEvent, "Kraken") then
                        local krakenPool = workspace.zones.fishing:FindFirstChild("The Kraken Pool") or workspace.zones.fishing:FindFirstChild("Ancient Kraken Pool")

                        if krakenPool then
                            print("Kraken Pool detected, waiting for it to end.")
                            eventDetected = true

                            if var.SelectedEventTotem then
                                var.TotemInUse = true
                                if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                    task.wait(0.2)
                                    LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                                    task.wait(0.5)
                                end
                                if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                                    workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                                    task.wait(0.5)
                                end
                            end

                            while var.AutoSundial and (workspace.zones.fishing:FindFirstChild("The Kraken Pool") or workspace.zones.fishing:FindFirstChild("Ancient Kraken Pool")) do
                                task.wait(1)
                            end
                            print("Kraken Pool event ended.")
                        end
                    end

                    -- Orcas Event Handling
                    if table.find(var.SelectedEvent, "Orcas") then
                        local OrcasPool = workspace.zones.fishing:FindFirstChild("Orcas Pool")

                        if OrcasPool then
                            print("Orcas Pool detected, waiting for it to end.")
                            eventDetected = true

                            if var.SelectedEventTotem then
                                var.TotemInUse = true
                                if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                    task.wait(0.2)
                                    LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                                    task.wait(0.5)
                                end
                                if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                                    workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                                    task.wait(0.5)
                                end
                            end

                            while var.AutoSundial and workspace.zones.fishing:FindFirstChild("Orcas Pool") do
                                task.wait(1)
                            end
                            print("Orcas Pool event ended.")
                        end
                    end

                    -- Megalodon Event Handling
                    if table.find(var.SelectedEvent, "Megalodon") then
                        local foundMegalodon = false

                        for _, child in pairs(workspace.zones.fishing:GetChildren()) do
                            if child:FindFirstChild("beacon") then
                                local poiHeader = child:FindFirstChild("POIHeader")
                                if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                                    if poiHeader.title.Text:find("Megalodon") then
                                        print("Megalodon detected in POIHeader, waiting for it to end.")
                                        foundMegalodon = true
                                        eventDetected = true

                                        if var.SelectedEventTotem then
                                            var.TotemInUse = true
                                            if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                                task.wait(0.2)
                                                LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                                                task.wait(0.5)
                                            end
                                            if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                                                workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                                                task.wait(0.5)
                                            end
                                        end

                                        while var.AutoSundial do
                                            local currentText = poiHeader.title.Text
                                            if not currentText:find("Megalodon") then
                                                print("Megalodon event ended.")
                                                break
                                            end
                                            task.wait(1)
                                        end
                                        break
                                    end
                                end
                            end
                        
                            local abundance = child:FindFirstChild("Abundance")
                            if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
                                if child.Name:find("Megalodon") then
                                    print("Megalodon detected in fishing zone name, waiting for it to end.")
                                    foundMegalodon = true
                                    eventDetected = true

                                    if var.SelectedEventTotem then
                                        var.TotemInUse = true
                                        if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                                            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                            task.wait(0.2)
                                            LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                                            task.wait(0.5)
                                        end
                                        if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                                            workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                                            task.wait(0.5)
                                        end
                                    end

                                    while var.AutoSundial do
                                        if not child.Name:find("Megalodon") then
                                            print("Megalodon event ended in fishing zone name.")
                                            break
                                        end
                                        task.wait(1)
                                    end
                                    break
                                end
                            end
                        end
                    end

                    -- Convert single event to table if needed
                    local function getEventList()
                        if type(var.SelectedEvent) == "string" then
                            return {var.SelectedEvent}
                        end
                        return var.SelectedEvent
                    end

                    -- Other Events Handling
                    if not eventDetected then
                        local currentEvent = ReplicatedStorage.world.event.Value
                        local eventList = getEventList()

                        for _, eventName in ipairs(eventList) do
                            if currentEvent ~= eventName then

                                if var.SelectedEventTotem then
                                    var.TotemInUse = true
                                    if LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem) then
                                        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                        task.wait(0.2)
                                        LocalPlayer.Backpack:FindFirstChild(var.SelectedEventTotem).Parent = LocalPlayer.Character
                                        task.wait(0.5)
                                    end
                                    if workspace[LocalPlayer.Name]:FindFirstChild(var.SelectedEventTotem) then
                                        workspace[LocalPlayer.Name][var.SelectedEventTotem]:Activate()
                                        task.wait(0.5)
                                    end
                                end

                                -- Wait for event to end before checking for next event
                                while var.AutoSundial and ReplicatedStorage.world.event.Value == eventName do
                                    print("Event matched: ", eventName)
                                    task.wait(1)
                                end
                                print("Event ended: ", eventName)
                                break
                            end
                        end
                    end

                    -- Fallback behavior if no event detected
                    if not eventDetected then
                        var.TotemInUse = true
                        local function equipSundial()
                            if LocalPlayer.Backpack:FindFirstChild("Sundial Totem") then
                                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                                task.wait(0.2)
                                LocalPlayer.Backpack:FindFirstChild("Sundial Totem").Parent = LocalPlayer.Character
                                task.wait(0.5)
                            end
                        end

                        equipSundial()
                        local retries = 3
                        while retries > 0 and not LocalPlayer.Character:FindFirstChild("Sundial Totem") do
                            task.wait(0.5)
                            equipSundial()
                            retries -= 1
                        end

                        if LocalPlayer.Character:FindFirstChild("Sundial Totem") then
                            workspace[LocalPlayer.Name]["Sundial Totem"]:Activate()
                            task.wait(0.5)
                        end
                    end

                    -- Re-equip fishing rod if it was equipped before
                    if wasHoldingRod then
                        local rod = LocalPlayer.Backpack:FindFirstChild(getEquippedRod())
                        if rod then
                            var.TotemInUse = false
                            rod.Parent = LocalPlayer.Character
                            task.wait(0.5)
                        end
                    end

                    var.LastCycle = currentCycle
                    var.TotemInUse = false
                end
            end
        end
    end)
})

sections.Item3:AddToggle("AutoMeteorToggle", {
    Title = "Auto Meteor",
    Default = false,
    Description = "Automatically collects item from meteor.",
    Callback = function(isEnabled)
        var.AutoMeteor = isEnabled
        if var.AutoMeteor then
            -- initial check
            if checkMeteor() ~= false then
                local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                local meteorItem =  workspace:FindFirstChild("MeteorItems"):GetChildren()[1]
                LocalPlayer.Character.HumanoidRootPart.Position = meteorItem.WorldPivot.Position
                for _, child in ipairs(workspace:WaitForChild("MeteorItems"):GetDescendants()) do
                    if child:IsA("ProximityPrompt") then
                        meteoroldParent = child.Parent
                        child.Parent = LocalPlayer.Character
                    end
                end
                wait(3)
                for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = meteoroldParent
                    end
                end
                LocalPlayer:RequestStreamAroundAsync(Vector3.new(oldPosition.Position))
                LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
            end
            

            --
            AutoMeteorConnection = workspace:WaitForChild("MeteorItems").ChildAdded:Connect(function(child)
                local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                local meteorItem =  workspace:FindFirstChild("MeteorItems"):GetChildren()[1]
                LocalPlayer.Character.HumanoidRootPart.Position = meteorItem.WorldPivot.Position
                for _, child in ipairs(workspace:WaitForChild("MeteorItems"):GetDescendants()) do
                    if child:IsA("ProximityPrompt") then
                        meteoroldParent = child.Parent
                        child.Parent = LocalPlayer.Character
                    end
                end
                wait(3)
                for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = meteoroldParent
                    end
                end
                LocalPlayer:RequestStreamAroundAsync(Vector3.new(oldPosition.Position))
                LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
            end)
        else
            if AutoMeteorConnection ~= nil then
                AutoMeteorConnection:Disconnect()
                AutoMeteorConnection = nil
            end
        end
    end,
})

sections.Item3:AddToggle("AutoMeteorToggle", {
    Title = "Auto Purchase Sundial",
    Default = false,
    Description = "Automatically purchases more Sundial Totem(s) if you don't have any.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoPurchaseSundial = isEnabled
        while var.AutoPurchaseSundial do
            local heldTool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if heldTool ~= "Sundial Totem" then
                --not holding.
                if not LocalPlayer.Backpack["Sundial Totem"] then
                    -- not in backpack either, gotta purchase..
                    game:GetService('ReplicatedStorage').events.purchase:FireServer("Sundial Totem", "Item", nil, 1)
                else 
                    -- LocalPlayer.Character.Humanoid:EquipTool(LocalPlayer.Backpack["Sundial Totem"])
                end
            else
                -- still got sundial, and in hand.
            end
            task.wait(1)
        end
    end)
})


-- sections.Item4:AddParagraph({Title = '<font color="#ea00ff">T</font><font color="#d700ff">r</font><font color="#c500ff">e</font><font color="#b200ff">a</font><font color="#a000ff">s</font><font color="#8e00ff">u</font><font color="#7b00ff">r</font><font color="#6900ff">e</font><font color="#5700ff">s</font>', Description = ""})
-- sections.Item4:AddParagraph({Title = gradient("Dupe Info"), Description = "<b>The items selected below will be duped.</b>\nFor example: If you have 20 treasure maps and use 3 and got the selected item, the remaining 17 maps will be used and you'll be left with 17 of that item."})

-- local treasureNames = {}
-- if type(data.Treasure) == "table" then
--     for treasureName, treasureData in pairs(data.Treasure) do
--         table.insert(treasureNames, treasureName)
--     end
-- end

-- sections.Item4:AddDropdown("TreasureItems", {
--     Title = "Select Item(s)",
--     Description = "",
--     PlaceHolder = "Select Item - Treasure",
--     Options = treasureNames,
--     Default = "",
--     Multiple = true,
--     Callback = function(SelectedTreasureItems)
--         var.SelectedTreasureItems = SelectedTreasureItems

--         for _, item in ipairs(var.SelectedTreasureItems) do
--             print(item)
--         end
--     end,
-- })

local sunkenLocations = {
    Moosewood = {
        {936, 130, -159},
        {693, 130, -362},
        {613, 130, 498},
        {285, 130, 564},
        {283, 130, -159},
    },
    RoslitBay = {
        {-1179, 130, 565},
        {-1217, 130, 201},
        {-1967, 130, 980},
        {-2444, 130, 266},
        {-2444, 130, -37},
    },
    SunstoneIsland = {
        {-852, 130, -1560},
        {-1000, 130, -751},
        {-1500, 130, -750},
        {-1547, 130, -1080},
        {-1618, 130, -1560},
    },
    TerrapinIsland = {
        {798, 130, 1667},
        {562, 130, 2455},
        {393, 130, 2435},
        {-1, 130, 1632},
        {-190, 130, 2450},
    },
    MushgroveSwamp = {
        {2890, 130, -997},
        {2729, 130, -1098},
        {2410, 130, -1110},
        {2266, 130, -721},
    },
    ForsakenShores = {
        {-2460, 130, 2047},
    }
}

-- Helper function to check location names in announcement
local function getLocationFromAnnouncement(text)
    -- Create a mapping of location names to their exact keys
    local locationMapping = {
        ["Moosewood"] = "Moosewood",
        ["Roslit Bay"] = "RoslitBay",
        ["Sunstone Island"] = "SunstoneIsland",
        ["Terrapin Island"] = "TerrapinIsland",
        ["Mushgrove Swamp"] = "MushgroveSwamp",
        ["Forsaken Shores"] = "ForsakenShores"
    }
    
    for displayName, key in pairs(locationMapping) do
        if string.find(text, displayName) then
            return key
        end
    end
    return nil
end

local sunkenConnection
sections.Item4:AddToggle("EnableAutoSunkenTreasure", {
    Title = "Auto Sunken Treasure (experimental)",
    Default = false,
    Description = "<b><font color='rgb(255, 255, 255)'>-------------------------------------[Normal Treasure]-----------------------------------</font></b>",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoSunken = isEnabled
        
        if var.AutoSunken then
            -- intial check
            if isSunkenChestActive() then
                for _, locations in pairs(sunkenLocations) do
                    for _, position in ipairs(locations) do
                        print("yeah")
                        LocalPlayer:RequestStreamAroundAsync(Vector3.new(unpack(position)))
                        if workspace.ActiveChestsFolder:FindFirstChild("Pad") then
                            workspace.ActiveChestsFolder.Pad.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                        end
                    end
                end
                local chestsFolder = workspace.ActiveChestsFolder.Pad.Chests
                local offset = Vector3.new(0, 5, 0)
                local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                                            
                for _, chest in ipairs(chestsFolder:GetChildren()) do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest.WorldPivot.Position + offset)
                                            
                    for _, child in ipairs(chest:GetDescendants()) do
                        if child:IsA("ProximityPrompt") and child.Name == "Prompt" then
                            local originalParent = child.Parent
                            child.Parent = game.Players.LocalPlayer.Character
                            print("Moved ProximityPrompt to the character:", child.Name)
                            
                            local char = game.Players.LocalPlayer.Character
                            for _, obj in ipairs(char:GetChildren()) do
                                if obj:IsA("ProximityPrompt") and obj.Name == "Prompt" then
                                    while obj.Enabled do
                                        obj.HoldDuration = 0
                                        obj.MaxActivationDistance = math.huge
                                        obj:InputHoldBegin()
                                        task.wait(0.01)
                                        obj:InputHoldEnd()
                                        task.wait(0.1)
                                    end
                                    obj.Parent = originalParent
                                end
                            end
                        end
                    end
                    task.wait(1)
                end
                                            
                LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
            end

            local topannouncements = LocalPlayer.PlayerGui.hud.safezone.topannouncements
            sunkenConnection = topannouncements.ChildAdded:Connect(function(child)
                local main = child:FindFirstChild("Main")
                if main and main:IsA("TextLabel") then
                    if main:IsA("TextLabel") and string.find(main.Text, "Sunken Treasure") then
                        local location = getLocationFromAnnouncement(main.Text)
                        if location and sunkenLocations[location] then
                            -- Stream all coordinates for the matching location
                            for _, coords in ipairs(sunkenLocations[location]) do
                                local position = Vector3.new(coords[1], coords[2], coords[3])
                                LocalPlayer:RequestStreamAroundAsync(position)
                                if workspace.ActiveChestsFolder:FindFirstChild("Pad") then
                                    workspace.ActiveChestsFolder.Pad.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                                end
                            end
                            if workspace.ActiveChestsFolder:FindFirstChild("Pad") then
                                workspace.ActiveChestsFolder.Pad.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                            end

                            local chestsFolder = workspace.ActiveChestsFolder.Pad.Chests
                            local offset = Vector3.new(0, 5, 0)
                            local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
                            
                            for _, chest in ipairs(chestsFolder:GetChildren()) do
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(chest.WorldPivot.Position + offset)
                                                        
                                for _, child in ipairs(chest:GetDescendants()) do
                                    if child:IsA("ProximityPrompt") and child.Name == "Prompt" then
                                        local originalParent = child.Parent
                                        child.Parent = game.Players.LocalPlayer.Character
                                        print("Moved ProximityPrompt to the character:", child.Name)
                                        
                                        local char = game.Players.LocalPlayer.Character
                                        for _, obj in ipairs(char:GetChildren()) do
                                            if obj:IsA("ProximityPrompt") and obj.Name == "Prompt" then
                                                while obj.Enabled do
                                                    obj.HoldDuration = 0
                                                    obj.MaxActivationDistance = math.huge
                                                    obj:InputHoldBegin()
                                                    task.wait(0.01)
                                                    obj:InputHoldEnd()
                                                    task.wait(0.1)
                                                end
                                                obj.Parent = originalParent
                                            end
                                        end
                                    end
                                end
                                task.wait(1)
                            end
                            
                            LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
                        end
                    end
                end
            end)
        elseif sunkenConnection then
            sunkenConnection:Disconnect()
            sunkenConnection = nil
        end
    end)
})



local function interactWithChest(chest)
    if chest and chest:FindFirstChild("ProximityPrompt") then
        local prompt = chest.ProximityPrompt
        prompt.HoldDuration = 0
        prompt.MaxActivationDistance = math.huge
        
        local player = game:GetService("Players").LocalPlayer
        local char = player.Character
        
        -- Temporarily parent the ProximityPrompt to the character
        prompt.Parent = char
        task.wait()
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                obj:InputHoldBegin()
                task.wait(0.01)
                obj:InputHoldEnd()
                obj:Destroy() -- Remove the prompt
                chest:Destroy() -- Destroy the chest after interaction
            end
        end
    else
        warn("Chest or ProximityPrompt not found!")
    end
end



local function fixAllMaps()
    LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
        if v.Name == "Treasure Map" then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            print("equipped, remote..")
            workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
            
            print("remote success")
        end
    end
end

local function collectAllChests()
    for i, v in pairs(workspace.world.chests:GetDescendants()) do
        if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
            for _, v in pairs(workspace.world.chests:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    if fireproximityprompt then
                        fireproximityprompt(v)
                    else
                        interactWithChest(v)
                    end
                end
            end
        end 
    end
end


sections.Item4:AddToggle("RepairMapCollectTreasureToggle", {
    Title = "Auto Repair & Collect Treasure(s)",
    Default = false,
    Description = "If this feature isn't working, try talking to jack.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        variables.MapToggle = isEnabled
        while variables.MapToggle do
            if var.TreasureDupeAllowed then
                -- Dupe Mode
                print("wait mode")
                local mapCount = 0

                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "Treasure Map" then
                        mapCount = mapCount + 1
                    end
                end
                print(mapCount)
                print(var.MinMapAmount)
                if mapCount >= var.MinMapAmount then
                    print('above')
                    print(mapCount)
                    print(var.MinMapAmount)
                    fixAllMaps()

                    
                    local announcements = LocalPlayer.PlayerGui.hud.safezone.announcements

                    DUPEMODECONNECTION = announcements.ChildAdded:Connect(function(child)
                        if child.Name == "Template" then
                            local main = child:FindFirstChild("Main")
                            if main and main:IsA("TextLabel") then
                                for _, item in ipairs(var.SelectedTreasureItems or {}) do
                                    if main.Text:find(item) then
                                        if item:find("Sunken") then
                                            -- Check if "Rod" is also present in the text
                                            if not main.Text:find("Rod") then
                                                print("Found Sunken but not Rod:", item)
                                                var.treasureDupeMode = true
                                                collectAllChests()
                                                DUPEMODECONNECTION:Disconnect()
                                                var.treasureDupeMode = false
                                                break
                                            else
                                                print("Ignored because it contains Rod:", item)
                                            end
                                        else
                                            print("found:", item)
                                            var.treasureDupeMode = true
                                            collectAllChests()
                                            DUPEMODECONNECTION:Disconnect()
                                            var.treasureDupeMode = false
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    

                    -- Collect Treasure
                    for i, v in pairs(workspace.world.chests:GetDescendants()) do
                        if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
                            for _, v in pairs(workspace.world.chests:GetDescendants()) do
                                if v.Name == "ProximityPrompt" then
                                    if not variables.MapToggle or var.treasureDupeMode then
                                        break
                                    end
                                    
                                    if fireproximityprompt then
                                        fireproximityprompt(v)
                                    else
                                        interactWithChest(v.Parent.Name)
                                    end
                                    task.wait(1)
                                end
                            end
                        end 
                    end
                end
            else
                -- Normal, Auto Mode
                print("do.")
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
                    if v.Name == "Treasure Map" then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        print("equipped, remote..")
                        workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
                        print("remote success")
                    end
                end

                -- Collect Treasure
                for i, v in pairs(workspace.world.chests:GetDescendants()) do
                    if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
                        for _, v in pairs(workspace.world.chests:GetDescendants()) do
                            if v.Name == "ProximityPrompt" then
                                if not variables.MapToggle then
                                    break
                                end       
                                
                                if fireproximityprompt then
                                    fireproximityprompt(v)
                                else
                                    interactWithChest(v.Parent.Name)
                                end
                                task.wait(1)
                            end
                        end
                    end 
                end
            end
            DestroyGhostItems()
            task.wait(1)
        end
    end)
})


local treasureGroupButton = sections.Item4:AddGroupButton()

treasureGroupButton:AddButton({
    Title = "Talk To Jack",
    Variant = "Outline",
    Callback = function()
        LocalPlayer:RequestStreamAroundAsync(Vector3.new(-2829.855712890625, 212.09266662597656, 1517.4398193359375))
        if workspace.world.npcs:FindFirstChild("Jack Marrow") then
            workspace.world.npcs["Jack Marrow"].dialogprompt.Parent = LocalPlayer.Character
            -- task.wait(1)
            local char = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = workspace.world.npcs["Jack Marrow"]
                end
            end
            lib:Notification("Talk To Jack", "Talked to Jack Marrow", 5)
        else
            lib:Notification("Talk To Jack", "Failed to find Jack Marrow", 5)
        end
    end,
})

treasureGroupButton:AddButton({
    Title = "Repair Held Map",
    Variant = "Outline",
    Callback = function()
        -- should add a check to see if they're holding or not lol
        workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
    end,
})


treasureGroupButton:AddButton({
    Title = "Use Held Map",
    Variant = "Outline",
    Callback = function()
        local treasureCoordinates = tostring(LocalPlayer.PlayerGui["Treasure Map"].Main.CoordinatesLabel.Text)

        -- Extract the coordinates from the text
        local x, y, z = treasureCoordinates:match("X ([%d%.%-]+), Y ([%d%.%-]+), Z ([%d%.%-]+)")
        
        if x and y and z then
            local formattedString = string.format("TreasureChest_%s_%s_%s", x, y, z)
            print(formattedString)
            
            local chest = workspace.world.chests:FindFirstChild(formattedString)
            if chest then
                if fireproximityprompt then
                    fireproximityprompt(chest.ProximityPrompt)
                else       
                    interactWithChest(chest)
                end
            else
                lib:Notification("Use Held Map", "Treasure chest not found!", 5)
            end
            
            task.wait()
        else
            lib:Notification("Use Held Map", "An error has occurred, make sure you're holding the map.", 5)
        end
    end,
})

-- treasureGroupButton:AddButton({
--     Title = "Repair All Maps",
--     Variant = "Primary",
--     Callback = function()
--         for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do 
--             if v.Name == "Treasure Map" then
--                 game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
--                 print("equipped, remote..")
--                 workspace.world.npcs["Jack Marrow"].treasure.repairmap:InvokeServer()
--                 print("remote success")
--             end
--         end
--     end,
-- })

-- treasureGroupButton:AddButton({
--     Title = "Collect All Treasures",
--     Variant = "Primary",
--     Callback = function()
--         for i, v in pairs(workspace.world.chests:GetDescendants()) do
--             if v:IsA("Part") and v:FindFirstChild("ChestSetup") then 
--                 for _, v in pairs(workspace.world.chests:GetDescendants()) do
--                     if v.Name == "ProximityPrompt" then
--                         task.wait(1)
--                         fireproximityprompt(v)
--                     end
--                 end
--                 task.wait(1)
--             end 
--         end
--     end,
-- })


treasureGroupButton:AddButton({
    Title = "Use All Fillionaires",
    Variant = "Primary",
    Callback = function()
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        local Fillionaire = LocalPlayer.Backpack:FindFirstChild("Fillionaire")
        local FillionaireLink = tostring(Fillionaire.link.Value)
        local FillionaireAmount = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[FillionaireLink].Stack.Value
        
        if Fillionaire then
            for _ = 1, FillionaireAmount do
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(Fillionaire)
            end
        end
        task.wait(1)
        local mainGui = LocalPlayer.PlayerGui.Fillionaire.Main

        for _, child in ipairs(mainGui:GetChildren()) do
            if child.Name == "Template" and child.Visible then
                local playerNumbers = child:FindFirstChild("PlayerNumbers")
                if playerNumbers then
                    for i = 1, 4 do
                        local numberButton = playerNumbers:FindFirstChild(tostring(i))
                        if numberButton and numberButton:IsA("GuiButton") then
                            if getconnections then
                                for _, v in pairs(getconnections(numberButton.MouseButton1Click)) do
                                    v.Function()
                                end
                            else
                                firesignal(numberButton.MouseButton1Click)
                            end
                            -- print("Triggered MouseButton1Click for:", numberButton.Name) -- Debug
                        end
                    end
                end
                task.wait()
                child:Destroy()
            end
        end
    end,
})

sections.Item4:AddParagraph({Title = gradient("Dupe Info"), Description = "<b>The items selected below will be duped.</b>\nFor example: If you have 20 treasure maps and use 3 and got the selected item, the remaining 17 maps will be used and you'll be left with 17 of that item."})

-- local treasureNames = {}
-- if type(data.Treasure) == "table" then
--     for treasureName, treasureData in pairs(data.Treasure) do
--         table.insert(treasureNames, treasureName)
--     end
-- end




sections.Item4:AddDropdown("TreasureItems", {
    Title = "Select Item(s)",
    Description = "",
    PlaceHolder = "Select Item - Treasure",
    Options = {"Aurora Totem", "Meteor Totem", "Tempest Totem", "Fillionaire", "Magic Thread", "Ancient Thread", "Lunar Thread", "Weird Algae", "Truffle Worm", "Quality Bait Crate", "XP (Untested)", "[Sunken] Fish"},
    Default = "",
    Multiple = true,
    Callback = function(SelectedTreasureItems)
        -- Modify the selected items
        var.SelectedTreasureItems = {}

        for _, item in ipairs(SelectedTreasureItems) do
            if item == "XP (Untested)" then
                table.insert(var.SelectedTreasureItems, "XP")
            elseif item == "[Sunken] Fish" then
                table.insert(var.SelectedTreasureItems, "Sunken")
            else
                table.insert(var.SelectedTreasureItems, item)
            end
        end

        -- Debug: Print the modified list
        print("Selected Treasure Items:", table.concat(var.SelectedTreasureItems, ", "))
    end,
})



sections.Item4:AddToggle("EnableTreasureDupe", {
    Title = "Enable Treasure Dupe",
    Default = false,
    Description = "Auto Repair & Collect Treasures still needs to be on.",
    Callback = function(isEnabled)
        var.TreasureDupeAllowed = isEnabled
        print()
    end,
})

sections.Item4:AddSlider("MinMapAmount", {
    Title = "Minimum Map Amount",
    Description = "20 is recommended for more effective duping.",
    Default = 20,
    Min = 0,
    Max = 20,
    Increment = 1,
    Callback = function(value)
        var.MinMapAmount = value
    end,
})



-- [[Function Was Made By Sal (CommonUI)]] -- 
function CheckAllCages()
    if workspace.active.crabcages:FindFirstChild(game:GetService("Players").LocalPlayer.Name) and  workspace.active.crabcages:FindFirstChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("Cage") then
        for i,v in pairs(workspace.active.crabcages:GetChildren()) do
            if v.Name == game:GetService("Players").LocalPlayer.Name and v:FindFirstChild("Cage") and v:WaitForChild("Prompt").Enabled == true then
                fireproximityprompt(v:WaitForChild("Prompt"),0)
            end
        end
    end
end
-- [[Function Was Made By Sal (CommonUI)]] -- 

var.CrabCageToggle = sections.Item6:AddToggle("CrabCageToggle", {
    Title = "Auto Place",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoCrabCage = isEnabled
        if var.AutoCrabCage then
            if not workspace.Camera:FindFirstChild("Cage") then
                lib:Notification("Auto Place", "Please hold a crab cage.", 5)
                var.CrabCageToggle:Set(false)
            end
            while var.AutoCrabCage do
                pcall(function()
                    if workspace.Camera.Cage.hitbox.Color == Color3.fromRGB(125, 255, 105) then
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Crab Cage").Deploy:FireServer(workspace.Camera.Cage.hitbox.CFrame)
                        task.wait(0.5)
                    end
                end)
                task.wait()
            end
        end
    end)
})

sections.Item6:AddButton({
    Title = "Claim nearby Crab Cages",
    Callback = function()
        if fireproximityprompt then
            CheckAllCages()
        else
            lib:Notification("Claim", "Incompatible Exploit", 5)
        end
    end,
})


variables.TeleLocationParagraph = sections.Tele:AddParagraph({Title = gradient("Location Info"), Description = "X,Y,Z | Location"})

task.spawn(LPH_JIT_MAX(function()
    while wait(1) do
        pcall(function()
            local position = LocalPlayer.Character.HumanoidRootPart.Position
            local zone = workspace[LocalPlayer.Name].zone.Value
            formattedPosition = string.format("%.1f, %.1f, %.1f", position.X, position.Y, position.Z)
            formattedPositionWithZone = string.format("%.1f, %.1f, %.1f | %s", position.X, position.Y, position.Z, tostring(zone))
            variables.TeleLocationParagraph:SetDesc(formattedPositionWithZone)
        end)
    end
end))

 

local function loadSavedLocations()
    local savedLocations = {}
    local savedPositions = {}
    local data = readfile("Lunor/Fisch/saved_teleports.json")
    
    for teleportSaveName, formattedPosition in data:gmatch('"(.-)" = "(.-)"') do
        table.insert(savedLocations, teleportSaveName)
        savedPositions[teleportSaveName] = formattedPosition
    end
    return savedLocations, savedPositions
end

pcall(function()
    local savedLocations, savedPositions = loadSavedLocations()
    var.SavedLocationsDropDown = sections.Tele:AddDropdown("SavedLocations", {
        Title = "Saved Locations Teleport",
        Description = "",
        Options = savedLocations,
        PlaceHolder = "Select Location",
        Default = "",
        Multiple = false,
        Callback = function(selectedLocation)
            if selectedLocation ~= "" then
                local position = savedPositions[selectedLocation]
                var.SelectedSavedLocations = savedPositions[selectedLocation]
                if position then
                    local x, y, z = position:match("([^,]+),([^,]+),([^,]+)")
                    x, y, z = tonumber(x), tonumber(y), tonumber(z)
                    ChangePlayerCFrame(x, y, z)
                end
            end
        end,
    })
end)
sections.Tele:AddTextbox({
    Title = "Save: Name",
    Default = "",
    Description = "",
    PlaceHolder = "Input",
    TextDisappear = false,
    Callback = function(teleportSaveName)
        variables.teleportSaveName = teleportSaveName
    end
})

local teleportGroupButton = sections.Tele:AddGroupButton()
teleportGroupButton:AddButton({
    Title = "Save Location",
    Callback = function()
        if formattedPosition then
            local teleportData = string.format('"%s" = "%s"\n', variables.teleportSaveName, formattedPosition)
            appendfile("Lunor/Fisch/saved_teleports.json", teleportData)
            lib:Notification("Save Location", "Successfully saved location " .. formattedPosition .. " as " .. variables.teleportSaveName, 5)
            savedLocations, savedPositions = loadSavedLocations()
            var.SavedLocationsDropDown:Refresh(savedLocations, true)
        else
            lib:Notification("Error", "Formatted position is nil. Cannot save location.", 5)
        end
    end,
})

teleportGroupButton:AddButton({
    Title = "Delete Location",
    Callback = function()
        local selectedLocation = var.SavedLocationsDropDown.Value
        if selectedLocation and selectedLocation ~= "" then
            -- Read current file content
            local data = readfile("Lunor/Fisch/saved_teleports.json")
            
            -- Create new content excluding the selected location
            local newContent = ""
            for teleportSaveName, formattedPosition in data:gmatch('"(.-)" = "(.-)"') do
                if teleportSaveName ~= selectedLocation then
                    newContent = newContent .. string.format('"%s" = "%s"\n', teleportSaveName, formattedPosition)
                end
            end
            
            -- Write the new content back to file
            writefile("Lunor/Fisch/saved_teleports.json", newContent)
            
            -- Update the saved locations and refresh dropdown
            savedLocations, savedPositions = loadSavedLocations()
            var.SavedLocationsDropDown:Refresh(savedLocations, true)
            var.SavedLocationsDropDown:Set()
            
            -- Show success notification
            lib:Notification("Delete Location", "Successfully deleted location: " .. selectedLocation, 5)
        else
            lib:Notification("Error", "Please select a location to delete", 5)
        end
    end,
})

teleportGroupButton:AddButton({
    Title = "Copy Coordinate",
    Variant = "Outline",
    Callback = function()
        local pos = tostring(LocalPlayer.Character.WorldPivot.Position)
        setclipboard(pos)
        lib:Notification("Copy Coordinate", "Successfully copied coordinates to clipboard.", 5)
    end,
})

sections.Tele1:AddDropdown("TeleportMethod", {
    Title = "Teleportation Method",
    Description = "Choose CFrame for instant teleportation or Tween for a smooth flight to the destination.",
    Options = {"Tween", "CFrame"},
    Default = "CFrame",
    Multiple = false,
    Callback = function(selectedOptions)
        if selectedOptions == "CFrame" then
            variables.TeleportMethod = true
            variables.TweenMethod = false
        elseif selectedOptions == "Tween" then
            variables.TweenMethod = true
            variables.TeleportMethod = false
        end
    end,
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local persistentPlayers = {}

-- Helper function to update dropdowns
local function updateDropdowns()
    pcall(function()
        -- Update PlayerDropDown
        if var.PlayerDropDown then
            var.PlayerDropDown:Refresh(persistentPlayers, true)
            local currentSelected = var.selectedPlayer or ""
            if currentSelected ~= "" and not table.find(persistentPlayers, currentSelected) then
                var.selectedPlayer = ""
            end
            var.PlayerDropDown:Set(var.selectedPlayer or "")
        end
        
        if var.PlayerDropDown2 then
            var.PlayerDropDown2:Refresh(persistentPlayers, true)
            local currentSelected2 = var.selectedPlayer2 or ""
            if currentSelected2 ~= "" and not table.find(persistentPlayers, currentSelected2) then
                var.selectedPlayer2 = ""
            end
            var.PlayerDropDown2:Set(var.selectedPlayer2 or "")
        end
    end)
end

-- Helper function to add player to persistent list
local function addToPersistentList(playerName)
    if not table.find(persistentPlayers, playerName) then
        table.insert(persistentPlayers, playerName)
        updateDropdowns()

        local player = Players:FindFirstChild(playerName)
        if player and player.Character then
            player.Character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
        end
    end
end

-- Workspace child added handler
Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and Players:FindFirstChild(child.Name) then
        addToPersistentList(child.Name)
    end
end)

-- Player joining handler
Players.PlayerAdded:Connect(function(player)
    -- Handle initial character if it exists
    if player.Character then
        addToPersistentList(player.Name)
    end
    
    -- Handle future characters
    player.CharacterAdded:Connect(function(character)
        addToPersistentList(player.Name)
    end)
    
    -- Handle player leaving
    player.CharacterRemoving:Connect(function()
        for i, name in ipairs(persistentPlayers) do
            if name == player.Name then
                table.remove(persistentPlayers, i)
                updateDropdowns()
                break
            end
        end
    end)
end)

-- Initialize existing players
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        addToPersistentList(player.Name)
    end
    
    player.CharacterAdded:Connect(function(character)
        addToPersistentList(player.Name)
    end)
    
    player.CharacterRemoving:Connect(function()
        for i, name in ipairs(persistentPlayers) do
            if name == player.Name then
                table.remove(persistentPlayers, i)
                updateDropdowns()
                break
            end
        end
    end)
end

-- Initial dropdown update
updateDropdowns()

-- Dropdown creation
var.PlayerDropDown = sections.Tele1:AddDropdown("PlayerTeleport", {
    Title = "Players",
    Description = "",
    Options = persistentPlayers,
    Default = "",
    PlaceHolder = "Select Player",
    Multiple = false,
    Callback = function(selectedPlayer)
        var.selectedPlayer = selectedPlayer
        if selectedPlayer ~= "" then
            LocalPlayer.Character.HumanoidRootPart.CFrame = workspace[selectedPlayer].HumanoidRootPart.CFrame
        end
    end,
})


sections.Tele1:AddDropdown("FishZones", {
    Title = "Fishing Zones",
    Description = "",
    Options = zoneNames,
    Default = "",
    PlaceHolder = "Select Zone",
    Multiple = false,
    Callback = function(selectedZone)
        var.selectedZone = selectedZone
        local part = workspace.zones.fishing:FindFirstChild(selectedZone)
        if part then
            -- Calculate the highest point of the part
            local highestPoint = part.CFrame * CFrame.new(0, part.Size.Y / 2, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = highestPoint
        end
    end,
})


-- Helper function to gather event names and update mapping
local function gatherEventNames()
    local newEventNames = {}  
    local newNameCount = {}   
    local newZoneMapping = {} 

    -- Guard clause
    local fishingZones = workspace.zones.fishing
    if not fishingZones then
        return {}, {}
    end

    -- Priority zones to check first
    local priorityZones = {
        {name = "Forsaken Veil - Scylla", displayName = "Scylla"},
        {name = "The Kraken Pool", displayName = "Kraken"},
        {name = "Ancient Kraken Pool", displayName = "Ancient Kraken"},
        {name = "Orcas Pool", displayName = "Orcas"},
        {name = "Ancient Orcas Pool", displayName = "Ancient Orcas"},
        {name = "The Depths - Serpent", displayName = "The Depths - Serpent"},
        {name = "Whales Pool", displayName = "Big Whales"},
    }

    -- Process priority zones first
    for _, zone in ipairs(priorityZones) do
        local child = fishingZones:FindFirstChild(zone.name)
        if child then
            local displayName = zone.displayName
            if not newNameCount[displayName] then
                newNameCount[displayName] = 1
            else
                newNameCount[displayName] = newNameCount[displayName] + 1
                displayName = displayName .. " (" .. newNameCount[displayName] .. ")"
            end
            
            newZoneMapping[displayName] = child.Name
            table.insert(newEventNames, displayName)
        end
    end

    -- Process all other zones
    for _, child in pairs(fishingZones:GetChildren()) do
        local zoneName = nil

        -- Check for beacon with POIHeader
        if child:FindFirstChild("beacon") then
            local poiHeader = child:FindFirstChild("POIHeader")
            if poiHeader and 
               poiHeader:FindFirstChild("title") and 
               poiHeader.title:IsA("TextLabel") then
                zoneName = poiHeader.title.Text
            end
        end

        -- Check for Abundance properties
        local abundance = child:FindFirstChild("Abundance")
        if abundance and 
           abundance:FindFirstChild("Chance") and 
           abundance:FindFirstChild("Mutation") then
            zoneName = child.Name
        end

        -- Process valid zone names
        if zoneName then
            -- Skip if contains "Abundance" or "Isonade"
            if not (zoneName:find("Abundance") or zoneName:find("Isonade")) then
                -- Check if this zone name hasn't already been processed
                if not newZoneMapping[zoneName] then
                    if not newNameCount[zoneName] then
                        newNameCount[zoneName] = 1
                    else
                        newNameCount[zoneName] = newNameCount[zoneName] + 1
                        zoneName = zoneName .. " (" .. newNameCount[zoneName] .. ")"
                    end

                    newZoneMapping[zoneName] = child.Name
                    table.insert(newEventNames, zoneName)
                end
            end
        end
    end

    -- Sort names alphabetically
    table.sort(newEventNames)

    return newEventNames, newZoneMapping
end

-- Helper function to update event dropdown
local function updateEventDropdown()
    pcall(function()
        if var.EventDropDown then
            local newEventNames, newZoneMapping = gatherEventNames()
            
            -- Update global variables
            eventNames = newEventNames
            zoneMapping = newZoneMapping
            
            -- Update dropdown
            var.EventDropDown:Refresh(newEventNames, true)
            
            -- Handle selected events that no longer exist
            if var.selectedEventOverrides then
                local validSelectedEvents = {}
                for _, event in ipairs(var.selectedEventOverrides) do
                    if table.find(newEventNames, event) then
                        table.insert(validSelectedEvents, event)
                    end
                end
                var.selectedEventOverrides = validSelectedEvents
            end
            
            var.EventDropDown:Set(var.selectedEventOverrides or {})
        end
    end)
end


updateEventDropdown()

-- ill finish it tmr
var.EventDropDown = sections.Tele1:AddDropdown("FishZones", {
    Title = "Events",
    Description = "",
    Options = eventNames,
    Default = "",
    PlaceHolder = "Select Event",
    Multiple = true,
    Callback = function(selectedEvents)
        var.selectedEventOverrides = selectedEvents
        -- Find the selected part by name and teleport the player to the highest point
        for _, event in ipairs(selectedEvents) do
            print("Selected event:", event)

            -- Get the actual part name from the zoneMapping table
            local actualZoneName = zoneMapping[event]

            if actualZoneName then
                local part = workspace.zones.fishing:FindFirstChild(actualZoneName)
                if part then
                    print("Teleporting to part:", part)
                    -- Calculate the highest point of the part
                    local highestPoint = part.CFrame * CFrame.new(0, part.Size.Y / 2, 0)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = highestPoint
                end
            end
        end
    end,
})


-- Update the button callback
sections.Tele1:AddButton({
    Title = "Update Events List",
    Variant = "Outline",
    Callback = function()
        updateEventDropdown()
    end,
})


local areaTeleportNames = {}
var.TpSpotsName = {}

for _, folder in pairs(workspace.world.spawns:GetChildren()) do
    if folder.Name ~= "TpSpots" and folder.Name ~= "loading" and folder.Name ~= "TeleportDelay" then
        table.insert(areaTeleportNames, folder.Name)
    end
end

for _,Place in pairs(workspace.world.spawns.TpSpots:GetChildren()) do
    table.insert(var.TpSpotsName, Place.Name)
end

sections.Tele1:AddDropdown("AreaTeleports", {
    Title = "Areas",
    Description = "",
    Options = areaTeleportNames,
    PlaceHolder = "Select Area",
    Default = "",
    Multiple = false,
    Callback = function(selectedArea)
        local areaTeleportFolder = workspace.world.spawns:FindFirstChild(selectedArea)
        if selectedArea ~= "" then
        if areaTeleportFolder then
            local firstChild = areaTeleportFolder:GetChildren()[1]
            if firstChild and firstChild:IsA("BasePart") then
                ChangePlayerCFrame(firstChild.Position.X, firstChild.Position.Y, firstChild.Position.Z)
            end
        end
        end
    end
})

sections.Tele1:AddDropdown("AreaTeleports2", {
    Title = "TP Spots",
    Description = "",
    Options = var.TpSpotsName,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        _G.TPSpots = workspace.world.spawns.TpSpots:FindFirstChild(selectedArea)
        if selectedArea ~= "" then
        if _G.TPSpots then
            ChangePlayerCFrame(_G.TPSpots.Position.X, _G.TPSpots.Position.Y + 5, _G.TPSpots.Position.Z)
        else
            warn("Selected area '" .. selectedArea .. "' does not exist.")
        end
        end
    end
})


local NPC = {
    ["Inn Keeper Forsaken Shores"] = "-2476.73779296875, 133.00003051757812, 1573.2672119140625",
    ["Summit Inn Keeper 1"] = "19664.458984375, 132.45314025878906, 5245.27783203125",
    ["Rhea"] = "-1038.4249267578125, 203.33749389648438, -1115.580078125",
    ["Kenith"] = "-1143.18017578125, 134.6342315673828, -1077.2073974609375",
    ["Skin Seller"] = "302.2337646484375, 132.14491271972656, 205.36087036132812",
    ["Forsaken Skin Merchant"] = "-2564.42578125, 148.63946533203125, 1645.054443359375",
    ["Terrapin Shipwright"] = "5869.421875, 143.49795532226562, 7.101318359375",
    ["Pierre"] = "391.3885498046875, 135.348388671875, 196.71238708496094",
    ["Alfredrickus"] = "-1520.84228515625, 141.5052947998047, 764.6096801757812",
    ["Inn Keeper Snowcap"] = "2660.8125, 155.0608367919922, 2395.78857421875",
    ["Snowcap Skin Merchant"] = "2652.446044921875, 141.2260284423828, 2537.990966796875",
    ["Mushgrove Elf"] = "2409.3662109375, 135.85812377929688, -732.3370361328125",
    ["Daisy"] = "581.550048828125, 165.49075317382812, 213.49996948242188",
    ["Idle Fishing NPC Moosewood2"] = "365.4126892089844, 132.44651794433594, 182.0972137451172",
    ["Mushgrove Skin Merchant"] = "2642.84814453125, 129.79051208496094, -708.4285278320312",
    ["Runaway Elf"] = "-7.39788818359375, 322.27178955078125, -9295.1376953125",
    ["Jack Marrow"] = "-2830.748046875, 215.2417449951172, 1518.34814453125",
    ["Terrapin Elf"] = "-160.50210571289062, 139.4464874267578, 1896.0755615234375",
    ["Claudia"] = "-7.519559383392334, 157.2010040283203, -1065.5740966796875",
    ["Idle Fishing NPC Moosewood"] = "423.3988037109375, 136.25140380859375, 333.18975830078125",
    ["Roslit Skin Merchant"] = "-1626.4571533203125, 133.33004760742188, 616.2025756835938",
    ["Terrapin Angler"] = "-1706.8802490234375, 148.00003051757812, 754.8173217773438",
    ["Summit Inn Keeper 4"] = "19889.65234375, 1154.7476806640625, 5510.896484375",
    ["Inn Keeper DesolateDeep"] = "-1651.9581298828125, -214.17938232421875, -2833.086669921875",
    ["Maverick Merchant"] = "-982.96435546875, -245.1102294921875, -2692.517333984375",
    ["Phineas"] = "469.91229248046875, 150.69342041015625, 277.9549865722656",
    ["Hiker #7"] = "19669.998046875, 140.966064453125, 5301.51953125",
    ["Mel Merchant"] = "-1658.4344482421875, -214.2913360595703, -2819.47314453125",
    ["Max Merchant"] = "-929.8687133789062, 131.07882690429688, -1104.6328125",
    ["Wilson"] = "2940.719482421875, 280.7838134765625, 2569.629638671875",
    ["Roddy"] = "-1004.0133056640625, -244.91015625, -2737.48291015625",
    ["Hiker #5"] = "19790.9453125, 415.4871826171875, 5418.53173828125",
    ["Hiker #11"] = "20062.3515625, 1136.42822265625, 5521.576171875",
    ["Forsaken Elf"] = "-2488.8203125, 134.00784301757812, 1474.3687744140625",
    ["Hiker #12"] = "19922.19921875, 1138.01318359375, 5357.24169921875",
    ["Latern Keeper"] = "658.4459838867188, 163.5, 260.2139892578125",
    ["???"] = "-85.54763793945312, -515.29931640625, 1135.826171875",
    ["Forsaken3"] = "-2706.95458984375, 165.62498474121094, 1755.236328125",
    ["Idle Fishing NPC 2.5"] = "-1778.79052734375, 148.22744750976562, 653.3268432617188",
    ["Moosewood Elf"] = "401.2041931152344, 136.28366088867188, 305.82623291015625",
    ["Miller Merchant"] = "19574.537109375, 132.71607971191406, 5312.08056640625",
    ["Hiker #2"] = "19526.990234375, 132.71607971191406, 5326.3896484375",
    ["Summit Inn Keeper 2"] = "19750.71875, 416.0520935058594, 5382.96484375",
    ["Hiker #3"] = "19824.34375, 130.375, 5216.85693359375",
    ["Roslit Shipwright"] = "-1452.0543212890625, 133.0000457763672, 745.169189453125",
    ["Hiker #1"] = "19603.392578125, 169.7622528076172, 5351.04443359375",
    ["Snowcap Shipwright"] = "2622.93994140625, 136.28387451171875, 2401.30517578125",
    ["Hiker #9"] = "19802.94921875, 424.77880859375, 5356.3935546875",
    ["Hiker #10"] = "19944.62109375, 1142.7388916015625, 5541.900390625",
    ["Desolate Skin Merchant"] = "-1573.1217041015625, -289.9115295410156, -2965.453125",
    ["Hiker #6"] = "20131.880859375, 208.6810760498047, 5453.31298828125",
    ["Statue Shipwright"] = "23.2196044921875, 135.03036499023438, -1007.029052734375",
    ["Quiet Synph"] = "566.2632446289062, 152.00003051757812, 353.8721008300781",
    ["Appraiser"] = "453.182373046875, 150.50003051757812, 206.90878295898438",
    ["Clarence"] = "-1625.3936767578125, -231.07135009765625, -2903.8525390625",
    ["Custos"] = "21.590187072753906, -707.9070434570312, 1253.7547607421875",
    ["Meteoriticist"] = "5921.576171875, 261.98199462890625, 596.27197265625",
    ["Tenebris"] = "1061.18408203125, -631.1304321289062, 1310.313232421875",
    ["Lucas"] = "449.3396301269531, 181.99989318847656, 180.68907165527344",
    ["Abyssus"] = "1399.0474853515625, -1016.0322875976562, 966.2442016601562",
    ["Marc Merchant"] = "466.1600341796875, 151.00205993652344, 224.49708557128906",
    ["Forsaken2"] = "-2586.603271484375, 149.00967407226562, 1682.072265625",
    ["Man Working On Rowboat"] = "-1446.365478515625, 134.98231506347656, 702.0789794921875",
    ["The Depths Angler"] = "981.8839111328125, -702.6148681640625, 1232.17529296875",
    ["Hiker #4"] = "19595.90234375, 132.71607971191406, 5271.5751953125",
    ["Perditus"] = "770.0521240234375, -730.6285400390625, 1383.4951171875",
    ["Inn Keeper Roslit"] = "-1512.37890625, 133.00003051757812, 631.2435302734375",
    ["Aspicientis"] = "1214.53125, -708.64404296875, 1320.8018798828125",
    ["Tom Elf"] = "404.63018798828125, 136.81517028808594, 317.099609375",
    ["Idle Fishing NPC 1"] = "-1428.9964599609375, 133.00003051757812, 686.034423828125",
    ["Forsaken1"] = "-2593.36572265625, 149.00970458984375, 1676.066162109375",
    ["Ancient Elf"] = "5813.37841796875, 147.48866271972656, 267.740234375",
    ["Merlin"] = "-928.0328369140625, 223.7000274658203, -998.7449951171875",
    ["Travelling Merchant"] = "-1059.0887451171875, 130.74203491210938, -1170.650390625",
    ["Gatherer Archaeologist"] = "6028.23388671875, 194.9801483154297, 298.5621337890625",
    ["Submersus"] = "1211.426513671875, -1015.798095703125, 1315.8280029296875",
    ["Roslit Elf"] = "-1919.3199462890625, 499.4999694824219, 162.685546875",
    ["Idle Fishing NPC 2"] = "-1778.5130615234375, 148.42538452148438, 648.0894775390625",
    ["Occultus"] = "1022.309326171875, -705.2661743164062, 1564.7314453125",
    ["Milo Merchant"] = "957.1780395507812, -711.5802001953125, 1263.293212890625",
    ["Mike Merchant"] = "2717.568359375, 157.17335510253906, 2374.478759765625",
    ["Analyst Archaeologist"] = "6086.53662109375, 194.98025512695312, 277.4117431640625",
    ["Henry"] = "483.539306640625, 152.383056640625, 236.296142578125",
    ["Marina"] = "68.12350463867188, 159.0147705078125, -1040.607177734375",
    ["Mann Merchant"] = "6080.77685546875, 194.97999572753906, 308.7760009765625",
    ["The Depths Skin Merchant"] = "1036.80517578125, -807.3424072265625, 1443.938232421875",
    ["Apprentice Archaeologist"] = "6087.63671875, 194.980224609375, 280.2427978515625",
    ["Chiseler"] = "6087.37841796875, 194.9801788330078, 294.5010986328125",
    ["AncientIsle Angler"] = "5738.27880859375, 176.99285888671875, -51.95977783203125",
    ["Ancient Skin Merchant"] = "6029.15380859375, 194.8448028564453, 266.4958190917969",
    ["Inn Keeper AncientIsle"] = "6047.9111328125, 198.47718811035156, 335.5181884765625",
    ["Explorer Archaeologist"] = "5971.81591796875, 258.9874572753906, 236.7926025390625",
    ["Jack"] = "-180.81967163085938, 145.87623596191406, 1954.0701904296875",
    ["Sleeper"] = "-1498.0291748046875, -234.701416015625, -2852.48828125",
    ["Statue Elf"] = "43.9637451171875, 144.2205810546875, -1029.9287109375",
    ["Sunstone Shipwright"] = "-945.2999267578125, 131.07882690429688, -1116.234619140625",
    ["Forsaken Shipwright"] = "-2476.388427734375, 133.1121368408203, 1540.5460205078125",
    ["Marytn Merchant"] = "-2509.317138671875, 135.78355407714844, 1583.0770263671875",
    ["Inn Keeper"] = "487.4584655761719, 150.80003356933594, 231.49893188476562",
    ["Summit Shipwright"] = "19609.19140625, 131.42013549804688, 5186.5927734375",
    ["Orc"] = "-1848.1353759765625, 165.7111358642578, 165.60140991210938",
    ["Sunstone Angler"] = "-886.2785034179688, 133.9722137451172, -1118.807373046875",
    ["Moosewood Skin Merchant"] = "416.0176086425781, 134.859619140625, 189.09486389160156",
    ["Synph"] = "-138.2506561279297, -512.3742065429688, 1131.9312744140625",
    ["Mushgrove Guard"] = "2520.591064453125, 160.1083984375, -890.6786499023438",
    ["Arnold"] = "320.1063232421875, 133.97727966308594, 264.3226013183594",
    ["Agaric"] = "2601.31982421875, 132.3877410888672, -729.6150512695312",
    ["Inn Keeper Sunstone"] = "-904.1670532226562, 131.57933044433594, -1104.810546875",
    ["Paul"] = "381.74188232421875, 136.50003051757812, 341.8910217285156",
    ["mirror Area"] = "HumanoidRootPart not found",
    ["Matt Merchant"] = "-1454.2396240234375, 133.00003051757812, 675.738037109375",
    ["Summit Inn Keeper 3"] = "20298.84765625, 706.5057373046875, 5748.56591796875",
    ["Mods Latern Keeper"] = "-39.045677185058594, -246.5999755859375, 195.6443634033203",
    ["Moosewood Angler"] = "480.10247802734375, 150.5010528564453, 302.2268981933594",
    ["Snowcap Elf"] = "2638.445556640625, 141.78384399414062, 2425.3388671875",
    ["Santa Claus"] = "-159.24945068359375, 364.6510009765625, -9497.666015625",
    ["Sunstone Elf"] = "-894.0286865234375, 133.57225036621094, -1112.41064453125",
    ["Idle Fishing NPC Terrapin"] = "-71.04296875, 133.08493041992188, 2036.72509765625",
    ["Drew"] = "-35.971435546875, 140.4624481201172, -1104.604248046875",
    ["Leeri"] = "-142.27484130859375, -548.29931640625, 1426.4293212890625",
    ["Cole"] = "-20.985851287841797, 136.49261474609375, -1135.5667724609375",
    ["Ashe"] = "-1709.9970703125, 150.34718322753906, 729.2640380859375",
    ["Mushgrove Shipwright"] = "2453.97265625, 130.52963256835938, -661.6033325195312",
    ["Moosewood Shipwright"] = "357.97259521484375, 133.615966796875, 258.154541015625",
    ["Perdido"] = "-98.76107788085938, -566.29931640625, 1549.70361328125",
}

local Interactable = {
    ["Windset Totem"] = "2851.57421875, 178.1171112060547, 2703.02294921875",
    ["Long Rod"] = "485.6950378417969, 171.6563262939453, 145.74610900878906",
    ["Tidebreaker"] = "-1637.361328125, -213.62155151367188, -2848.759033203125",
    ["Flimsy Rod"] = "471.1076965332031, 148.36170959472656, 229.64244079589844",
    ["Tempest Totem"] = "36.4246826171875, 133.02679443359375, 1946.0823974609375",
    ["Refill Station"] = "20063.865234375, 1134.41455078125, 5524 .5302734375",
    ["Fortune Rod"] = "-1520.879638671875, 141.2832794189453, 771.94677734375",
    ["Fast Rod"] = "447.1835632324219, 148.22573852539062, 220.1874542236328",
    ["Flippers"] = "-1636.26708984375, -214.4133758544922, -2850.9501953125",
    ["Red Energy Crystal"] = "19922.52734375, 1139.0325927734375, 5351.244140625",
    ["Lost Rod"] = "2879.876953125, 135.7919158935547, 2727.4814453125",
    ["Aurora Totem"] = "-1812.632568359375, -139.7498779296875, -3279.98779296875",
    ["Basic Diving Gear"] = "369.1747741699219, 132.5088348388672, 248.7053680419922",
    ["Beginner Oxygen Tank"] = "19782.734375, 413.361572265625, 5384.38720703125",
    ["Summit Rod"] = "20207.75390625, 736.0582885742188, 5711.3515625",
    ["Enchant Altar"] = "1310.5465087890625, -799.4696044921875, -82.7303466796875",
    ["Steady Rod"] = "-1511.2352294921875, 139.67950439453125, 759.4171142578125",
    ["Kings Rod"] = "1375.576416015625, -810.2017211914062, -303.5092468261719",
    ["Carbon Rod"] = "454.0836181640625, 150.59007263183594, 225.32882690429688",
    ["Lucky Rod"] = "446.08599853515625, 148.2530059814453, 222.16000366210938",
    ["Glider"] = "-1713.796142578125, 145.90367126464844, 740.8370361328125",
    ["Smokescreen Totem"] = "2791.712158203125, 137.3506622314453, -629.4522705078125",
    ["Training Rod"] = "457.69384765625, 148.35752868652344, 230.414306640625",
    ["Phoenix Rod"] = "5971.03125, 270.37750244140625, 852.37255859375",
    ["Magnet Rod"] = "-194.99887084960938, 130.14808654785156, 1930.9710693359375",
    ["Quality Bait Crate"] = "-177.6083526611328, 141.68313598632812, 1932.85693359375",
    ["Basic Oxygen Tank"] = "19523.20703125, 130.6274871826172, 5328.50634765625",
    ["Intermediate Oxygen Tank"] = "20214.212890625, 734.760498046875, 5715.3271484375",
    ["Crab Cage"] = "474.8035888671875, 149.66456604003906, 229.49468994140625",
    ["Bait Crate"] = "384.57513427734375, 135.3519287109375, 337.53399658203125",
    ["Coral Geode"] = "-1641.544921875, -214.0647735595703, -2845.41796875",
    ["Blizzard Totem"] = "20148.748046875, 740.1343994140625, 5803.6611328125",
    ["Rod Of The Depths"] = "1704.840087890625, -903.5467529296875, 1447.786865234375",
    ["Winter Cloak"] = "19950.82421875, 1143.836181640625, 5581.42529296875",
    ["Avalanche Rod"] = "19770.181640625, 415.68096923828125, 5419.19677734375",
    ["Arctic Rod"] = "19578.236328125, 132.33837890625, 5307.3828125",
    ["Advanced Oxygen Tank"] = "19948.294921875, 1140.8302001953125, 5540.115234375",
    ["Pickaxe"] = "19783.19140625, 415.7436218261719, 5391.92041015625",
    ["Rapid Rod"] = "-1509.24462890625, 139.7259063720703, 759.628173828125",
    ["GPS"] = "517.896728515625, 149.21763610839844, 284.8568420410156",
    ["Meteor Totem"] = "-1945.8262939453125, 272.4389953613281, 231.54412841796875",
    ["Nocturnal Rod"] = "-141.87423706054688, -515.3135375976562, 1139.0452880859375",
    ["Sundial Totem"] = "-1149.452880859375, 134.5681915283203, -1077.2763671875",
    ["Plastic Rod"] = "454.4253845214844, 148.16973876953125, 229.17242431640625",
    ["Advanced Glider"] = "19939.048828125, 1140.6904296875, 5542.84912109375",
    ["Fish Radar"] = "365.75177001953125, 134.50498962402344, 274.1058044433594",
    ["Eclipse Totem"] = "5967.28271484375, 272.2904968261719, 836.9033813476562",
    ["Scurvy Rod"] = "-2828.218505859375, 213.4571990966797, 1512.2095947265625",
    ["Conception Conch"] = "-104.02766418457031, -735.5084838867188, 1211.6905517578125",
    ["Heaven's Rod"] = "20025.7578125, -468.9183654785156, 7146.93310546875",
}


local OptionnsInteractable = {}
local OptionsNpc = {}

for name, _ in pairs(NPC) do
    table.insert(OptionsNpc, name)
end

for name, _ in pairs(Interactable) do
    table.insert(OptionnsInteractable, name)
end

function parseCoordinates(coordString)
    local coords = {}
    for num in string.gmatch(coordString, "[-%d%.]+") do
        table.insert(coords, tonumber(num))
    end
    return unpack(coords)
end

for _, folder in pairs(workspace.world.spawns:GetChildren()) do
    if folder.Name ~= "TpSpots" and folder.Name ~= "loading" and folder.Name ~= "TeleportDelay" then
        table.insert(areaTeleportNames, folder.Name)
    end
end

sections.Tele1:AddDropdown("AreaTeleports3", {
    Title = "Interactables",
    Description = "",
    Options = OptionnsInteractable,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        local coordString = Interactable[selectedArea]
        if selectedArea ~= "" then
        if coordString then
            ChangePlayerCFrame(parseCoordinates(coordString))
        end
        end
    end
})

sections.Tele1:AddDropdown("AreaTeleports4", {
    Title = "NPCs",
    Description = "",
    Options = OptionsNpc,
    Default = "",
    PlaceHolder = "Select",
    Multiple = false,
    Callback = function(selectedNpc)
        local coordString = NPC[selectedNpc]
        if selectedNpc ~= "" then
        if coordString then
            ChangePlayerCFrame(parseCoordinates(coordString))
        end
        end
    end
})


sections.Tele2:AddTextbox({
    Title = "TP To Coordinates",
    PlaceHolder = "Enter Coords | Example: 1234,128,1239",
    Default = "",
    Description = "",   
    TextDisappear = true,
    Callback = function(TPCoord)
        local Coords = tostring(TPCoord)
        -- Split the string into x, y, z components
        local x, y, z = Coords:match("([^,]+),([^,]+),([^,]+)")
        
        -- Convert the string values to numbers
        local targetPosition = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
        
        -- Set the player's position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition)
        
    end
})

-- game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Captain Ahab/HasMobyDick"):InvokeServer()
-- workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Captain Ahab"):WaitForChild("dialog"):WaitForChild("proccessRelic"):InvokeServer()

autoCaptainAhab = sections.Tele2:AddToggle("AutoCaptainAhab", {
    Title = "Auto Captain Ahab",
    Default = false,
    Description = "Automatically holds and submit Moby, good if you have a lot. This automatically excludes favourited ones.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoCaptainAhab = isEnabled
        
        if var.autoCaptainAhab and not var.captainAhabLoaded then
            -- loads angler so u can talk to him and shii
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(363.57086181640625, 133.00003051757812, 294.68212890625))
            if workspace.world.npcs:FindFirstChild("Captain Ahab") then
                workspace.world.npcs:FindFirstChild("Captain Ahab").ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                workspace.world.npcs:FindFirstChild("Captain Ahab").dialogprompt.Parent = LocalPlayer.Character
                for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        obj.Parent = workspace.world.npcs["Captain Ahab"]
                    end
                end
                var.captainAhabLoaded = true
            else
                lib:Notification("Auto Angler", "Failed to load Captain Ahab, try toggling on again..", 5)
                autoCaptainAhab:Set(false)
                return
            end
        end
        
        while var.autoCaptainAhab do  
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
            for _, child in pairs(LocalPlayer.Backpack:GetChildren()) do
                if child.Name == "Moby" then
                    local link = child:FindFirstChild("link")
                    if link and link:IsA("ObjectValue") then
                        local inventoryItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[tostring(link.Value)]
                        if inventoryItem and not inventoryItem:FindFirstChild("Favourited") then
                            child.Parent = LocalPlayer.Character
                            break
                        end
                    end
                end
            end
            local response = game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Captain Ahab/HasMobyDick"):InvokeServer()
            if response == true then
                workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Captain Ahab"):WaitForChild("dialog"):WaitForChild("proccessRelic"):InvokeServer()
            end
            task.wait(0.5)
        end
    end)
})

autoObsidian = sections.Tele2:AddToggle("AutoObsidian", {
    Title = "Auto Drill Obsidian",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoObsidian = isEnabled
        if var.autoObsidian then
            if not LocalPlayer.Character:FindFirstChild("Drill") or LocalPlayer.Backpack:FindFirstChild("Drill") then
                game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Dr Glimmerfin/Talked"):InvokeServer()
            end
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-1745.2374267578125, 113.39686584472656, 291.99932861328125))
            pcall(function()
                workspace.world.map["Roslit Bay"].Lava.LavaTrench:Destroy()
            end)

            if LocalPlayer.Backpack:FindFirstChild("Drill") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Backpack.Drill.Parent = LocalPlayer.Character
            end

            local Drill = LocalPlayer.Character:FindFirstChild("Drill")

            if Drill then
                while var.autoObsidian and Drill.Parent do
                    local obsidians = workspace.world.map["Roslit Bay"].Obsidians:GetChildren()
                    if #obsidians == 0 then
                        autoObsidian:Set(false)
                        break
                    end

                    for _, obsidian in ipairs(obsidians) do
                        if not var.autoObsidian then break end
                        if obsidian:GetAttribute("Health") and obsidian:GetAttribute("Health") > 0 then
                            local char = LocalPlayer.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                obsidian.PrimaryPart.CanCollide = false
                                local function mineObsidian()
                                    while var.autoObsidian and obsidian and obsidian:GetAttribute("Health") > 0 do
                                        char.HumanoidRootPart.CFrame = obsidian.PrimaryPart.CFrame
                                        Drill:Activate()
                                        task.wait()
                                    end
                                end
                                mineObsidian()
                            end
                        end
                    end
                    task.wait()
                end
            end
            -- LOAD GLIMMERFIN
            -- if not var.glimmerFinLoaded then

            --     -- loads angler so u can talk to him and shii
            --     LocalPlayer:RequestStreamAroundAsync(Vector3.new(-1322.7054443359375, 132.50140380859375, 300.3186950683594))
            --     if workspace.world.npcs:FindFirstChild("Dr Glimmerfin") then
            --         workspace.world.npcs:FindFirstChild("Dr Glimmerfin").ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            --         workspace.world.npcs:FindFirstChild("Dr Glimmerfin").dialogprompt.Parent = LocalPlayer.Character
            --         for _, obj in ipairs(LocalPlayer.Character:GetChildren()) do
            --             if obj:IsA("ProximityPrompt") then
            --                 obj.HoldDuration = 0
            --                 obj:InputHoldBegin()
            --                 task.wait(0.01)
            --                 obj:InputHoldEnd()
            --                 obj.Parent = workspace.world.npcs["Dr Glimmerfin"]
            --             end
            --         end
            --         var.glimmerFinLoaded = true
            --     else
            --         lib:Notification("Auto Angler", "Failed to load Dr. Glimmerfin, try toggling on again..", 5)
            --     end
            -- end
        end
    end)
})


autoLavaCrystal = sections.Tele2:AddToggle("AutoLavaCrystal", {
    Title = "Auto Drill Lava Crystal",
    Default = false,
    Description = "This is for layer 1",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoLavaCrystal = isEnabled
        if var.autoLavaCrystal then
            if not LocalPlayer.Character:FindFirstChild("Drill") or LocalPlayer.Backpack:FindFirstChild("Drill") then
                game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Dr Glimmerfin/Talked"):InvokeServer()
            end
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-1745.2374267578125, 113.39686584472656, 291.99932861328125))
            pcall(function()
                workspace.world.map["Roslit Bay"].Lava.LavaTrench:Destroy()
            end)

            if LocalPlayer.Backpack:FindFirstChild("Drill") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Backpack.Drill.Parent = LocalPlayer.Character
            end

            local Drill = LocalPlayer.Character:FindFirstChild("Drill")

            if Drill then
                while var.autoLavaCrystal and Drill.Parent do
                    local lavaCrystals = workspace.world.map["Roslit Bay"].Cave["Volcanic Vents"].LavaCrystals:GetChildren()
                    if #lavaCrystals == 0 then
                        autoLavaCrystal:Set(false)
                        break
                    end

                    for _, lavaCrystal in ipairs(lavaCrystals) do
                        if not var.autoLavaCrystal then break end
                        if lavaCrystal:GetAttribute("Health") and lavaCrystal:GetAttribute("Health") > 0 then
                            local char = LocalPlayer.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                lavaCrystal.PrimaryPart.CanCollide = false
                                local function mineLavaCrystal()
                                    while var.autoLavaCrystal and lavaCrystal and lavaCrystal:GetAttribute("Health") > 0 do
                                        char.HumanoidRootPart.CFrame = lavaCrystal.PrimaryPart.CFrame
                                        Drill:Activate()
                                        task.wait()
                                    end
                                end
                                mineLavaCrystal()
                            end
                        end
                    end
                    task.wait()
                end
            end
        end
    end)
})


autoIceCrystal = sections.Tele2:AddToggle("AutoIceCrystal", {
    Title = "Auto Drill Ice Crystal",
    Default = false,
    Description = "This is for layer 2",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.autoIceCrystal = isEnabled
        if var.autoIceCrystal then
            if not LocalPlayer.Character:FindFirstChild("Drill") or LocalPlayer.Backpack:FindFirstChild("Drill") then
                game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Dr Glimmerfin/Talked"):InvokeServer()
            end
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-1745.2374267578125, 113.39686584472656, 291.99932861328125))
            pcall(function()
                workspace.world.map["Roslit Bay"].Lava.LavaTrench:Destroy()
            end)

            if LocalPlayer.Backpack:FindFirstChild("Drill") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                LocalPlayer.Backpack.Drill.Parent = LocalPlayer.Character
            end

            local Drill = LocalPlayer.Character:FindFirstChild("Drill")

            if Drill then
                while var.autoIceCrystal and Drill.Parent do
                    local iceCrystals = workspace.world.map["Roslit Bay"].Cave.Challengers.IceCrystals:GetChildren()
                    if #iceCrystals == 0 then
                        autoIceCrystal:Set(false)
                        break
                    end

                    for _, iceCrystal in ipairs(iceCrystals) do
                        if not var.autoIceCrystal then break end
                        if iceCrystal:GetAttribute("Health") and iceCrystal:GetAttribute("Health") > 0 then
                            local char = LocalPlayer.Character
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                iceCrystal.PrimaryPart.CanCollide = false
                                local function mineIceCrystal()
                                    while var.autoIceCrystal and iceCrystal and iceCrystal:GetAttribute("Health") > 0 do
                                        char.HumanoidRootPart.CFrame = iceCrystal.PrimaryPart.CFrame
                                        Drill:Activate()
                                        task.wait()
                                    end
                                end
                                mineIceCrystal()
                            end
                        end
                    end
                    task.wait()
                end
            end
        end
    end)
})

AdvancedGroupButton = sections.Tele2:AddGroupButton()
AdvancedGroupButton:AddButton({
    Title = "Discover All Locations",
    Variant = "Outline",
    Callback = function()
        for key, value in pairs(data.Locations) do
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("discoverlocation"):FireServer(key)
        end
    end,
})

AdvancedGroupButton:AddButton({
    Title = "Complete Statue & Bridge",
    Variant = "Outline",
    Callback = function()
        if not game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Cache:FindFirstChild("Door.ZeusPuzzleDoor") then
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-4295.7998046875, -629.7000122070312, 2486.400146484375))
            LocalPlayer.Character.HumanoidRootPart.Position = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.StartMinigame.Position
            -- LocalPlayer.Character.HumanoidRootPart.Position = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.WorldPivot.Position
            -- LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4298, -680, 2357)
            ZeusPuzzle = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle
            -- statue = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.Statue.CompletationZone
            -- bridge = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.Bridge.CompletationZone
            -- if statue then
            -- print("here")
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-3923.971923828125, -628.4500122070312, 2422.89990234375))
            LocalPlayer.Character.HumanoidRootPart.Position = ZeusPuzzle.CodeMinigame.Statue.CompletationZone.Position
            -- else
            --     lib:Notification("Statue", "Unable to find Statue..", 5)
            -- end
            wait(3)
            -- if bridge then
            -- print("here 2")
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(-4561.30029296875, -629.8500366210938, 2424.599609375))
            LocalPlayer.Character.HumanoidRootPart.Position = ZeusPuzzle.CodeMinigame.Bridge.CompletationZone.Position
            -- else
            --     lib:Notification("Bridge", "Unable to find Bridge..", 5)
            -- end
            wait(3)
            LocalPlayer.Character.HumanoidRootPart.Position = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.End.Position
            local display1Text = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.Completation.Display1.SurfaceGui.TextLabel.Text
            local display2Text = workspace.world.map.Atlantis.Puzzles.ZeusPuzzle.CodeMinigame.Completation.Display2.SurfaceGui.TextLabel.Text
        
            -- Keep only numeric characters and concatenate
            local cleanedDisplay1 = string.gsub(display1Text, "%D", "") -- Remove all non-digits
            local cleanedDisplay2 = string.gsub(display2Text, "%D", "") -- Remove all non-digits
            local combinedText = tostring(cleanedDisplay1 .. cleanedDisplay2)
            print(combinedText)
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/ZeusPuzzle/CheckCode"):InvokeServer(combinedText)
            lib:Notification("Complete Statue & Bridge", "Completed.", 5)
        else
            lib:Notification("Complete Statue & Bridge", "You already completed it..", 5)
        end
    end,
})


AdvancedGroupButton:AddButton({
    Title = "Brick Toucher",
    Variant = "Outline",
    Callback = function()
    task.wait()
    LocalPlayer:RequestStreamAroundAsync( Vector3.new(-1844, 194, 197), 1/0)
    fireclickdetector( workspace.Brick2.ClickDetector)
    task.wait()
    LocalPlayer:RequestStreamAroundAsync(Vector3.new(5952.478515625, 280.28594970703125, 853.2422485351562), 1/0)
    fireclickdetector( workspace.Brick3.ClickDetector)
    task.wait()
    LocalPlayer:RequestStreamAroundAsync(Vector3.new(993.117431640625, -735.3968505859375, 1140.9139404296875), 1/0)
    fireclickdetector( workspace.Brick1.ClickDetector)
    lib:Notification("Brick Toucher", "Completed!", 3)
    end,
})

AdvancedGroupButton:AddButton({
    Title = "Announce Brick Code",
    Variant = "Outline",
    Callback = function()
    task.wait()
    LocalPlayer:RequestStreamAroundAsync( Vector3.new(-1494, -226, -2196), 1/0)
    lib:Notification("Announce Brick Code", "Code: "..workspace.BrickRodMessages.m3.SurfaceGui.TextLabel.Text, 3)
    end,
})

AdvancedGroupButton:AddButton({
    Title = "Complete Chess Puzzle",
    Variant = "Outline",
    Callback = function()
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4299, -11172, 4013)
        wait(2)
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local remote = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ChessMinigame/Interact")

        -- Function to fire the remote event and wait for a "Part" to appear
        local function fireAndWait(serverArg, targetFolder)
            while not targetFolder:FindFirstChild("Part") do
                remote:FireServer(serverArg) -- Fire the remote event with the specified argument
                task.wait(1.5) -- Add a small delay to avoid spamming
            end
        end

        -- Define the target folders for each color
        local chessBoard = workspace.world.map["Roslit Bay"].Cave["Calm Cave"].ChessBoard.Pieces
        local targets = {
            {arg = 1, folder = chessBoard.Blue},
            {arg = 2, folder = chessBoard.Yellow},
            {arg = 3, folder = chessBoard.Purple},
            {arg = 4, folder = chessBoard.Red},
        }

        -- Run all tasks simultaneously using coroutines
        for _, target in ipairs(targets) do
            coroutine.wrap(fireAndWait)(target.arg, target.folder)
        end
    end,
})

AdvancedGroupButton:AddButton({
    Title = "Complete Bow Scylla Bossfight",
    Variant = "Outline",
    Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").events.scyllaDamageEvent:Destroy()
        end)
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        local char = LocalPlayer.Character

        -- getting bow
        if not LocalPlayer.Backpack:FindFirstChild("Crossbow Base") then
            LocalPlayer.Character.HumanoidRootPart.Position = workspace.MarianaBossFight.AncientWeaponParts.Base.WorldPivot.Position
            wait(1.5)
            repeat
                workspace.MarianaBossFight.AncientWeaponParts.Base.Proximity.ProximityPrompt.Parent = LocalPlayer.Character
                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = workspace.MarianaBossFight.AncientWeaponParts.Base.Proximity
                    end
                end
                task.wait()
            until LocalPlayer.Backpack:FindFirstChild("Crossbow Base")
        end
        
        -- getting arrow
        if not LocalPlayer.Backpack:FindFirstChild("Crossbow Arrow") then
            LocalPlayer.Character.HumanoidRootPart.Position = workspace.MarianaBossFight.AncientWeaponParts.Arrow.WorldPivot.Position
            wait(1.5)
            repeat
                workspace.MarianaBossFight.AncientWeaponParts.Arrow.Proximity.ProximityPrompt.Parent = LocalPlayer.Character
                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = workspace.MarianaBossFight.AncientWeaponParts.Arrow.Proximity
                    end
                end
                task.wait()
            until LocalPlayer.Backpack:FindFirstChild("Crossbow Arrow")
        end

        if not LocalPlayer.Backpack:FindFirstChild("Crossbow Bow") then
            LocalPlayer.Character.HumanoidRootPart.Position = workspace.MarianaBossFight.AncientWeaponParts.Bow.WorldPivot.Position
            wait(1.5)
            repeat
                workspace.MarianaBossFight.AncientWeaponParts.Bow.Proximity.ProximityPrompt.Parent = LocalPlayer.Character
                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = workspace.MarianaBossFight.AncientWeaponParts.Bow.Proximity
                    end
                end
                task.wait()
            until LocalPlayer.Backpack:FindFirstChild("Crossbow Bow")
        end


        LocalPlayer.Character.HumanoidRootPart.Position = workspace.MarianaBossFight["Harpoon Anim"].RootPart.Position
        wait(1)
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()


        -- base
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["Crossbow Base"])
        wait(1)
        repeat
            workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment.ProximityPrompt.Parent = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment
                end
            end
        until not LocalPlayer.Backpack:FindFirstChild("Crossbow Base") and not LocalPlayer.Character:FindFirstChild("Crossbow Base")


        -- giving arrow
        task.wait()
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["Crossbow Arrow"])
        wait(1)
        repeat
            workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment.ProximityPrompt.Parent = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment
                end
            end
        until not LocalPlayer.Backpack:FindFirstChild("Crossbow Arrow") and not LocalPlayer.Character:FindFirstChild("Crossbow Arrow")



        -- giving bow
        task.wait()
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        task.wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["Crossbow Bow"])
        wait(1)
        repeat
            workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment.ProximityPrompt.Parent = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = workspace.MarianaBossFight["Harpoon Anim"].RootPart.Attachment
                end
            end
        until not LocalPlayer.Backpack:FindFirstChild("Crossbow Bow") and not LocalPlayer.Character:FindFirstChild("Crossbow Bow")
    end,
})

-- sections.Tele2:AddParagraph({Title = "Something cool is coming..", Description = "Soon."})
var.BabyAnglerParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(180, 0, 255)\">Get Baby Angler Lantern</font>",
                             Description = "Requirements:\n- Orca OR Kraken\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"})

local BAGroupButton = sections.Tele2:AddGroupButton()

function KrakenOrcaCheck()
    local backpack = LocalPlayer.Backpack
    local character = LocalPlayer.Character

    -- Function to check if an item matches "Kraken" or "Orca"
    local function isMatchingTool(item)
        return item:IsA("Tool") and (string.find(item.Name, "Kraken") or string.find(item.Name, "Orca"))
    end

    -- Check the backpack
    for _, item in ipairs(backpack:GetChildren()) do
        if isMatchingTool(item) then
            return true -- Return true if a matching item is found in the backpack
        end
    end

    -- Check the character (in case the tool is equipped)
    if character then
        for _, item in ipairs(character:GetChildren()) do
            if isMatchingTool(item) then
                return true -- Return true if a matching item is found in the character
            end
        end
    end

    return false -- Return false if no matching items are found
end

function BACheck()
    if KrakenOrcaCheck() then
        var.BabyAnglerParagraph:SetDesc("Requirements:\n- <font color=\"rgb(0, 255, 0)\">Orca OR Kraken</font>\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>")
    else
        var.BabyAnglerParagraph:SetDesc("Requirements:\n- <font color=\"rgb(255, 0, 0)\">Orca OR Kraken</font>\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>")
    end
end

BAGroupButton:AddButton({
    Title = "Check Requirements",
    Variant = "Outline",
    Callback = function()
        BACheck()
    end,
})

function findMatchingAnglerfish()
    -- Get the parent model
    local parentModel = workspace["Baby Anglerfishs"]

    -- Variables to store potential matches
    local perfectMatch = nil -- Meets both criteria
    local enabledMatch = nil -- Only meets the SpotLight.Enabled criteria

    -- Iterate through all children of the parent model
    for _, child in ipairs(parentModel:GetChildren()) do
        -- Check if the child has the Overhead.Main.Title.Text property
        if child:FindFirstChild("Overhead") and child.Overhead:FindFirstChild("Main") and child.Overhead.Main:FindFirstChild("Title") then
            local titleText = child.Overhead.Main.Title.Text

            -- Check if the text contains the word "sleep"
            if titleText:lower():find("sleep") then
                -- Now check if the Lantern.SpotLight exists and is Enabled
                if child:FindFirstChild("Lantern") and child.Lantern:FindFirstChild("SpotLight") then
                    local spotLight = child.Lantern.SpotLight

                    -- Check if the SpotLight is Enabled
                    if spotLight.Enabled then
                        -- Perfect match found (both criteria met)
                        perfectMatch = child
                        break -- Stop searching, we found the best match
                    end
                end
            end
        end

        -- If no perfect match yet, check for any model with SpotLight.Enabled
        if not perfectMatch and child:FindFirstChild("Lantern") and child.Lantern:FindFirstChild("SpotLight") then
            local spotLight = child.Lantern.SpotLight
            if spotLight.Enabled then
                enabledMatch = child -- Store this as a fallback
            end
        end
    end

    -- Return the best match
    if perfectMatch then
        anglerType = "perfectMatch"
        return perfectMatch
    elseif enabledMatch then
        anglerType = "enabledMatch"
        return enabledMatch
    else
        return false
    end
end


function feedAnglers()
    local oldPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
    local babyAngler = findMatchingAnglerfish()
    coroutine.wrap(function()
        while var.AnglerLantern do
            local player = LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            -- Move the player to the Baby Anglerfish's RootPart
            humanoidRootPart.CFrame = babyAngler.RootPart.CFrame
            humanoidRootPart.Velocity = Vector3.zero

            task.wait() -- Yield to prevent freezing
        end
    end)()
    task.wait(1)
    print("here")
    -- Handle the ProximityPrompt
    -- Find the matching model
    local babyAngler = findMatchingAnglerfish()
    -- Check if the returned model is the default one
    if anglerType == "enabledMatch" then
        print("here?????????")
        -- Move the ProximityPrompt to the player's character
        babyAngler.RootPart.ProximityPrompt.Parent = LocalPlayer.Character

        -- Get the player's character
        local char = LocalPlayer.Character
        -- Iterate through the character's children to find the ProximityPrompt
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                -- Modify the ProximityPrompt properties
                obj.HoldDuration = 0
                obj.MaxActivationDistance = math.huge

                -- Simulate holding the ProximityPrompt
                obj:InputHoldBegin()
                task.wait(0.01)
                obj:InputHoldEnd()

                -- Print confirmation
                print("shoulda gotten it..")

                -- Move the ProximityPrompt back to the babyAngler's RootPart
                obj.Parent = babyAngler.RootPart
            end
        end

        -- Wait and print confirmation
        task.wait(1)
        print("another here")
    end
    -- wait(3)
    print("skipping")
    repeat
        print("ok doing")
        babyAngler.Lantern.ProximityPrompt.Parent = LocalPlayer.Character
        local char = LocalPlayer.Character
        for _, obj in ipairs(char:GetChildren()) do
            if obj:IsA("ProximityPrompt") then
                obj.HoldDuration = 0
                obj.MaxActivationDistance = math.huge
                obj:InputHoldBegin()
                task.wait(0.01)
                obj:InputHoldEnd()
                print("shoulda gotten it..")
                obj.Parent = babyAngler.Lantern
            end
        end
        task.wait()
        print("stopping")
    until LocalPlayer.Backpack:FindFirstChild("Anglers Lantern") or var.AnglerLantern == false
    var.AnglerLantern = false
    LocalPlayer.Character.HumanoidRootPart.CFrame = oldPosition
end

BAGroupButton:AddButton({
    Title = "Get Baby Angler Lantern",
    Variant = "Primary",
    Callback = function()
        findMatchingAnglerfish()
        if findMatchingAnglerfish() == false then
            lib:Notification("Angler Lantern", "Not of the anglers have a lantern..", 5)
            return
        end
        if anglerType ~= "perfectMatch" then
            local character = LocalPlayer.Character


            local hasRequiredTool = false
            if character then
                for _, item in ipairs(character:GetChildren()) do
                    if item:IsA("Tool") and (string.find(item.Name, "Kraken") or string.find(item.Name, "Orca")) then
                        hasRequiredTool = true
                        break
                    end
                end
            end

            if not hasRequiredTool then
                lib:Notification("Angler Lantern", "Please hold the fish..", 5)
                return
            end
        end
        var.AnglerLantern = true
        -- If the player is holding the required tool, proceed with feedAnglers
        feedAnglers()
    end,
})

BAGroupButton:AddButton({  
    Title = "Force Stop",
    Variant = "Primary",
    Callback = function()
        var.AnglerLantern = false
    end,
})

var.ROTDParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(240, 50, 50)\">Rod Of The Depths</font>",
                             Description = "Requirements:\n- Vertigo Bestiary Completed\n- Opened The Depths Door\n- Abyssal Enchant Relic\n- Hexed Enchant Relic\n- 750,000 C$\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"})

local ROTDGroupButton = sections.Tele2:AddGroupButton()

function ROTDCheck()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local Bestiary = ReplicatedStorage.playerstats[LocalPlayer.Name]:FindFirstChild("Bestiary")
    local Cache = ReplicatedStorage.playerstats[LocalPlayer.Name]:FindFirstChild("Cache")
    local Coins = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value
    local inventory = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory
    
    local requiredChildren = {
        "Night Shrimp",
        "Spiderfish",
        "Twilight Eel",
        "Fangborn Gar",
        "Abyssacuda",
        "Voidfin Mahi",
        "Rubber Ducky",
        "Isonade",
        "The Depths Key",
    }
    
    local allFound = true
    for _, childName in ipairs(requiredChildren) do
        if not Bestiary or not Bestiary:FindFirstChild(childName) then
            allFound = false
            break
        end
    end
    
    local bestiaryStatus = allFound and "<font color=\"rgb(0, 255, 0)\">Vertigo Bestiary Completed</font>" 
                          or "<font color=\"rgb(255, 0, 0)\">Vertigo Bestiary Completed</font>"
    
    local doorStatus = Cache and Cache:FindFirstChild("Door.TheDepthsGate") and 
                       "<font color=\"rgb(0, 255, 0)\">Opened The Depths Door</font>" 
                       or "<font color=\"rgb(255, 0, 0)\">Opened The Depths Door</font>"
    
    local coinsStatus = Coins > 750000 and "<font color=\"rgb(0, 255, 0)\">750,000 C$</font>" 
                            or "<font color=\"rgb(255, 0, 0)\">750,000 C$</font>"
    
    local hexedStatus = false
    local abyssalStatus = false
    for _, item in pairs(inventory:GetChildren()) do
        if item.Name:find("Enchant Relic") then
            if item:FindFirstChild("Mutation") then
                if item.Mutation.Value == "Hexed" then
                    hexedStatus = true
                end
                if item.Mutation.Value == "Abyssal" then
                    abyssalStatus = true
                end
            end
        end
    end
    
    local hexedStatusText = hexedStatus and "<font color=\"rgb(0, 255, 0)\">Hexed Enchant Relic</font>" 
                                        or "<font color=\"rgb(255, 0, 0)\">Hexed Enchant Relic</font>"
    
    local abyssalStatusText = abyssalStatus and "<font color=\"rgb(0, 255, 0)\">Abyssal Enchant Relic</font>" 
                                          or "<font color=\"rgb(255, 0, 0)\">Abyssal Enchant Relic</font>"
    
    var.ROTDParagraph:SetDesc(
        "Requirements:\n" .. 
        "- " .. bestiaryStatus .. "\n" ..
        "- " .. doorStatus .. "\n" ..
        "- " .. abyssalStatusText .. "\n" ..
        "- " .. hexedStatusText .. "\n" ..
        "- " .. coinsStatus .. "\n" ..
        "<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"
    )
end



ROTDGroupButton:AddButton({
    Title = "Check Requirements",
    Variant = "Outline",
    Callback = function()
        ROTDCheck()
    end,
})

local ROTDGrabber = LPH_JIT_MAX(function()
    local backpack = LocalPlayer.Backpack
    local playerStats = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory

    local equippedHexed = false -- Track if Hexed relic was equipped

    for _, item in ipairs(backpack:GetChildren()) do
        if string.find(item.Name, "Enchant Relic") and item:FindFirstChild("link") then
            local relicName = tostring(item.link.Value)
            local relic = playerStats:FindFirstChild(relicName)

            if relic and relic:FindFirstChild("Mutation") then
                local mutationValue = tostring(relic.Mutation.Value)
                print(relicName .. " -> Mutation: " .. mutationValue)

                if mutationValue == "Hexed" and not equippedHexed then
                    lib:Notification("ROTD", "Putting in Hexed Relic", 5)
                    LocalPlayer.Character.Humanoid:EquipTool(item)
                    print("Equipped " .. item.Name .. " because it is Hexed.")
                    ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ActivatorClientActive"):FireServer("Hexed")
                    equippedHexed = true
                end
            end
        end
    end
    wait(1)
    -- Equip an "Abyssal" relic AFTER the Hexed one is handled
    for _, item in ipairs(backpack:GetChildren()) do
        if string.find(item.Name, "Enchant Relic") and item:FindFirstChild("link") then
            local relicName = tostring(item.link.Value)
            local relic = playerStats:FindFirstChild(relicName)

            if relic and relic:FindFirstChild("Mutation") then
                local mutationValue = tostring(relic.Mutation.Value)

                if mutationValue == "Abyssal" then
                    lib:Notification("ROTD", "Putting in Abyssal Relic", 5)
                    LocalPlayer.Character.Humanoid:EquipTool(item)
                    print("Equipped " .. item.Name .. " because it is Abyssal.")
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ActivatorClientActive"):FireServer("Abyssal")
                    break -- Stop after equipping the first Abyssal relic
                end
            end
        end
    end
    lib:Notification("ROTD", "Purchasing the rod..", 5)
    wait(5)
    game:GetService('ReplicatedStorage').events.purchase:FireServer("Rod Of The Depths", "Rod", nil, 1)
    wait(1)
    lib:Notification("ROTD", "Completed!", 5)
end)


ROTDGroupButton:AddButton({
    Title = "Complete & Buy ROTD",
    Variant = "Primary",
    Callback = function()
        ROTDGrabber()
    end,
})

var.HeavenParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(255, 255, 0)\">Heaven's Rod</font>",
                             Description = "Requirements:\n- 2,280,000 C$\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it. Price could be less.</font>"})

local HeavenGroupButton = sections.Tele2:AddGroupButton()

function HeavenCheck()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local Coins = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value
    
    local coinsStatus = Coins > 2280000 and "<font color=\"rgb(0, 255, 0)\">2,280,000 C$</font>" 
                            or "<font color=\"rgb(255, 0, 0)\">2,280,000 C$</font>"
    
    var.HeavenParagraph:SetDesc(
        "Requirements:\n" ..
        "- " .. coinsStatus .. "\n" ..
        "<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"
    )
end


HeavenGroupButton:AddButton({
    Title = "Check Requirements",
    Variant = "Outline",
    Callback = function()
        HeavenCheck()
    end,
})
local HeavenRodGrabber = LPH_JIT_MAX(function()
    local Players = game:GetService("Players")
    local Workspace = game:GetService("Workspace")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    LocalPlayer:RequestStreamAroundAsync(Vector3.new(20125.1328125, 210.0240020751953, 5449.103515625))
    local BlueShardPath = nil
    for _, v in pairs(Workspace.world.map["Northern Summit"]:GetDescendants()) do
        if v:IsA("MeshPart") and v.Name == "Meshes/Shard1" and v.BrickColor == BrickColor.new("Electric blue") then
            BlueShardPath = v.Parent.Parent
            print(BlueShardPath)
            break
        end
    end
    LocalPlayer:RequestStreamAroundAsync(Vector3.new(19500.53515625, 332.25433349609375, 5548.9072265625))
    local YellowShardPath = nil
    for _, child in ipairs(workspace.world.map["Northern Summit"]:GetChildren()) do
        if child.ClassName == "Model" and child:GetAttribute("ItemName") == "Yellow Energy Crystal" then
            print(child.Name)
            child.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
            YellowShardPath = child
        end
    end

    while var.ProccessingRod do
        local Backpack = LocalPlayer.Backpack
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        if not Backpack:FindFirstChild("Pickaxe") then
            if not LocalPlayer.Character:FindFirstChild("Pickaxe") then
                game:GetService("ReplicatedStorage").events.purchase:FireServer("Pickaxe", "Item", nil, 1)
            end
        end
        -- Blue
        if not Backpack:FindFirstChild("Blue Energy Crystal") then
            Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
            local Pickaxe = Backpack:FindFirstChild("Pickaxe") or Character:FindFirstChild("Pickaxe")
            if Pickaxe then
                if Pickaxe.Parent == Backpack then
                    Pickaxe.Parent = Character
                end
                repeat task.wait()
                    Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
                    Character:FindFirstChild("Pickaxe"):Activate()
                until BlueShardPath:FindFirstChild("Root"):FindFirstChild("Prompt").Enabled
                task.wait(1)
                -- fireproximityprompt(BlueShardPath.Root.Prompt)
                BlueShardPath.Root.Prompt.Parent = LocalPlayer.Character
                local char = LocalPlayer.Character
                for _, obj in ipairs(char:GetChildren()) do
                    if obj:IsA("ProximityPrompt") then
                        obj.HoldDuration = 0
                        obj.MaxActivationDistance = math.huge
                        obj:InputHoldBegin()
                        task.wait(0.01)
                        obj:InputHoldEnd()
                        print("shoulda gotten it..")
                        obj.Parent = BlueShardPath.Root
                    end
                end
            end
        end

        -- Green
        if not Backpack:FindFirstChild("Green Energy Crystal") then
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthEvent/PlayerClaimItem"):InvokeServer()
        end

        -- Red
        if not Backpack:FindFirstChild("Red Energy Crystal") then
            game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthExp/PurchaseShard"):InvokeServer()
        end
        
        -- Yellow
        if not Backpack:FindFirstChild("Yellow Energy Crystal") then
            if not Backpack:FindFirstChild("Avalanche Totem") then
                if not LocalPlayer.Character:FindFirstChild("Avalanche Totem") then
                    game:GetService("ReplicatedStorage").events.purchase:FireServer("Avalanche Totem", "Item", nil, 1)
                    print("bought..")
                end
            end
            repeat task.wait() until not game:GetService("ReplicatedStorage").world.totemInUse.value
            if not LocalPlayer.Character:FindFirstChild("Avalanche Totem") then
                if game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Avalanche Totem") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["Avalanche Totem"])
                end
            end
            Character:WaitForChild("Avalanche Totem"):Activate()
            repeat task.wait() until YellowShardPath.Root.Prompt.Enabled
            -- YellowShardPath = workspace.world.map["Northern Summit"]["959eaff8-8e14-4d4f-9ebf-74d50ee8bbda"]
            LocalPlayer.Character.HumanoidRootPart.Position = YellowShardPath.Root.Position
            task.wait(1)
            YellowShardPath.Root.Prompt.Parent = LocalPlayer.Character
            local char = LocalPlayer.Character
            for _, obj in ipairs(char:GetChildren()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.MaxActivationDistance = math.huge
                    obj:InputHoldBegin()
                    task.wait(0.01)
                    obj:InputHoldEnd()
                    print("shoulda gotten it..")
                    obj.Parent = YellowShardPath.Root
                end
            end
        end
        task.wait(1)
        if Backpack:FindFirstChild("Yellow Energy Crystal") and Backpack:FindFirstChild("Blue Energy Crystal") and Backpack:FindFirstChild("Green Energy Crystal") and Backpack:FindFirstChild("Red Energy Crystal") then
            lib:Notification("Heaven's Rod", "Completed crystals, filling them in..", 7)
            LocalPlayer:RequestStreamAroundAsync(Vector3.new(19964.609375, 1135.482666015625, 5348.857421875))
            local targetPosition = workspace.world.map["Northern Summit"].ColoredGlassFloor.Hitbox.Position
            local offset = Vector3.new(0, 5, 0)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition + offset)
            local Crystals = {"Blue", "Green", "Red", "Yellow"}
            local remote = game:GetService("ReplicatedStorage").packages.Net["RE/NorthFinalPuzzleService/Place"]
        
            for _, crystal in ipairs(Crystals) do
                remote:FireServer(crystal)
                task.wait(2.5)
            end
            game:GetService('ReplicatedStorage').events.purchase:FireServer("Heaven's Rod", "Rod", nil, 1)
            var.ProccessingRod = false
        end
    end
end)

HeavenGroupButton:AddButton({
    Title = "Complete & Buy Heaven's Rod",
    Variant = "Primary",
    Callback = function()
        if game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Rods:FindFirstChild("Heaven's Rod") then
            lib:Notification("Heaven Rod", "You already have Heaven's Rod.", 5)
            return
        end
        var.ProccessingRod = true
        HeavenRodGrabber()
    end,
})

-- var.ZeusParagraph = sections.Tele2:AddParagraph({Title = "<font color=\"rgb(120, 107, 24)\">Zeus's Rod</font>",
--                              Description = "Requirements:\n- 1,700,000 C$\n<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it. Price could be less.</font>"})

-- local ZeusGroupButton = sections.Tele2:AddGroupButton()

-- function ZeusCheck()
--     local Players = game:GetService("Players")
--     local ReplicatedStorage = game:GetService("ReplicatedStorage")
--     local LocalPlayer = Players.LocalPlayer
--     local Coins = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.coins.Value
    
--     local coinsStatus = Coins > 1700000 and "<font color=\"rgb(0, 255, 0)\">1,700,000 C$</font>" 
--                             or "<font color=\"rgb(255, 0, 0)\">2,280,000 C$</font>"
    
--     var.ZeusParagraph:SetDesc(
--         "Requirements:\n" ..
--         "- " .. coinsStatus .. "\n" ..
--         "<font color=\"rgb(255, 255, 255)\">Do not touch anything while it completes it.</font>"
--     )
-- end


-- ZeusGroupButton:AddButton({
--     Title = "Check Requirements",
--     Variant = "Outline",
--     Callback = function()
--         ZeusCheck()
--     end,
-- })


-- function ZeusRodGrabber()
--     local Players = game:GetService("Players")
--     local Workspace = game:GetService("Workspace")
--     local ReplicatedStorage = game:GetService("ReplicatedStorage")
--     local LocalPlayer = Players.LocalPlayer
--     LocalPlayer:RequestStreamAroundAsync(Vector3.new(20125.1328125, 210.0240020751953, 5449.103515625))
--     local BlueShardPath = nil
--     for _, v in pairs(Workspace.world.map["Northern Summit"]:GetDescendants()) do
--         if v:IsA("MeshPart") and v.Name == "Meshes/Shard1" and v.BrickColor == BrickColor.new("Electric blue") then
--             BlueShardPath = v.Parent.Parent
--             print(BlueShardPath)
--             break
--         end
--     end
--     LocalPlayer:RequestStreamAroundAsync(Vector3.new(19500.53515625, 332.25433349609375, 5548.9072265625))
--     local YellowShardPath = nil
--     for _, child in ipairs(workspace.world.map["Northern Summit"]:GetChildren()) do
--         if child.ClassName == "Model" and child:GetAttribute("ItemName") == "Yellow Energy Crystal" then
--             print(child.Name)
--             child.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
--             YellowShardPath = child
--         end
--     end

--     while var.ProccessingRod do
--         local Backpack = LocalPlayer.Backpack
--         local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
--         if not Backpack:FindFirstChild("Pickaxe") then
--             if not LocalPlayer.Character:FindFirstChild("Pickaxe") then
--                 game:GetService("ReplicatedStorage").events.purchase:FireServer("Pickaxe", "Item", nil, 1)
--             end
--         end
--         -- Blue
--         if not Backpack:FindFirstChild("Blue Energy Crystal") then
--             Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
--             local Pickaxe = Backpack:FindFirstChild("Pickaxe") or Character:FindFirstChild("Pickaxe")
--             if Pickaxe then
--                 if Pickaxe.Parent == Backpack then
--                     Pickaxe.Parent = Character
--                 end
--                 repeat task.wait()
--                     Character.HumanoidRootPart.CFrame = CFrame.new(20125.296875, 212.6418914794922, 5449.6962890625)
--                     Character:FindFirstChild("Pickaxe"):Activate()
--                 until BlueShardPath:FindFirstChild("Root"):FindFirstChild("Prompt").Enabled
--                 task.wait(1)
--                 -- fireproximityprompt(BlueShardPath.Root.Prompt)
--                 BlueShardPath.Root.Prompt.Parent = LocalPlayer.Character
--                 local char = LocalPlayer.Character
--                 for _, obj in ipairs(char:GetChildren()) do
--                     if obj:IsA("ProximityPrompt") then
--                         obj.HoldDuration = 0
--                         obj.MaxActivationDistance = math.huge
--                         obj:InputHoldBegin()
--                         task.wait(0.01)
--                         obj:InputHoldEnd()
--                         print("shoulda gotten it..")
--                         obj.Parent = BlueShardPath.Root
--                     end
--                 end
--             end
--         end

--         -- Green
--         if not Backpack:FindFirstChild("Green Energy Crystal") then
--             game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthEvent/PlayerClaimItem"):InvokeServer()
--         end

--         -- Red
--         if not Backpack:FindFirstChild("Red Energy Crystal") then
--             game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/NorthExp/PurchaseShard"):InvokeServer()
--         end
        
--         -- Yellow
--         if not Backpack:FindFirstChild("Yellow Energy Crystal") then
--             if not Backpack:FindFirstChild("Avalanche Totem") then
--                 if not LocalPlayer.Character:FindFirstChild("Avalanche Totem") then
--                     game:GetService("ReplicatedStorage").events.purchase:FireServer("Avalanche Totem", "Item", nil, 1)
--                     print("bought..")
--                 end
--             end
--             repeat task.wait() until not game:GetService("ReplicatedStorage").world.totemInUse.value
--             if not LocalPlayer.Character:FindFirstChild("Avalanche Totem") then
--                 if game:GetService("Players").LocalPlayer.Backpack:WaitForChild("Avalanche Totem") then
--                     game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack["Avalanche Totem"])
--                 end
--             end
--             Character:WaitForChild("Avalanche Totem"):Activate()
--             repeat task.wait() until YellowShardPath.Root.Prompt.Enabled
--             -- YellowShardPath = workspace.world.map["Northern Summit"]["959eaff8-8e14-4d4f-9ebf-74d50ee8bbda"]
--             LocalPlayer.Character.HumanoidRootPart.Position = YellowShardPath.Root.Position
--             task.wait(1)
--             YellowShardPath.Root.Prompt.Parent = LocalPlayer.Character
--             local char = LocalPlayer.Character
--             for _, obj in ipairs(char:GetChildren()) do
--                 if obj:IsA("ProximityPrompt") then
--                     obj.HoldDuration = 0
--                     obj.MaxActivationDistance = math.huge
--                     obj:InputHoldBegin()
--                     task.wait(0.01)
--                     obj:InputHoldEnd()
--                     print("shoulda gotten it..")
--                     obj.Parent = YellowShardPath.Root
--                 end
--             end
--         end
--         task.wait(1)
--         if Backpack:FindFirstChild("Yellow Energy Crystal") and Backpack:FindFirstChild("Blue Energy Crystal") and Backpack:FindFirstChild("Green Energy Crystal") and Backpack:FindFirstChild("Red Energy Crystal") then
--             lib:Notification("Heaven's Rod", "Completed crystals, filling them in..", 7)
--             LocalPlayer:RequestStreamAroundAsync(Vector3.new(19964.609375, 1135.482666015625, 5348.857421875))
--             local targetPosition = workspace.world.map["Northern Summit"].ColoredGlassFloor.Hitbox.Position
--             local offset = Vector3.new(0, 5, 0)
--             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition + offset)
--             local Crystals = {"Blue", "Green", "Red", "Yellow"}
--             local remote = game:GetService("ReplicatedStorage").packages.Net["RE/NorthFinalPuzzleService/Place"]
        
--             for _, crystal in ipairs(Crystals) do
--                 remote:FireServer(crystal)
--                 task.wait(2.5)
--             end
--             game:GetService('ReplicatedStorage').events.purchase:FireServer("Heaven's Rod", "Rod", nil, 1)
--             var.ProccessingRod = false
--         end
--     end
-- end

-- ZeusGroupButton:AddButton({
--     Title = "Complete & Buy Zeus's Rod",
--     Variant = "Primary",
--     Callback = function()
--         var.ProccessingRodZeus = true
--         ZeusRodGrabber()
--     end,
-- })


-- for _, spawnFolder in ipairs(workspace.world.spawns:GetChildren()) do
--     if spawnFolder:IsA("Folder") then
--         local newSection = tabs.Teleporation:AddSection({Title = spawnFolder.Name})
--         table.insert(sections, newSection)

--         newSection:AddParagraph({
--             Title = spawnFolder.Name,
--             Description = "Teleport Section for " .. spawnFolder.Name
--         })

--         TeleportationButton[spawnFolder.Name] = {
--             Section = newSection,
--             T1 = newSection:AddGroupButton()
--         }

--         for _, spawnPoint in ipairs(spawnFolder:GetChildren()) do
--             if spawnPoint:IsA("BasePart") then
--                 local spawnPosition = spawnPoint.Position

--                 local baseName = spawnPoint.Name
--                 local uniqueName = baseName

--                 if nameCounts[baseName] then
--                     nameCounts[baseName] = nameCounts[baseName] + 1
--                     uniqueName = baseName .. " (" .. nameCounts[baseName] .. ")"
--                 else
--                     nameCounts[baseName] = 1
--                 end

--                 TeleportationButton[spawnFolder.Name].T1:AddButton({
--                     Title = uniqueName,
--                     Variant = "Outline",
--                     Callback = function()
--                         ChangePlayerCFrame(spawnPosition.X, spawnPosition.Y, spawnPosition.Z)
--                     end,
--                 })
--             end
--         end
--     end
-- end

sections.Misc:AddParagraph({
    Title = gradient("Oxygen"),
})

local oxygenConnections = {
    main = nil,
    character = nil
}

local oxygenPeaksConnections = {
    main = nil,
    character = nil
}

local temperatureConnections = {
    main = nil,
    character = nil
}

local temperatureHeatConnections = {
    main = nil,
    character = nil
}

-- Oxygen - Normal
sections.Misc:AddToggle("DisableOxygenNormal", {
    Title = "Disable Oxygen - Normal",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        local function handleOxygen(character)
            local oxygen = character:FindFirstChild("Resources") and character.Resources:FindFirstChild("oxygen") 
                or character:FindFirstChild("oxygen")
            
            if oxygen then
                if isEnabled then
                    oxygen.Disabled = true
                    if oxygenConnections.main then
                        oxygenConnections.main:Disconnect()
                    end
                    oxygenConnections.main = oxygen.Changed:Connect(function()
                        oxygen.Disabled = true
                    end)
                else
                    oxygen.Enabled = true
                end
            end
        end

        if isEnabled then
            -- Handle existing character
            if LocalPlayer.Character then
                handleOxygen(LocalPlayer.Character)
            end
            -- Connect to future characters
            oxygenConnections.character = LocalPlayer.CharacterAdded:Connect(handleOxygen)
        else
            -- Disconnect all connections
            if oxygenConnections.main then
                oxygenConnections.main:Disconnect()
                oxygenConnections.main = nil
            end
            if oxygenConnections.character then
                oxygenConnections.character:Disconnect()
                oxygenConnections.character = nil
            end
            -- Restore oxygen if character exists
            if LocalPlayer.Character then
                handleOxygen(LocalPlayer.Character)
            end
        end
    end)
})

-- Oxygen - Peaks
sections.Misc:AddToggle("DisableOxygenPeak", {
    Title = "Disable Oxygen - Peaks",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        local function handleOxygenPeaks(character)
            local oxygenPeaks = character:FindFirstChild("Resources") and character.Resources:FindFirstChild("oxygen(peaks)") 
                or character:FindFirstChild("oxygen(peaks)")
            
            if oxygenPeaks then
                if isEnabled then
                    oxygenPeaks.Disabled = true
                    if oxygenPeaksConnections.main then
                        oxygenPeaksConnections.main:Disconnect()
                    end
                    oxygenPeaksConnections.main = oxygenPeaks.Changed:Connect(function()
                        oxygenPeaks.Disabled = true
                    end)
                else
                    oxygenPeaks.Enabled = true
                end
            end
        end

        if isEnabled then
            if LocalPlayer.Character then
                handleOxygenPeaks(LocalPlayer.Character)
            end
            oxygenPeaksConnections.character = LocalPlayer.CharacterAdded:Connect(handleOxygenPeaks)
        else
            if oxygenPeaksConnections.main then
                oxygenPeaksConnections.main:Disconnect()
                oxygenPeaksConnections.main = nil
            end
            if oxygenPeaksConnections.character then
                oxygenPeaksConnections.character:Disconnect()
                oxygenPeaksConnections.character = nil
            end
            if LocalPlayer.Character then
                handleOxygenPeaks(LocalPlayer.Character)
            end
        end
    end)
})

-- Temperature
sections.Misc:AddToggle("DisableTemp", {
    Title = "Disable Temperature",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        local function handleTemperature(character)
            
            local temperature = character:FindFirstChild("Resources") and character.Resources:FindFirstChild("temperature") 
                or character:FindFirstChild("temperature")
            
            if temperature then
                if isEnabled then
                    temperature.Disabled = true
                    if temperatureConnections.main then
                        temperatureConnections.main:Disconnect()
                    end
                    temperatureConnections.main = temperature.Changed:Connect(function()
                        temperature.Disabled = true
                    end)
                else
                    temperature.Enabled = true
                end
            end
        end

        if isEnabled then
            if LocalPlayer.Character then
                handleTemperature(LocalPlayer.Character)
            end
            temperatureConnections.character = LocalPlayer.CharacterAdded:Connect(handleTemperature)
        else
            if temperatureConnections.main then
                temperatureConnections.main:Disconnect()
                temperatureConnections.main = nil
            end
            if temperatureConnections.character then
                temperatureConnections.character:Disconnect()
                temperatureConnections.character = nil
            end
            if LocalPlayer.Character then
                handleTemperature(LocalPlayer.Character)
            end
        end
    end)
})

-- Temperature Heat
sections.Misc:AddToggle("DisableTempHeat", {
    Title = "Disable Temperature - Heat",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        local function handleTemperature(character)
            
            local temperature = character:FindFirstChild("Resources") and character.Resources:FindFirstChild("temperature(heat)") 
                or character:FindFirstChild("temperature(heat)")
            
            if temperature then
                if isEnabled then
                    temperature.Disabled = true
                    if temperatureConnections.main then
                        temperatureConnections.main:Disconnect()
                    end
                    temperatureConnections.main = temperature.Changed:Connect(function()
                        temperature.Disabled = true
                    end)
                else
                    temperature.Enabled = true
                end
            end
        end

        if isEnabled then
            if LocalPlayer.Character then
                handleTemperature(LocalPlayer.Character)
            end
            temperatureConnections.character = LocalPlayer.CharacterAdded:Connect(handleTemperature)
        else
            if temperatureConnections.main then
                temperatureConnections.main:Disconnect()
                temperatureConnections.main = nil
            end
            if temperatureConnections.character then
                temperatureConnections.character:Disconnect()
                temperatureConnections.character = nil
            end
            if LocalPlayer.Character then
                handleTemperature(LocalPlayer.Character)
            end
        end
    end)
})


sections.Misc:AddParagraph({
    Title = gradient("Others"),
})

-- sections.Misc:AddToggle("FrrezeBabyGirl", {
--     Title = "Freeze Baby Anglerfishes",
--     Default = true,
--     Description = "",
--     Callback = LPH_JIT_MAX(function(isEnabled)
--         var.freezeBabygirl = isEnabled
--         local babyAnglerfishFolder = workspace["Baby Anglerfishs"]
--         for _, model in ipairs(babyAnglerfishFolder:GetChildren()) do
--             if model:IsA("Model") and model:FindFirstChild("RootPart") then
--                 local rootPart = model.RootPart
--                 rootPart.Anchored = var.freezeBabygirl
--             end
--         end
--     end)
-- })


var.PlatformColor = Color3.new(1.000000, 1.000000, 1.000000)
var.PlatFormsize = 15
var.Platform = nil
sections.Misc3:AddColorpicker("PlatformColor", {
    Title = "PlatForm Color",
    Default = Color3.new(1.000000, 1.000000, 1.000000),
    Callback = function(selectedColor)
            if var.Platform ~= nil then
            var.Platform.Color = selectedColor
        else
            var.PlatformColor = selectedColor
        end
    end,
})

sections.Misc3:AddSlider("PlatFormSize", {
    Title = "Platform Size",
    Description = "",
    Default = 15,
    Min = 0,
    Max = 255,
    Increment = 1,
    Callback = function(value)
        if var.Platform ~= nil then
            var.Platform.Size = Vector3.new(value, 1, value)
        else
            var.PlatFormsize = value
        end
    end,
})

sections.Misc3:AddToggle("JesusMode", {
    Title = "Portable Platform",
    Default = false,
    Description = "Recommended",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.PortablePlatform = isEnabled
    if var.PortablePlatform  then
    var.Platform = Instance.new("Part")
    var.Platform.Name = LocalPlayer.Name .. " PortablePlatform"
    var.Platform.Size = Vector3.new(var.PlatFormsize, 1, var.PlatFormsize)
    var.Platform.Anchored = true
    var.Platform.CanCollide = true
    var.Platform.Material = Enum.Material.Neon
    var.Platform.Shape = Enum.PartType.Ball
    var.Platform.CFrame = CFrame.new(0,0,0)
    var.Platform.Parent = LocalPlayer.Character
    elseif var.PortablePlatform == false then
        if var.Platform ~= nil then
        var.Platform:Destroy()
        var.Platform = nil
        end
    end

    while var.PortablePlatform do

                -- Get the character's HumanoidRootPart
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                -- Find the nearest terrain position that is water
                local nearestWaterPosition = nil
                local closestDistance = math.huge
                local desiredOffset = 1 -- Distance offset from the player

                -- Iterate over a smaller, more efficient grid
                for x = -50, 50, 5 do
                    for z = -50, 50, 5 do
                        local checkPosition = humanoidRootPart.Position + Vector3.new(x, 0, z)
                        local rayOrigin = Vector3.new(checkPosition.X, humanoidRootPart.Position.Y + 50, checkPosition.Z)
                        local rayDirection = Vector3.new(0, -100, 0)

                        -- Perform raycasting
                        local raycastParams = RaycastParams.new()
                        raycastParams.FilterDescendantsInstances = {workspace.Terrain}
                        raycastParams.FilterType = Enum.RaycastFilterType.Whitelist

                        local rayResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                        if rayResult then
                            local hitPosition = rayResult.Position
                            local hitMaterial = rayResult.Material

                            -- Check if the material is water and ensure minimum offset
                            if hitMaterial == Enum.Material.Water then
                                local distance = (humanoidRootPart.Position - hitPosition).Magnitude
                                if distance < closestDistance and distance > desiredOffset then
                                    closestDistance = distance
                                    nearestWaterPosition = hitPosition
                                end
                            end
                        end
                    end
                end

                -- Teleport the bobber to the nearest water position
                if nearestWaterPosition then
                    local offsetDirection = (nearestWaterPosition - humanoidRootPart.Position).Unit
                    local finalPosition = nearestWaterPosition + offsetDirection * desiredOffset

                    var.Platform.CFrame = CFrame.new(finalPosition)
                end

                task.wait() -- Adjust the wait time if necessary
            end

    end)
})


sections.Misc3:AddToggle("JesusMode", {
    Title = "Walk on water",
    Default = false,
    Description = "Old method",
    Callback = function(isEnabled)
        if isEnabled then
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Ocean" or Ocean.Name == "Deep Ocean" or Ocean.Name == "Desolate Deep" then 
                    Ocean.CanCollide = true
                end
            end
        else
            for _, Ocean in pairs(game:GetService("Workspace").zones.fishing:GetDescendants()) do
                if Ocean:IsA("Part") and Ocean.Name == "Ocean" or Ocean.Name == "Deep Ocean" or Ocean.Name == "Desolate Deep" then 
                    Ocean.CanCollide = false
                end
            end
        end
    end,
})

sections.Misc3:AddToggle("UnJesus", {
    Title = "Walk under water",
    Default = false,
    Description = "Allows you to walk normally underwater",
    Callback = function(isEnabled)
        var.walkUnderWater = isEnabled
        
        local function setupCharacter(character)
            local Humanoid = character:WaitForChild("Humanoid")
            
            if isEnabled then
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
                
                local stateConnection
                stateConnection = Humanoid.StateChanged:Connect(function(_, newState)
                    if not var.walkUnderWater then
                        stateConnection:Disconnect()
                        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
                        return
                    end
                    
                    if newState == Enum.HumanoidStateType.Swimming then
                        Humanoid:ChangeState(Enum.HumanoidStateType.Running)
                    end
                end)
            else
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
            end
        end
        
        if LocalPlayer.Character then
            setupCharacter(LocalPlayer.Character)
        end
        
        local characterConnection
        characterConnection = LocalPlayer.CharacterAdded:Connect(function(character)
            if not var.walkUnderWater then
                characterConnection:Disconnect()
                return
            end
            setupCharacter(character)
        end)
    end
})

local PromptButtonHoldBegan = nil
var.InstantPPToggle = sections.Misc:AddToggle("InstantProximityPrompt", {
    Title = "Instant Interact",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        if isEnabled then
            if fireproximityprompt then
                PromptButtonHoldBegan = game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
                    fireproximityprompt(prompt)
                end)
            else
                lib:Notification('Incompatible Exploit', 'Your exploit does not support this feature (missing fireproximityprompt)')
                var.InstantPPToggle:Set(false)
            end
        else
            if PromptButtonHoldBegan ~= nil then
                PromptButtonHoldBegan:Disconnect()
                PromptButtonHoldBegan = nil
            end
        end
    end,
})

sections.Misc:AddSlider("JumpPower", {
    Title = "JumpPower",
    Description = "",
    Default = tonumber(LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpPower),
    Min = 0,
    Max = 500,
    Increment = 1,
    Callback = function(value)
        var.jumpPower = value
        -- local Character = game:GetService("Players").LocalPlayer.Character
        -- Character:FindFirstChildOfClass('Humanoid').JumpPower = value
    end,
})

sections.Misc:AddSlider("WalkSpeed", {
    Title = "WalkSpeed",
    Description = "",
    Default = tonumber(LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed),
    Min = 0,
    Max = 500,
    Increment = 1,
    Callback = function(value)
        var.walkSpeed = value
        -- local Character = game:GetService("Players").LocalPlayer.Character
        -- Character:FindFirstChildOfClass('Humanoid').WalkSpeed = value
    end,
})

RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed ~= var.walkSpeed then
        LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = var.walkSpeed
    end
    if LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpPower ~= var.jumpPower then
        LocalPlayer.Character:FindFirstChildOfClass('Humanoid').JumpPower = var.jumpPower
    end
end)


sections.Misc:AddToggle("TitleLoop", {
    Title = "Loop Through Titles",
    Default = false,
    Description = "Others can see this, this is just for fun.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.TitleLoop = isEnabled
        local titleStats = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.title
        
        if titleStats then
            while var.TitleLoop do
                for _, child in ipairs(titleStats:GetChildren()) do
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Titles/Equip"):FireServer(child.Name)
                    -- print("Fired server with argument:", child.Name)
                    task.wait(0.05)
                    if not var.TitleLoop then break end
                end
            end
        end
    end)
})


sections.Misc:AddToggle("RodLoop", {
    Title = "Loop Through Rods",
    Default = false,
    Description = "Others can see this, this is just for fun.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.RodLoop = isEnabled
        local rods = ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(LocalPlayer.Name).Rods

        if rods then
            while var.RodLoop do
                for _, child in ipairs(rods:GetChildren()) do
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Rod/Equip"):FireServer(child.Name)

                    -- print("Fired equiprod event with argument:", child.Name)
                    task.wait(0.05)
                    if not var.RodLoop then break end
                end
            end
        end
    end)
})

local Emotes = {}

for _,v in pairs(game:GetService("ReplicatedStorage").resources.animations.emotes:GetChildren()) do
    if v:IsA("Animation") then
        table.insert(Emotes, v.name)
    end
end

local OldAnimation
    function playEmote(name)
    if OldAnimation then OldAnimation:Stop() end
    OldAnimation = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").resources.animations.emotes[name])
    OldAnimation:Play()
    end

sections.Misc:AddDropdown("", {
    Title = "Emotes",
    Description = "Your able to play the animations (FE)",
    Options = Emotes,
    Default = "",
    Multiple = false,
    Callback = function(SelectedEmote)
    if SelectedEmote == "" or SelectedEmote == nil then

    else
        playEmote(SelectedEmote)
    end
    end
})

sections.Misc:AddButton({
    Title = "Stop Emoting",
    Variant = "Primary",
    Callback = function()
       if OldAnimation then OldAnimation:Stop() end
    end,
})

sections.Misc:AddSlider("TiderBreaker", {
    Title = "Tidebreaker Speed",
    Description = "",
    Default = 6500,
    Min = 0,
    Max = 50000,
    Increment = 1,
    Callback = function(value)
        if character:FindFirstChild("Tidebreaker") then
            character:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").Force = Vector3.new(value,0,0)
        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tidebreaker") then
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").Force = Vector3.new(value,0,0)
        -- else
        --     lib:Notification("Error", "it seems like you don't own a tidebreaker", 5)
        --     print("it's from speed")
        end
    end,
})
var.UHHHHHHWTF = false
sections.Misc:AddToggle("TideBreaker2", {
    Title = "Make TideBreaker Easier to Control",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
    var.UHHHHHHWTF = isEnabled
    if var.UHHHHHHWTF then
        if character:FindFirstChild("Tidebreaker") then
            character:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").ApplyAtCenterOfMass = var.UHHHHHHWTF
        elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tidebreaker") then
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Tidebreaker"):WaitForChild("Core"):WaitForChild("VectorForce").ApplyAtCenterOfMass = var.UHHHHHHWTF
        else
            lib:Notification("Error", "it seems like you don't own a tidebreaker", 5)
            print("it's from control")
        end
    end
    end,
})

local randomMiscButton = sections.Misc:AddGroupButton()

-- randomMiscButton:AddButton({
--     Title = "Refresh Dropdown",
--     Variant = "Outline",
--     Callback = function()
--         UpdatePlayerList()
--     end,
-- })


randomMiscButton:AddButton({
    Title = "Remove AFK Permanently",
    Variant = "Primary",
    Callback = function()
       ReplicatedStorage.events.afk:Destroy()
       local AFK = Instance.new("RemoteEvent", game:GetService("ReplicatedStorage").events)
       AFK.Name = 'afk'
    end,
})


randomMiscButton:AddButton({
    Title = "Redeem All Codes",
    Variant = "Primary",
    Callback = function()
        lib:Notification("Claim All Codes", "Fatching Codes from wiki, may take a bit...", 2)
        local html = loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/RBXL-HTML-Parser/refs/heads/master/html/init.lua"))()
        local root = html.parse(game:HttpGet("https://fischipedia.org/wiki/Codes#Codes"))

        local function Trim(str: string)
            if not str then return "" end
            return str:match("^%s*(.-)%s*$")
        end

        local codes = {}

        for _, table in ipairs(root:select(".wikitable")) do
            local caption = table:select("caption")[1]
            if not caption then continue end
            if Trim(caption:content()):lower() ~= "active codes" then continue end
            local tbody = table:select("tbody")[1]
            if not tbody then continue end
            local rows = tbody:select("tr")
            for i = 2, #rows do
                local row = rows[i]
                local cells = row:select("td")
                if cells and cells[1] then
                    local code = Trim(cells[1]:content())
                    if code ~= "" then
                        codes[#codes + 1] = code
                    end
                end
            end
        end
        -- lib:Notification("Claim All Codes", "Successfully Fetched ".. #codes .. " Active Codes. Now Redeeming Codes", 2)
        for _, code in ipairs(codes) do
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("runcode"):FireServer(code)
        end
        lib:Notification("Claim All Codes", "Successfully Claimed all Fetched Code!", 2)
    end,
})

randomMiscButton:AddButton({
    Title = "Die",
    Variant = "Primary",
    Callback = function()
        ReplicatedStorage:WaitForChild("events"):WaitForChild("drown"):FireServer(0)     
    end,
})

randomMiscButton:AddButton({
    Title = "Load IY",
    Variant = "Primary",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
    end,
})

-- lib:Notification("Loading", "Stage 8", 5)

groupId = 7381705

-- Function to fetch roles in the group
local function fetchGroupRoles(groupId)
    local response = request({
        Url = string.format("https://groups.roblox.com/v1/groups/%d/roles", groupId),
        Method = "GET",
        Headers = { ["Content-Type"] = "application/json" }
    })

    if response and response.Success then
        return HttpService:JSONDecode(response.Body)
    else
        warn("Failed to fetch group roles:", response.StatusCode, response.StatusMessage)
        return nil
    end
end

local rolesList = {}

local rolesData = fetchGroupRoles(groupId)
if rolesData and rolesData.roles then
    for _, role in ipairs(rolesData.roles) do
        table.insert(rolesList, role.name)
    end
end

var.AntiStaffDropDown = sections.Misc1:AddDropdown("AntiStaffList", {
    Title = "Select Roles",
    Description = "",
    Options = rolesList,
    Default = "",
    Multiple = true,
    Callback = function(selectedRoles)
        var.SelectedRoles = selectedRoles
    end
})

-- role ~= "Fischer" and
-- ^ add this too but removed for now for testing purposes
var.FinishedChecked = false
if var.FinishedChecked == false then
var.AntiStaffDropDown:Refresh(rolesList,true)
for _, role in ipairs(rolesList) do
    if role ~= "Guest" and role ~= "Fischer" then
        var.AntiStaffDropDown:Set(role)
    end
end
var.FinishedChecked = true
end

local RolewatchConnection

var.AntiStaffToggle = sections.Misc1:AddToggle("AntiStaff", {
    Title = "Anti Staff",
    Default = true,
    Description = "Leaves the game automatically if a staff joins (excludes friends)",
    Callback = LPH_JIT_MAX(function(isEnabled)
        if isEnabled then
            RolewatchConnection = Players.PlayerAdded:Connect(function(player)
                if player:IsInGroup(groupId) then
                    local playerRole = tostring(player:GetRoleInGroup(groupId)):lower()
                    if type(var.SelectedRoles) == "table" then
                        for _, selectedRole in ipairs(var.SelectedRoles) do
                            if playerRole == selectedRole:lower() then
                                -- Check if the player is a friend before kicking
                                if not LocalPlayer:IsFriendsWith(player.UserId) then
                                    LocalPlayer:Kick(".")
                                    _G.UIStroke = Instance.new("UIStroke", game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt"))
                                    _G.UIStroke.Color = Color3.new(0.231373, 0.231373, 0.231373)
                                    _G.UIStroke.Transparency = 0.6
                                    _G.UICorner = Instance.new("UICorner", game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt"))
                                    _G.UICorner.CornerRadius = UDim.new(0, 5)
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").BackgroundColor3 = Color3.new(0.078431, 0.078431, 0.078431)
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").Size = UDim2.new(0, 400, 0, 330)
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.RichText = true
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").TitleFrame.ErrorTitle.RichText = true
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").TitleFrame.ErrorTitle.Text = [[<font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font>]]
                                    game:GetService("CoreGui").RobloxPromptGui:WaitForChild("promptOverlay"):FindFirstChild("ErrorPrompt").MessageArea.ErrorFrame.ErrorMessage.Text = [[
<b><font color="#5359bf">L</font><font color="#4c4eb9">u</font><font color="#4644b3">n</font><font color="#403aad">o</font><font color="#3a30a8">r</font></b> has detected a Staff and has Initiated Self-Kick on your profile.

Username: <font color="rgb(255,255,255)">]] .. player.Name .. [[</font>  
Role: <font color="rgb(255,255,255)">]] .. selectedRole .. [[</font>.
Action Was Taken at : <font color="rgb(255,255,255)">]] .. os.date("%I:%M %p") .. [[</font>

<font color="rgb(255,255,0)">⚠️ Please be careful, actions like this may result in further consequences.</font>
]]
                                else
                                    -- Optional: Add a notification for friend detection
                                    lib:Notification("Friend Detected", "Staff member " .. player.Name .. " is your friend. Not kicking.", 5)
                                end
                                break
                            end
                        end
                    else
                        warn("SelectedRoles is not a table or is nil.")
                    end
                end
            end)
            lib:Notification("Anti Staff", "Anti Staff has automatically been enabled.", 5)
        else
            if RolewatchConnection then
                RolewatchConnection:Disconnect()
                RolewatchConnection = nil
            end
        end
    end)
})

-- lib:Notification("Loading", "Stage 9", 5)

var.InventoryValueGift = sections.Misc2:AddParagraph({
    Title = gradient("Inventory Information"),
    Description = "You have <font color=\"rgb(255,0,0)\">___</font> total fish, <font color=\"rgb(255,0,0)\">___</font> favourited, and <font color=\"rgb(255,0,0)\">___</font> of the held fish.\nInventory Value: <font color=\"rgb(255,0,0)\">Offline</font>\nHeld Item Value: <font color=\"rgb(255,0,0)\">Offline</font>"
})


function UpdatePlayerList()
    variables.PlayerList = {}
    for _, v in pairs(Players:GetPlayers()) do
        table.insert(variables.PlayerList, v.DisplayName .. " (@"..v.Name..") ")
    end
    var.UserDropDown:Refresh(variables.PlayerList, true)
    var.UserDropDown:Set(variables.CopyuserSelect)
end


var.UserDropDown = sections.Misc2:AddDropdown("AllUsers", {
    Title = "Select User",
    Description = "",
    PlaceHolder = "Search Player",
    Options = variables.PlayerList,
    Default = "",
    Multiple = false,
    Callback = function(selectedPlayer)
        local realName = selectedPlayer:match("%(@(.-)%)")
        var.SelectedPlayer = realName
        print(var.SelectedPlayer)
    end
})

UpdatePlayerList()

local giftGroupButton = sections.Misc2:AddGroupButton()

giftGroupButton:AddButton({
    Title = "Refresh Dropdown",
    Variant = "Outline",
    Callback = function()
        UpdatePlayerList()
    end,
})

giftGroupButton:AddButton({
    Title = "Gift Hand",
    Variant = "Primary",
    Callback = function()
        local check = validToolCheck()
        if check then
            local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
            
            gift(var.SelectedPlayer, fish.Name)        
        else
            lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped3..", 5)
        end
    end,
})

giftGroupButton:AddButton({
    Title = "Gift All",
    Variant = "Primary",
    Callback = function()
        giftAll()
    end,
})

sections.Misc2:AddToggle("ExcludeFav", {
    Title = "Exclude Favourites",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        var.ExcludeFavourite = isEnabled
    end,
})

sections.Misc2:AddToggle("LoopAccept", {
    Title = "Loop Accept",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.Accept = isEnabled
        local function processOffers()
            for _, frame in pairs(LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren()) do
                if frame:IsA("Frame") and frame.Name == "offer" then
                    local confirmButton = frame:FindFirstChild("confirm")
                    if confirmButton and confirmButton:IsA("TextButton") then 
                        -- if getconnections then
                        --     for i, v in pairs(getconnections(confirmButton.MouseButton1Click)) do
                        --         v.Function()
                        --     end
                        -- else
                        --     firesignal(confirmButton.MouseButton1Click)
                        -- end
                        confirmButton.Selectable = true
                        GuiService.SelectedObject = confirmButton
                        VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                        VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                        task.wait()
                        GuiService.SelectedObject = nil
                    end                    
                end
            end
        end
        
        while var.Accept do
            if #LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren() > 0 then
                processOffers()
            end
            task.wait(0.1)
        end
        
    end)
})

sections.Misc2:AddToggle("LoopDecline", {
    Title = "Loop Decline",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.Decline = isEnabled
        local function processOffers()
            for _, frame in pairs(LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren()) do
                if frame:IsA("Frame") and frame.Name == "offer" then
                    local confirmButton = frame:FindFirstChild("deny")
                    if confirmButton and confirmButton:IsA("TextButton") then 
                        -- if getconnections then
                        --     for i, v in pairs(getconnections(confirmButton.MouseButton1Click)) do
                        --         v.Function()
                        --     end
                        -- else
                        --     firesignal(confirmButton.MouseButton1Click)
                        -- end
                        confirmButton.Selectable = true
                        GuiService.SelectedObject = confirmButton
                        VIM:SendKeyEvent(true, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                        VIM:SendKeyEvent(false, Enum.KeyCode.Return, false, LocalPlayer.PlayerGui)
                        task.wait()
                        GuiService.SelectedObject = nil
                    end                    
                end
            end
        end
        
        while var.Decline do
            if #LocalPlayer.PlayerGui.hud.safezone.bodyannouncements:GetChildren() > 0 then
                processOffers()
            end
            task.wait(0.1)
        end
        
    end)
})


var.GiftHandToggle = sections.Misc2:AddToggle("LoopGiftHand", {
    Title = "Loop Gift Hand",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.GiftHand = isEnabled
        while var.GiftHand do

            local check = validToolCheck()
            if check then
                local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                gift(var.SelectedPlayer, fish.Name)
            else
                lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped2..", 5)
                var.GiftHandToggle:Set(false)
            end
            task.wait()
        end
    end)
})




sections.Misc2:AddToggle("LoopGiftInv", {
    Title = "Loop Gift Inventory",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.GiftInventory = isEnabled
        if var.GiftInventory then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
        end
        while var.GiftInventory do
            giftAll()
            wait(1)
            if not var.GiftInventory then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                break
            end
        end
    end)
})


var.GiftInformationParagraph = sections.Misc2:AddParagraph({
    Title = gradient("Information"),
    Description = '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>'})

    

sections.Misc2:AddTextbox({
    Title = "Gift: Amount",
    Default = "",
    Description = "Amount of your held item that'll be give..",
    PlaceHolder = "Ex: 5",
    TextDisappear = false,
    Callback = function(giftAmount)
        var.giftAmount = tonumber(giftAmount)
    end
})

-- var.LoopGiftAmountToggle = sections.Misc2:AddToggle("LoopGiftAmount", {
--     Title = "Loop Gift Amount",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         var.LoopGiftAmount = isEnabled
--         local check = validToolCheck()
--         if check then
--             local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--             local link = tostring(fish.link.Value)
--             print(link)
--             local amount = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[link].Stack.Value)
--             print(amount)
--             print(var.giftAmount)
--             if amount < tonumber(var.giftAmount) then
--                 lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount..", 5)
--                 var.LoopGiftAmountToggle:Set(false)
--             else
--                 local targetAmount = amount - var.giftAmount
                
--                 while var.LoopGiftAmount do
--                     amount = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[link].Stack
            
--                     if amount > tonumber(targetAmount) then
--                         gift(var.selectedPlayer, fish.Name)
--                         task.wait(0.1)
--                     else
--                         lib:Notification("Loop Gift Amount", "Completed.", 5)
--                         var.LoopGiftAmountToggle:Set(false)
--                         var.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#00FF00">Completed</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#00FF00">Completed</font>')
--                         break
--                     end
--                 end
--             end
--         else
--             lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped..", 5)
--         end
--     end,
-- })


-- reverted your LPH_JIT_MAX on this one sorry, some guy said it worked before and now it crashes him


sections.Misc2:AddDropdown("LoopGiftAmoutMode", {
    Title = "Gift Amount Mode",
    Description = "",
    PlaceHolder = "Select Mode",
    Options = {"Only The Held Item", "Same Fish"},
    Default = "Only The Held Item",
    Multiple = false,
    Callback = function(Value)
        var.GiftValueMode = Value
    end
})


var.LoopGiftAmountToggle = sections.Misc2:AddToggle("LoopGiftAmount", {
    Title = "Loop Gift Amount",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.LoopGiftAmount = isEnabled

        if not isEnabled then
            return
        end

        if var.GiftValueMode == "Only The Held Item" then
            local check = validToolCheck()
            if check then
                local fish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").link.Value)
                local stack = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value)
                if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish] then
                    print(stack)
                    print(tonumber(var.giftAmount))
                    if tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value) < tonumber(var.giftAmount) then
                        print(stack, var.giftAmount, "lol")
                        var.LoopGiftAmountToggle:Set(false)
                        lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount..", 5)
                        return
                    else
                        local realFish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                        local startingValue = tonumber(stack) -- 10
                        print(startingValue)
                        local amountToGift = startingValue - var.giftAmount -- (gA = 4) = 6
                        print(startingValue, var.giftAmount ..  " = " .. amountToGift)
                        while var.LoopGiftAmount do
                            local stack = tonumber(ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish].Stack.Value)
                            print(tonumber(stack) .. " " .. amountToGift)
                            if tonumber(stack) > amountToGift then
                                print("supposed to gift..")
                                local targetItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish]
                                local previousValue = targetItem.Stack.Value
                                gift(var.SelectedPlayer, realFish)
                                while targetItem.Stack.Value == previousValue do
                                    task.wait()
                                end
                                local fishValue = tonumber(stack) or 0
                                local giftValue = tonumber(amountToGift) or 0

                                local formattedFishValue = formatNumber(fishValue)
                                local formattedGiftValue = formatNumber(giftValue)

                                local updatedDesc = string.format(
                                    '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FFFF00">%s -> %s</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>',
                                    formattedFishValue,
                                    formattedGiftValue
                                )

                                var.GiftInformationParagraph:SetDesc(updatedDesc)
                            else
                                var.LoopGiftAmountToggle:Set(false)
                                lib:Notification("Loop Gift Amount", "Completed.", 5)
                                var.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#00FF00">Completed</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FF0000">Offline</font>')
                                return
                            end
                            task.wait(3)
                        end
                    end
                end
            end
        elseif var.GiftValueMode == "Same Fish" then
            print("same fish modee!!")
            local check = validToolCheck()
            if check then
                local totalHeldFishCount = 0
                local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
                local ItemName = tool and tool.Name or "Flimsy Rod"
            
                for _, v in next, game:GetService("ReplicatedStorage").playerstats[game:GetService("Players").LocalPlayer.Name].Inventory:GetChildren() do
                    if string.find(v.Name, ItemName) and v:FindFirstChild("Stack") then
                        totalHeldFishCount = totalHeldFishCount + v.Stack.Value
                    end
                end

                if tonumber(totalHeldFishCount) < tonumber(var.giftAmount) then
                    print(totalHeldFishCount, var.giftAmount, "lol")
                    var.LoopGiftAmountToggle:Set(false)
                    lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount..", 5)
                    return
                else

                if var.ExcludeFavourite then
                    local totalHeldFishCountFavourite = 0
                    local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
                    local ItemName = tool and tool.Name or "Flimsy Rod"
                
                    for _, v in next, game:GetService("ReplicatedStorage").playerstats[game:GetService("Players").LocalPlayer.Name].Inventory:GetChildren() do
                        if string.find(v.Name, ItemName) and v:FindFirstChild("Stack") and not v:FindFirstChild("Favourited") then
                            totalHeldFishCountFavourite = totalHeldFishCountFavourite + v.Stack.Value
                        end
                    end
    
                    if tonumber(totalHeldFishCountFavourite) < tonumber(var.giftAmount) then
                        print(totalHeldFishCountFavourite, var.giftAmount, "lol")
                        var.LoopGiftAmountToggle:Set(false)
                        lib:Notification("Loop Gift Amount", "You have less of this fish than your desired gifting amount.. (favourites excluded)", 5)
                        return
                    end
                end

                local totalHeldFishCount = 0
                local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
                local ItemName = tool and tool.Name or "Flimsy Rod"
                
                -- Function to handle Stack.Value changes
                local function onStackChanged(newValue, linkValue)
                    print("Stack value changed for link:", linkValue, "New value:", newValue)
                end
                
                -- Function to connect to Stack.Value's Changed event
                local function connectToStack(item, linkValue, excludeFavourite)
                    if item:FindFirstChild("Stack") then
                        if not excludeFavourite or not item:FindFirstChild("Favourited") then
                            item.Stack:GetPropertyChangedSignal("Value"):Connect(function()
                                onStackChanged(item.Stack.Value, linkValue)
                            end)
                            print("Connected to link:", linkValue)
                            return true -- Indicate that the connection was successful
                        end
                    end
                    return false -- Indicate that the connection was not made
                end
                
                -- Iterate through the player's backpack to find tools with the same name
                for _, backpackTool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if backpackTool.Name == ItemName and backpackTool:FindFirstChild("link") then
                        local linkValue = tostring(backpackTool.link.Value)
                        
                        -- Find the corresponding item in the inventory
                        local inventoryItem = game:GetService("ReplicatedStorage").playerstats[game:GetService("Players").LocalPlayer.Name].Inventory:FindFirstChild(linkValue)
                        
                        if inventoryItem then
                            -- Connect to the Stack.Value's Changed event
                            local connectionMade = connectToStack(inventoryItem, linkValue, var.ExcludeFavourite)
                            
                            -- If the connection was made, set the parent of the tool to the player's character
                            if connectionMade then
                                backpackTool.Parent = game:GetService("Players").LocalPlayer.Character
                                print("Set parent of tool:", backpackTool.Name, "to LocalPlayer.Character")
                            end
                        end
                    end
                end
            end            
        end
    end
    end
})




sections.Misc2:AddTextbox({
    Title = "Gift: Value",
    Default = "",
    Description = "",
    PlaceHolder = "Ex: 1000000",
    TextDisappear = false,
    Callback = function(giftValue)
        var.giftValue = giftValue
    end
})

var.ToggleGiftHandValue = sections.Misc2:AddToggle("LoopGiftHand", {
    Title = "Gift Value: Hand",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoGiftHandValue = isEnabled

        if not isEnabled then
            return
        end

        local check = validToolCheck()
        if check then
            local fish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").link.Value)
            if ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish] then                
                if tonumber(GetBackPackItemValue(fish)) < tonumber(var.giftValue) then
                    print(GetBackPackItemValue(fish), var.giftValue, "lol")
                    var.ToggleGiftHandValue:Set(false)
                    lib:Notification("Gift Value: Hand", "You don't have enough value to gift..", 5)
                    return
                else
                    local realFish = tostring(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    local startingValue = tonumber(GetBackPackItemValue(fish)) -- 10m
                    print(startingValue)
                    local valueToGift = startingValue - var.giftValue -- 6m

                    while var.AutoGiftHandValue do
                        print("here")
                        if tonumber(GetBackPackItemValue(fish)) > valueToGift then
                            print('here1')
                            local targetItem = ReplicatedStorage.playerstats[LocalPlayer.Name].Inventory[fish]
                            local previousValue = targetItem.Stack.Value
                            print('here??')
                            print(fish)
                            print(var.SelectedPlayer)
                            gift(var.SelectedPlayer, realFish)
                            while targetItem.Stack.Value == previousValue do
                                task.wait()
                            end
                            local fishValue = tonumber(GetBackPackItemValue(fish)) or 0
                            local giftValue = tonumber(valueToGift) or 0

                            local formattedFishValue = formatNumber(fishValue)
                            local formattedGiftValue = formatNumber(giftValue)

                            local updatedDesc = string.format(
                                '<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#FFFF00">%s -> %s</font>',
                                formattedFishValue,
                                formattedGiftValue
                            )

                            var.GiftInformationParagraph:SetDesc(updatedDesc)
                        else
                            var.ToggleGiftHandValue:Set(false)
                            lib:Notification("Gift Value: Hand", "Completed.", 5)
                            var.GiftInformationParagraph:SetDesc('<b>Once the amount is reached, the toggle will automatically turn off and stopped.</b>\nGift Amount: <font color="#FF0000">Offline</font>\nGift Value (Inv): <font color="#FF0000">Offline</font>\nGift Value (Hand): <font color="#00FF00">Completed</font>')
                            return
                        end
                        task.wait(3)
                    end
                end
            end
        end
    end)
})


local GamepassExploit = {
    ["SelectedGamepass"] = "",  -- Fixed the typo here
    ["Loop"] = false,
    ["Randomize"] = false,
}

sections.Misc6:AddDropdown("", {
    Title = "Select Gamepass",
    Description = "",
    PlaceHolder = "Search a Gamepass",
    Options = {"Supporter","Appraisers Luck","Double XP","Emote Pack","Sell Anywhere","Bobber Pack","Radio","AppraiseAnywhere","Spawn Boat Anywhere"},
    Default = "",
    Multiple = false,
    Callback = function(Gamepass)
        GamepassExploit["SelectedGamepass"] = Gamepass  -- Fixed the typo here
        print(GamepassExploit["SelectedGamepass"])
    end
})

sections.Misc6:AddButton({
    Title = "Send Gamepass Message",
    Callback = function()   
        if GamepassExploit["Randomize"] then
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("gamepasspurchased"):FireServer({["Name"] = ({"Supporter", "Appraisers Luck", "Double XP", "Emote Pack", "Sell Anywhere", "Bobber Pack", "Radio", "AppraiseAnywhere", "Spawn Boat Anywhere"})[math.random(1, 9)]})
        elseif GamepassExploit["SelectedGamepass"] and GamepassExploit["SelectedGamepass"] ~= "" then
            game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("gamepasspurchased"):FireServer({["Name"] = tostring(GamepassExploit["SelectedGamepass"])})
        else
            lib:Notification("Error", "Please select a gamepass or toggle Randomize", 2)
        end
    end,
})


sections.Misc6:AddToggle("", {
    Title = "Randomize Gamepass",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        GamepassExploit["Randomize"] = isEnabled
    end)
})

local BadApple = nil
BadApple = sections.Misc6:AddToggle("", {
    Title = "Spam Gamepass",
    Default = false,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        GamepassExploit["Loop"] = isEnabled
        task.spawn(function()
            while GamepassExploit["Loop"] do
                if GamepassExploit["Randomize"] then
                    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("gamepasspurchased"):FireServer({["Name"] = ({"Supporter", "Appraisers Luck", "Double XP", "Emote Pack", "Sell Anywhere", "Bobber Pack", "Radio", "AppraiseAnywhere", "Spawn Boat Anywhere"})[math.random(1, 9)]})
                elseif GamepassExploit["Randomize"] == false and GamepassExploit["SelectedGamepass"] ~= nil or "" then
                    game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("gamepasspurchased"):FireServer({["Name"] = GamepassExploit["SelectedGamepass"]})
                else
                    lib:Notification("Error", "Please Select a gamepass or toggle Randomize", 2)
                    break
                end
                task.wait(1.2)
            end
        end)
    end)
})



--  sections.Misc6:AddParagraph({Title = "<font color=\"rgb(115, 252, 3)\">Cash Exploit</font>",
--  Description = "<font color='rgb(255,0,0)'>WARNING: USE AT YOUR OWN RISK!!!</font>\n- Turn on the toggle below\n- Go to Items > Purchase\n- Purchase some bait crates or something else."})
-- sections.Misc6:AddToggle('Toggle', {
--     Title = 'Cash exploit', 
--     Description = "Auto Sell All",
--     Default = false,
--     Callback = function(Value)
--         var.cashExploitRunning = Value
--         while var.cashExploitRunning do
--     task.spawn(pcall, function()
--         game:GetService("ReplicatedStorage").events.SellAll:InvokeServer()
--     end)

-- task.wait()

-- end
-- end
-- })


-- sections.Misc6:AddParagraph({Title = "<font color=\"rgb(115, 252, 3)\">Fish Dupe</font>", Description = "<font color='rgb(255,0,0)'>REQUIRES APPRAISE ANYWHERE GAMEPASS!!</font>"})


-- -- sections.Misc2:AddDropdown("InventoryValueModeFish", {
-- --     Title = "Select Fish",
-- --     Description = "",
-- --     PlaceHolder = "Select Fish",
-- --     Options = fishNames,
-- --     Default = "",
-- --     Multiple = true,
-- --     Callback = function(selectedFish)
-- --         var.SelectedInventoryValueModeFish = selectedFish
-- --     end
-- -- })

-- dupeToggle = sections.Misc6:AddToggle("DupeHeldItemToggle", {
--     Title = "Dupe Held Item", 
--     Default = false,
--     Description = "It's recommended you use Hide Inventory if you do this for long, as it'll lag. Credits to lyth.",
--     Callback = function(v)
--         dupe = v
--         if dupe then
--             validFish = ReplicatedStorage:WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/AppraiseAnywhere/HaveValidFish"):InvokeServer()
--             if not validFish then
--                 lib:Notification("Dupe Held Item", "Invalid Fish", 5)
--                 -- Fluent:Notify({
--                 --     Title = "Notification",
--                 --     Content = "Invalid Fish",
--                 --     Duration = 5
--                 -- })
--                 -- dupeToggle:SetValue(false)
--                 return
--             elseif validFish then
--                 name = LocalPlayer.Character:FindFirstChildOfClass("Tool").Name
--                 while dupe do 
--                     task.spawn(function()
--                         pcall(function()
--                             ReplicatedStorage.packages.Net["RF/AppraiseAnywhere/Fire"]:InvokeServer()
--                         end)
--                     end)
--                     task.spawn(function()
--                         pcall(function()
--                             workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
--                         end)
--                     end)
--                     task.wait(1)
--                     game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack[name])
--                 end
--             end
--         end       
--     end 
-- })




function giftValueMode(type)
    itemValues = {}
    local backpackItems = game:GetService("Players").LocalPlayer.Backpack:GetChildren()
 
    for _, v in ipairs(backpackItems) do
        if v:FindFirstChild("link") then
            local itemValue = GetBackPackItemValue(v.link.Value)
            if itemValue and itemValue > 0 then
                table.insert(itemValues, {name = v.Name, value = itemValue, tool = v})
            end
        end
    end
 
    if type == "Highest" then
        table.sort(itemValues, function(a, b) return a.value > b.value end)
    elseif type == "Lowest" then
        table.sort(itemValues, function(a, b) return a.value < b.value end)
    end
end

function giftSpecificMode()
    local totalValue = 0
    local backpackItems = game:GetService("Players").LocalPlayer.Backpack:GetChildren()
    local giftValue = var.giftValue  -- The desired total value
    fishToEquip = {}  -- Table to hold fish that will be equipped

    for _, v in ipairs(backpackItems) do
        if v:FindFirstChild("link") then
            for _, fishName in ipairs(var.SelectedInventoryValueModeFish) do
                if v.Name == fishName then
                    local itemValue = GetBackPackItemValue(v.link.Value)
                    if itemValue and itemValue > 0 then
                        -- Check if adding this item will exceed the target value
                        if totalValue + itemValue <= giftValue then
                            totalValue = totalValue + itemValue
                            print(v.Name .. ": " .. itemValue)
                            table.insert(fishToEquip, v)  -- Add to equip list
                        else
                            -- If it would exceed, just skip adding it to the equip list
                            print("Skipping excess fish: " .. v.Name)
                        end
                    end
                end
            end
        end
    end
    
    print("Total value of selected fish: " .. totalValue)
    return totalValue
end

-- sections.Item0:AddButton({
--     Title = "check high/low",
--     Callback = function()   
--         giftValueMode("Highest")
--     end,
-- })

-- sections.Item0:AddButton({
--     Title = "check specific fish",
--     Callback = function()   
--         giftSpecificMode()
--     end,
-- })

var.GiftInvValueParagraph = sections.Misc2:AddParagraph({Title = "Gift Value: Inventory", Description = "This is non functional. coming soon"})

sections.Misc2:AddDropdown("InventoryValueMode", {
    Title = "Gift Value Inventory Mode",
    Description = "",
    PlaceHolder = "Select Mode",
    Options = {"Highest Value", "Lowest Value", "Most", "Least", "Specific Fishes"},
    Default = "",
    Multiple = false,
    Callback = function(selectedMode)
        var.SelectedInventoryValueMode = selectedMode
    end
})

sections.Misc2:AddDropdown("InventoryValueModeFish", {
    Title = "Select Fish",
    Description = "",
    PlaceHolder = "Select Fish",
    Options = fishNames,
    Default = "",
    Multiple = true,
    Callback = function(selectedFish)
        var.SelectedInventoryValueModeFish = selectedFish
    end
})

var.ToggleGiftInvValue = sections.Misc2:AddToggle("ToggleGiftInv", {
    Title = "Gift Value: Inventory [soon]",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.AutoGiftInvValue = isEnabled
        if var.AutoGiftInvValue then
            lib:Notificaton("Gift Value: Inv", "Processing mode: " .. var.SelectedInventoryValueMode, 7)
            var.GiftInvValueParagraph:SetDesc("Processing mode: " .. var.SelectedInventoryValueMode .. "\nDesired Value: " .. var.giftValue)

            -- HIGHEST VALUE MODE
            if var.SelectedInventoryValueMode == "Highest Value" then
                if getInventoryValue() < var.giftValue then 
                    lib:Notificaton("Gift Value: Inv", "Not enough value..", 5)
                    var.ToggleGiftInvValue:Set(false)
                end
                giftValueMode("Highest")
                for _, item in ipairs(itemValues) do
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(item.tool)
                    print(item.name .. ": " .. item.value)
                    wait(1)
                end



            -- LOWEST VALUE MODE
            elseif var.SelectedInventoryValueMode == "Lowest Value" then
                if getInventoryValue() < var.giftValue then 
                    lib:Notificaton("Gift Value: Inv", "Not enough value..", 5)
                    var.ToggleGiftInvValue:Set(false)
                end
                giftValueMode("Lowest")
                for _, item in ipairs(itemValues) do
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(item.tool)
                    print(item.name .. ": " .. item.value)
                    wait(1)
                end
            elseif var.SelectedInventoryValueMode == "Most" then

            elseif var.SelectedInventoryValueMode == "Least" then



            -- SPECIFIC FISH MODE
            elseif var.SelectedInventoryValueMode == "Specific Fish" then
                if var.SelectedInventoryValueModeFish == nil then
                    lib:Notificaton("Gift Value: Inv", "Please select a fish.", 5)
                    var.ToggleGiftInvValue:Set(false)
                end
                if giftSpecificMode() < var.giftValue then
                    lib:Notificaton("Gift Value: Inv", "Not enough value..", 5)
                    var.ToggleGiftInvValue:Set(false)
                end
                    -- Equip the fish that were added to the fishToEquip list
                for _, fish in ipairs(fishToEquip) do
                    if fish:FindFirstChild("tool") then
                        local tool = fish:FindFirstChild("tool")
                        if tool then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                            print("Equipping fish: " .. fish.Name)
                        end
                    end
                end
            end
        end
    end
})





-- lib:Notification("Loading", "Stage 10", 5)
-- var.GiftHand = isEnabled
-- while var.GiftHand do

--     local check = validToolCheck()
--     if check then
--         local fish = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--         gift(var.SelectedPlayer, fish.Name)
--     else
--         lib:Notification("Gift Hand", "You don't seem to have a valid fish equipped2..", 5)
--         var.GiftHandToggle:Set(false)
--     end
--     task.wait()
-- end

-- Constants
local SEASON_DURATION = 576 * 60 -- 576 minutes in seconds
local CYCLE_START = 1737296640 -- Starting timestamp (Summer)
local FULL_CYCLE = SEASON_DURATION * 4

-- Create toggle function
var.SeasonTrackerToggle = sections.Visuals:AddToggle("SeasonTracker", {
    Title = "Season Tracker",
    Default = false,
    Description = "Displays the Fisch season cycle.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.SeasonTracker = isEnabled
        
        -- Remove existing GUI if it exists
        if var.SeasonGui then
            var.SeasonGui:Destroy()
            var.SeasonGui = nil
        end
        
        if isEnabled then
            local ScreenGui = Instance.new("ScreenGui")
            local Frame = Instance.new("Frame")
            local Title = Instance.new("TextLabel")
            local SeasonContainer = Instance.new("Frame")
            
            var.SeasonGui = ScreenGui
            ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            Frame.Parent = ScreenGui
            
            -- Configure main frame with new style
            Frame.Size = UDim2.new(0, 277, 0, 250)
            Frame.Position = UDim2.new(0, 10, 1, -260) -- Position at bottom left
            Frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
            Frame.BorderSizePixel = 0
            Frame.BackgroundTransparency = 0.1
            Frame.BorderMode = Enum.BorderMode.Inset
            
            -- Configure title with new style
            Title.Parent = Frame
            Title.Size = UDim2.new(1, 0, 0, 36)
            Title.Position = UDim2.new(0, 0, 0, 0)
            Title.BackgroundColor3 = Color3.fromRGB(19, 19, 19)
            Title.TextColor3 = Color3.new(1, 1, 1)
            Title.TextSize = 24
            Title.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            Title.Text = "Lunor - Season Tracker"
            
            -- Add title gradient
            local titleGradient = Instance.new("UIGradient")
            titleGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(201, 201, 201))
            }
            titleGradient.Parent = Title
            
            -- Configure season container with new style
            SeasonContainer.Parent = Frame
            SeasonContainer.Size = UDim2.new(1, -16, 1, -44)
            SeasonContainer.Position = UDim2.new(0, 8, 0, 40)
            SeasonContainer.BackgroundTransparency = 1
            
            -- Season info setup with icons
            local seasonInfo = {
                {name = "Summer", color = Color3.fromRGB(255, 216, 0), icon = "17746817125"},
                {name = "Autumn", color = Color3.fromRGB(235, 137, 35), icon = "17746816954"},
                {name = "Winter", color = Color3.fromRGB(72, 152, 239), icon = "17746816531"},
                {name = "Spring", color = Color3.fromRGB(56, 214, 123), icon = "17746816696"}
            }
            
            local seasonFrames = {}
            
            -- Create season displays with new style
            for i, season in ipairs(seasonInfo) do
                local seasonFrame = Instance.new("Frame")
                seasonFrame.Parent = SeasonContainer
                seasonFrame.Size = UDim2.new(1, 0, 0.23, 0)
                seasonFrame.Position = UDim2.new(0, 0, 0.255 * (i-1), 0)
                seasonFrame.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
                seasonFrame.BackgroundTransparency = 0.9
                seasonFrame.BorderSizePixel = 0
                seasonFrame.ClipsDescendants = true
                
                -- Add corner and stroke
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 6)
                corner.Parent = seasonFrame
                
                local stroke = Instance.new("UIStroke")
                stroke.Parent = seasonFrame
                stroke.Transparency = 0.4
                stroke.Color = Color3.fromRGB(248, 248, 248)
                
                -- Name label with new style
                local nameLabel = Instance.new("TextLabel")
                nameLabel.Parent = seasonFrame
                nameLabel.Size = UDim2.new(0.75, 0, 0.5, 2)
                nameLabel.Position = UDim2.new(0, 12, 0, 2)
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = season.color
                nameLabel.TextSize = 16
                nameLabel.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                nameLabel.TextXAlignment = Enum.TextXAlignment.Left
                nameLabel.Text = season.name
                
                -- Time label with new style
                local timeLabel = Instance.new("TextLabel")
                timeLabel.Parent = seasonFrame
                timeLabel.Size = UDim2.new(0.75, 0, 0.5, 0)
                timeLabel.Position = UDim2.new(0, 12, 0.35, 0)
                timeLabel.BackgroundTransparency = 1
                timeLabel.TextColor3 = Color3.fromRGB(198, 198, 198)
                timeLabel.TextSize = 14
                timeLabel.FontFace = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                timeLabel.TextXAlignment = Enum.TextXAlignment.Left
                
                -- Add season icon
                local icon = Instance.new("ImageLabel")
                icon.Parent = seasonFrame
                icon.Size = UDim2.new(0, 32, 0, 32)
                icon.Position = UDim2.new(0.82, 0, 0.8, -15)
                icon.AnchorPoint = Vector2.new(0, 0.5)
                icon.BackgroundTransparency = 1
                icon.Image = "rbxassetid://" .. season.icon
                
                seasonFrames[i] = {
                    frame = seasonFrame,
                    nameLabel = nameLabel,
                    timeLabel = timeLabel,
                    icon = icon
                }
            end
            
            -- Update function with improved formatting
            local function formatTime(seconds)
                local hours = math.floor(seconds / 3600)
                local minutes = math.floor((seconds % 3600) / 60)
                local secs = math.floor(seconds % 60)
                return string.format("%02dh %02dm %02ds", hours, minutes, secs)
            end
            
            -- Update display function
            local function updateDisplay()
                if not var.SeasonTracker then return end
                
                local currentTime = os.time()
                local timeSinceStart = currentTime - CYCLE_START
                local cyclePosition = timeSinceStart % FULL_CYCLE
                local currentSeasonIndex = math.floor(cyclePosition / SEASON_DURATION) + 1
                
                for i, seasonFrame in ipairs(seasonFrames) do
                    local seasonStartTime = ((i - 1) * SEASON_DURATION)
                    local timeUntilSeason = seasonStartTime - cyclePosition
                    
                    if timeUntilSeason < 0 then
                        timeUntilSeason = timeUntilSeason + FULL_CYCLE
                    end
                    
                    if i == currentSeasonIndex then
                        local timeRemaining = SEASON_DURATION - (cyclePosition % SEASON_DURATION)
                        seasonFrame.frame.BackgroundTransparency = 0.8
                        seasonFrame.timeLabel.Text = "Ends in: " .. formatTime(timeRemaining)
                        seasonFrame.nameLabel.Text = seasonInfo[i].name .. " (Current)"
                    else
                        seasonFrame.frame.BackgroundTransparency = 0.9
                        seasonFrame.timeLabel.Text = "Starts in: " .. formatTime(timeUntilSeason)
                        seasonFrame.nameLabel.Text = seasonInfo[i].name
                    end
                end
            end
            
            -- Add smooth dragging functionality
            local function MakeDraggable(topbarobject, object)
                local Dragging = nil
                local DragInput = nil
                local DragStart = nil
                local StartPosition = nil
                local TweenSpeed = 0.1
                
                local function Update(input)
                    local Delta = input.Position - DragStart
                    local targetPosition = UDim2.new(
                        StartPosition.X.Scale,
                        StartPosition.X.Offset + Delta.X,
                        StartPosition.Y.Scale,
                        StartPosition.Y.Offset + Delta.Y
                    )
                    
                    local tween = game:GetService("TweenService"):Create(
                        object,
                        TweenInfo.new(TweenSpeed, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                        {Position = targetPosition}
                    )
                    tween:Play()
                end
                
                topbarobject.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = true
                        DragStart = input.Position
                        StartPosition = object.Position
                        
                        input.Changed:Connect(function()
                            if input.UserInputState == Enum.UserInputState.End then
                                Dragging = false
                            end
                        end)
                    end
                end)
                
                topbarobject.InputChanged:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                        DragInput = input
                    end
                end)
                
                game:GetService("UserInputService").InputChanged:Connect(function(input)
                    if input == DragInput and Dragging then
                        Update(input)
                    end
                end)
            end
            
            -- Initialize dragging
            MakeDraggable(Title, Frame)
            
            -- Start update loop with RunService
            spawn(function()
                while var.SeasonTracker do
                    updateDisplay()
                    task.wait(1)
                end
            end)
        end
    end)
})


sections.Visuals:AddToggle("AutoRadarMode", {
    Title = "Enable Fish Radar",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        variables.AutoToggleRadar = true
        if isEnabled then
                for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
                    if descendant.Name == "radar1" or descendant.Name == "radar2" then
                        descendant.Enabled = true
                        descendant.MaxDistance = math.huge
                    end
                end
        else
            variables.AutoToggleRadar = false
            for _, descendant in ipairs(workspace.zones.fishing:GetDescendants()) do
                if descendant.Name == "radar1" or descendant.Name == "radar2" then
                    descendant.Enabled = false
                    descendant.MaxDistance = 250
                end
            end
        end
    end,
})


sections.Visuals:AddToggle("Inventory Value", {
    Title = "Calculate Each Item Value",
    Default = false,
    Description = "Displays a text showing the value of items",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoPriceCheck = isEnabled
        
        if isEnabled then
            for _, v in pairs(LocalPlayer.PlayerGui.hud.safezone.backpack:GetDescendants()) do
                if v:IsA("ValueBase") and v.Name == "item" then
                    local itemValue = GetBackPackItemValue(v.Value)
                    if itemValue and itemValue ~= 0 then
                        CreatePrice(v.Parent, itemValue)
                    end
                end
            end


            task.spawn(function()
                while var.AutoPriceCheck do
                    if not _G.running then
                        _G.running = true
                        monitorBackpack()
                    end
                    
                    task.wait(1)
                end

                if not var.AutoPriceCheck and _G.running then
                    _G.running = false

                    if _G.connections then
                        for _, connection in ipairs(_G.connections) do
                            if connection.Connected then
                                connection:Disconnect()
                            end
                        end
                        _G.connections = {}
                    end

                    clearPriceLabels()
                end
            end)
        else

            var.AutoPriceCheck = false
        end
    end)
})


sections.Visuals:AddToggle("AutoFullBright", {
    Title = "Enable FullBright",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.FullBright = isEnabled
        if var.FullBright then
            brightLoop = RunService.RenderStepped:Connect(brightFunc)
        elseif not var.FullBright then
            if brightLoop then
                brightLoop:Disconnect()
            end
        end
    end,
})

local updateConnection
local characterConnection
local playerConnection
local activeConnections = {}
local activeUIs = {}

sections.Visuals:AddToggle("LureVisual", {
    Title = "Lure Visual",
    Default = false,
    Description = "Bad for performance",
    Callback = function(isEnabled)
        var.LureVisual = isEnabled
        local TweenService = game:GetService("TweenService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        
        -- Cleanup system
        local activeConnections = {}
        local activeUI = nil

        local function addConnection(connection)
            table.insert(activeConnections, connection)
            return connection
        end

        local function cleanup()
            for _, connection in ipairs(activeConnections) do
                connection:Disconnect()
            end
            table.clear(activeConnections)
            
            if activeUI and activeUI.Parent then
                activeUI:Destroy()
                activeUI = nil
            end
        end

        if not isEnabled then
            cleanup()
            return
        end

        -- UI creation with single instance
        local function createUI()
            if activeUI then return activeUI end
            
            local ui = Instance.new("ScreenGui")
            ui.Parent = gethui()
            
            local mainFrame = Instance.new("Frame")
            mainFrame.BorderSizePixel = 0
            mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            mainFrame.Size = UDim2.new(0, 48, 0, 48)
            mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            mainFrame.Position = UDim2.new(0.5, 0, 1, 0)
            mainFrame.Parent = ui
            
            Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8000)
            
            local textLabel = Instance.new("TextLabel")
            textLabel.TextTransparency = 1
            textLabel.TextSize = 28
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.BackgroundTransparency = 1
            textLabel.Size = UDim2.new(0, 200, 0, 50)
            textLabel.Text = "Lure: 0%"
            textLabel.Parent = mainFrame
            
            activeUI = ui
            return ui
        end

        -- Animation management
        local activeTweens = {}
        local function cancelTweens()
            for _, tween in ipairs(activeTweens) do
                tween:Cancel()
            end
            table.clear(activeTweens)
        end

        local function playTweenAnimation(ui)
            cancelTweens()
            
            local mainFrame = ui:FindFirstChildWhichIsA("Frame")
            local textLabel = mainFrame and mainFrame:FindFirstChildWhichIsA("TextLabel")
            if not mainFrame or not textLabel then return end

            local positionTween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {Position = UDim2.new(0.5, 0, 0.85, 0)})
            local expandTween = TweenService:Create(mainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 200, 0, 48)})
            local textFadeTween = TweenService:Create(textLabel, TweenInfo.new(0.3), {TextTransparency = 0})

            positionTween:Play()
            table.insert(activeTweens, positionTween)
            
            positionTween.Completed:Once(function()
                expandTween:Play()
                table.insert(activeTweens, expandTween)
                
                expandTween.Completed:Once(function()
                    textFadeTween:Play()
                    table.insert(activeTweens, textFadeTween)
                end)
            end)
        end

        local function reverseTweenAnimation(ui)
            cancelTweens()
            
            local mainFrame = ui:FindFirstChildWhichIsA("Frame")
            local textLabel = mainFrame and mainFrame:FindFirstChildWhichIsA("TextLabel")
            if not mainFrame or not textLabel then return end

            local textFadeTween = TweenService:Create(textLabel, TweenInfo.new(0.3), {TextTransparency = 1})
            local shrinkTween = TweenService:Create(mainFrame, TweenInfo.new(0.7), {Size = UDim2.new(0, 48, 0, 48)})
            local positionTween = TweenService:Create(mainFrame, TweenInfo.new(0.7), {Position = UDim2.new(0.5, 0, 1, 0)})

            textFadeTween:Play()
            table.insert(activeTweens, textFadeTween)
            
            textFadeTween.Completed:Once(function()
                shrinkTween:Play()
                table.insert(activeTweens, shrinkTween)
                
                shrinkTween.Completed:Once(function()
                    positionTween:Play()
                    table.insert(activeTweens, positionTween)
                    
                    positionTween.Completed:Once(function()
                        if ui.Parent then
                            ui:Destroy()
                            activeUI = nil
                        end
                    end)
                end)
            end)
        end

        local function handleFishing(character)
            local toolConnection
            local function handleTool(tool)
                local stats = game.ReplicatedStorage:FindFirstChild("playerstats")
                local playerStats = stats and stats:FindFirstChild(tostring(LocalPlayer))
                local rod = playerStats and playerStats.Stats:FindFirstChild("rod")
                
                if rod and rod.Value == tool.Name then
                    local bobberConnection
                    bobberConnection = addConnection(tool.ChildAdded:Connect(function(child)
                        if child.Name == "bobber" then
                            local ui = createUI()
                            playTweenAnimation(ui)
                            
                            local values = tool:FindFirstChild("values")
                            local lureValue = values and values:FindFirstChild("lure")
                            local reelValue = values and values:FindFirstChild("reel")

                            if lureValue then
                                local function updateLure()
                                    ui:FindFirstChild("Frame").TextLabel.Text = "Lure: " .. math.floor(lureValue.Value + 0.5) .. "%"
                                end
                                updateLure()
                                addConnection(lureValue.Changed:Connect(updateLure))
                            end

                            if reelValue then
                                addConnection(reelValue.Changed:Connect(function()
                                    if reel.Value then
                                        reverseTweenAnimation(ui)
                                    end
                                end))
                            end

                            addConnection(tool.AncestryChanged:Connect(function(_, parent)
                                if not parent then
                                    reverseTweenAnimation(ui)
                                    if bobberConnection then
                                        bobberConnection:Disconnect()
                                    end
                                end
                            end))

                            addConnection(LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
                                if child.Name == "reel" then
                                    reverseTweenAnimation(ui)
                                end
                            end))
                        end
                    end))
                end
            end

            -- Handle existing tools
            for _, tool in ipairs(character:GetChildren()) do
                if tool:IsA("Tool") then
                    handleTool(tool)
                end
            end

            -- Listen for new tools
            toolConnection = addConnection(character.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    handleTool(child)
                end
            end))
        end

        -- Initial setup
        if LocalPlayer.Character then
            handleFishing(LocalPlayer.Character)
        end
        addConnection(LocalPlayer.CharacterAdded:Connect(handleFishing))

        -- Cleanup when toggle is disabled
        return function()
            cleanup()
            cancelTweens()
        end
    end,
})


-- local createdVisual = false
-- local LureVisualUI = {}
-- local updateConnection

-- sections.Visuals:AddToggle("LureVisual", {
--     Title = "Lure Visual",
--     Default = false,
--     Description = "",
--     Callback = function(isEnabled)
--         var.LureVisual = isEnabled

--         local function createLureVisual()
--             createdVisual = true

--             LureVisualUI["1"] = Instance.new("ScreenGui", gethui())
--             LureVisualUI["1"]["Name"] = [[LureVisual]]

--             LureVisualUI["2"] = Instance.new("Frame", LureVisualUI["1"])
--             LureVisualUI["2"]["BorderSizePixel"] = 0
--             LureVisualUI["2"]["BackgroundColor3"] = Color3.fromRGB(21, 21, 21)
--             LureVisualUI["2"]["Size"] = UDim2.new(0, 0, 0, 0) -- Start small for animation
--             LureVisualUI["2"]["Position"] = UDim2.new(0.457, 0, 0.87, 0)
--             LureVisualUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
--             LureVisualUI["2"]["Name"] = [[CoolMonke]]
--             LureVisualUI["2"]["BackgroundTransparency"] = 1 -- Fully transparent at start

--             -- Add UICorner for rounded edges
--             LureVisualUI["3"] = Instance.new("UICorner", LureVisualUI["2"])

--             -- Add UIStroke for border
--             LureVisualUI["4"] = Instance.new("UIStroke", LureVisualUI["2"])
--             LureVisualUI["4"]["Thickness"] = 0.6
--             LureVisualUI["4"]["Color"] = Color3.fromRGB(255, 255, 255)

--             -- Add TextLabel for Lure percentage
--             LureVisualUI["5"] = Instance.new("TextLabel", LureVisualUI["2"])
--             LureVisualUI["5"]["BorderSizePixel"] = 0
--             LureVisualUI["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
--             LureVisualUI["5"]["TextSize"] = 24
--             LureVisualUI["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
--             LureVisualUI["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
--             LureVisualUI["5"]["BackgroundTransparency"] = 1
--             LureVisualUI["5"]["RichText"] = true
--             LureVisualUI["5"]["Size"] = UDim2.new(1, 0, 1, 0)
--             LureVisualUI["5"]["Text"] = [[Lure: 0%]]

--             -- Add progress bar at the bottom
--             LureVisualUI["7"] = Instance.new("Frame", LureVisualUI["2"])
--             LureVisualUI["7"]["BorderSizePixel"] = 0
--             LureVisualUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
--             LureVisualUI["7"]["Size"] = UDim2.new(0, 170, 0, 7)
--             LureVisualUI["7"]["Position"] = UDim2.new(-0.00595, 0, 0.87, 0)
--             LureVisualUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)

--             LureVisualUI["8"] = Instance.new("UICorner", LureVisualUI["7"])
--             LureVisualUI["8"]["CornerRadius"] = UDim.new(0, 8000)

--             -- Tween Animation for Pop-Up
--             local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
--             local goal = {Size = UDim2.new(0, 168, 0, 46), BackgroundTransparency = 0.3}
--             local tween = game:GetService("TweenService"):Create(LureVisualUI["2"], tweenInfo, goal)
--             tween:Play()
--         end

--         local function cleanupUI()
--             if createdVisual and LureVisualUI["1"] then
--                 -- Smooth fade-out
--                 local fadeOutTween = game:GetService("TweenService"):Create(LureVisualUI["2"], TweenInfo.new(0.5), {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 0)})
--                 fadeOutTween:Play()
--                 fadeOutTween.Completed:Connect(function()
--                     LureVisualUI["1"]:Destroy()
--                     createdVisual = false
--                 end)
--             end
--         end

--         if isEnabled then
--             updateConnection = game:GetService("RunService").Heartbeat:Connect(function()
--                 local player = LocalPlayer

--                 if player.PlayerGui:FindFirstChild("reel") then
--                     cleanupUI()
--                     return
--                 end

--                 local rod = player.Character and player.Character:FindFirstChild(getEquippedRod())
--                 if rod then
--                     local values = rod:FindFirstChild("values")
--                     if values then
--                         local casted = values:FindFirstChild("casted")
--                         if casted and casted.Value == false then
--                             cleanupUI()
--                         elseif casted and casted.Value == true and not createdVisual then
--                             createLureVisual()
--                         end

--                         if createdVisual then
--                             local lure = values:FindFirstChild("lure")
--                             local bite = values:FindFirstChild("bite")
--                             if lure and bite and bite.Value == false and lure.Value < 100 then
--                                 local lureValue = math.floor(lure.Value + 0.5) -- Round to nearest whole number
--                                 LureVisualUI["5"].Text = "Lure: " .. tostring(lureValue) .. "%"
--                             elseif bite and bite.Value then
--                                 LureVisualUI["5"].Text = "Caught!"
--                                 task.delay(0.5, cleanupUI)
--                             end
--                         end
--                     end
--                 else
--                     cleanupUI()
--                 end
--             end)
--         else
--             if updateConnection then
--                 updateConnection:Disconnect()
--                 updateConnection = nil
--             end
--             cleanupUI()
--         end
--     end,
-- })



local gayconnection
sections.Visuals:AddToggle("AutoPredictor", {
    Title = "Auto Predictor",
    Default = false,
    Description = "Predict what fish you're about to get before catching it",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.AutoPredictor = isEnabled

        local function onReelGUIAdded(ReelGUI)
            if not var.AutoPredictor then return end

            local fishValueObj = ReelGUI:WaitForChild("bar"):WaitForChild("reel"):WaitForChild("fish", math.huge)
            lib:Notification("Auto Predictor", "Predicted: " .. tostring(fishValueObj.Value), 3)
        end

        if isEnabled then
            local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
            local existingReelGUI = playerGui:FindFirstChild("reel")

            if existingReelGUI then
                onReelGUIAdded(existingReelGUI)
            end

            gayconnection =playerGui.ChildAdded:Connect(function(child)
                if child.Name == "reel" then
                    onReelGUIAdded(child)
                end
            end)
        else
            if gayconnection then
                gayconnection:Disconnect()
                gayconnection = nil
            end
        end
    end)
})



sections.Visuals:AddColorpicker("WaterColor", {
    Title = "Water Color",
    Default = Color3.fromRGB(60, 66, 85),
    Callback = function(selectedColor)
    game:GetService("Workspace").Terrain.WaterColor = selectedColor
    end,
})

sections.Visuals:AddSlider("WaterSpeed", {
    Title = "Waves Speed",
    Description = "",
    Default = 10,
    Min = 0,
    Max = 255,
    Increment = 1,
    Callback = function(value)
        game:GetService("Workspace").Terrain.WaterWaveSpeed = value
    end,
})


local function antiLag()
    local Terrain = workspace:FindFirstChildOfClass('Terrain')
    local RunService = game:GetService('RunService')
    
    -- Terrain water settings
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 0
    
    -- Lighting settings
    local Lighting = game:GetService('Lighting')
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    
    -- Rendering quality
    settings().Rendering.QualityLevel = 1
    
    -- Modify game objects
    for _, v in pairs(game:GetDescendants()) do
        -- Part modifications
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
            v.Material = "Plastic"
            v.Reflectance = 0
        
        -- Decal transparency
        elseif v:IsA("Decal") then
            v.Transparency = 1
        
        -- Particle and effect lifetime
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v.Lifetime = NumberRange.new(0)
        
        -- Explosion reduction
        elseif v:IsA("Explosion") then
            v.BlastPressure = 1
            v.BlastRadius = 1
        end
    end
    
    -- Disable lighting effects
    for _, v in pairs(Lighting:GetDescendants()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    
    -- Auto-remove certain new descendant objects
    workspace.DescendantAdded:Connect(function(child)
        task.spawn(function()
            if child:IsA('ForceField') or child:IsA('Sparkles') or child:IsA('Smoke') or child:IsA('Fire') then
                RunService.Heartbeat:Wait()
                child:Destroy()
            end
        end)
    end)
end

-- lib:Notification("Loading", "Stage 13", 5)
sections.Visuals1:AddTextbox({
    Title = "Set FPS Cap",
    Default = "",
    Description = "",
    PlaceHolder = "240",
    TextDisappear = false,
    Callback = function(cap)
        fpscap = cap
        setfpscap(fpscap)
    end
})

sections.Visuals1:AddToggle("BoostFPS", {
    Title = "Boost FPS",
    Default = false,
    Description = "Reduces Quality",
    Callback = function(isEnabled)
        var.BoostFPS = isEnabled
        if var.BoostFPS then
            antiLag()
        end
    end,
})

-- sections.Visuals1:AddToggle("RemoveOtherPlayers", {
--     Title = "Remove Other Players",
--     Default = false,
--     Description = "FPS Boost",
--     Callback = function(isEnabled)
--         var.removeOtherPlayers = isEnabled
--         if var.removeOtherPlayers then
--             for _, player in pairs(game.Players:GetPlayers()) do
--                 if player ~= game.Players.LocalPlayer then
--                     player:Destroy()
--                 end
--             end
--             for _, folder in pairs(game:GetService("ReplicatedStorage").playerstats:GetChildren()) do
--                 if folder.Name ~= game.Players.LocalPlayer.Name then
--                     folder:Destroy()
--                 end
--              end
--         end
--     end,
-- })

local playerAddedConnection
local statsAddedConnection
local workspaceChildAddedConnection
local playersCharactersConnections = {}

sections.Visuals1:AddToggle("RemoveOtherPlayers", {
    Title = "Remove Other Players",
    Default = false,
    Description = "FPS Boost",
    Callback = function(isEnabled)
        var.removeOtherPlayers = isEnabled

        if isEnabled then
            -- Remove existing players and their characters
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    if player.Character then
                        player.Character:Destroy()
                    end
                    task.defer(function()
                        if player then player:Destroy() end
                    end)
                end
            end

            -- Remove existing characters in Workspace
            for _, child in pairs(workspace:GetChildren()) do
                if child:IsA("Model") then
                    local player = game.Players:GetPlayerFromCharacter(child)
                    if player and player ~= game.Players.LocalPlayer then
                        child:Destroy()
                    end
                end
            end

            -- Remove existing player stats
            local playerStats = game:GetService("ReplicatedStorage"):FindFirstChild("playerstats")
            if playerStats then
                for _, folder in pairs(playerStats:GetChildren()) do
                    if folder.Name ~= game.Players.LocalPlayer.Name then
                        folder:Destroy()
                    end
                end
            end

            -- Setup connections for new players, characters, and stats
            playerAddedConnection = game.Players.PlayerAdded:Connect(function(player)
                if player ~= game.Players.LocalPlayer then
                    local conn
                    conn = player.CharacterAdded:Connect(function(char)
                        if char then char:Destroy() end
                        if conn then conn:Disconnect() end
                    end)
                    if player.Character then
                        player.Character:Destroy()
                    end
                    task.defer(function()
                        if player then player:Destroy() end
                    end)
                end
            end)

            workspaceChildAddedConnection = workspace.ChildAdded:Connect(function(child)
                if child:IsA("Model") then
                    local player = game.Players:GetPlayerFromCharacter(child)
                    if player and player ~= game.Players.LocalPlayer then
                        child:Destroy()
                    end
                end
            end)

            statsAddedConnection = game:GetService("ReplicatedStorage"):FindFirstChild("playerstats")
            if statsAddedConnection then
                statsAddedConnection = statsAddedConnection.ChildAdded:Connect(function(folder)
                    task.wait()
                    if folder and folder.Parent == game:GetService("ReplicatedStorage").playerstats then
                        folder:Destroy()
                    end
                end)
            end

        else
            -- Disconnect all connections
            if playerAddedConnection then playerAddedConnection:Disconnect() end
            if workspaceChildAddedConnection then workspaceChildAddedConnection:Disconnect() end
            if statsAddedConnection then statsAddedConnection:Disconnect() end

            -- Clear connections table
            playersCharactersConnections = {}
        end
    end,
})


sections.Visuals1:AddToggle("RemoveFishModel", {
    Title = "Remove Fish Model",
    Default = true,
    Description = "Removes the fish on the bobber.",
    Callback = function(isEnabled)
        var.RemoveFishModel = isEnabled
        workspace:WaitForChild("active").ChildAdded:Connect(function(Child: Instance)
            if Child:IsA("Model") then
                Child:Destroy()
            end
        end)
    end,
})

-- sections.Visuals1:AddButton({
--     Title = "Boost FPS",
--     Variant = "Primary",
--     Callback = function()
--         antiLag()
--     end,
-- })

local hideUIConnection
sections.Visuals1:AddToggle("HideUI", {
    Title = "Hide UI",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        local hud = LocalPlayer.PlayerGui:FindFirstChild("hud")
        if hud and hud:IsA("ScreenGui") then
            if isEnabled then
                hud.Enabled = false
                if not hideUIConnection then
                    hideUIConnection = hud:GetPropertyChangedSignal("Enabled"):Connect(function()
                        hud.Enabled = false
                    end)
                end
            else
                if hideUIConnection then
                    hideUIConnection:Disconnect()
                    hideUIConnection = nil
                end
                hud.Enabled = true
            end
        end
    end,
})


sections.Visuals1:AddToggle("HideCaughtPlus", {
    Title = "Hide Caught",
    Default = false,
    Description = "Hides the Fish Caught popup",
    Callback = function(isEnabled)
        var.HideCaught = isEnabled
        pcall(function()
            if var.HideCaught then
                game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.announcements.announcer.Parent = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.SubmarineControls
            elseif not var.HideCaught then
                game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.SubmarineControls.announcer.Parent = game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.announcements
            end
        end)
    end,
})




sections.Visuals1:AddToggle("HideCaught", {
    Title = "Hide Caught+",
    Default = false,
    Description = "Premium Feature",
    Callback = function(isEnabled)
        var.HideCaughtPlus = isEnabled
        pcall(function()
            if var.HideCaughtPlus then
                game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.announcements.announcer.Enabled = false
            elseif not var.HideCaughtPlus then
                game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.announcements.announcer.Enabled = true
            end
        end)
    end,
})


sections.Visuals1:AddColorpicker("RenderScreenColor", {
    Title = "Change Render Screen Color",
    Default = Color3.fromRGB(0, 0, 0),
    Callback = function(selectedColor)
        local playerGui = LocalPlayer:WaitForChild("PlayerGui")
        playerGui:FindFirstChild("guh").Frame.BackgroundColor3 = selectedColor
    end,
})

sections.Visuals1:AddToggle("Blackscreen", {
    Title = "Low Rendering Screen",
    Default = false,
    Description = "Disables Rendering",
    Callback = function(isEnabled)
        var.whiteScreenToggle = isEnabled
        local playerGui = LocalPlayer:WaitForChild("PlayerGui")
        local blackScreenGui = playerGui:FindFirstChild("guh")
        
        if isEnabled then
            if not blackScreenGui then
                blackScreenGui = Instance.new("ScreenGui")
                blackScreenGui.Name = "guh"
                blackScreenGui.DisplayOrder = 999
                blackScreenGui.ResetOnSpawn = false
                blackScreenGui.Parent = playerGui
                
            if not isfile('Lunor_Trans.png') then
                writefile("Lunor_Trans.png", game:HttpGet('https://github.com/Just3itx/Backup/blob/main/Lunor_Trans.png?raw=true'))
            end
            var.Blacke02 = Instance.new("Frame", blackScreenGui)
            var.Blacke02.Position = UDim2.new(0,0,0,-60)
            var.Blacke02.Size = UDim2.new(1,0,2,0)
            var.Blacke02.BackgroundColor3 = Color3.new(0,0,0)
            var.Blacke03 = Instance.new("TextLabel", var.Blacke02)
            var.Blacke03.Position = UDim2.new(0.43,0,0,450)
            var.Blacke03.AutomaticSize = "XY"
            var.Blacke03.Text = "Lunor"
            var.Blacke03.TextColor3 = Color3.new(255,255,255)
            var.Blacke03.RichText = true
            var.Blacke03.TextSize = 100
            var.Blacke03.Font = Enum.Font.SourceSansBold
            var.Blacke03.BackgroundTransparency = 1
            var.Blacke04 = Instance.new("ImageLabel",var.Blacke02)
            var.Blacke04.Position = UDim2.new(0.52,0,0,370)
            var.Blacke04.Size = UDim2.new(0,256,0,256)
            var.Blacke04.BackgroundTransparency = 1
            var.Blacke04.Image = getLunorIcon()
            end
            blackScreenGui.Enabled = true
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        else
            if blackScreenGui then
                blackScreenGui.Enabled = false
            end
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    end,
})


sections.Visuals1:AddToggle("debrisfx", {
    Title = "Hide Debris",
    Default = true,
    Description = "Good for seraphic rod.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.hideDebris = isEnabled
        local debrisfx = workspace.active:FindFirstChild("debrisfx")
        
        -- Store the connection in a global variable so we can disconnect it later
        if not var.debrisConnection then
            var.debrisConnection = nil
        end

        if isEnabled and debrisfx then
            -- Create new connection only if enabled
            var.debrisConnection = debrisfx.ChildAdded:Connect(function(child)
                child:Destroy()
            end)
        else
            -- Disconnect the existing connection when toggle is turned off
            if var.debrisConnection then
                var.debrisConnection:Disconnect()
                var.debrisConnection = nil
            end
        end
    end)
})


local rainConnection

sections.Visuals1:AddToggle("Rain", {
    Title = "Disable Rain",
    Default = true,
    Description = "Hides Raining",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.hideRainToggle = isEnabled

        -- Disconnect existing connection if it exists
        if rainConnection then
            rainConnection:Disconnect()
            rainConnection = nil
        end

        if isEnabled then
            -- Continuously monitor and disable rain
            rainConnection = game:GetService("RunService").RenderStepped:Connect(function()
                -- Safely handle potential errors
                pcall(function()
                    -- Disable rain emitters in the Camera
                    local rainEmitter = workspace.Camera:FindFirstChild("__RainEmitter")
                    if rainEmitter then
                        if rainEmitter:FindFirstChild("RainStraight") then
                            rainEmitter.RainStraight.Lifetime = NumberRange.new(0, 0)
                        end
                        if rainEmitter:FindFirstChild("RainTopDown") then
                            rainEmitter.RainTopDown.Lifetime = NumberRange.new(0, 0)
                        end
                    end
                end)

                -- Disable attachments related to rain in the Terrain
                pcall(function()
                    for _, descendant in ipairs(workspace.Terrain:GetDescendants()) do
                        if descendant:IsA("Attachment") and (descendant.Name == "__RainOccludedAttachment" or descendant.Name == "__RainSplashAttachment") then
                            if descendant:FindFirstChild("RainStraight") then
                                descendant.RainStraight.Lifetime = NumberRange.new(0, 0)
                            end
                            if descendant:FindFirstChild("RainTopDown") then
                                descendant.RainTopDown.Lifetime = NumberRange.new(0, 0)
                            end
                            if descendant:FindFirstChild("RainSplash") then
                                descendant.RainSplash.Lifetime = NumberRange.new(0, 0)
                            end
                        end
                    end
                end)
            end)
        else
            -- Re-enable rain emitters when toggled off
            pcall(function()
                local rainEmitter = workspace.Camera:FindFirstChild("__RainEmitter")
                if rainEmitter then
                    if rainEmitter:FindFirstChild("RainStraight") then
                        rainEmitter.RainStraight.Lifetime = NumberRange.new(0.8, 0.8)
                    end
                    if rainEmitter:FindFirstChild("RainTopDown") then
                        rainEmitter.RainTopDown.Lifetime = NumberRange.new(0.8, 0.8)
                    end
                end
            end)
        end
    end)
})

sections.Visuals1:AddToggle("Fog", {
    Title = "Disable Fog",
    Default = true,
    Description = "Hides Fog",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.hideFogToggle = isEnabled
        
        Lighting.FogEnd = 100000
        
        for _, v in pairs(Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    end)
})

local underwaterConnections = {}

sections.Visuals1:AddToggle("DisableUnderWaterScreen", {
    Title = "Disable Underwater Screen",
    Default = true,
    Description = "",
    Callback = LPH_JIT_MAX(function(isEnabled)
        for _, conn in pairs(underwaterConnections) do
            if conn.Connected then conn:Disconnect() end
        end
        underwaterConnections = {}

        if isEnabled then
            local lighting = game:GetService("Lighting")
            for _, effectName in pairs({"underwaterbl", "underwatercc"}) do
                local effect = lighting:FindFirstChild(effectName)
                if effect then
                    table.insert(underwaterConnections, effect:GetPropertyChangedSignal("Enabled"):Connect(function()
                        if effect.Enabled then effect.Enabled = false end
                    end))
                end
            end
        end
    end)
})


-- Clear All Terrain [Improve FPS]
local terrainClearConnection
sections.Visuals1:AddToggle("ClearTerrain", {
    Title = "Clear All Terrain [Improve FPS]",
    Default = false,
    Description = "Clears all terrain to improve performance.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.clearTerrainToggle = isEnabled

        -- Disconnect any existing connection
        if terrainClearConnection then
            terrainClearConnection:Disconnect()
            terrainClearConnection = nil
        end

        if var.clearTerrainToggle then
            -- Continuously clear terrain children
            terrainClearConnection = game:GetService("RunService").RenderStepped:Connect(function()
                workspace.Terrain:ClearAllChildren()
            end)
        end
    end)
})

-- Disable Waves [Improve FPS]
local wavesConnection
sections.Visuals1:AddToggle("DisableWaves", {
    Title = "Disable Waves [Improve FPS]",
    Default = true,
    Description = "Disables waves to improve performance.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.disableWavesToggle = isEnabled
        if var.disableWavesToggle == true then
        local waves =  workspace.active.constant.Waves.Waves:FindFirstChild("waves")
        if waves then
        waves.Enabled = false 
        end
        elseif var.disableWavesToggle == false then
        local waves =  workspace.active.constant.Waves.Waves:FindFirstChild("waves")
        if waves then
        waves.Enabled = true 
        end
        end
    end)
})

-- Disable Aurora Borealis Sky [Improve FPS]
local auroraConnection
sections.Visuals1:AddToggle("DisableAurora", {
    Title = "Disable Aurora Borealis Sky [Improve FPS]",
    Default = true,
    Description = "Disables aurora borealis beams for better performance.",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.disableAuroraToggle = isEnabled

        -- Disconnect any existing connection
        if auroraConnection then
            auroraConnection:Disconnect()
            auroraConnection = nil
        end

        if var.disableAuroraToggle then
            auroraConnection = game:GetService("RunService").RenderStepped:Connect(function()
                    for _, beam in ipairs(workspace.active.constant["Aurora Borealis"]["Aurora Borealis"]:GetChildren()) do
                        if beam:IsA("Beam") then
                            beam.Enabled = false
                        end
                    end
            end)
        end
    end)
})

sections.Visuals1:AddToggle("DeleteInventory1", {
    Title = "Delete Inventory Excluding your Defualt tools [Client Side]",
    Default = false,
    Description = "Delete your Entire Inventory Client Sided But it does not delete The Defualt Tools",
    Callback = LPH_NO_VIRTUALIZE(function(isEnabled)
        var.DeleteInventory = isEnabled
        local excludedTools = {"Equipment Bag","Bestiary","Radio","Boats"}
        while var.DeleteInventory do
        for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if not table.find(excludedTools, tool.Name) and tool.Name ~= getEquippedRod() then
                tool:Destroy()
            end
        end
            task.wait()
        end
    end)
})

local ExludedTable = {}

if type(data.Fish) == "table" then
    for i, fishData in pairs(data.Fish) do
        table.insert(ExludedTable, i)
    end
end

if type(data.Items) == "table" then
    for i, v in pairs(data.Items) do
        table.insert(ExludedTable, i)
    end
end

local exludingTabe = {}

sections.Visuals1:AddDropdown("ClearInventoryDropdown", {
    Title = " Exclude List",
    Description = "",
    Options = ExludedTable,
    Default = {"Treasure Map","Crab Cage","Conception Conch","GPS","Fish Radar","Glider","Advanced Glider","Pickaxe","Winter Cloak","Basic Diving Gear","Advanced Diving Gear","Flippers","Super Flippers","Tidebreaker","Enchanted Relic","Exalted Relic","Bait Crate","Quality Bait Crate","Fish Barrel","Common Crate","Coral Geode","Carbon Crate","Volcanic Geode","Sundial Totem","Eclipse Totem","Smokescreen Totem","Avalanche Totem","Aurora Totem","Tempest Totem","Blizzard Totem","Windset Totem","Tidebreaker"},
    PlaceHolder = "Search your Fish/Items Fish Here",
    Multiple = true,
    Callback = function(SelectedShit)
        exludingTabe = SelectedShit
    end,
})


sections.Visuals1:AddToggle("DeleteInventory2", {
    Title = "Delete Inventory (Client Sided)",
    Default = false,
    Description = "Delete your Entire Inventory Client Sided But it does not delete The Default Tools This is for FPS, you still keep your stuff.",
    Callback = LPH_NO_VIRTUALIZE(function(isEnabled)
        var.DeleteInventory2 = isEnabled
        local excludedTools2 = {"Equipment Bag","Bestiary","Radio","Boats"}
        while var.DeleteInventory2 do
        for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if not table.find(excludedTools2, tool.Name) and not table.find(exludingTabe, tool.Name) and tool.Name ~= getEquippedRod() then
                tool:Destroy()
            end
        end
            task.wait()
        end
    end)
})

sections.Visuals1:AddToggle("DeleteOtherPlayerInventory", {
    Title = "Delete Other Player Inventory (Client Sided)",
    Default = false,
    Description = "Delete Other Player Inventory to make you not render there Tools",
    Callback = LPH_NO_VIRTUALIZE(function(isEnabled)
        var.DeleteOtherPlayerInventory = isEnabled
        while var.DeleteOtherPlayerInventory do 
            for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
                if player ~= game:GetService("Players").LocalPlayer then
                    local backpack = player:FindFirstChild("Backpack")
                    if backpack then
                        for _, tool in next,backpack:GetChildren() do
                            if tool:IsA("Tool") then
                                tool:Destroy()
                            end
                        end
                    end
                end
            end
        task.wait()
        end
    end)
})


sections.Visuals1:AddToggle("HideOtherPlayers", {
    Title = "Hide The players(Client Sided)",
    Default = false,
    Description = "Might Help with your frames",
    Callback = LPH_JIT_MAX(function(isEnabled)
        var.HidePlayers = isEnabled
        while var.HidePlayers do 
        local undoFrame = game:GetService("CoreGui").RoactAppExperimentProvider.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
        local ScrollingFrame = game:GetService("CoreGui").RoactAppExperimentProvider.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer
        if undoFrame then
            for _, v in next, undoFrame:GetChildren() do
                if v.Name ~= "p_" .. LocalPlayer.UserId then
                    v.Visible = false
                end
            end
        end
        ScrollingFrame.Size = UDim2.new(1,0,0,40)
        undoFrame.Size = UDim2.new(1,0,0,40)
        undoFrame.Parent.ScrollingEnabled = false
        task.wait()
        end
    end)
})
-- lib:Notification("Loading", "Stage 14", 5)


var.ToggledTest = false
var.ColoredREEEL = Color3.new(0.435294, 0, 1)

sections.Visuals2:AddColorpicker("LocalPlayerColor", {
    Title = "Character Color",
    Default = Color3.fromRGB(60, 66, 85),
    Callback = function(selectedColor)
    var.ColoredREEEL = selectedColor
    for _,v in pairs(LocalPlayer.Character:GetDescendants()) do
        if var.ToggledTest == true then
        if v:IsA("BasePart") then
                v.Color = var.ColoredREEEL
        end
    end
    end
    end
})
var.ToggledTest = false
var.ColoredREEEL = Color3.new(0.435294, 0, 1)
var.lockConnections2 = {}
sections.Visuals2:AddToggle("LocalPlayerIdentity", {
    Title = "Hide LocalPlayer Identity",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        if isEnabled then
        var.ToggledTest = true
        function createRainbowGradient(parent)
    _G.gradient = Instance.new("UIGradient", parent)
    _G.gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.000, Color3.fromRGB(242, 138, 54)),
        ColorSequenceKeypoint.new(0.250, Color3.fromRGB(242, 54, 107)),
        ColorSequenceKeypoint.new(0.500, Color3.fromRGB(134, 54, 242)),
        ColorSequenceKeypoint.new(0.750, Color3.fromRGB(54, 187, 242)),
        ColorSequenceKeypoint.new(1.000, Color3.fromRGB(54, 242, 173))
    }
    return _G.gradient
end

function setupCharacter(character)
    _G.humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    _G.user = _G.humanoidRootPart:WaitForChild("user")

    -- Cleanup previous character meshes and appearance
    for _, v in ipairs(character:GetDescendants()) do
        if v:IsA("CharacterMesh") or v:IsA("Accessory") or v:IsA("SpecialMesh") or (v:IsA("Decal") and v.Name == "face") then
            v:Destroy()
        elseif v:IsA("BasePart") then
            v.Material = Enum.Material.Neon
            v.Color = var.ColoredREEEL
        end
    end

    if character:FindFirstChild("Shirt") then character.Shirt:Destroy() end
    if character:FindFirstChild("Pants") then character.Pants:Destroy() end

    -- Apply rainbow gradients
    _G.Rainbow = createRainbowGradient(_G.user.user)
    _G.Rainbow2 = createRainbowGradient(_G.user.level)
    _G.Rainbow3 = createRainbowGradient(_G.user.streak)
    _G.Rainbow4 = createRainbowGradient(_G.user.title)
    _G.Rainbow5 = createRainbowGradient(LocalPlayer.PlayerGui.hud.safezone.coins)
    _G.Rainbow6 = createRainbowGradient(LocalPlayer.PlayerGui.hud.safezone.lvl)

var.lockConnections = {}

function lockText(property, target, value)
    target[property] = value

    -- Create a connection to monitor property changes
    var.connection = target:GetPropertyChangedSignal(property):Connect(function()
        if target[property] ~= value then
            target[property] = value
        end
    end)

    -- Store the connection in the lockConnections table
    table.insert(var.lockConnections, var.connection)
end

    lockText("Text", _G.user.user, "Hidden")
    lockText("Text", _G.user.level, "Level: ∞")
    lockText("Text", _G.user.streak, "∞")
    lockText("Text", _G.user.title, "❤")
    lockText("Text", LocalPlayer.PlayerGui.hud.safezone.coins, "~~~~~~★ C$")
    lockText("Text", LocalPlayer.PlayerGui.hud.safezone.lvl, "Level: ∞")
    var.MoneyLog = nil
    var.MoneyLog = LocalPlayer.PlayerGui.hud.safezone.StatChangeList.ChildAdded:Connect(function(v)
        if v:IsA("TextLabel") then
            v.Text = "math.huge 👍"
        end
    end)

function lockTextSafe(path, text)
 _G.success, _G.err = pcall(function()
        lockText("Text", path, text)
    end)
    if not _G.success then
        warn("Failed to set lockText: " .. _G.err)
    end
end
_G.players = Players
_G.localPlayer = _G.players.LocalPlayer
_G.userId = "p_" .. _G.localPlayer.UserId

_G.roactProvider = game:GetService("CoreGui"):FindFirstChild("RoactAppExperimentProvider")
if not _G.roactProvider then
    warn("Please wait till your game is fully loaded")
    return
end

_G.offsetFrame = _G.roactProvider:FindFirstChild("Children")
    and _G.roactProvider.Children:FindFirstChild("OffsetFrame")
if _G.offsetFrame then
    _G.undoFrame = _G.offsetFrame:FindFirstChild("PlayerScrollList")
        and _G.offsetFrame.PlayerScrollList:FindFirstChild("SizeOffsetFrame")
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame
        and _G.offsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame

    if _G.undoFrame and _G.undoFrame[_G.userId] then
        _G.userFrame = _G.undoFrame[_G.userId]:WaitForChild("ChildrenFrame")

        lockTextSafe(_G.userFrame:WaitForChild("NameFrame"):WaitForChild("BGFrame"):WaitForChild("OverlayFrame"):WaitForChild("PlayerName"):WaitForChild("PlayerName"), "⭐ You Found Me!")
        lockTextSafe(_G.userFrame:WaitForChild("GameStat_C$"):WaitForChild("OverlayFrame"):WaitForChild("StatText"), "★★★★★")
        lockTextSafe(_G.userFrame:WaitForChild("GameStat_Level"):WaitForChild("OverlayFrame"):WaitForChild("StatText"), "∞")
    end
end

    function animateRainbow()
        _G.multi = 0.7
        _G.val = 0
        
        game:GetService("RunService").RenderStepped:Connect(function(r)
            _G.val += r*_G.multi
            
            if _G.val > 0.5 then
                _G.multi = _G.multi*-1
            elseif _G.val < -0.5 then
                _G.multi = _G.multi*-1
            end

            _G.Rainbow.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow2.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow3.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow4.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow5.Offset = Vector2.new(_G.val, 0)
            _G.Rainbow6.Offset = Vector2.new(_G.val, 0)
        end)
    end

    task.spawn(animateRainbow)
end


var.Cow = nil
var.Cow = LocalPlayer.CharacterAdded:Connect(setupCharacter)
if LocalPlayer.Character then
    setupCharacter(LocalPlayer.Character)
end

var.Cow2 = nil
var.Cow2 = game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView
    .RCTScrollView.RCTScrollContentView.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") then
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
        end
    end)
var.Cow3 = nil
var.Cow3 = LocalPlayer.PlayerGui.hud.safezone.topannouncements.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") then
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
            descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
        end
    end)
for _, descendant in pairs(game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.scrollingView.bottomLockedScrollView.RCTScrollView.RCTScrollContentView:GetDescendants()) do
    if descendant:IsA("TextLabel") then
        descendant.Text = string.gsub(descendant.Text, LocalPlayer.Name, "[Hidden]")
        descendant.Text = string.gsub(descendant.Text, LocalPlayer.DisplayName, "[Hidden]")
    end
end
    repeat task.wait()
        if var.ToggledTest == false then
    var.Cow3:Disconnect()
    var.Cow3 = nil
    var.Cow2:Disconnect()
    var.Cow2 = nil
    var.Cow:Disconnect()
    var.Cow = nil
    var.MoneyLog:Disconnect()
    var.MoneyLog = nil

    for _, connection in ipairs(var.lockConnections) do
    connection:Disconnect() 
    end
    var.lockConnections = {}
    print("Disabled Testing")
    end
    until var.ToggledTest == false
    else
    if var.ToggledTest == true then
        var.ToggledTest = false
        lib:Notification("Hide LocalPlayer Identity", "All actions stopped. To fully disable, die using the 'Die' button in Misc > Character.", 10)
    end
        end
    end,
})

sections.Visuals2:AddToggle("HideAllIdentities", {
    Title = "Hide All Player Identities",
    Default = false,
    Description = "Extra Protection if you want to protect your self",
    Callback = function(isEnabled)
        var.HideAllIdentitiesEnabled = isEnabled

        local function safeCall(func)
            local success, result = pcall(func)
            if not success then
                warn("Error occurred: ", result)
            end
        end

        local function hideIdentityForCharacter(character)
            for _, descendant in ipairs(character:GetDescendants()) do
                safeCall(function()
                    -- Check for and modify or remove name tags and other elements related to user information
                    if descendant:IsA("BillboardGui") then
                        local user = descendant:FindFirstChild("user")
                        if user then
                            -- Hide user-related information
                            if user:FindFirstChild("user") then
                                user.user.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("level") then
                                user.level.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("streak") then
                                user.streak.Text = "[Hidden]"
                            end
                            if user:FindFirstChild("title") then
                                user.title.Text = "[Hidden]"
                            end
                        end
                    end

                    if character:FindFirstChild("Shirt") then character.Shirt:Destroy() end
                    if character:FindFirstChild("Pants") then character.Pants:Destroy() end

                    if descendant:IsA("Accessory") or descendant:IsA("CharacterMesh") or (descendant:IsA("Decal") and descendant.Name == "face") then
                        descendant:Destroy()
                    end

                    -- Remove tags or other UI elements
                    if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                        if descendant.Text then
                            descendant.Text = "[Hidden]"
                        end
                    end
                    
                    -- Remove character meshes, accessories, and face decals
                    if descendant:IsA("CharacterMesh") or descendant:IsA("Accessory") or descendant:IsA("SpecialMesh") or (descendant:IsA("Decal") and descendant.Name == "face") then
                        descendant:Destroy()
                    elseif descendant:IsA("BasePart") then
                        descendant.Material = Enum.Material.Rubber
                    end
                end)
            end
        end

        function lockText(property, target, value)
            target[property] = value
            local connection = target:GetPropertyChangedSignal(property):Connect(function()
                if target[property] ~= value then
                    target[property] = value
                end
            end)
            table.insert(var.lockConnections2, connection)
        end

        function lockTextSafe(path, text)
            local success, err = pcall(function()
                lockText("Text", path, text)
            end)
            if not success then
                warn("Failed to set lockText: " .. err)
            end
        end

        local function hideAllPlayers()
            local players = Players
            local roactProvider = game:GetService("CoreGui"):FindFirstChild("RoactAppExperimentProvider")
            if not roactProvider then
                warn("Please wait till your game is fully loaded")
                return
            end

            _G.offsetFrame = roactProvider.Children:FindFirstChild("OffsetFrame")
            if _G.offsetFrame then
                local undoFrame = game:GetService("CoreGui").RoactAppExperimentProvider.Children.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame

                if undoFrame then
                    for _, player in ipairs(players:GetPlayers()) do
                        local playerFrame = undoFrame:FindFirstChild("p_"..player.UserId)
                        if playerFrame then
                            local userFrame = playerFrame:WaitForChild("ChildrenFrame")
                            local playerNameLabel = userFrame:WaitForChild("NameFrame"):WaitForChild("BGFrame"):WaitForChild("OverlayFrame"):WaitForChild("PlayerName"):WaitForChild("PlayerName")
                            lockTextSafe(playerNameLabel, "[Hidden]")
                            
                            local gameStatCLabel = userFrame:WaitForChild("GameStat_C$"):WaitForChild("OverlayFrame"):WaitForChild("StatText")
                            lockTextSafe(gameStatCLabel, "★★★★★")

                            local gameStatLevelLabel = userFrame:WaitForChild("GameStat_Level"):WaitForChild("OverlayFrame"):WaitForChild("StatText")
                            lockTextSafe(gameStatLevelLabel, "∞")
                        end
                    end
                end
            end
        end

        local function hideChatMessages()
            safeCall(function()
                local chat = game:GetService("CoreGui"):FindFirstChild("ExperienceChat")
                if chat then
                    local players = Players
                    local playerNames = {}

                    -- Collect all player names and display names
                    for _, player in ipairs(players:GetPlayers()) do
                        table.insert(playerNames, player.Name)
                        table.insert(playerNames, player.DisplayName)
                    end

                    -- Iterate through all descendants of the chat
                    for _, descendant in ipairs(chat:GetDescendants()) do
                        if descendant:IsA("TextLabel") and descendant.Text then
                            -- Replace each player's name and display name with "[Hidden]"
                            for _, name in ipairs(playerNames) do
                                descendant.Text = descendant.Text:gsub(name, "[Hidden]")
                            end
                        end
                    end
                end
            end)
        end

        local function hideAllIdentities()
            local players = Players
            
            while var.HideAllIdentitiesEnabled do
                -- Hide identities in the workspace
                for _, player in ipairs(players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("Humanoid") then
                        hideIdentityForCharacter(player.Character)
                    end
                end
                hideAllPlayers()
                hideChatMessages()

                task.wait() -- Adding a small wait to reduce strain
            end
        end

        if isEnabled then
            task.spawn(hideAllIdentities)
        elseif var.HideAllIdentitiesEnabled == false then
            for _, connection in ipairs(var.lockConnections2) do
                connection:Disconnect() 
            end
            var.lockConnections2 = {}
            -- lib:Notification("Hide All Player Identities", "Stopped hiding all player identities.", 5)
        end
    end
})



-- var.ColorBox = Color3.fromRGB(255, 255, 255)
-- sections.Visuals3:AddColorpicker("ESPColor", {
--     Title = "ESP Color",
--     Default = Color3.fromRGB(255, 255, 255),
--     Callback = function(selectedColor)
--     var.ColorBox = selectedColor
--     end,
-- })
-- local selectedESPEventFish = {}
-- sections.Visuals3:AddDropdown("EventESP", {
--     Title = "Event Visual",
--     Description = "",
--     Options = {"The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Chinook Salmon Abundance", "Arapaima Abundance", "Mackerel Abundance"},
--     Default = {"The Depths - Serpent", "Megalodon", "Great Hammerhead Shark", "Great White Shark", "Whale Shark", "Isonade", "Chinook Salmon Abundance", "Arapaima Abundance", "Mackerel Abundance"},
--     PlaceHolder = "Select a Certain Event",
--     Multiple = true,
--     Callback = function(selectedEvents)
--         selectedESPEventFish = selectedEvents
--     end,
-- })
-- local allESPEvent = {}
-- local toggedESPEVENT = false

-- sections.Visuals3:AddToggle("ToggleEVENTESP", {
--     Title = "ESP Event",
--     Default = true,
--     Description = "Gives a Cool ESP Event",
--     Callback = function(isEnabled)
--         toggedESPEVENT = isEnabled

--         if toggedESPEVENT then
--             while toggedESPEVENT do
--                 for _, child in pairs(workspace.zones.fishing:GetChildren()) do
--                     if child:FindFirstChild("beacon") then
--                         local poiHeader = child:FindFirstChild("POIHeader")
--                         if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
--                             print("Event title:", poiHeader.title.Text)
                            
--                             -- Check if the event title matches any from `allESPEvent`
--                             for _, event in pairs(allESPEvent) do
--                                 if poiHeader.title.Text:find(event) then
--                                     local object = Sense.AddInstance(child, {
--                                         text = "{name} | {distance} | {position}", -- Placeholders
--                                         textColor = { Color3.new(1, 1, 1), 1 },
--                                         textOutline = true,
--                                         textOutlineColor = Color3.new(),
--                                         textSize = 13,
--                                         textFont = 2,
--                                         limitDistance = false,
--                                         maxDistance = 150
--                                     })
--                                     object.options.enabled = true
--                                     table.insert(allESPEvent, object) -- Add the ESP instance to the table
--                                 end
--                             end
--                         end
--                     end
--                 end
--                 wait(0.1) -- Prevent script from freezing
--             end
--         else
--             -- Disable all toggles in the table
--             for _, object in pairs(allESPEvent) do
--                 if object.options then
--                     object.options.enabled = false
--                 end
--             end
--             allESPEvent = {} -- Clear the table
--         end
--     end,
-- })

sections.Visuals4:AddParagraph({Title = "Information", Description = "This feature is new and was rushed, it doesn't work with some rods and looks very scuffed. It will be improved later on."})


-- who cooked fisch bro 😭
local function FetchDetailsModel(thing)
    local details;

    --// Mesh & Aura Detection Method \\--
    for _, kys_fisch in thing:GetDescendants() do
        local rawName = kys_fisch.Name:lower()
        if rawName:match("meshes/") then
            details = kys_fisch:FindFirstAncestorOfClass("Model")
            break
        elseif rawName:match("aura") and kys_fisch:IsA("BasePart") and kys_fisch.Parent:IsA("Model") then
            details = kys_fisch.Parent
            break
        elseif rawName:match("detail") and kys_fisch:IsA("Model") then
            details = kys_fisch
            break
        end
    end

    if not details then
        warn("[ERROR] Failed to find details model for", thing:GetFullName())
        return
    end

    return details
end

local function FindSkinDetailBase(detailsModel)
    local base;
    for _, detail in detailsModel:GetChildren() do
        if detail.Name:match("_Plane.001") or detail.Name == "Rod" then
            base = detail
        end

        if base then break end
    end

    if not base then -- scary 😨
        base = detailsModel:FindFirstChildWhichIsA("BasePart", true)
    end

    return base
end

local OldDecorations = {}
local function ClearOldDecoration(model)
    if model:FindFirstChild("handle") then
        model.handle.Transparency = 1
    end

    local detailsModel = model:FindFirstChild("Details") or FetchDetailsModel(model)

    for _, detail in detailsModel:GetDescendants() do
        if detail:IsA("BasePart") or detail:IsA("Decal") or detail:IsA("MeshPart") then
            if not OldDecorations[detail] then OldDecorations[detail] = detail.Transparency end
            detail.Transparency = 1
        elseif detail:IsA("ParticleEmitter") then
            if not OldDecorations[detail] then OldDecorations[detail] = detail.Transparency end
            detail.Transparency = NumberSequence.new(1)
        elseif detail:IsA("Beam") or detail:IsA("Trail") then
            if not OldDecorations[detail] then OldDecorations[detail] = detail.Enabled end
            detail.Enabled = false
        end
    end
end

local function RevertOldDecoration(model)
    if model:FindFirstChild("handle") then
        model.handle.Transparency = 0
    end

    local detailsModel = model:FindFirstChild("Details") or FetchDetailsModel(model)

    for _, detail in detailsModel:GetDescendants() do
        if detail:IsA("BasePart") or detail:IsA("Decal") or detail:IsA("MeshPart") then
            detail.Transparency = OldDecorations[detail] or 0
        elseif detail:IsA("ParticleEmitter") then
            detail.Transparency = OldDecorations[detail] or NumberSequence.new(0)
        elseif detail:IsA("Beam") or detail:IsA("Trail") then
            detail.Enabled = OldDecorations[detail] or true
        end
    end
end

local ApplySkin = LPH_JIT_MAX(function(rodName, skinName)
    if skinName == "Default" then skinName = nil end

    if game.Players.LocalPlayer.Character:FindFirstChild("Skin") then
        game.Players.LocalPlayer.Character:FindFirstChild("Skin"):Destroy()
    end

    local rod = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    local isEquipped = true
    if not rod or not rod:FindFirstChild("rod/server") then
        isEquipped = false
        
        for _, item in game.Players.LocalPlayer.Backpack:GetChildren() do
            if not item:FindFirstChild("rod/server") then continue end
            
            rod = item
            break
        end
    end


    local rodSkinWrapperModel; do
        if rodName and skinName then
            rodSkinWrapperModel = game:GetService("ReplicatedStorage").resources.models.RodSkins:FindFirstChild(rodName)
            if not rodSkinWrapperModel then
                warn("Rod not found:", rodName)
                return
            end
        end
    end

    -- Cleanup
    for _, child in rod:GetChildren() do
        if not child:GetAttribute("Skin") then continue end
        
        child:Destroy()
    end

    -- Skin Loading
    if not skinName and not rodName then
        RevertOldDecoration(rod)
        return
    end

    local isRegularRodSelected = not skinName 
    local skinModel = skinName and rodSkinWrapperModel:FindFirstChild(skinName) or game:GetService("ReplicatedStorage").resources.items.rods:FindFirstChild(rodName)
    
    if not skinModel then
        return
    end
    
    -- Variables
    local weldToArm = rod.handle:FindFirstChild("WeldToArm")
    local C0 = weldToArm and weldToArm.C0 or CFrame.new()
    local C1 = weldToArm and weldToArm.C1 or CFrame.new()
    local CurrentAngle = weldToArm and weldToArm.CurrentAngle or 0

    -- Initialize Skin Details
    local skinClone = (isRegularRodSelected and skinModel[rodName] or skinModel.Skin):Clone()
    skinClone.Name = "Skin"
    skinClone:SetAttribute("Skin", true)
    skinClone.Parent = game.Players.LocalPlayer.Character
    skinClone:SetPrimaryPartCFrame(game.Players.LocalPlayer.Character["Right Arm"].CFrame)
    
    -- please kys fisch who cooked this 😡😡
    local skinDetails = FetchDetailsModel(skinClone)
    skinDetails:SetAttribute("Skin", true)
    skinDetails.Parent = game.Players.LocalPlayer.Character
    
    local skinHandle = skinClone.handle
    skinHandle.Parent = isEquipped and skinClone or rod
    skinHandle:SetAttribute("Skin", true)

    if not skinHandle:FindFirstChild("Motor6D") then
        local newMotor = Instance.new("Motor6D")
        newMotor.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
        newMotor.Part1 = skinHandle
        newMotor.C0 = C0
        newMotor.C1 = C1
        newMotor.CurrentAngle = CurrentAngle
        newMotor.Parent = skinHandle
    end

    -- Hide old details
    ClearOldDecoration(rod)

    for _, detail in skinDetails:GetChildren() do
        if detail:IsA("BasePart") then
            detail.Anchored = false
            detail.CanCollide = false
        end
    end

    -- Weld new skin detail to thingy
    -- We need to get the plane thing first tho so
    local planeMeshSkin, planeMesh = FindSkinDetailBase(skinDetails), FindSkinDetailBase(FetchDetailsModel(rod));
    
    -- Then weld it, we can use a ManualWeld to weld the thingy to the plane
    local rodWeld = Instance.new("Weld", planeMeshSkin) do
        rodWeld.Part0 = planeMeshSkin
        rodWeld.Part1 = isEquipped and planeMesh or FindSkinDetailBase(FetchDetailsModel(game.Players.LocalPlayer.Character:FindFirstChild("RodBodyModel")))
    end

    if not isEquipped then
        local rowBodyModel = game.Players.LocalPlayer.Character:WaitForChild("RodBodyModel")
        local rodBodyDetail = FetchDetailsModel(rowBodyModel)

        skinHandle.Parent = skinClone
        ClearOldDecoration(rowBodyModel)
        
        local planeMeshBody = FindSkinDetailBase(rodBodyDetail)
        rodWeld.Part0 = planeMeshSkin
        rodWeld.Part1 = planeMeshBody
    end

    -- Tool Connections
    local toolHandler, bobberHandler, bodyHandler;

    local isCleaningUp = false
    local function cleanup()
        if isCleaningUp then return end
        isCleaningUp = true

        toolHandler:Disconnect()
        bobberHandler:Disconnect()
        bodyHandler:Disconnect()

        -- Parent Property of skibidi is locked type shi
        pcall(function() skinDetails:Destroy() end)
        pcall(function() skinClone:Destroy() end)
    end

    toolHandler = rod.AncestryChanged:Connect(function(_, newParent)
        if not newParent then cleanup() return end

        if newParent == game.Players.LocalPlayer.Character then
            skinHandle.Parent = rod
            
            rodWeld.Part0 = planeMeshSkin
            rodWeld.Part1 = planeMesh
        end
    end)

    bobberHandler = rod.ChildAdded:Connect(function(child)
        if child.Name ~= "bobber" then return end
        
        local fishingLine = child:WaitForChild("bob"):WaitForChild("Beam")
        
        fishingLine.Attachment1 = skinHandle.tip
        fishingLine:GetPropertyChangedSignal("Attachment1"):Connect(function()
            fishingLine.Attachment1 = skinHandle.tip
        end)
    end)

    bodyHandler = game.Players.LocalPlayer.Character.ChildAdded:Connect(function(child)
        if child.Name ~= "RodBodyModel" then return end

        local rodBodyDetail = FetchDetailsModel(child)

        skinHandle.Parent = skinClone
        ClearOldDecoration(child)
        
        local planeMeshBody = FindSkinDetailBase(rodBodyDetail)
        rodWeld.Part0 = planeMeshSkin
        rodWeld.Part1 = planeMeshBody
    end)

    skinDetails.Destroying:Once(function() cleanup() end)
    skinClone.Destroying:Once(function() cleanup() end)
end)

local selectedRodName, selectedSkinName = "No-Life Rod", "Hellbringer"
local RodSkins = game:GetService("ReplicatedStorage").resources.models.RodSkins
local rodSkinList = {}

for _, rod in ipairs(RodSkins:GetChildren()) do
    for _, child in ipairs(rod:GetChildren()) do
        table.insert(rodSkinList, rod.Name .. " - " .. child.Name)
    end
end

for _, NormalRod in next, game:GetService("ReplicatedStorage"):WaitForChild("resources"):WaitForChild("items"):WaitForChild("rods"):GetChildren() do
    table.insert(rodSkinList, NormalRod.Name .. " - Default")
end

sections.Visuals4:AddDropdown("RodSkin", {
    Title = "Rod Skins",
    Description = "",
    Options = rodSkinList,
    Default = "",
    PlaceHolder = "Select Skin",
    Multiple = false,
    Callback = function(selectedSkin)
        selectedRodName = nil
        selectedSkinName = nil

        local splitData = selectedSkin:split(" - ")
        if #splitData < 2 then
            print("Invalid selection format")
            return
        end

        selectedRodName = splitData[1]
        selectedSkinName = splitData[2] ~= "Normal" and splitData[2] or nil

        print("Selected Rod:", selectedRodName, "Skin:", selectedSkinName or "Normal")
    end,
})

local skinGroupButton = sections.Visuals4:AddGroupButton()

skinGroupButton:AddButton({
    Title = "Apply Skin",
    Variant = "Primary",
    Callback = function()
        if selectedRodName then
            ApplySkin(selectedRodName, selectedSkinName)
        else
            warn("No skin selected!")
        end
    end,
})

skinGroupButton:AddButton({
    Title = "Remove Skin",
    Variant = "Primary",
    Callback = function()
        local equippedRod = getEquippedRod()
        if equippedRod then
            ApplySkin(equippedRod)
        else
            warn("No rod equipped!")
        end
    end
})

--[[3itx Code]]--
var.selectedBoatLocation = nil
var.SelectedBoatSpawn = nil

local BoatsDataSheet = {
    ["Moosewood"] = {
        ["Coords"] = {357.9726, 133.616, 258.1545},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Moosewood Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Moosewood Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Sunstone"] = {
        ["Coords"] = {-945.2999, 131.0788, -1116.2346},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Sunstone Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Sunstone Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Statue"] = {
        ["Coords"] = {23.2196, 135.0304, -1007.0291},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Statue Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Statue Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Snowcap"] = {
        ["Coords"] = {2622.9399, 136.2839, 2401.3052},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Snowcap Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Snowcap Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Ancient"] = {
        ["Coords"] = {5869.421875, 143.49795532226562, 7.101318359375},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Ancient Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Ancient Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Terrapin"] = {
        ["Coords"] = {-186.7543, 132.5000, 1922.5327},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Terrapin Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Terrapin Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["North"] = {
        ["Coords"] = {19609.19140625, 131.42013549804688, 5186.5927734375},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Summit Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Summit Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Roslit"] = {
        ["Coords"] = {-1452.0543, 133.0000, 745.1692},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Roslit Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Roslit Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
    ["Mushgrove"] = {
        ["Coords"] = {2453.9727, 130.5296, -661.6033},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Mushgrove Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Mushgrove Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    },
        ["Forsaken"] = {
        ["Coords"] = {-2476.388427734375, 130.1121368408203, 1540.5460205078125},
        ["Loaded"] = false,
        ["Path"] = 'workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Forsaken Shipwright")',
        ["remote"] = function()
            return workspace:WaitForChild("world")
                :WaitForChild("npcs")
                :WaitForChild("Forsaken Shipwright")
                :WaitForChild("shipwright")
                :WaitForChild("giveUI")
                :InvokeServer()
        end
    }
}

var.BoatLocations = {}
var.Boats = {}

for _, v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("playerstats"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("Boats"):GetChildren()) do
    table.insert(var.Boats, v.Name)
end
for Sex, _ in pairs(BoatsDataSheet) do
    table.insert(var.BoatLocations, Sex)
end

sections.Misc4:AddDropdown("",{
    Title = "Spawn Location",
    Description = "",
    Options = var.BoatLocations,
    Default = "",
    PlaceHolder = "Select a Spawn Location",
    Multiple = false,
    Callback = function(BoatLocation)
    var.selectedBoatLocation = BoatLocation
    end,
})

function boatPrompt()
    workspace.active.boats[LocalPlayer.Name]:GetChildren()[1].owner.sitprompt.Parent = LocalPlayer.Character
    local char = LocalPlayer.Character
    for _, obj in ipairs(char:GetChildren()) do
        if obj:IsA("ProximityPrompt") then
            obj.HoldDuration = 0
            obj.MaxActivationDistance = math.huge
            obj:InputHoldBegin()
            task.wait(0.01)
            obj:InputHoldEnd()
            print("shoulda gotten it..")
            obj.Parent = workspace.active.boats:FindFirstChild(game:GetService("Players").LocalPlayer.Name):GetChildren()[1].owner
        end
    end
end


local BoatsDropdown
BoatsDropdown = sections.Misc4:AddDropdown("",{
    Title = "Select Boat",
    Description = "",
    Options = var.Boats,
    Default = "",
    PlaceHolder = "Select a Boat",
    Multiple = false,
    Callback = function(Boat)
    var.SelectedBoatSpawn = Boat
    end,
})

var.PlayerDropDown2 = sections.Misc4:AddDropdown("", {
    Title = "Players",
    Description = "",
    Options = persistentPlayers,
    Default = "",
    PlaceHolder = "Select Player",
    Multiple = false,
    Callback = function(selectedPlayer)
        var.selectedPlayer2 = selectedPlayer
    end,
})

local BoatOptions = sections.Misc4:AddGroupButton()
BoatOptions:AddButton({
    Title = "Refresh Boat List",
    Variant = "Primary",
    Callback = function()
    table.clear(var.Boats)
    for _, v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("playerstats"):WaitForChild(game:GetService("Players").LocalPlayer.Name):WaitForChild("Boats"):GetChildren()) do
    table.insert(var.Boats, v.Name)
    end
    BoatsDropdown:Refresh(var.Boats,true)
    BoatsDropdown:Set(var.SelectedBoatSpawn)
    end,
})

BoatOptions:AddButton({
    Title = "Spawn Boat",
    Variant = "Primary",
    Callback = function()
        local selectedBoatName = var.SelectedBoatSpawn
        local selectedBoatLocation = var.selectedBoatLocation
        
        if selectedBoatName and selectedBoatLocation then
            local boatData = BoatsDataSheet[selectedBoatLocation]
            
            if boatData then
                if boatData.Loaded then
                    boatData.remote()
                    task.wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    -- wait(1)
                    -- pcall(function()
                    --     boatPrompt()
                    -- end)
                else
                    local coords = boatData.Coords
                    local player = game.Players.LocalPlayer
                    local position = Vector3.new(unpack(coords))
                    player:RequestStreamAroundAsync(position)
                    local path = loadstring("return " .. boatData.Path)()
                    path.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                    prompt(path)
                    task.wait()
                    boatData.remote()
                    task.wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    boatData.Loaded = true
                    -- wait(1)
                    -- pcall(function()
                    --     boatPrompt()
                    -- end)
                end
            else
                lib:Notification("Boat Error", "Invalid boat selected.", 3)
            end
        else
            lib:Notification("Boat Error", "Please select a boat and location to work.", 3)
        end
    end,
})



BoatOptions:AddButton({
    Title = "Despawn Boat",
    Variant = "Primary",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local activeBoat = workspace.active.boats:FindFirstChild(player.Name)

        if activeBoat then
            game:GetService("ReplicatedStorage").packages.Net["RE/Boats/Despawn"]:FireServer()
        else
            lib:Notification("Boat Error", "No Active Boat Found!", 3)
        end
    end,
})

BoatOptions:AddButton({
    Title = "Spawn Boat Near you",
    Variant = "Primary",
    Callback = function()
        local selectedBoatName = var.SelectedBoatSpawn
        local selectedBoatLocation = "Moosewood"

        if selectedBoatName and selectedBoatLocation then
            local boatData = BoatsDataSheet[selectedBoatLocation]

            if boatData then
                if boatData.Loaded then
                    boatData.remote()
                    task.wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    -- wait(1)
                    -- pcall(function()
                    --     boatPrompt()
                    -- end)
                else
                    local coords = boatData.Coords
                    local player = game.Players.LocalPlayer
                    local position = Vector3.new(unpack(coords))
                    player:RequestStreamAroundAsync(position)
                    local path = loadstring("return " .. boatData.Path)()
                    path.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
                    prompt(path)
                    task.wait()
                    boatData.remote()
                    task.wait()
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.backpack.Visible = true
                    game:GetService("Players").LocalPlayer.PlayerGui.hud.safezone.shipwright.Visible = false
                    game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RF/Boats/Spawn"):InvokeServer(selectedBoatName)
                    boatData.Loaded = true
                    -- wait(1)
                    -- pcall(function()
                    --     boatPrompt()
                    -- end)
                end
                local playerBoat = game:GetService("Workspace"):WaitForChild("active"):WaitForChild("boats"):WaitForChild(game:GetService("Players").LocalPlayer.Name):FindFirstChildOfClass("Model")
                if playerBoat and playerBoat:FindFirstChild("Base") then
                    local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    local direction = Vector3.new(0, -1, 0) -- Downward ray to find ground
                    local distance = 20 -- Raycast distance
                    local ignoreList = {playerBoat, game.Players.LocalPlayer.Character} -- Ignore the boat and player
                    local rayOrigin = playerPosition + Vector3.new(0, 5, -10) -- Adjust initial position to be above and behind the player

                    -- Find the nearest safe position
                    local hit, hitPosition = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(rayOrigin, direction * distance), ignoreList)

                    if hit then
                        -- Adjust position slightly above the ground to avoid embedding
                        local safePosition = hitPosition + Vector3.new(0, playerBoat.Base.Size.Y / 2, 0)
                        playerBoat.Base.CFrame = CFrame.new(safePosition)
                    else
                        lib:Notification("Boat Error", "Could not find a safe place to spawn the boat.", 3)
                    end
                end
            else
                lib:Notification("Boat Error", "Invalid boat selected.", 3)
            end
        else
            lib:Notification("Boat Error", "Please select a boat and location to work.", 3)
        end
    end,
})

BoatOptions:AddButton({
    Title = "Fling Selected Player",
    Variant = "Primary",
    Callback = function()
        if not var.selectedPlayer2 then
            lib:Notification("Fling Error", "Please Select an Player to Fling!", 3)
            return
        end
 
        local targetPlayerCharacter = game:GetService("Players"):FindFirstChild(var.selectedPlayer2).Character
        if not targetPlayerCharacter or not targetPlayerCharacter.PrimaryPart then
            lib:Notification("Fling Error", "Unable to Find Player Model Please GO Near them to Load it", 3)
            return
        end
 
        local localPlayerBoatFolder = game:GetService("Workspace"):WaitForChild("active"):WaitForChild("boats"):FindFirstChild(game:GetService("Players").LocalPlayer.Name)
        if not localPlayerBoatFolder or #localPlayerBoatFolder:GetChildren() == 0 then
            lib:Notification("Fling Error", "You Don't Have Any Boat Spawned", 3)
            return
        end
 
 
 
        local localPlayerBoat = localPlayerBoatFolder:GetChildren()[math.random(1, #localPlayerBoatFolder:GetChildren())]
        local initialPosition = Vector3.new(targetPlayerCharacter.PrimaryPart.Position.X, localPlayerBoat:GetPivot().Position.Y, targetPlayerCharacter.PrimaryPart.Position.Z)
        localPlayerBoat:PivotTo(CFrame.new(initialPosition))
        localPlayerBoat:FindFirstChild("PlaneConstraint", true).Enabled = false
        localPlayerBoat.ModelStreamingMode = "Persistent"
        lib:Notification("Fling", "Attempting to fling " .. targetPlayerCharacter.Name, 3)
 
        local forces, rotationForces = {}, {}
        for _, part in pairs(localPlayerBoat:GetDescendants()) do
            if not part:IsA("BasePart") then continue end
            
            part.Massless = true
            part.CanCollide = false
 
            local bodyPosition = Instance.new("BodyPosition", part)
            bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyPosition.Position = initialPosition
            table.insert(forces, bodyPosition)
 
            local angularVelocity = Instance.new("BodyAngularVelocity", part)
            angularVelocity.AngularVelocity = Vector3.new(0, 9e9, 0)
            angularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
            table.insert(rotationForces, angularVelocity)
        end
 
        local Flinged = false
        task.spawn(function()
            repeat task.wait()
                if not localPlayerBoat:IsDescendantOf(workspace) or not targetPlayerCharacter:IsDescendantOf(workspace) then break end
                for _, force in pairs(rotationForces) do
                    force.AngularVelocity = Vector3.new(0, 9e9, 0)
                    task.wait(0.1)
                end
            until Flinged
        end)
 
        repeat task.wait()
            if not localPlayerBoat:IsDescendantOf(workspace) or not targetPlayerCharacter:IsDescendantOf(workspace) then break end
            
            if targetPlayerCharacter.PrimaryPart.Velocity.Magnitude > 4500 then
                Flinged = true
                break
            end
 
            for _, force in pairs(forces) do
                force.Position = targetPlayerCharacter.PrimaryPart.Position
                task.wait()
            end
        until Flinged
 
        for _, category in pairs({ forces, rotationForces }) do
            for _, force in pairs(category) do
                force:Destroy()
            end
        end
        
        if Flinged then
            lib:Notification("Fling", "Successfully flinged " .. targetPlayerCharacter.Name, 3)
            game:GetService("ReplicatedStorage").packages.Net["RE/Boats/Despawn"]:FireServer()
        end
    end,
 })


-- BoatOptions:AddButton({
--     Title = "⚠ Purchase All Boats ⚠",
--     Variant = "Outline",
--     Callback = function()
--         pcall(function()
--             for name, _ in pairs(data.Boats) do
--                 game:GetService('ReplicatedStorage').events.purchase:FireServer(name, "Boat", nil, 1)
--             end
--         end)
--     end,
-- })
local AntiBoatFling = nil

sections.Misc4:AddToggle("AntiBoatFling", {
    Title = "Anti Boat Fling",
    Default = false,
    Description = "Prevents getting flung by the boats",
    Callback = LPH_JIT_MAX(function(isEnabled)
        if isEnabled then
            for _, v in next, workspace.active.boats:GetDescendants() do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
            
            AntiBoatFling = workspace.active.boats.DescendantAdded:Connect(function(part)
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end)
        else
            for _, v in next, workspace.active.boats:GetDescendants() do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                end
            end
            if AntiBoatFling then
                AntiBoatFling:Disconnect()
                AntiBoatFling = nil
            end
        end
    end)
})

sections.Misc4:AddSlider("BoatHeight", {
    Title = "Boat Height",
    Description = "Boat Height doesn't apply to newly spawned boats; change it again when a new boat is spawned.",
    Default = 129,
    Min = 0,
    Max = 5000,
    Increment = 1,
    Callback = function(value)
        local player = LocalPlayer
        local boatPath = game:GetService("Workspace"):FindFirstChild("active")
        
        if boatPath then
            local boats = boatPath:FindFirstChild("boats")
            if boats then
                local playerBoat = boats:FindFirstChild(player.Name)
                
                if playerBoat and playerBoat:IsA("Model") then
                    local BoatPart = playerBoat:FindFirstChildOfClass("Model")
                    if BoatPart then
                    local planePart = BoatPart:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        local plane = planePart:FindFirstChild("Plane0")
                        
                        if planeConstraint and plane then
                            planeConstraint.Enabled = true
                            plane.WorldCFrame = CFrame.new(plane.WorldCFrame.Position.X, value, plane.WorldCFrame.Position.Z) * plane.WorldCFrame.Rotation
                        end
                    end
                    end
                else
                end
            end
        end
    end,
})


sections.Misc4:AddTextbox({
    Title = "Custom Coords Boat TP",
    Default = "",
    Description = "",
    PlaceHolder = "Enter Coords | Example: 1234,128,1239",
    TextDisappear = true,
    Callback = function(Vector)
        local function stringToVector3(inputString)
            inputString = inputString:gsub("%s+", "")
            local xStr, yStr, zStr = inputString:match("([^,]+),([^,]+),([^,]+)")
            local x = tonumber(xStr)
            local y = tonumber(yStr)
            local z = tonumber(zStr)
            if x and y and z then
                return Vector3.new(x, y, z)
            else
                error("Invalid input: Please enter values in the format 'X, Y, Z'")
            end
        end

        local playerBoat = game:GetService('Workspace'):WaitForChild("active"):WaitForChild("boats"):WaitForChild(game:GetService("Players").LocalPlayer.Name):FindFirstChildOfClass("Model")
        if playerBoat then
            local owner = playerBoat:FindFirstChild("owner")
            if owner then
                local sitPrompt = owner:FindFirstChild("sitprompt")
                if sitPrompt and sitPrompt.Enabled then
                    fireproximityprompt(sitPrompt)
                    task.wait()
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(stringToVector3(Vector))
                elseif sitPrompt and sitPrompt.Enabled == false then 
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(stringToVector3(Vector))
                end
            end
        end
    end
})

sections.Misc4:AddDropdown("", {
    Title = "Perfered Boat TP Spots",
    Description = "",
    Options = var.TpSpotsName,
    Default = "",
    PlaceHolder = "Select Spot",
    Multiple = false,
    Callback = function(selectedArea)
        _G.TPSpots = workspace.world.spawns.TpSpots:FindFirstChild(selectedArea)
        
        if _G.TPSpots then
            local playerBoat = game:GetService('Workspace'):WaitForChild("active"):WaitForChild("boats"):WaitForChild(game:GetService("Players").LocalPlayer.Name):FindFirstChildOfClass("Model")
        if playerBoat then
            local owner = playerBoat:FindFirstChild("owner")
            if owner then
                local sitPrompt = owner:FindFirstChild("sitprompt")
                if sitPrompt and sitPrompt.Enabled then
                    -- wait(1)
                    -- pcall(function()
                    --     boatPrompt()
                    -- end)
                    task.wait()
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(_G.TPSpots.Position.X,_G.TPSpots.Position.Y,_G.TPSpots.Position.Z)
                elseif sitPrompt and sitPrompt.Enabled == false then 
                    local planePart = playerBoat:FindFirstChild("PlanePart")
                    if planePart then
                        local planeConstraint = planePart:FindFirstChild("PlaneConstraint")
                        if planeConstraint then
                            planeConstraint.Enabled = false
                        end
                    end
                    playerBoat.Base.CFrame = CFrame.new(_G.TPSpots.Position.X,_G.TPSpots.Position.Y,_G.TPSpots.Position.Z)
                end
            end
        end
        end
    end
})

local BoatSettings = {
    ["Max Speed"] = 0,
    ["Turning Speed"] = 0,
    ["Acceleration"] = 0,
}


if require and identifyexecutor() ~= "Xeno" then
    sections.Misc4:AddSlider("BoatMaxSpeed", {
        Title = "Boat Max Speed",
        Description = "Change Boat Speed",
        Default = 1,
        Min = 0,
        Max = 1000,
        Increment = 1,
        Callback = function(value)
            BoatSettings["Max Speed"] = value
        end,
    })
    var.UseMaxSpeed = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Max Speed', 
        Description = "Use Custom Max Speed",
        Default = false,
        Callback = function(Value)
            var.UseMaxSpeed = Value
            local vesselsModule = require(game:GetService("ReplicatedStorage").modules.vessels)
            if var.UseMaxSpeed then
                for boat, Properties in next, vesselsModule.library do
                    Properties.MaxSpeed = BoatSettings["Max Speed"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.MaxSpeed = tonumber(data.Boats[boat].MaxSpeed)
                    end
                end
            end
        end,
    })

    sections.Misc4:AddSlider("TurningSpeed", {
    Title = "Boat Turning Speed",
    Description = "Change Turning Speed",
    Default = 1,
    Min = 0,
    Max = 100,
    Increment = 1,
    Callback = function(value)
        BoatSettings["Turning Speed"] = value
    end,
    })

    var.UseTurningSpeed = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Turning Speed', 
        Description = "Use Custom Turning Speed",
        Default = false,
        Callback = function(Value)
            var.UseTurningSpeed = Value
            local vesselsModule = require(game:GetService("ReplicatedStorage").modules.vessels)
            if var.UseTurningSpeed then
                for boat, Properties in next, vesselsModule.library do
                    Properties.TurningSpeed  = BoatSettings["Turning Speed"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.TurningSpeed  = tonumber(data.Boats[boat].TurningSpeed)
                    end
                end
            end
        end,
    })

    sections.Misc4:AddSlider("BoatAcceleration ", {
    Title = "Boat Acceleration",
    Description = "Change Actual Boat Speed",
    Default = 1,
    Min = 0,
    Max = 500,
    Increment = 1,
    Callback = function(value)
        BoatSettings["Acceleration"] = value
    end,
    })

    var.UseAcceleration = false
    sections.Misc4:AddToggle('', {
        Title = 'Use Acceleration', 
        Description = "Use Custom Acceleration",
        Default = false,
        Callback = function(Value)
            var.UseAcceleration = Value
            local vesselsModule = require(game:GetService("ReplicatedStorage").modules.vessels)
            if var.UseAcceleration then
                for boat, Properties in next, vesselsModule.library do
                    Properties.Accel  = BoatSettings["Acceleration"]
                end
            else
                for boat, Properties in next, vesselsModule.library do
                    if data.Boats[boat] then
                        Properties.Accel  = tonumber(data.Boats[boat].Acceleration)
                    end
                end
            end
        end,
    })
end


-- sections.Misc5:AddParagraph({Title = gradient("Server Joiner"),
-- Description = "<font color='rgb(255,0,0)'>WARNING: USE AT YOUR OWN RISK!!!</font>\n- An issue occured: Find older server\n- Nothing happens: Find older server\n\n"})

function decodeJobId(str)
    local prefixes = { "BONKHUB", "ACM:" }

    for _, prefix in ipairs(prefixes) do
        if string.find(str, prefix, 1, true) == 1 then
            local base64Part = string.sub(str, #prefix + 1)
            return crypt.base64decode(base64Part)
        end
    end

    return str
end


sections.Misc5:AddTextbox({
    Title = "Server Code",
    Default = "",
    Description = "",
    PlaceHolder = "this-is-an-example-code",
    TextDisappear = true,
    Callback = function(Value)
        serverToHop = decodeJobId(Value)
        -- serverToHop = tostring(Value)
    end
})

local serverGoTo = sections.Misc5:AddGroupButton()
serverGoTo:AddButton({
    Title = "Go to Server Code",
    Variant = "Primary",
    Callback = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, serverToHop)
    end,
})
serverGoTo:AddButton({
    Title = "Copy Server Code",
    Variant = "Outline",
    Callback = function()
        setclipboard(tostring(game.JobId))
        lib:Notification("Copy Code", "Successfully copied server code.", 5)
    end,
})

serverGoTo:AddButton({
    Title = "Rejoin Server",
    Variant = "Outline",
    Callback = function()
        if #game:GetService("Players"):GetPlayers() <= 1 then
            LocalPlayer:Kick("\nRejoining...")
            wait()
                
        else
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    end,
})

sections.Misc5:AddParagraph({Title = gradient("Server Hopper"),
Description = "Soon ;)"})

-- if game.Placeid == 111674521372264 then
-- sections.Misc6:AddParagraph({Title = "<font color=\"rgb(115, 252, 3)\">Cash Giver</font>",
-- Description = "<font color='rgb(255,0,0)'>WARNING: USE AT YOUR OWN RISK!!!</font>\n- An issue occured: Find older server\n- Nothing happens: Find older server\n-> <font color=\"rgb(255, 255, 0)\">Purchase all boats is just as dangerous and spawn money!</font> (Includes gamepass boats.)\n\n"})

--     local amountMoneyDuped = 69

--     sections.Misc6:AddTextbox({
--     Title = "Money Exploit >",
--     Default = "",
--     Description = "DETECTABLE!! USE AT YOUR OWN RISK!!!",
--     PlaceHolder = "Ex: 10000000",
--     TextDisappear = true,
--     Callback = function(Value)
--     amountMoneyDuped = tonumber(Value)
--     end
--     })
--     BoatExploitGroupButton = sections.Misc6:AddGroupButton()
--     BoatExploitGroupButton:AddButton({
--     Title = "Spawn Money",
--     Variant = "Outline",
--     Callback = function()
--     game:GetService('ReplicatedStorage').events.purchase:FireServer("Sleigh", "Boat", nil, amountMoneyDuped)
--     end,
--     })

--     BoatExploitGroupButton:AddButton({
--     Title = "⚠ Purchase All Boats ⚠",
--     Variant = "Outline",
--     Callback = function()
--         pcall(function()
--             for name, _ in pairs(data.Boats) do
--                 game:GetService('ReplicatedStorage').events.purchase:FireServer(name, "Boat", nil, 1)
--             end
--         end)
--     end,
-- })



-- local dupe = { Connections = {} }
-- sections.Misc6:AddToggle('Toggle', {
--     Title = 'Fish Dupe', 
--     Description = "The more you have, the quicker it'll be. The dupe is very unstable, experiment on your own, try different servers, fishes, etc.",
--     Default = false,
--     Callback = function(Value)
--         if Value then

--             local fish = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Tool')
--             if not fish:FindFirstChild('link') or not fish.link.Value or not fish.link.Value:IsDescendantOf(game) or not fish:FindFirstChild('fishscript') then
--                 lib:Notification("Fish Dupe","You are not holding a valid item.",1.5)
--                 return
--             end
--             local fishname = fish.Name

--             lib:Notification("Fish Dupe",'Targetting ' .. fishname .. '.',1.5)

--             if ReplicatedStorage.events:FindFirstChild('anno_thought') then
--                 ReplicatedStorage.events.anno_thought:Destroy()
--                 Instance.new("RemoteEvent", ReplicatedStorage.events).Name = "anno_thought"
--             end

--             dupe.Connections.DupeConnection2 = RunService.RenderStepped:Connect((function()

--                 task.spawn(function()
--                     pcall(function()
--                         workspace.world.npcs.Appraiser.appraiser.appraise:InvokeServer()
--                     end)
--                 end)

--                 --local fish = LocalPlayer.Backpack:FindFirstChild(fishname) or Character:FindFirstChild(fishname)
--                 local fish; do
--                     --fish = LocalPlayer.Backpack:FindFirstChild(fishname) or Character:FindFirstChild(fishname)

--                     if not fish then
--                         for i,v in LocalPlayer.Backpack:GetChildren() do
--                             if not v or v.Name ~= fishname or not v:FindFirstChild('link') or not v.link.Value or not v.link.Value:IsDescendantOf(game) or not v:FindFirstChild('fishscript') then
--                                 continue
--                             end

--                             fish = v
--                             break
--                         end
--                     end
--                 end

--                 if fish then
--                     print('Dupe', fish.Name)
--                     fish.Parent = game:GetService("Players").LocalPlayer.character
--                 else
--                     print('No fish found')
--                     game:GetService("Players").LocalPlayer.character.Humanoid:UnequipTools()
--                     for i,v in game:GetService("Players").LocalPlayer.character:GetChildren() do
--                         if v:IsA('Tool') then
--                             v.Parent = LocalPlayer.Backpack
--                         end
--                     end
--                 end

--             end))


--         else

--             if dupe.Connections.DupeConnection2 then
--                 dupe.Connections.DupeConnection2:Disconnect()
--                 dupe.Connections.DupeConnection2 = nil
--             end

--             if dupe.Connections.DupeConnection3 then
--                 dupe.Connections.DupeConnection3:Disconnect()
--                 dupe.Connections.DupeConnection3 = nil
--             end

--             for i,v in game:GetService("Players").LocalPlayer.character:GetChildren() do
--                 if v:IsA('Tool') then
--                     v.Parent = LocalPlayer.Backpack
--                 end
--             end

--         end
--     end
-- })

-- local DupeFishGroupButton = sections.Misc6:AddGroupButton()

-- function DestroyGhostDupe()
--     local Players = game:GetService("Players")
--     local ReplicatedStorage = game:GetService("ReplicatedStorage")

--     local LocalPlayer = Players.LocalPlayer
--     local PlayerGui = LocalPlayer.PlayerGui
--     local hud = PlayerGui:FindFirstChild("hud")
--     local safezone = hud and hud:FindFirstChild("safezone")
--     local backpack = safezone and safezone:FindFirstChild("backpack")
--     local inventory = backpack and backpack:FindFirstChild("inventory")
--     local scroll = inventory and inventory:FindFirstChild("scroll")
--     local playerInventory = ReplicatedStorage:WaitForChild("playerstats")[LocalPlayer.Name]:WaitForChild("Inventory")

--     if scroll then
--         for _, child in pairs(scroll:GetChildren()) do
--             if child:FindFirstChild("item") then
--                 local itemValue = tostring(child.item.Value)
--                 if not playerInventory:FindFirstChild(itemValue) then
--                     child:Destroy()
--                 end
--             end
--         end
--     end
-- end

-- DupeFishGroupButton:AddButton({
--     Title = "Delete Ghost Items",
--     Variant = "Primary",
--     Callback = function()
--         DestroyGhostDupe()
--     end,
-- })

-- DupeFishGroupButton:AddButton({
--     Title = "Create Safe Zone",
--     Variant = "Primary",
--     Callback = function()
--         local SafeZone = Instance.new("Part")
--         SafeZone.Size = Vector3.new(15, 1, 15)
--         SafeZone.Position = Vector3.new(math.random(-2000,2000), math.random(50000,90000), math.random(-2000,2000))
--         SafeZone.Anchored = true
--         SafeZone.BrickColor = BrickColor.new("Royal purple")
--         SafeZone.Material = Enum.Material.ForceField
--         SafeZone.Parent = game.Workspace
--         LocalPlayer.Character.HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 5, 0)
--         lib:Notification("Safezone", "You need to use teleports to go back.", 7)
--     end,
-- })

-- DupeFishGroupButton:AddButton({
--     Title = "Copy Tutorial Video Link",
--     Variant = "Outline",
--     Callback = function()
--         setclipboard("https://youtu.be/Axq0W7sOAFc")
--         lib:Notification("Tutorial","Copied link to clipboard, just paste it.", 5)
--     end,
-- })
-- end

-- var.ExaltedParagraph = sections.Misc6:AddParagraph({Title = "<font color=\"rgb(84, 92, 86)\">Exalted Enchant Dupe</font>",
--                              Description = "Requirements:\n- Server Age\n- Hexed Enchant Relic\n- Crystalized Enchant Relic\n- Greedy Enchant Relic\n- Translucent Enchant Relic\n- Atlantean Enchant Relic\n- Fossilized Enchant Relic\n- Mosaic Enchant Relic"})

                 
-- function ExaltedCheck()
--     local inventory = game:GetService("ReplicatedStorage").playerstats.CerealWithLava.Inventory
--     local targetMutations = {"Hexed", "Crystalized", "Greedy", "Translucent", "Atlantean", "Fossilized", "Mosaic"}
--     local description = "Requirements:\n"

--     -- Server Age Check
--     local uptimeText = game:GetService("Players").LocalPlayer.PlayerGui.serverInfo.serverInfo.uptime.Text
--     local targetTimestamp = 1737522000
--     local serverAgeCheck = false

--     local hours, minutes, seconds = uptimeText:match("Server Uptime: (%d+):(%d+):(%d+)")
--     if hours and minutes and seconds then
--         local uptimeInSeconds = tonumber(hours) * 3600 + tonumber(minutes) * 60 + tonumber(seconds)
--         local currentTimestamp = os.time()
--         local serverStartTime = currentTimestamp - uptimeInSeconds
--         serverAgeCheck = serverStartTime < targetTimestamp
--     end

--     description = description .. (serverAgeCheck and 
--         "<font color=\"rgb(0, 255, 68)\">- Server Age</font>" or 
--         "<font color=\"rgb(255, 0, 0)\">- Server Age</font>") .. "\n"

--     -- Mutation Checks
--     for _, mutation in ipairs(targetMutations) do
--         local found = false
--         for _, item in pairs(inventory:GetChildren()) do
--             if item.Name:find("Enchant Relic") and item:FindFirstChild("Mutation") then
--                 if item.Mutation.Value == mutation then
--                     found = true
--                     break
--                 end
--             end
--         end
        
--         description = description .. (found and 
--             "<font color=\"rgb(0, 255, 68)\">- " .. mutation .. " Enchant Relic</font>" .. "\n" or 
--             "<font color=\"rgb(255, 0, 0)\">- " .. mutation .. " Enchant Relic</font>" .. "\n")
--     end

--     var.ExaltedParagraph:SetDesc(description)
-- end

-- sections.Misc6:AddToggle("ExaltedDupe", {
--     Title = "Dupe Exalted Relics",
--     Default = false,
--     Description = "Uses your held relic.",
--     Callback = function(isEnabled)
--         var.loopExalted = isEnabled
--         while var.loopExalted do
--             pcall(function()
--                 local link = tostring(workspace[LocalPlayer.Name]["Enchant Relic"].link.Value)
--                 local mutation = game:GetService("ReplicatedStorage").playerstats[LocalPlayer.Name].Inventory[link].Mutation.Value
--                 game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ActivatorClientActive"):FireServer(mutation .. "_Exalted")
--             end)
--             task.wait()
--         end
--     end,
-- })

-- local DupeExaltedGroupButton = sections.Misc6:AddGroupButton()


-- DupeExaltedGroupButton:AddButton({
--     Title = "Check Requirements",
--     Variant = "Primary",
--     Callback = function()
--         ExaltedCheck()
--     end,
-- })

-- DupeExaltedGroupButton:AddButton({
--     Title = "Go to area",
--     Variant = "Primary",
--     Callback = function()
--         LocalPlayer:RequestStreamAroundAsync(Vector3.new(2234.365478515625, -807.2540893554688, 1042.9285888671875))
--         if workspace.world.map["Gamma Grotto"]:FindFirstChild("Model") then
--             LocalPlayer.Character.HumanoidRootPart.Position = workspace.world.map["Gamma Grotto"]:FindFirstChild("Model").WorldPivot.Position
--         else
--             lib:Notification("Go to area", "Failed to find/load area.", 5)
--         end
--     end,
-- })

-- DupeExaltedGroupButton:AddButton({
--     Title = "Copy Tutorial Video Link",
--     Variant = "Outline",
--     Callback = function()
--         setclipboard("https://www.youtube.com/watch?v=Q06ax3z581A")
--         lib:Notification("Tutorial","Copied link to clipboard, just paste it.", 5)
--     end,
-- })

-- DupeExaltedGroupButton:AddButton({
--     Title = "Fill in relics",
--     Variant = "Primary",
--     Callback = function()
--         local Mutations = {"Hexed", "Crystalized", "Greedy", "Translucent", "Atlantean", "Fossilized", "Mosaic"}
--         for _, mutation in ipairs(Mutations) do
--             game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/ActivatorClientActive"):FireServer(mutation .. "_Exalted")
--         end
--     end,
-- })


-- Function to grab and format the playtime
sections.Webhook1:AddDropdown("WebhookMode", {
    Title = "Select Webhook",
    Description = "",
    Options = {"Edit Message", "New Message"},
    Default = "Edit Message",
    PlaceHolder = "Select Mode",
    Multiple = false,
    Callback = function(Value)
        WebhookMode = Value
    end,
})

sections.Webhook1:AddDropdown("WebhookRarityFish", {
    Title = "Trigger Rarity/Fish",
    Description = "",
    Options = allFish_Rarity,
    Default = "",
    PlaceHolder = "Select Rarity/Fish | Don't select anything if all",
    Multiple = true,
    Callback = function(Value)
        var.WebhookRarityFish = Value
    end
})

--[[3itx Made this]]--

-- Function to grab and format the playtime
local function grabPlayTime()
    local seconds = PlayerStats.tracker_timeplayed.Value or 0  -- Grab the playtime (in seconds)

    -- Convert seconds to days, hours, minutes, seconds
    local days = math.floor(seconds / 86400)  -- 1 day = 86400 seconds
    local hours = math.floor((seconds % 86400) / 3600)  -- 1 hour = 3600 seconds
    local minutes = math.floor((seconds % 3600) / 60)  -- 1 minute = 60 seconds
    local remainingSeconds = math.floor(seconds % 60)  -- Remaining seconds

    -- Construct the formatted string
    local timeString = ""
    if days > 0 then
        timeString = timeString .. days .. "d "
    end
    if hours > 0 then
        timeString = timeString .. hours .. "h "
    end
    if minutes > 0 then
        timeString = timeString .. minutes .. "m "
    end
    if remainingSeconds > 0 or (days == 0 and hours == 0 and minutes == 0) then
        timeString = timeString .. remainingSeconds .. "s"
    end

    return timeString
end

var.WebhookURL = nil
local UseProxy = false
local EmbedColor = nil
local EditDelay = 60

function color3ToHex(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

local function processFishingZones()
    -- Guard clause
    local fishingZones = workspace.zones.fishing
    if not fishingZones then
        return "none"
    end

    -- Initialize tables for tracking
    local zoneNames = {}
    local seenNames = {} -- Track duplicate handling

    -- Priority zones to check first
    local priorityZones = {
        {name = "The Kraken Pool", displayName = "Kraken"},
        {name = "Ancient Kraken Pool", displayName = "Ancient Kraken"},
        {name = "Orcas Pool", displayName = "Orcas"},
        {name = "Ancient Orcas Pool", displayName = "Ancient Orcas"},
        {name = "The Depths - Serpent", displayName = "The Depths - Serpent"},
        {name = "Lovestorm Eel Supercharged", displayName = "Lovestorm Eel Supercharged"},
        {name = "Lovestorm Eel", displayName = "Lovestorm Eel"}
    }

    -- Check priority zones first
    for _, zone in ipairs(priorityZones) do
        if fishingZones:FindFirstChild(zone.name) then
            if not seenNames[zone.displayName] then
                table.insert(zoneNames, zone.displayName)
                seenNames[zone.displayName] = 1
            else
                seenNames[zone.displayName] = seenNames[zone.displayName] + 1
            end
        end
    end

    -- Process all other zones
    for _, child in pairs(fishingZones:GetChildren()) do
        local zoneName = nil

        -- Check for beacon with POIHeader
        if child:FindFirstChild("beacon") then
            local poiHeader = child:FindFirstChild("POIHeader")
            if poiHeader and poiHeader:FindFirstChild("title") and poiHeader.title:IsA("TextLabel") then
                zoneName = poiHeader.title.Text
            end
        end

        -- Check for Abundance properties
        local abundance = child:FindFirstChild("Abundance")
        if abundance and abundance:FindFirstChild("Chance") and abundance:FindFirstChild("Mutation") then
            zoneName = child.Name
        end

        -- Process valid zone names
        if zoneName and not table.find(zoneNames, zoneName) then
            if not seenNames[zoneName] then
                table.insert(zoneNames, zoneName)
                seenNames[zoneName] = 1
            else
                seenNames[zoneName] = seenNames[zoneName] + 1
            end
        end
    end

    -- Handle empty result
    if #zoneNames == 0 then
        return "none"
    end

    -- Format results with counts
    local formattedNames = {}
    for _, name in ipairs(zoneNames) do
        if seenNames[name] > 1 then
            table.insert(formattedNames, string.format("%s (x%d)", name, seenNames[name]))
        else
            table.insert(formattedNames, name)
        end
    end

    -- Sort names alphabetically for consistent output
    table.sort(formattedNames)

    return table.concat(formattedNames, ", ")
end

function getServerUptime()
    local uptime = game:GetService("ReplicatedStorage").world.uptime.Value
    local version = game:GetService("ReplicatedStorage").world.version.Value
    local days = math.floor(uptime / 86400)  -- 1 day = 86400 seconds
    local hours = math.floor((uptime % 86400) / 3600)  -- Remaining hours
    local minutes = math.floor((uptime % 3600) / 60)  -- Remaining minutes

    local formattedTime = string.format("%dd %dh %dm", days, hours, minutes)
    return formattedTime
end

local HiddenMode = false
function StatusEmbed()
    function NoDiddy()
        if HiddenMode then
            return "Lunor User <3"
        else
            return "@" .. LocalPlayer.DisplayName .. "(" .. LocalPlayer.Name .. ")"
        end
    end
    return {
        ["title"] = tostring(NoDiddy()) .. " - Lunor // Fisch",
        ["description"] = "◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤\n"
        .. "**« Account Info »**\n"
        .. "🕹️ <:1036413570302345277:1320298554178273283>lvl » " .. tostring(LocalPlayer.leaderstats.Level.Value or "Error") .. "\n"
        .. "💰 <:1032398237283385364:1320297984302514206>C$ » " .. tostring(LocalPlayer.leaderstats["C$"].Value or "Error") .. "\n"
        .. "🔥 <:1032398237283385364:1320297984302514206>Streak » " .. (function()
            local streak = PlayerStats.tracker_streak.Value
            if tonumber(streak) then
                return formatNumber(tonumber(streak))
            else
                return "Error"
            end
        end)() .. "\n"
        .. "🎣 <:1032398237283385364:1320297984302514206>Equipped Rod » " .. tostring(PlayerStats.rod.Value or "Error") .. "\n"
        .. "🌏 <:1032398237283385364:1320297984302514206>Location » " .. tostring(character.zone.Value or "Error") .. "\n"
        .. "📦 <:1032398237283385364:1320297984302514206>Bait » " .. (function()
            local sum = 0
            local baitStats = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.bait
            for _, v in ipairs(baitStats:GetChildren()) do
                sum += tonumber(v.Value) or 0
            end
            return formatNumber(sum) or "Error"
        end)() .. "\n"
        .. "🐟 <:1032398237283385364:1320297984302514206>Total Caught » " .. (function()
            local fishCaught = PlayerStats.tracker_fishcaught.Value
            if tonumber(fishCaught) then
                return formatNumber(tonumber(fishCaught))
            else
                return "Error"
            end
        end)() .. "\n"
        .. "🎒 <:1032398237283385364:1320297984302514206>Inventory Value » " .. tostring(calculateInventoryValue() or "Error") .. "\n"
        .. "⌛ <:10364135703023452772:1320300405632270356>Time Played » " .. grabPlayTime() .. "\n\n"
        .. "**« Server Info »**\n"
        .. "🌧️ <:1036413570302345277:1320298554178273283>Weather » " .. tostring(ReplicatedStorage.world.weather.Value or "Error") .. "\n"
        .. "🌥️ <:1032398237283385364:1320297984302514206>Time » " .. tostring(ReplicatedStorage.world.cycle.Value or "Error") .. "\n"
        .. "🌿 <:1032398237283385364:1320297984302514206>Season » " .. tostring(ReplicatedStorage.world.season.Value or "Error") .. "\n"
        .. "🌆 <:1032398237283385364:1320297984302514206>Event » " .. tostring(ReplicatedStorage.world.event.Value or "Error") .. "\n"
        .. "🦈 <:1032398237283385364:1320297984302514206>Event Fish » " .. tostring(processFishingZones() or "Error") .. "\n"
        .. "🕓 <:1032398237283385364:1320297984302514206>Server Uptime » " .. tostring(getServerUptime() or "Error") .. "\n"
        .. "📍 <:1032398237283385364:1320297984302514206>Server Location » "
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_country").Value or "Error") .. ", "
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_region").Value or "Error") .. ", "
        .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("region_city").Value or "Error") .. "\n"
        .. "🍚 <:1032398237283385364:1320297984302514206>Version » " .. tostring(ReplicatedStorage:WaitForChild("world"):WaitForChild("version").Value or "Error") .. "\n"
        .. "👥 <:10364135703023452772:1320300405632270356>Players » " .. tostring(#Players:GetPlayers() or "Error") .. "\n"
        .. "◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤\n"
        .. "-# Updating in <t:" .. tostring(os.time() + (EditDelay or 0)) .. ":R>",
        ["color"] = discordColor,
        ["thumbnail"] = {["url"] = "https://r2.e-z.host/89f12c0f-033a-445c-a79d-0a1811ec8380/nfamu2z5i9b88fitmk.png"}
    }
end

local function getSeasonInfo()
    local seasons = {
        {name = "Summer", emoji = "<:Summer:1330930778921500782>"},
        {name = "Autumn", emoji = "<:Autumn:1330930777193582693>"},
        {name = "Winter", emoji = "<:17746816531:1330930776333746367>"},
        {name = "Spring", emoji = "<:Spring:1330930780725317744>"}
    }
    return seasons
end

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    return string.format("%02dh %02dm %02ds", hours, minutes, secs)
end

function StatusWithSeasonTracker()
    local currentTime = os.time()
    local timeSinceStart = currentTime - CYCLE_START
    local cyclePosition = timeSinceStart % FULL_CYCLE
    local currentSeasonIndex = math.floor(cyclePosition / SEASON_DURATION) + 1

    local seasons = getSeasonInfo()
    local description = "**◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤**\n\n"

    for i, season in ipairs(seasons) do
        local seasonStartTime = ((i - 1) * SEASON_DURATION) + CYCLE_START
        local nextSeasonTime = seasonStartTime + SEASON_DURATION
        local markerEmoji = "<:1036413570302345277:1320298554178273283>"
        local timeEmoji = "<:10364135703023452772:1320300405632270356>"

        description = description .. markerEmoji .. season.emoji .. "  **" .. season.name

        if i == currentSeasonIndex then
            description = description .. "** (Current)\n" .. timeEmoji .. "**Ends <t:" .. nextSeasonTime .. ":t>**\n\n"
        else
            description = description .. "**\n" .. timeEmoji .. "**Starts <t:" .. seasonStartTime .. ":t>**\n\n"
        end
    end

    description = description .. "**◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤◢◤**"

    return {
        ["title"] = "**Seasons Tracker**",
        ["description"] = description,
        ["color"] = discordColor
    }
end

function StoppedEmbed()
    return {
        ["title"] = "Webhook Has Been Stopped :skull:",
        ["description"] = "```ansi\n" ..
                          "[2;43m[2;37m[1;37mThanks for using Lunor Webhook's[0m[2;37m[2;43m[0m[2;43m[0m\n" ..
                          "```",
        ["color"] = 16711680, -- This color is for the embed border
        ["thumbnail"] = {
            ["url"] = "https://r2.e-z.host/89f12c0f-033a-445c-a79d-0a1811ec8380/nfamu2z5i9b88fitmk.png"
        }
    }
end

local function checkWebhook(url)
    local success, response = pcall(function()
        return request({
            Url = url,
            Method = "GET"
        })
    end)

    if not success then
        print("An error occurred: " .. tostring(response))
        return false
    else
        if response.StatusCode == 200 then
            return true
        elseif response.StatusCode == 401 then
            return false
        else
            lib:Notification("Webhook Settings", "Error has been Caught" .. response.StatusCode, 5)
            return false
        end
    end
end

function replaceWebhookURL(webhookLink)
    webhookLink = webhookLink:gsub("https://canary%.?", "https://"):gsub("https://ptb%.?", "https://") or webhookLink
    webhookLink = webhookLink:gsub("https://discord%.com/api/webhooks/", "https://webhook.lewisakura.moe/api/webhooks/"):gsub("https://discordapp%.com/api/webhooks/", "https://webhook.lewisakura.moe/api/webhooks/")
    return webhookLink
end

var.StatusWebhook = false
sections.Webhook1:AddTextbox({
    Title = "Webhook URL",
    PlaceHolder = "Insert Webhook URL",
    Default = "",
    Description = "",
    TextDisappear = true,
    Callback = function(Webhook)
        local isAlive = checkWebhook(Webhook)
        if isAlive then
            if UseProxy then
                var.WebhookURL = replaceWebhookURL(Webhook)
            else
                var.WebhookURL = Webhook
            end
        else
            lib:Notification("Webhook Settings", "Webhook is not a valid Link please Provide a Valid Webhook link", 5)
        end
    end
})

sections.Webhook1:AddToggle("UseProxy", {
    Title = "Use Proxy",
    Default = true,
    Description = "",
    Callback = function(isEnabled)
        UseProxy = isEnabled
    end
})

sections.Webhook2:AddColorpicker("EmbedColor", {
    Title = "Embed Color",
    Default = Color3.fromRGB(208, 157, 255),
    Callback = function(selectedColor)
        -- Extract and scale RGB values from Color3
        local red = math.floor(selectedColor.R * 255)
        local green = math.floor(selectedColor.G * 255)
        local blue = math.floor(selectedColor.B * 255)

        -- Convert to Discord embed color format
        discordColor = red * 65536 + green * 256 + blue

        -- Print the formatted color
        -- print("Discord Embed Color:", discordColor)
    end,
})

sections.Webhook2:AddTextbox({
    Title = "Edit Embed Delay (s)",
    Default = "",
    Description = "",
    PlaceHolder = "Insert a Delay",
    TextDisappear = false,
    Callback = function(Delay)
        EditDelay = Delay
    end
})

sections.Webhook2:AddToggle("HiddenToggle", {
    Title = "Hide from the Feds",
    Default = false,
    Description = "Won't show your name in the webhook message.",
    Callback = function(isEnabled)
        HiddenMode = isEnabled
    end
})

local function sendWebhook()
    local data = {
        ["content"] = "",
        ["embeds"] = {StatusEmbed(), StatusWithSeasonTracker()}
    }

    local jsonData = HttpService:JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }

    local response = request({
        Url = var.WebhookURL .. "?wait=true",
        Method = "POST",
        Headers = headers,
        Body = jsonData
    })

    if response.StatusCode == 200 then
        local responseBody = HttpService:JSONDecode(response.Body)
        local messageId = responseBody.id
        print("Message ID:", messageId)

        return messageId
    else
        print("Error sending webhook message:", response.StatusCode, response.StatusMessage)
        return nil
    end
end

local function sendStoppedEmbed(messageId)
    local stoppedData = {
        ["embeds"] = {StoppedEmbed()}
    }
    local stoppedJsonData = HttpService:JSONEncode(stoppedData)

    local headers = {
        ["content-type"] = "application/json"
    }

    local stoppedResponse = request({
        Url = var.WebhookURL .. "/messages/" .. messageId,
        Method = "PATCH",
        Headers = headers,
        Body = stoppedJsonData
    })

    if stoppedResponse.StatusCode == 200 then
        print("Webhook stopped message sent successfully!")
    else
        print("Error sending stopped message:", stoppedResponse.StatusCode, stoppedResponse.StatusMessage)
    end
end

local editWebhook = LPH_JIT_MAX(function(messageId)
    while var.StatusWebhook do
        task.wait(EditDelay)

        local data = {
            ["embeds"] = {StatusEmbed(), StatusWithSeasonTracker()}
        }

        local jsonData = HttpService:JSONEncode(data)

        local headers = {
            ["content-type"] = "application/json"
        }

        if WebhookMode == "Edit Message" then
            local editResponse = request({
                Url = var.WebhookURL .. "/messages/" .. messageId,
                Method = "PATCH",
                Headers = headers,
                Body = jsonData
            })

            if editResponse.StatusCode == 200 then
                print("Message edited successfully!")
            else
                print("Error editing message:", editResponse.StatusCode, editResponse.StatusMessage)
            end
        elseif WebhookMode == "New Message" then
            local newMessageResponse = request({
                Url = var.WebhookURL .. "?wait=true",
                Method = "POST",
                Headers = headers,
                Body = jsonData
            })

            if newMessageResponse.StatusCode == 200 then
                print("New message sent successfully!")
            else
                print("Error sending new message:", newMessageResponse.StatusCode, newMessageResponse.StatusMessage)
            end
        end
    end
    sendStoppedEmbed(messageId)
end)

sections.Webhook3:AddToggle("StartStatusWebhook", {
    Title = "Start Status",
    Default = false,
    Description = "",
    Callback = function(isEnabled)
        var.StatusWebhook = isEnabled
        if isEnabled then
            if data1 == nil then
                data1 = data
            end
            if data2 == nil then
                data2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Catto-YFCN/GoofyData/refs/heads/main/FishImages"))()
            end
            local messageId = sendWebhook()
            if messageId then
                editWebhook(messageId)
            end
        else
            var.StatusWebhook = false
        end
    end
})


local playerName = LocalPlayer.Name
local playerStats = ReplicatedStorage:WaitForChild("playerstats"):WaitForChild(playerName)
local inventory = playerStats:WaitForChild("Inventory")

var.lol = false
local connections = {} -- To store connections for cleanup

local function createWebhookEmbed(title, description, imageURL, thumbnailURL)
    return {
        ["title"] = title,
        ["description"] = description,
        ["color"] = 0,
        ["image"] = { ["url"] = imageURL },
        ["thumbnail"] = { ["url"] = thumbnailURL }
    }
end


local function sendWebhook2(embed)
    local data = {
        ["content"] = "",
        ["embeds"] = { embed }
    }
    local jsonData = HttpService:JSONEncode(data)
    local headers = { ["content-type"] = "application/json" }

    local response = request({
        Url = var.WebhookURL,
        Method = "POST",
        Headers = headers,
        Body = jsonData
    })

    print("Webhook sent with status:", response.StatusCode)
end


local function onValueChanged(value)
    if not value or not value:IsA("ValueBase") then
        print("Error: Invalid value detected:", tostring(value))
        return
    end

    local parent = value.Parent
    if not parent then
        print("Error: Parent not found for value:", value.Name)
        return
    end

    -- Extract fish name by removing digits
    local fishName = parent.Name:gsub("%d", "")

    -- Check if WebhookRarityFish is defined and not empty
    if var.WebhookRarityFish ~= nil and next(var.WebhookRarityFish) ~= nil then
        -- Get the rarity of the fish from data1.Fish
        local fishRarity = data1.Fish[fishName] and data1.Fish[fishName].Rarity or "Unknown"

        -- Check if the fish name or its rarity is in WebhookRarityFish
        local shouldSendWebhook = false
        for _, item in ipairs(var.WebhookRarityFish) do
            if item == fishName or item == fishRarity then
                shouldSendWebhook = true
                break
            end
        end

        -- If the fish name or rarity is not in the list, don't send the webhook
        if not shouldSendWebhook then
            return
        end
    end

    -- If WebhookRarityFish is nil or empty, or the fish matches the criteria, proceed to create the description
    task.wait()
    local description = "<:1036413570302345277:1320298554178273283> **Fish Name:** " .. fishName .. "\n"
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("ValueBase") or child:IsA("BoolValue") then
            description = description .. "<:1032398237283385364:1320297984302514206> **" .. child.Name .. ":** " .. tostring(child.Value) .. "\n"
        end
    end
    description = description .. "<:1032398237283385364:1320297984302514206> **Rarity:** " .. tostring(data1.Fish[fishName].Rarity or "Unknown") .. "\n" .. "<:10364135703023452772:1320300405632270356> **Total Price:** " .. tostring(formatNumber(GetBackPackItemValue(parent.Name))) .. " C$\n**Showcase Image:**"

    -- Create and send the webhook embed
    local embed = createWebhookEmbed(
        "Lunor Auto Catcher Notifier",
        description,
        tostring(data2.ImageLinks[fishName].Link) or "https://stablepoint.com/assets/uploads/images/blog/503-image1.jpg?v=1636710553",
        "https://r2.e-z.host/89f12c0f-033a-445c-a79d-0a1811ec8380/nfamu2z5i9b88fitmk.png"
    )
    sendWebhook2(embed)
end
FlagsManager:LoadAutoloadConfig()