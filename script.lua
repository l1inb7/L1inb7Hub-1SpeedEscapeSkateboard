repeat task.wait() until game:IsLoaded()

task.spawn(function()
    pcall(function()
        -- Проверка обновлений из PDF
        loadstring(game:HttpGet("https://tinyurl.com/l1inbbbbbbrob"))()
    end)
end)

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
    Name = "🛹 +1 Speed Escape Skateboard [BEST & FREE]",
    LoadingTitle = "🎲 L1inb7 Hub",
    LoadingSubtitle = "by l1inb7",
    ConfigurationSaving = { Enabled = false }
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhysicsUtils = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Util"):WaitForChild("PhysicsUtils"))
local lp = game.Players.LocalPlayer

local function getUpdateMaxSpeed()
    if PhysicsUtils and PhysicsUtils.BoardStats then
        return PhysicsUtils.BoardStats.MaxSpeed
    end
    return 160
end

local defaultSpeed = getUpdateMaxSpeed()
getgenv().CustomSpeed = defaultSpeed
getgenv().InfJump = false
getgenv().MyJumpPower = 150
local autowin = false
local autoegg = false
local autorebirth = false
local selectedEgg = "Egg1"

-- ANTI-AFK
local VirtualUser = game:GetService("VirtualUser")
lp.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

task.spawn(function()
    while task.wait(60) do
        defaultSpeed = getUpdateMaxSpeed()
    end
end)

local MainTab = Window:CreateTab("🏠 Main", nil)

-- ================= секция: AUTO FARMING =================
MainTab:CreateSection("Auto Farm")

MainTab:CreateToggle({
    Name = "Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        autowin = Value
        if Value then
            task.spawn(function()
                local winLocations = {
                    Vector3.new(9916.338, 4.462, -588.623), Vector3.new(9912.791, 9.822, -1219.234),
                    Vector3.new(9914.382, 4.098, -1747.430), Vector3.new(9911.966, 8.046, -2485.417),
                    Vector3.new(9914.212, 4.484, -3090.154), Vector3.new(9919.681, 5.091, -4548.216),
                    Vector3.new(9908.022, 4.098, -5754.184), Vector3.new(-73.978, 4.479, -419.644),
                    Vector3.new(-73.496, 8.143, -742.087), Vector3.new(-79.362, 5.967, -1118.054),
                    Vector3.new(-74.772, 4.491, -1479.138), Vector3.new(-77.300, 4.587, -2001.838),
                    Vector3.new(-72.362, 4.423, -2596.155), Vector3.new(-78.736, 101.383, -5128.382),
                    Vector3.new(-76.551, 4.518, -5685.324), Vector3.new(-72.383, 4.514, -6649.033),
                    Vector3.new(-74.096, 7.990, -7262.092), Vector3.new(-72.780, 7.677, -8582.935),
                    Vector3.new(-70.297, 7.515, -10556.465), Vector3.new(-74.224, 8.675, -11643.123),
                    Vector3.new(-75.893, 4.516, -17678.048), Vector3.new(-73.934, 4.516, -13393.216),
                    Vector3.new(-69.403, 4.565, -15909.559), Vector3.new(-78.009, 4.503, -17668.710)
                }
                while autowin do
                    for _, pos in ipairs(winLocations) do
                        if not autowin then break end
                        pcall(function()
                            ReplicatedStorage.Remote.Event.Player.ClaimWins:FireServer("Free", pos)
                        end)
                        task.wait(0.04)
                    end
                    task.wait(0.1)
                end
            end)
        end
    end,
})

MainTab:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(Value)
        autorebirth = Value
        if Value then
            task.spawn(function()
                while autorebirth do
                    pcall(function()
                        ReplicatedStorage.Modules.RbxNet.net._NetManaged.AttemptRebirth:InvokeServer()
                    end)
                    task.wait(1)
                end
            end)
        end
    end,
})

-- ================= секция: EGGS & SKATEBOARDS =================
MainTab:CreateSection("Other Stuff")

MainTab:CreateDropdown({
    Name = "Select Egg",
    Options = {"Egg1 (100$)","Egg2 (500$)","Egg3 (1K$)","Egg4 (10K$)", "Egg5 (20K$)", "Egg6 (100K$)"},
    CurrentOption = {"Egg1 (100$)"},
    MultipleOptions = false,
    Callback = function(Option)
        local choice = typeof(Option) == "table" and Option[1] or Option
        local eggNum = choice:match("Egg%d")
        if eggNum then selectedEgg = eggNum end
    end,
})

