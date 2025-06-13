local replicated = game:GetService("ReplicatedStorage")
local PathfindingService = game:GetService("PathfindingService")
local vim = game:GetService("VirtualInputManager")
local teleport = game:GetService('TeleportService')
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = LocalPlayer:WaitForChild("Backpack")

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	Humanoid = Character:WaitForChild('Humanoid')
	RootPart = Character:WaitForChild('HumanoidRootPart')
	Backpack = LocalPlayer:WaitForChild("Backpack")
end)

do 
	if LocalPlayer.PlayerGui:FindFirstChild("Roblox/Fluent") then  LocalPlayer.PlayerGui:FindFirstChild("Roblox/Fluent"):Destroy() end 
	if LocalPlayer.PlayerGui:FindFirstChild("ScreenGuis") then  LocalPlayer.PlayerGui.ScreenGuis:Destroy() end
end

do
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in ipairs(GC(LocalPlayer.Idled)) do if v["Disable"] then v["Disable"](v) elseif v["Disconnect"] then v["Disconnect"](v) end end
	else
		LocalPlayer.Idled:Connect(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end)
	end
end

local mainFolder = "Zepthic"
local path = mainFolder.."/ARX"
local ConfigName = path.."/"..LocalPlayer.Name.."-config.json"

local DefaultSettings = {}

local Settings = {}

do 
	if not isfolder(mainFolder) then
		makefolder(mainFolder)
	end

	if not isfolder(path) then
		makefolder(path)
	end

	if isfile(ConfigName) then
		local success, result = pcall(function()
			return HttpService:JSONDecode(readfile(ConfigName))
		end)

		if success and type(result) == "table" then
			Settings = result
		else
			Settings = DefaultSettings
		end
	else
		Settings = DefaultSettings
		writefile(ConfigName, HttpService:JSONEncode(Settings))
	end

	for key, value in ipairs(DefaultSettings) do
		if Settings[key] == nil then
			Settings[key] = value
		end
	end
end

function saveConfig()
	if not isfolder(path) then
		makefolder(path)
	end
	writefile(ConfigName, HttpService:JSONEncode(Settings))
end

local Story = {}
local record = {}
local marco = {}
local func = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Main.GameStage.Main.Base.Story.ScrollingFrame:GetChildren()) do
	if v:IsA("TextButton") and v.Name ~= "UIListLayout" then
		table.insert(Story, v.Name)
	end
end

if isfolder(path.."/Marco") then
	for _, filePath in ipairs(listfiles(path.."/Marco")) do
		local name = filePath:match("^.+[/\\]([^/\\]+)")
		if name then
			table.insert(marco, name)
		end
	end
end

convertInstance = (function(v)
	local success, path = pcall(function()
		return v:GetFullName()
	end)
	if success then
		return "game."..path
	end
	return tostring(v)
end)

safeSerialize = (function(args)
    local result = {}
    for _, v in ipairs(args) do
        if typeof(v) == "Instance" then
            table.insert(result, convertInstance(v))
        else
            table.insert(result, v)
        end
    end
    return result
end)

local recordEntry = {}

local oldNamecall; oldNamecall = getfenv().hookmetamethod(game, "__namecall", function(self, ...)
	local method = getfenv().getnamecallmethod()
	if method == "FireServer" then
		if _G.RecordingMarco then
			local args = {...}
			local safeArgs = safeSerialize(args)

			table.insert(recordEntry,{
				path = convertInstance(self),
				args = safeArgs
			})

			local filePath = path .. "/Marco/" .. _G.Marco
			_G.existing = {}

			if isfile(filePath) then
				local ok, content = pcall(readfile, filePath)
				if ok and content and content ~= "" then
					local success, data = pcall(HttpService.JSONDecode, HttpService, content)
					if success and type(data) == "table" then
						local filtered = {}
						for _, v in ipairs(data) do
							if type(v) == "table" then
								table.insert(filtered, v)
							end
						end
						_G.existing = filtered
					end
				end
			end

			table.insert(_G.existing, recordEntry)
		end
		return self.FireServer(self, ...)
	end
	return oldNamecall(self, ...)
end)

func['JoinStory'] = (function()
    while _G.JoinStory do task.wait()
        pcall(function()
			if not workspace:FindFirstChild('Building') then
				if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name) then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer('Create')
				end
				if replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).World.Value ~= _G.StoryMode then 
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-World", {World = _G.StoryMode})
				end
				if replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).Chapter.Value ~= _G.StoryMode.."_".."Chapter".._G.Chapter then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-Chapter", {Chapter = _G.StoryMode.."_".."Chapter".._G.Chapter})
				end
				if replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).Difficulty.Value ~= _G.Difficulty then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-Difficulty", {Difficulty = _G.Difficulty})
				end
				if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).Submit.Value then 
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Submit")
				end
				if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).OnTeleport.Value then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Start")
				end
			end
        end)
    end
