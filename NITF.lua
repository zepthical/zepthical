local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LP = Players.LocalPlayer
local Char = LP.Character or LP.CharacterAdded:Wait()
local Humanoid = Char:WaitForChild("Humanoid")

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()
local UI = CK.new({ Name = "AutoFarm 💸+ TP + Laser", Keybind = "RightControl", Scale = CK.Scale.Mini })

local autoCollect, autoRebirth, infJump, noclip, lockToLegendary, laserToggle = false, false, false, false, false, false
local originalPos, storedLasers = nil, {}

local function refreshChar()
    Char = LP.Character or LP.CharacterAdded:Wait()
    Humanoid = Char:WaitForChild("Humanoid")
end

LP.CharacterAdded:Connect(function()
    task.wait(1)
    refreshChar()
end)


local TabMain = UI:DrawTab({ Name = "Main", Icon = "dollar-sign" })
local SectionMain = TabMain:DrawSection({ Name = "Automation", Position = "left" })


SectionMain:AddToggle({ Name = "Auto Collect Money (Lime)", Default = false, Callback = function(v)
    autoCollect = v
end })

SectionMain:AddToggle({ Name = "Auto Rebirth", Default = false, Callback = function(v)
    autoRebirth = v
end })

SectionMain:AddToggle({ Name = "TP to Buy ", Default = false, Callback = function(v)
    lockToLegendary = v
    if v then
        originalPos = LP.Character:FindFirstChild("HumanoidRootPart") and LP.Character.HumanoidRootPart.Position
    else
        if originalPos then
            LP.Character:MoveTo(originalPos)
        end
    end
end })

SectionMain:AddButton({ Name = "Give All Tools (no dupes)", Callback = function()
    local tools = RS:FindFirstChild("Tools")
    if tools then
        for _, tool in pairs(tools:GetChildren()) do
            if tool:IsA("Tool") and not LP.Backpack:FindFirstChild(tool.Name) and not Char:FindFirstChild(tool.Name) then
                tool:Clone().Parent = LP.Backpack
            end
        end
    end
end })

SectionMain:AddToggle({ Name = "Auto Remove Lasers (toggle)", Default = false, Callback = function(v)
    laserToggle = v
    local houses = workspace:FindFirstChild("GameFolder") and workspace.GameFolder:FindFirstChild("HouseFolder")
    if houses then
        for _, house in pairs(houses:GetChildren()) do
            for _, part in pairs(house:GetDescendants()) do
                if part:IsA("BasePart") and part.Color == Color3.fromRGB(255, 0, 0) then
                    if v then
                        storedLasers[part] = part:Clone()
                        part:Destroy()
                    else
                        if storedLasers[part] then
                            storedLasers[part].Parent = house
                        end
                    end
                end
            end
        end
    end
end })


local TabMove = UI:DrawTab({ Name = "Movement", Icon = "move" })
local SectionMove = TabMove:DrawSection({ Name = "Speed & Jump", Position = "left" })
local SectionUtil = TabMove:DrawSection({ Name = "Other", Position = "right" })

local speedValue = 16
local jumpValue = 100

SectionMove:AddSlider({ Name = "WalkSpeed", Min = 16, Max = 150, Default = 16, Callback = function(v)
    speedValue = v
    if Humanoid then Humanoid.WalkSpeed = v end
end })

SectionMove:AddSlider({ Name = "JumpPower", Min = 50, Max = 300, Default = 100, Callback = function(v)
    jumpValue = v
    if Humanoid then Humanoid.JumpPower = v end
end })

SectionUtil:AddToggle({ Name = "Infinite Jump", Default = false, Callback = function(v)
    infJump = v
end })

UIS.JumpRequest:Connect(function()
    if infJump and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

SectionUtil:AddToggle({ Name = "Noclip", Default = false, Callback = function(v)
    noclip = v
end })

RunService.Stepped:Connect(function()
    if noclip and Char then
        for _, v in pairs(Char:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide then
                v.CanCollide = false
            end
        end
    end
end)


task.spawn(function()
    while true do
        task.wait(0.15)
        if not Char or not Humanoid then refreshChar() end

        if Humanoid then
            Humanoid.WalkSpeed = speedValue
            Humanoid.JumpPower = jumpValue
        end

        if autoCollect then
            local houses = workspace:FindFirstChild("GameFolder") and workspace.GameFolder:FindFirstChild("HouseFolder")
            if houses then
                for _, house in pairs(houses:GetChildren()) do
                    local display = house:FindFirstChild("Display")
                    if display then
                        for _, pad in pairs(display:GetChildren()) do
                            local part = pad:FindFirstChild("CollectPart")
                            local ui = part and part:FindFirstChild("UI")
                            local amountLabel = ui and ui:FindFirstChild("Frame") and ui.Frame:FindFirstChild("AmountText")
                            if part and amountLabel and part:IsA("BasePart") and part.Color == Color3.fromRGB(0, 255, 0) then
                                local text = amountLabel.Text
                                if text and text:match("%d") and not text:find("$0") then
                                    LP.Character:MoveTo(part.Position + Vector3.new(0, 3, 0))
                                    firetouchinterest(LP.Character.HumanoidRootPart, part, 0)
                                    firetouchinterest(LP.Character.HumanoidRootPart, part, 1)
                                    task.wait(0.15)
                                end
                            end
                        end
                    end
                end
            end
        end

        if autoRebirth and RS:FindFirstChild("Remotes") and RS.Remotes:FindFirstChild("Rebirth") then
            RS.Remotes.Rebirth:FireServer()
        end

        if lockToLegendary then
            local charFolder = workspace:FindFirstChild("GameFolder") and workspace.GameFolder:FindFirstChild("CharacterFolder")
            if charFolder then
                for _, npc in pairs(charFolder:GetChildren()) do
                    if npc:FindFirstChild("Torso") then
                        LP.Character:MoveTo(npc.Torso.Position + Vector3.new(0, 3, 0))
                        break
                    end
                end
            end
        end
    end
end)