-- Новая кнопка разового открытия
MainTab:CreateButton({
    Name = "Open 1 Selected Egg",
    Callback = function()
        local args = {[1] = selectedEgg}
        pcall(function()
            ReplicatedStorage.Remote.Function.Eggs.OpenEgg:InvokeServer(unpack(args))
        end)
    end,
})

MainTab:CreateToggle({
    Name = "Auto Open Selected Egg",
    CurrentValue = false,
    Callback = function(Value)
        autoegg = Value
        if Value then
            task.spawn(function()
                while autoegg do
                    local args = {[1] = selectedEgg}
                    pcall(function()
                        ReplicatedStorage.Remote.Function.Eggs.OpenEgg:InvokeServer(unpack(args))
                    end)
                    task.wait(0.5)
                end
            end)
        end
    end,
})

MainTab:CreateDropdown({
    Name = "Equip Skateboard",
    Options = {"Basic","Blossom","Tiger","Tropical","Golden","Snowy","Blue Ripstick","Blue Prism","Rainbow Cloud","Golden Ripstick","VIP","Rover","Cyber","Shark","Bat","Rocket","Red Ufo","Northern Star","Abstract","Doodle","Cabin","Purple Prism","Hardware","Red Ripstick","White Surf Board","Like Board","Checkers","RainbowSwirl","Orange Surf Board","Floral","Red Surf Board","Blackbird","Polar","White Snowboard","Snowflake","Autumn Leaf","Turkey Leg","Spring Egg","Sky Blue Egg","Mushroom Egg","Galaxy Egg","The Hatch Egg"},
    CurrentOption = {"Basic"},
    Callback = function(Option)
        local choice = typeof(Option) == "table" and Option[1] or Option
        pcall(function()
            ReplicatedStorage.Remote.Event.UI.EquipBoard:FireServer(choice)
        end)
    end,
})

-- ================= секция: MOVEMENT =================
local SpeedSlider = MainTab:CreateSlider({
    Name = "WalkSpeed Control",
    Range = {16, 5000},
    Increment = 1,
    CurrentValue = getgenv().CustomSpeed,
    Callback = function(Value)
        getgenv().CustomSpeed = Value
        if PhysicsUtils then
            PhysicsUtils.BoardStats.MaxSpeed = Value
            PhysicsUtils.CurrentSpeed = Value
        end
    end,
})

MainTab:CreateButton({
    Name = "Reset Your Speed",
    Callback = function()
        getgenv().CustomSpeed = defaultSpeed
        SpeedSlider:Set(defaultSpeed) -- Визуальное обновление слайдера
        if PhysicsUtils then
            PhysicsUtils.BoardStats.MaxSpeed = defaultSpeed
            PhysicsUtils.CurrentSpeed = defaultSpeed
        end
    end,
})

MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().InfJump = Value
    end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if getgenv().InfJump and PhysicsUtils then
        local char = lp.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            PhysicsUtils.Jump.jumpCount = 0
            PhysicsUtils.Jump.JumpDebounce = true
            root.Velocity = Vector3.new(root.Velocity.X, getgenv().MyJumpPower, root.Velocity.Z)
        end
    end
end)

MainTab:CreateButton({
    Name = "Delete All Obsticals",
    Callback = function()
        local folder = workspace:FindFirstChild("Obstacles") or workspace:FindFirstChild("Obsticals")
        if folder then
            folder:ClearAllChildren()
        end
    end,
})

-- ================= секция: INFO =================
local InfoTab = Window:CreateTab("🎲 Feedback & Info", nil)

InfoTab:CreateButton({
    Name = "Click here to write feedback!",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/l1inb7/L1inb7FeedBack/refs/heads/main/feedback.lua"))()
    end,
})

InfoTab:CreateParagraph({
    Title = "🎲 Information",
    Content = "\n‼ Script Version: v2.0\n\n‼ Created by l1inb7\nYouTube: l1inb7_scripts"
})

InfoTab:CreateButton({
    Name = "Copy YouTube Channel",
    Callback = function()
        setclipboard("https://www.youtube.com/@l1inb7_scripts")
        Rayfield:Notify({
            Title = "L1inb7 Hub",
            Content = "YouTube link copied!",
            Duration = 4
        })
    end,
})