end)

func['JoinRanger'] = (function()
	while _G.JoinRanger do task.wait()
		pcall(function()
			if not workspace:FindFirstChild('Building') then
			if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name) then
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer('Create')
			end
			if not game:GetService("ReplicatedStorage").PlayRoom:FindFirstChild(LocalPlayer.Name).Mode.Value ~= "Ranger Stage" then
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-Mode", {Mode = "Ranger"})
			end
			if replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).World.Value ~= _G.World then 
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-World", {World = "Ranger"})
			end
			if replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).Chapter.Value ~= _G.World.."_".."RangerStage".._G.Act then
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Change-Chapter", {Chapter = _G.World.."_".."RangerStage".._G.Act})
			end
			if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).Submit.Value then 
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Submit")
			end
			if not replicated.PlayRoom:FindFirstChild(LocalPlayer.Name).OnTeleport.Value then
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer("Start")
			end
			end
		end)
	end
end)

func['AutoPlay'] = (function()
	if _G.AutoPlay then
		if not LocalPlayer.PlayerGui.HUD.InGame.Main.AutoPlay.Back2.UIStroke:FindFirstChild("true").Enabled then
			replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("AutoPlay"):FireServer()
		end
	else 
		if LocalPlayer.PlayerGui.HUD.InGame.Main.AutoPlay.Back2.UIStroke:FindFirstChild("true").Enabled then
			replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("AutoPlay"):FireServer()
		end
	end
end)

func['AutoRetry'] = (function()
	while _G.AutoRetry do
		task.wait(1)
		pcall(function()
			if workspace:FindFirstChild('Building') then
				if LocalPlayer.PlayerGui.RewardsUI.Enabled then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteRetry"):FireServer()
				end	
			end
		end)
	end
end)

func['AutoNext'] = (function()
	while _G.AutoNext do
		task.wait(1)
		pcall(function()
			if workspace:FindFirstChild('Building') then
				if LocalPlayer.PlayerGui.RewardsUI.Enabled then
					replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteNext"):FireServer()
				end	
			end
		end)
	end
end)

func['RecordingMarco'] = (function()
	while _G.RecordingMarco do task.wait(0.5)
		pcall(function()
			writefile(filePath, HttpService:JSONEncode(_G.existing))
		end)
	end
end)

func['Playbackmarco'] = (function()
	while _G.Playbackmarco do task.wait()
		pcall(function()
			local filePath = path.."/Marco/".._G.Marco
			if isfile(filePath) then
				local content = readfile(filePath)
				local data = HttpService:JSONDecode(content)

				for _, record in ipairs(data) do
					local remotePath = record.path
					local args = record.args

					local s = remotePath:split(".")
					local current = game
					for i = 2, #s do
						if current and typeof(current) == "Instance" then
							current = current:FindFirstChild(s[i])
						end
					end

					if typeof(args) == "string" then
						args = { args }
					end

					local realArgs = {}
					for _, arg in ipairs(args) do
						if typeof(arg) == "string" and arg:match("^game%.") then
							local pathParts = arg:split(".")
							local inst = game
							for i = 2, #pathParts do
								if inst and typeof(inst) == "Instance" then
									inst = inst:FindFirstChild(pathParts[i])
								end
							end
							table.insert(realArgs, inst or arg)
						else
							table.insert(realArgs, arg)
						end
					end

					if current and typeof(current) == "Instance" then
						current:FireServer(unpack(realArgs))
						task.wait(0.8)
					end
				end
			end
		end)
	end
end)

func['AutoUpgrade'] = (function()
	while _G.AutoUpgrade do task.wait(0.5)
		pcall(function()
			for _, v in ipairs(_G.UpdatesCatogory) do
				replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Upgrade"):FireServer(LocalPlayer:WaitForChild("UnitsFolder"):WaitForChild(v))
				task.wait(0.6)
			end		
		end)
	end
end)

func['AutoUpgradeStatus'] = (function()
	while _G.AutoUpgradeStatus do task.wait(0.5)
		pcall(function()
			replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("StatsManager"):FireServer("MaximumYen")
		end)
	end
end)


func['WhiteScreen'] = (function()
	if _G.WhiteScreen then
		RunService:Set3dRenderingEnabled(false)
	else
		RunService:Set3dRenderingEnabled(true)
	end
end)


local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yenixs/GUI/refs/heads/main/FLUENT"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

