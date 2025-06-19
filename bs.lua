	
	local replicated = game:GetService("ReplicatedStorage")
	local PathfindingService = game:GetService("PathfindingService")
	local vim = game:GetService("VirtualInputManager")
	local teleport = game:GetService('TeleportService')
	local RunService = game:GetService("RunService")
	local Functions = require(replicated.Modules.Core.Net)
	
	
	local Players = game:GetService("Players")
	local Client = Players.LocalPlayer
	local Character = Client.Character or Client.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
	local RootPart = Character:WaitForChild("HumanoidRootPart")
	local Backpack = Client:WaitForChild("Backpack")
	
	Client.CharacterAdded:Connect(function(newCharacter)
		Character = newCharacter
		Humanoid = Character:WaitForChild('Humanoid')
		RootPart = Character:WaitForChild('HumanoidRootPart')
		Backpack = Client:WaitForChild("Backpack")
	end)	

	local fireproximityprompt = fireproximityprompt or getfenv().fireproximityprompt
	
	dist = function(Objective : CFrame)
		return (Objective.Position - Client.Character.HumanoidRootPart.Position).Magnitude
	end
	GetInfo = function(w : string)
		local amount = 0
		local IsHaving = false
		local Uid = nil
		for i, v in pairs(Client.PlayerGui.Items.ItemsHolder.ItemsScrollingFrame:GetChildren()) do
			if v.Name ~= 'Folder' and v.Name ~= 'UIGridLayout' then
				if v:FindFirstChild("ItemName") and v.ItemName.Text == w then
					Uid = v.Name
					amount = amount + 1
					IsHaving = true
					break
				end
			end
		end
		return {
			[1] = amount,
			[2] = IsHaving,
			[3] = Uid
		}
	end
	GetMoney = function()
		return tonumber(Client.PlayerGui.TopRightHud.Holder.Frame.MoneyTextLabel.Text:sub(2))
	end
	ATMMoney = function()
		for i,v in ipairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do 
			if v:IsA("TextLabel") then 
				if string.find(v.Text,"Bank Balance") then 
					return tonumber(v.Text:match("%$(%d+)"))
				end
			end
		end
	end
	GetChipPrice = function(types : string)
		local ChipPrice = {
			["HackToolBasic"] = 10,
			["HackToolPro"] = 150,
			["HackToolUltimate"] = 350,
		}
		return ChipPrice[types]
	end
	CheckingIsHacking = function()
		for i,v in pairs(Client.PlayerGui.SliderMinigame:GetChildren()) do
			if v.Visible then 
				return true
			else 
				return false
			end
		end
	end
	TeleportDetect = function()
		for _, v in pairs(Client.PlayerGui.Notifications.Frame:GetChildren()) do
			if v.Name == "Notification" and (v.Text == "Teleport detected" or v.Text == "Anti noclip triggered") then
				return true
			end
		end
		return false
	end
	
	do
		for _, v in pairs(workspace:GetDescendants()) do
			if v.Name == "DoorSystem" then v:Destroy() end
			if v.Name == "VehicleBlockers" then v:Destroy() end
		end
	end
	
	local function walkTo(destination: Vector3, value: boolean)
		local character = Client.Character or Client.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
	
		local path = PathfindingService:CreatePath({
			AgentCanJump = true,
			AgentJumpHeight = 2,
			AgentHeight = 5.5,
			AgentRadius = 2.5,
		})
	
		local success = pcall(function()
			path:ComputeAsync(rootPart.Position, destination)
		end)
	
		if success and path.Status == Enum.PathStatus.Success then
			if value then
				for _, wp in ipairs(path:GetWaypoints()) do
					if _G["StopWalking"] then return end
					if humanoid.Health <= 0 then break end
	
					local finished = false
					local conn
					conn = humanoid.MoveToFinished:Connect(function()
						finished = true
						if conn then conn:Disconnect() end
					end)
	
					humanoid:MoveTo(wp.Position)
	
					if wp.Action == Enum.PathWaypointAction.Jump then
						Client.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
	
					repeat task.wait() until finished or _G["StopWalking"]
					if _G["StopWalking"] then return end
				end
			end
		else
			warn(path.Status)
		end
	end
	
	local function Driveto(model: Model, destination: Vector3, value: boolean,t)
		_G["StopDriving"] = true
		task.wait()
		_G["StopDriving"] = false
	
		local path = PathfindingService:CreatePath({
			AgentRadius = 1.5,
			AgentHeight = 5.5,
			AgentCanJump = true,
			AgentMaxSlope = 45
		})
	
		local success, err = pcall(function()
			path:ComputeAsync(model.PrimaryPart.Position, destination)
		end)
	
		if success and path.Status == Enum.PathStatus.Success then
			local waypoints = path:GetWaypoints()
	
			for i, waypoint in ipairs(waypoints) do
				if _G["StopDriving"] then return end
	
				local startPos = model.PrimaryPart.Position
				local goalPos = waypoint.Position + Vector3.new(0, 1.5, 0)
				local dir = (goalPos - startPos).Unit
				local dist = (goalPos - startPos).Magnitude
				local movedDist = 0
				local speed = 55
				local startTime = tick()
	
				while movedDist < dist and not _G.StopDriving and value do
					if not value or (t and t:GetAttribute(_G.keys[3])) and not CheckingIsHacking() then
						local carclip = model.PrimaryPart:FindFirstChild("CarClip")
						if carclip then carclip:Destroy() end
						break
					end					
					task.wait()
	
					if _G["StopDriving"] then break end
					if Client.Character.Humanoid.Health <= 0 then break end
					if not _G["Auto ATM"] or not Client.Character.Humanoid.Sit then
						break
					end
	
					if TeleportDetect() then
						local carclip = model.PrimaryPart:FindFirstChild("CarClip")
						if carclip then carclip:Destroy() end
						Driveto(model, destination, value)
						break
					end
	
					if Client.Character.Humanoid.Sit then
						if model.PrimaryPart:FindFirstChild("CarClip") then
							if waypoint.Action == Enum.PathWaypointAction.Jump then
								local downPos = model.PrimaryPart.Position + Vector3.new(0, 6, 0)
								local jumpRotation = CFrame.lookAt(downPos, downPos + dir)
								model:SetPrimaryPartCFrame(jumpRotation)
								task.wait(0.2)
							end
	
							local dt = tick() - startTime
							movedDist = math.min(dt * speed, dist)
							local newPos = startPos + dir * movedDist
							local rotation = CFrame.lookAt(newPos, newPos + dir)
							model:SetPrimaryPartCFrame(rotation)
						else
							local i = Instance.new("BodyVelocity")
							i.Name = "CarClip"
							i.MaxForce = Vector3.new(100000, 100000, 100000)
							i.P = 1250
							i.Velocity = Vector3.zero
							i.Parent = model.PrimaryPart
						end
					end
				end
	
				if _G["StopDriving"] then break end
			end
	
			local carclip = model.PrimaryPart:FindFirstChild("CarClip")
			if carclip then carclip:Destroy() end
	
		else
			warn(path.Status)
		end
	end
	local function StopWalking()
		_G["StopWalking"] = true 
		if _G["StopWalking"] then  
		Client.Character.Humanoid:MoveTo(Client.Character.HumanoidRootPart.Position) 
		wait()
		_G["StopWalking"] = false
		end
	end

	Get_Vehicles = function(types : string, callback)
		for _, b in ipairs(workspace.Vehicles:GetChildren()) do
			if b:GetAttribute('OwnerUserId') ~= Client.UserId then
				local Checker = GetInfo(types)
				if Checker[2] then
					Functions.get("toggle_equip_item_1",Checker[3])
				end
			end 
			if b:GetAttribute('OwnerUserId') == Client.UserId and not CheckingIsHacking() and not TeleportDetect() then
				task.wait(0.2)
				Functions.send("lock_vehicle",b,true)     
				task.wait()                   
				callback(b)
			end
		end
	end
	
	local LoadFuncs = {}
	LoadFuncs.__index = LoadFuncs
	
	LoadFuncs['Auto ATM'] = setmetatable({}, {__call = function(self, value : boolean)
		if _G['AutoBike'] then
			Get_Vehicles("BMX",function(v)
				if not Client.Character.Humanoid.Sit and not CheckingIsHacking() and not TeleportDetect() then 
					v:SetPrimaryPartCFrame(Client.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5))
					fireproximityprompt(v.Chassis.DrivePromptAttachment.DrivePrompt, 1)
				elseif Client.Character.Humanoid.Sit and not CheckingIsHacking() and not TeleportDetect() then 
					local hacktool = GetInfo(_G['HackToolClass'])
					if hacktool[2] then 
						if hacktool[1] >= 0 then
							local closestATM, shortestDist = nil, math.huge
							for _, v in ipairs(workspace.Map.Props:GetChildren()) do
								if v.Name == "ATM" then
									_G.keys = {}
									for k in pairs(v:GetAttributes()) do table.insert(_G.keys, k) end
									table.sort(_G.keys)
									if _G.keys[3] and v:GetAttribute(_G.keys[3]) == false then
										local d = dist(v.Area.CFrame)
										if d < shortestDist then
											closestATM = v
											shortestDist = d
										end
									end
								end
							end
							if closestATM then 
								if closestATM:GetAttribute(_G.keys[3]) == false then
									repeat task.wait()
										if dist(closestATM.Area.CFrame) > 5 and not  CheckingIsHacking() and not TeleportDetect() then 
											Driveto(v, closestATM.Area.Position, value,closestATM)
										elseif dist(closestATM.Area.CFrame) < 5 and not CheckingIsHacking() and not TeleportDetect() and Humanoid.Sit then
											if _G.Deposit and GetMoney() >= _G.Money then
                                                Functions.get("transfer_funds","hand","bank",_G.Money)
                                            end
											Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
										elseif dist(closestATM.Area.CFrame) < 5 and not CheckingIsHacking() and not TeleportDetect() and not Humanoid.Sit then
											Functions.send("request_begin_hacking_2", closestATM, _G['HackToolClass'])
										elseif dist(closestATM.Area.CFrame) < 5 and CheckingIsHacking() and not TeleportDetect() and not Humanoid.Sit then
											wait(1.2)
											Functions.send("atm_win_2", closestATM)
										end
									until closestATM:GetAttribute(_G.keys[3]) == true or not value or hacktool[1] == 0
								end
							end
						end
					else 
						if GetMoney() <= GetChipPrice(_G.HackToolClass)*_G.Amount then
							if ATMMoney()  >= GetChipPrice(_G.HackToolClass) then
								local closestATMs, shortestDistd = nil, math.huge
								for _, vs in ipairs(workspace.Map.Props:GetChildren()) do
									if vs.Name == "ATM" then
										_G.keys = {}
										for k in pairs(vs:GetAttributes()) do table.insert(_G.keys, k) end
										table.sort(_G.keys)
										if _G.keys[3] and vs:GetAttribute(_G.keys[3]) == false then
											local d = dist(vs.Area.CFrame)
											if d < shortestDistd then
												closestATMs = vs
												shortestDistd = d
											end
										end
									end
								end
								if closestATMs then 
									if closestATMs:GetAttribute(_G.keys[3]) == false then
										repeat task.wait()
											if dist(closestATMs.Area.CFrame) > 5 and not  CheckingIsHacking() and not TeleportDetect() then 
												Driveto(v, closestATMs.Area.Position, value,closestATMs)
											elseif dist(closestATMs.Area.CFrame) < 5 and not CheckingIsHacking() and not TeleportDetect() and Humanoid.Sit then
												Functions.send("transfer_funds","bank","hand",GetChipPrice(_G.HackToolClass)*_G.Amount-GetMoney())		
											end
											return											
										until not value or GetMoney() <= GetChipPrice(_G.HackToolClass)*_G.Amount
									end
								end
							end
						else
							if dist(CFrame.new(-212, 255, 387)) < 20 then
								if GetMoney() >= GetChipPrice(_G.HackToolClass)*_G.Amount then
									for i = 1, _G["Amount"] do
										Functions.get("purchase_consumable", workspace:WaitForChild("ShopZone_Illegal"), _G["HackToolClass"])
									end
									return
								end
							end
							Driveto(v, Vector3.new(-212.181717, 255.525162, 387.744324), _G['Auto ATM'])	
						end		
					end
				end
			end)
		else 

		end
	end,})
	
	LoadFuncs["Auto Janitor Quest"] = setmetatable({}, {__call = function(self, value: boolean)
		if not value then StopWalking() end
			if value then 
				if Client:GetAttribute("Job") == "janitor" then
					if Client.Character:FindFirstChild'Mop' then
						local nearestPuddle = nil
						local shortestDistance = math.huge
		
						for _, puddle in ipairs(workspace.Map.Tiles.BurgerPlaceTile.BurgerPlace.Interior.Puddles:GetChildren()) do
							if puddle:IsA("BasePart") and puddle.Size.Magnitude > 0.001 and puddle.Transparency < 1 and puddle.Name ~= "NastyPuddle" and puddle.Name ~= "ToxicPuddle" and puddle.Name ~= "OilPuddle" then
								local distance = (puddle.Position - Client.Character.HumanoidRootPart.Position).Magnitude
								if distance < shortestDistance then
									nearestPuddle = puddle
									shortestDistance = distance
								end
							end
						end

						if nearestPuddle then
							walkTo(nearestPuddle.Position, value)
						end
					else 
						Humanoid:EquipTool('Mop')
					end
				else 
					if dist(CFrame.new(110, 255, -309)) < 3 then
						Functions.send("apply_for_job", workspace:WaitForChild("BurgePlaceBeacon"))
					end
					walkTo(Vector3.new(110.824829, 255.190384, -309.609131), value)
				end
			end
		end
	})
	
	
	LoadFuncs["Auto Steak House"] = setmetatable({}, {
		__call = function(self, value: boolean)
			if not value then StopWalking() return end
	
			local steakList = {"Steak", "BronzeSteak", "SilverSteak", "GoldenSteak", "DiamondSteak"}
			local progressGui = Client.PlayerGui.ProgressBar.ProgressBarFrame
			local RootPart = Client.Character and Client.Character:FindFirstChild("HumanoidRootPart")
	
			local hasSteak = false
			local steakTool = nil
	
			for _, name in pairs(steakList) do
				if Backpack:FindFirstChild(name) then
					hasSteak = true
					steakTool = Backpack:FindFirstChild(name)
					break
				elseif Character:FindFirstChild(name) then
					hasSteak = true
					break
				end
			end
	
			if Client:GetAttribute("Job") == "steakhouse_cook" then
				if not hasSteak and not progressGui.Visible then
					if dist(CFrame.new(-279.035919, 256.224487, 334.839172)) < 5 then
						vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
						vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
					end
					walkTo(Vector3.new(-279.16619873046875, 256.2244873046875, 335.1399841308594), value)
				else
					if hasSteak and not progressGui.Visible then
						if steakTool then
							Humanoid:EquipTool(steakTool)
						end
						if workspace:FindFirstChild("Beacon") and workspace.Beacon.PrimaryPart then
							walkTo(workspace.Beacon.PrimaryPart.Position, value)
						end
					elseif progressGui.Visible then
						local scale = progressGui.MainFrame.BarAmount.Size.X.Scale
						if scale > 0.95 and scale < 1 then
							for _, v in pairs(workspace.Map.Tiles.ShoppingTile.SteakHouse.Interior:GetChildren()) do
								if v.Name == "Grill" then
									Functions.send("finish_grilling_2", v, "Perfect")
								end
							end
						end
					end
				end
			else
				if dist(CFrame.new(-234.644211, 256.224518, 339.919342)) < 5 then
					Functions.send("apply_for_job", workspace.Map.Tiles.ShoppingTile.SteakHouse.Interior.SteakHouseBeacon)
				end
				walkTo(Vector3.new(-234.56198120117188, 256.2244873046875, 339.0831298828125), value)
			end
		end
	})
	
	
	LoadFuncs["Auto Seven Eleven Quest"] = setmetatable({}, {__call = function(self, Value : boolean)
		if not Value then StopWalking() end
		if Client:GetAttribute("Job") == "shelf_stocker" then 
			if not Client.Backpack:FindFirstChild("BoxTool") and not Client.Character:FindFirstChild("BoxTool") then
				if dist(CFrame.new(143, 255, 207)) < 5 then
					fireproximityprompt(workspace.Map.Tiles.GasStationTile.Quick11.Interior.ShelfStockingJob.NormalBox.ProximityPrompt,3)
				end
				walkTo(Vector3.new(143, 255, 207), Value)
			else
				if Client.Character:FindFirstChild"BoxTool" then
					repeat task.wait()
						for _,v in pairs(workspace.Map.Tiles.GasStationTile.Quick11.Interior.ShelfStockingJob.Shelves:GetChildren()) do 
							if v:FindFirstChild("Attachment") then
								walkTo(v.Position,Value)
							end
						end
					until not Client.Character:FindFirstChild("BoxTool") or not Value
				else
					Humanoid:EquipTool(Client.Backpack:FindFirstChild("BoxTool"))
				end
			end
		else
			if dist(CFrame.new(165.542587, 255.190521, 203.767914, -0.0388794467, 2.16780527e-09, -0.999243915, -1.72669912e-09, 1, 2.23662933e-09, 0.999243915, 1.81235249e-09, -0.0388794467)) < 5 then
				Functions.send("apply_for_job",workspace:WaitForChild("Map"):WaitForChild("Tiles"):WaitForChild("GasStationTile"):WaitForChild("Quick11"):WaitForChild("Interior"):WaitForChild("Quick11Beacon"))
			end
			walkTo(Vector3.new(166.34539794921875, 255.19053649902344, 203.02333068847656),Value)
		end
	end,})
	
	LoadFuncs['EnabledCustomWalkSpeed'] = setmetatable({},{__call = function(self, value : boolean)
		if value then 
			Functions.send("set_sprinting_1", true)
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetAttribute("TargetWalkSpeed", _G['SpeedAmount'])
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G['SpeedAmount']
		else 
			Functions.send("set_sprinting_1", false)
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetAttribute("TargetWalkSpeed", 8)
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 8
		end
	end,})
	
	LoadFuncs['EnabledCustomJumpPower'] = setmetatable({},{__call = function(self, value : boolean)
		if value then 
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpHeight = _G['JumpAmount']
		else 
			game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").JumpHeight = 3.895
		end
	end,})
	
	LoadFuncs['AutoRespawn'] = setmetatable({}, {__call = function(self, value : boolean)
			if not value then _G["Detected"] = false return end 
			if game:GetService("Players").LocalPlayer.PlayerGui.DeathScreen.DeathScreenHolder.Visible then 
				Functions.send('death_screen_request_respawn')            
			end
		end,
	})
	
	LoadFuncs['AutoRejoinDieded'] = setmetatable({},{__call = function(self, value : boolean)
		if Client.Character.Humanoid.Health <= 0 then 
			teleport:Teleport(game.PlaceId,Client)
		end
	end,})
	
	
	task.spawn(function()
		while task.wait() do 
			if _G['Auto Seven Eleven Quest'] or _G['Auto Janitor Quest'] or _G['Auto Steak House'] or _G['Auto ATM'] then 
				for _, v in pairs(Client.PlayerGui.Notifications.Frame:GetChildren()) do
					if v.Name == "Notification" and v.Text == "Teleport detected" then
						_G.detectedTeleport = true
					else 
						_G.detectedTeleport = false
					end
				end
	
				_G['AIWALKINGSPEED'] = _G.detectedTeleport and 24 or _G['OLD']
	
				pcall(function()
					Functions.send("set_sprinting_1", true)
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):SetAttribute("TargetWalkSpeed", _G['AIWALKINGSPEED'])
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = _G['AIWALKINGSPEED']
				end)
			end
		end
	end)
	
	LoadFuncs['AntiDied'] = setmetatable({},{__call = function(self, value : boolean)
		while _G['AntiDied'] do task.wait(0.8)
			if Client.Character.Humanoid.Health <= 30 then
				RootPart.Anchored = _G['AntiDied']
				Client.Character:PivotTo(CFrame.new(RootPart.CFrame.X,RootPart.CFrame.Y + 60,RootPart.CFrame.Z))
			end
		end
	end,})
	
	LoadFuncs['DamageAura'] = setmetatable({},{__call = function(self, value : boolean)
		if value then 
			for _, v in pairs(Client.Character:GetChildren()) do
				if v:IsA('Tool') then
					for _, vx in pairs(game:GetService("Players"):GetPlayers()) do
						if vx ~= Client and vx.Character and vx.Character:FindFirstChild("HumanoidRootPart") then
							if dist(vx.Character.HumanoidRootPart.CFrame) <  _G['Around'] then
								Functions.send("melee_attack", Client.Character:WaitForChild(v.Name), {vx}, vx.Character.HumanoidRootPart.CFrame, 0.4)
							end
						end
					end
				end
			end          
		end
	end,})
	
	if not _G.Has then 
		 _G.Has = Drawing.new("Circle")
		 _G.Has.Thickness = 1.5
		 _G.Has.Color = Color3.fromRGB(255,255,255)
		 _G.Has.Filled = false 
	end
	
	RunService.Stepped:Connect(function()
		local Mouse = Client:GetMouse()
		_G.Has.Radius = _G['AroundRadius']
		_G.Has.Visible = _G.FovCircle
		_G.Has.Position = Vector2.new(Mouse.X,Mouse.Y + 55)
	end)
	
	local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Marukulaes/Azura-Hub/refs/heads/main/library"))()
	
	local Windows = library.Create({
		Tabs = true,
		Name = "Yonix Hub",
		Color = Color3.fromRGB(238, 170, 47),
		TextMap = "Blockspin"
	})
	
	Windows.CreateTab({
		Name = "Instant Execution",
		Dis = "Execute any script instantly with our optimized engine"
	})
	
	Windows.CreateTab({
		Name = "Stable & Reliable",
		Dis = "Built for performance and stability across all games"
	})
	
	Windows.CreateTab({
		Name = "Auto Updates",
		Dis = "Stay up to date with automatic updates and patches"
	})
	
	local Tabs = {
		Tap_Home = Windows.CreateTabs({Name = "Home"}),
		Visual = Windows.CreateTabs({Name = "Visual"}),
	}
	
	local function AddSection(SectionModule, side, name)
		local sideName
		if side == 1 then
			sideName = "Left"
		else
			sideName = "Right"
		end
		local page = SectionModule.CreatePage({ Side = sideName,  Title = name })
		return page
	end
	
	local function AddLabel(item)
		return item.Section.CreateLabel({ Title = item.Title })
	end
	
	
	function AddToggle(Section, options, CallBack)
		local SettingName;
		local tasks;
		local Title, Description = options.Title, options.Description
		if type(CallBack) == "string" then
			if not SettingName then SettingName = CallBack end
			CallBack = nil
		end
		if not SettingName then SettingName = Title end
		return Section.CreateToggle({Title = Title, Value = _G[SettingName],CallBack = CallBack or function(Value)
			_G[SettingName] = Value
			if LoadFuncs[SettingName] then
				tasks = task.spawn(function() 
					while _G[SettingName] do
						LoadFuncs[SettingName](Value) 
						task.wait(.1)
					end
				end)
			end 
			if not Value and tasks ~= nil then task.cancel(tasks) tasks = nil end
		end,})
	end
	
	local function AddDropdown(Section, ClassMulti, item, config)
		return Section.CreateDropdown({
			Title = item.Title,
			List = config.Values or {},
			Multi = ClassMulti or false,
			Value = config.Default or {},
			Callback = config.Callback or function() return true end})
	end
	
	local function AddSlider(Section, item, config)
		return Section.CreateSlider({
			Title = item.Title,
			Min = config.Min,
			Max = config.Max,
			Value = config.Value,
			Callback = config.Callback or function() return true end})
	end
	
	local function AddButton(Section, title, callback)
		return Section.CreateButton({
			Title = title,
			Callback = callback or function() return true end})
	end
		
	local ATM = AddSection(Tabs.Tap_Home,1,"ATM")
	
	AddDropdown(ATM,false,{Title = "Select Hack Tool Type"},{Values = {"HackToolBasic","HackToolPro","HackToolUltimate"},Default = _G['HackToolClass'], Callback = function(v)
		_G['HackToolClass'] = v
	end})
	
	AddSlider(ATM,{Title="Item Amount"},{Min = 1, Max = 10, Value = _G['Amount'] or 3, Callback = function(v)
		_G['Amount'] = v
	end})

	AddSlider(ATM,{Title="Money Amount"},{Min = 1, Max = 10000, Value = _G['Money'] or 10000, Callback = function(v)
		_G['Money'] = v
	end})
	
	AddToggle(ATM,{
		Title = "Auto ATM",
		Description = "ไอ้สัสขโมย"
	},"Auto ATM")
	
	AddToggle(ATM,{
		Title = "Enabled Bike",
		Description = "ไอ้สัสขโมยระดับโหดๆ"
	},"AutoBike")
	AddToggle(ATM,{
		Title = "Enabled Deposit",
		Description = "EZ Money"
	},"Deposit")
	
	
	local Jobs = AddSection(Tabs.Tap_Home,1,"Job")
	AddToggle(Jobs,{
		Title = "Auto Janitor",
		Description = "ภารโรง"
		},"Auto Janitor Quest")
	AddToggle(Jobs,{
		Title = "Auto Steak House",
		Description = "เชฟ"
	},"Auto Steak House")
	AddToggle(Jobs,{
		Title = "Auto 7-11",
		Description = "พนักงานเซเว่น Eleven"
	},"Auto Seven Eleven Quest")
	local Modifiers = AddSection(Tabs.Tap_Home,1,"Modifies")
	AddToggle(Modifiers,{
		Title = "Enabled Custom WalkSpeed",
		Description = "WalkSpeed"
	},"EnabledCustomWalkSpeed")
	AddSlider(Modifiers,{Title="Speed Amount"},{Min = 1, Max = 30, Value = _G['SpeedAmount'] or 8, Callback = function(v)
		_G['SpeedAmount'] = v
	end})
	AddToggle(Modifiers,{
		Title = "Enabled Custom JumpPower",
		Description = "JumpPower"
	},"EnabledCustomJumpPower")
	AddSlider(Modifiers,{Title="Jump Amount"},{Min = 1, Max = 25, Value = _G['JumpAmount'] or 3.895, Callback = function(v)
		_G['JumpAmount'] = v
	end})
	local Settings = AddSection(Tabs.Tap_Home,2,"Settings")
	AddToggle(Settings,{
		Title = "Auto Respawn if u died",
		Description = "แก้ให้ถ้าแม่งตายห่าตายโหง"
	},"AutoRespawn")
	AddToggle(Settings,{
		Title = "Anti Died",
		Description = "กันแม่งถ้าแม่งตายอะ"
	},"AntiDied")
	AddToggle(Settings,{
		Title = "Auto Rejoin When Died",
		Description = "แม่งจะรีเกมตอนที่แม่งตายห่าตายโหงอะ"
	},"AutoRejoinDieded")
	AddSlider(Settings,{Title="Instant Speed"},{Min = 1, Max = 150, Value = _G['AIWALKINGSPEED'] or 24, Callback = function(v)
		_G['AIWALKINGSPEED'] = v
		_G['OLD'] = v
	end})
	
	local Crate = AddSection(Tabs.Tap_Home,2,"Ammo")
	
	AddDropdown(Crate,false,{Title = "Choose Ammo Crate Type"},{Values = {"Pistol","Rifle","Shotgun","Special"},Default = _G['AmmoCrate'], Callback = function(v)
		_G['AmmoCrate'] = v
	end})
	
	AddButton(Crate,"Open Crate (Must be Near)",function()
		Functions.send('open_crate',workspace:WaitForChild("Map"):WaitForChild("Tiles"):WaitForChild("GunShopTile"):WaitForChild("PatriotWeapons"):WaitForChild("Interior"):WaitForChild("Crates"):WaitForChild("Ammo Crate"):WaitForChild("CrateOptions"):WaitForChild(_G['AmmoCrate']),"money")
	end)
	
	local Guns = AddSection(Tabs.Tap_Home,2,"Guns")
	
	AddDropdown(Guns,false,{Title = "Choose Gun Crate Type"},{Values = {"Basic","Advanced","Superior","Elite","Legendary","Omega"},Default = _G['GunCrate'], Callback = function(v)
		_G['GunCrate'] = v
	end})
	
	AddButton(Guns,"Open Crate (Must be Near)",function()
		Functions.send('open_crate',workspace:WaitForChild("Map"):WaitForChild("Tiles"):WaitForChild("GunShopTile"):WaitForChild("PatriotWeapons"):WaitForChild("Interior"):WaitForChild("Crates"):WaitForChild("Weapon Crate"):WaitForChild("CrateOptions"):WaitForChild(_G['GunCrate']),"money")
	end)
	
	local Case = AddSection(Tabs.Tap_Home,2,"Car")
	
	AddDropdown(Case,false,{Title = "Choose Car Crate Type"},{Values = {'Basic','Rare','Elite'},Default = _G['CaseCrate'], Callback = function(v)
		_G['CaseCrate'] = v
	end})
	
	AddButton(Case,"Open Crate (Must be Near)",function()
		Functions.send('open_crate',workspace:WaitForChild("Map"):WaitForChild("Tiles"):WaitForChild("PrestigeDealerAndHousing"):WaitForChild("PrestigeCarDealer"):WaitForChild("Interior"):WaitForChild("Crates"):WaitForChild("Car Crate"):WaitForChild("CrateOptions"):WaitForChild(_G['CaseCrate']),"money")
	end)
	
	
	local Dm = AddSection(Tabs.Visual,1,"General")
	
	
	AddToggle(Dm,{
		Title = "Enabled Damage Aura",
		Description = "DamageAura"
	},"DamageAura")
	
	AddSlider(Dm,{Title="Range"},{Min = 1, Max = 30, Value = _G['Around'] or 8, Callback = function(v)
		_G['Around'] = v
	end})
	
	local DmsA = AddSection(Tabs.Visual,2,"Aimbot")
	
	
	AddToggle(DmsA,{
		Title = "Enabled Fov Circle",
		Description = "Circle Fov"
	},"FovCircle")
	
	AddSlider(DmsA,{Title="Radius Circle"},{Min = 1, Max = 200, Value = _G['AroundRadius'] or 100, Callback = function(v)
		_G['AroundRadius'] = v
	end})
	AddSlider(DmsA,{Title="Field of View"},{Min = 1, Max = 120, Value = _G['Field of View'] or 70, Callback = function(v)
		_G['Field of View'] = v
		workspace.Camera.FieldOfView = _G['Field of View']
	end})