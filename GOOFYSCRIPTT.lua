getgenv().autoTap = false 
getgenv().buyEgg = false

local RemotePath = game:GetService("ReplicatedStorage").Events

local function doTap()
    task.spawn(function()
        while task.wait() and autoTap do
            RemotePath.Tap:FireServer()
        end
    end)
end

local function buyEgg(eggType)
    task.spawn(function()
        while task.wait() and buyEgg do
            RemotePath.HatchEgg:InvokeServer({}, eggType, hatchAmount)
        end
    end)
end

doTap()
buyEgg("Starter", 1) -- 1 or 3

function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        return plyr.Character.HumanoidRootPart.Position;
    end
        return false;
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
    end
end
function teleportWorld(world)
    if game:GetService("Workspace").Portals:FindFirstChild(world) then
        teleportTO(game:GetService("Workspace").Portals[world].PortalPart.CFrame)
    end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "oweq exe", HidePremium = false, SaveConfig = true, ConfigFolder = "Tapping"})

local Tab1 = Window:MakeTab({
    Name = "Farming",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Tab3 = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Pet",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

Tab1:AddToggle({
    Name = "Auto Tap",
    Default = false,
    Callback = function(Value1)
        autoTap = Value1
        if autoTap then
            doTap()
            wait()
        end   
    end   
})

Tab2:AddButton({
	Name = "Starter Egg",
	Callback = function(Value2)
        buyEgg = Value2
      		print("button pressed")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]





local function buyEgg(eggType)
    task.spawn(function()
        while task.wait() and buyEgg do
            RemotePath.HatchEgg:InvokeServer({}, eggType, hatchAmount)
        end
    end)
end
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]



d:Button("Teleport Forest",function()
    teleportWorld('Forest')
end)

-- b:Label("Pretty Useless NGL",{
--     TextSize = 25; -- Self Explaining
--     TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
--     BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
-- }) 

-- b:Button("Button",function()
--     print("Elym Winning")
-- end)

-- b:Toggle("Toggle",function(bool)
--     shared.toggle = bool
--     print(shared.toggle)
-- end)

-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end)