do 
	if LocalPlayer.PlayerGui:FindFirstChild("Roblox/Fluent") then

		local ScreenGui = Instance.new("ScreenGui")
		local Frame = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local ImageButton = Instance.new("ImageButton")

		ScreenGui.Name = "ScreenGuis"
		ScreenGui.Parent = LocalPlayer.PlayerGui

		Frame.Parent = ScreenGui
		Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BackgroundTransparency = 0.700
		Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Frame.BorderSizePixel = 0
		Frame.Position = UDim2.new(0.474052399, 0, 0.046491228, 0)
		Frame.Size = UDim2.new(0.0340000018, 0, 0.0700000003, 0)

		UICorner.Parent = Frame

		ImageButton.Parent = Frame
		ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ImageButton.BackgroundTransparency = 1.000
		ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageButton.BorderSizePixel = 0
		ImageButton.Position = UDim2.new(-0.0250000004, 0, -0.027777778, 0)
		ImageButton.Size = UDim2.new(1.1, 0, 1.1, 0)
		ImageButton.Image = "rbxassetid://103816145608946"

		ImageButton.MouseButton1Click:Connect(function()
			LocalPlayer.PlayerGui["Roblox/Fluent"]:GetChildren()[2].Visible = not LocalPlayer.PlayerGui["Roblox/Fluent"]:GetChildren()[2].Visible
		end)
	end
end 

local Window = Fluent:CreateWindow({
	Title = "Zepthic",
	SubTitle = "Anime Ranger x",
	TabWidth = 160,
	Size = UDim2.fromOffset(490, 360),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
	AutoJoin = Window:AddTab({ Title = "Auto Join", Icon = "upload" }),
	GamePlay = Window:AddTab({ Title = "Marco", Icon = "play" }),
	Games = Window:AddTab({ Title = "Game", Icon = "box" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function Dropdown(tab, title, values, default, callback)
	local dropdown = tab:AddDropdown(title, {
		Title = title,
		Values = values,
		Multi = false,
		Default = default
	})
	dropdown:OnChanged(callback, saveConfig)
	return dropdown
end
local function MultiDropdown(tab, title, values, default, callback)
	local dropdowns = tab:AddDropdown(title, {
		Title = title,
		Description = "",
		Values = values,
		Multi = true,
		Default = default or {}
	})
	dropdowns:OnChanged(callback, saveConfig)
	return dropdowns
end
local function Toggle(tab, title, settings)
	local toggle = tab:AddToggle(title, { Title = title, Default = Settings[settings] })
	toggle:OnChanged(function(value)
		Settings[settings] = value
		_G[settings] = Settings[settings]
		saveConfig()
		if func[settings] then
			task.spawn(func[settings])
		end
	end)	
	return toggle
end


do 
	Fluent:Notify({
		Title = "Zepthic",
		Content = "Loading...",
		Duration = 5
	})
	Tabs.AutoJoin:AddSection("Story")
	Dropdown(Tabs.AutoJoin, "Story: ", Story, Settings.StoryMode, function(value)
		Settings.StoryMode = value
		_G.StoryMode = value
	end)
	Dropdown(Tabs.AutoJoin, "Chapter: ", {'1','2','3','4','5','6','7','8','9','10'}, Settings.Chapter, function(value)
		Settings.Chapter = value
		_G.Chapter = value
	end)
	Dropdown(Tabs.AutoJoin, "Difficulty: ", {'Normal','Hard','Difficulty'}, Settings.Difficulty, function(value)
		Settings.Difficulty = value
		_G.Difficulty = value
	end)
    Toggle(Tabs.AutoJoin, "Auto Join", "JoinStory")
	Tabs.AutoJoin:AddSection("Ranger")
	Dropdown(Tabs.AutoJoin, "World: ", Story, Settings.World, function(value)
		Settings.World = value
		_G.World = value
	end)
	Dropdown(Tabs.AutoJoin, "Act: ", {'1','2','3'}, Settings.Act, function(value)
		Settings.Act = value
		_G.Act = value
	end)
	Toggle(Tabs.AutoJoin, "Auto Join", "JoinRanger")
	Tabs.AutoJoin:AddSection("Upgrade")
	Dropdown(Tabs.AutoJoin, "Upgrade: ", {'YenMaxLevel','YenGenarateLevel','BaseHealthLevel'}, Settings.Upgrade, function(value)
		Settings.Upgrade = value
		_G.Upgrade = value
	end)
	Tabs.AutoJoin:AddButton({
		Title = "Upgrade",
		Description = "",
		Callback = function()
			game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("PlayerStats"):FireServer(_G.Upgrade)
		end
	})
	Tabs.AutoJoin:AddSection("Summon")
	Dropdown(Tabs.AutoJoin, "Banner: ", {'Standard','Rateup'}, Settings.Summon, function(value)
		Settings.Summon = value
		_G.Summon = value
	end)
	Dropdown(Tabs.AutoJoin, "Amount: ", {'x1','x10'}, Settings.Unit, function(value)
		Settings.Unit = value
		_G.Unit = value
	end)
	Tabs.AutoJoin:AddButton({
		Title = "Summon",
		Description = "",
		Callback = function()
			replicated:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gambling"):WaitForChild("UnitsGacha"):FireServer(_G.Unit,_G.Summon,{})
		end
	})
	Tabs.GamePlay:AddSection("Marco")
	local d = Dropdown(Tabs.GamePlay, "Marco: ", marco, Settings.Marco, function(value)
		Settings.Marco = value
		_G.Marco = value
	end)
	Tabs.GamePlay:AddButton({
	Title = "Refresh Marco",
	Description = "",
	Callback = function()
		table.clear(marco)
		if isfolder(path.."/Marco") then
			for _, filePath in ipairs(listfiles(path.."/Marco")) do
				local name = filePath:match("^.+[/\\]([^/\\]+)")
				if name then
					table.insert(marco, name)
				end
			end
		end
		d:SetValues(marco)
		Fluent:Notify({
			Title = "Zepth",
			Content = "Refresh Marco Successfully",
			Duration = 3
		})
	end
	})
	Tabs.GamePlay:AddButton({
		Title = "Delete Selected Marco",
		Description = "",
		Callback = function()
			local filePath = path.."/Marco/".._G.Marco
			if isfile(filePath) then
				delfile(filePath)
				Fluent:Notify({
					Title = "Yenix Hub",
					Content = "Deleted ".._G.Marco..".json successfully",
					Duration = 3
				})
			else
				Fluent:Notify({
					Title = "Yenix Hub",
					Content = "File not found",
					Duration = 3
				})
			end
		end
	})
	Tabs.GamePlay:AddSection("Marco Create")
	Tabs.GamePlay:AddInput("MarcoName", {
        Title = "Marco Name",
        Default = "",
        Placeholder = "Enter Marco Name",
        Numeric = false, 
        Finished = false,
        Callback = function(Value)
            MarcoName = Value
        end
    })
	Tabs.GamePlay:AddButton({
		Title = "Create File",
		Description = "",
		Callback = function()
			if not isfolder(path.."/Marco") then
				makefolder(path.."/Marco")
			end

			if isfile(path.."/Marco/"..MarcoName.."-"..LocalPlayer.Name..".json") then
				Fluent:Notify({
					Title = "Yenix Hub",
					Content = "File Already Exist",
					Duration = 5
				})
			else
				writefile(path.."/Marco/"..MarcoName.."-"..LocalPlayer.Name..".json", HttpService:JSONEncode(marco)) 
				Fluent:Notify({
					Title = "Yenix Hub",
					Content = "File Created Successfully",
					Duration = 5
				})
			end
		end
	})
	Tabs.GamePlay:AddSection("Marco Function")
	Toggle(Tabs.GamePlay, "Marco Playback", "Playbackmarco")
	Toggle(Tabs.GamePlay, "Marco Recording", "RecordingMarco")
	Tabs.Games:AddSection("General")
	Toggle(Tabs.Games, "Auto Play", "AutoPlay")
	Toggle(Tabs.Games, "Auto Retry", "AutoRetry")
	Toggle(Tabs.Games, "Auto Next", "AutoNext")
	local b = {} if LocalPlayer:FindFirstChild('UnitsFolder') then for i,v in pairs(LocalPlayer:FindFirstChild('UnitsFolder'):GetChildren()) do table.insert(b, v.Name) end end
	MultiDropdown(Tabs.Games, "Select Upgrade Slot:", b, Settings.UpdatesCatogory, function(value)
		local Values = {}
		for k, v in pairs(value) do
			if typeof(k) == "string" and v then
				table.insert(Values, k)
			end
		end
		Settings.UpdatesCatogory = Values
		_G.UpdatesCatogory = Settings.UpdatesCatogory 
	end)
	Toggle(Tabs.Games, "Auto Upgrade", "AutoUpgrade")
	Toggle(Tabs.Games, "Auto Upgrade Stats", "AutoUpgradeStatus")
	Toggle(Tabs.Settings, "Whitescreen", "WhiteScreen")
end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
	Title = "Zepthic Loaded Successfully",
	Content = "Loaded Anime ranger x Comeplete",
	Duration = 5
})

SaveManager:LoadAutoloadConfig()
