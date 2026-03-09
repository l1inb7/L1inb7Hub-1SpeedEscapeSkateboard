local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "+1 Speed Escape Skateboard [OP & FREE]",
   LoadingTitle = "🎲 L1inb7 Hub",
   LoadingSubtitle = "by L1inb7",
   ConfigurationSaving = {
      Enabled = false,
      FileName = "L1inb7Hub"
   },
   KeySystem = false
})

local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

----------------------------------------------------
-- MAIN TAB
----------------------------------------------------

local MainTab = Window:CreateTab("Main", 4483362458)

Rayfield:Notify({
   Title = "You executed the script",
   Content = "Thanks for using L1inb7 Hub!",
   Duration = 5
})

----------------------------------------------------
-- AUTO WIN
----------------------------------------------------

local autowin = false

MainTab:CreateToggle({
   Name = "Auto Win",
   CurrentValue = false,
   Callback = function(Value)
      autowin = Value

      task.spawn(function()
         while autowin do

            local args = {
               [1] = "Free",
               [2] = Vector3.new(9914.46875, 6.3058, -5766.1577)
            }

            ReplicatedStorage.Remote.Event.Player.ClaimWins
            :FireServer(unpack(args))

            task.wait(1)

         end
      end)
   end,
})

----------------------------------------------------
-- SKATEBOARD SYSTEM
----------------------------------------------------

local Skateboards = {
   "Basic",
   "Blossom",
   "Tiger",
   "Tropical",
   "Golden",
   "Snowy",
   "Blue Ripstick",
   "Blue Prism",
   "Rainbow Cloud",
   "Golden Ripstick",
   "VIP",
   "Rover",
   "Cyber",
   "Shark",
   "Bat",
   "Rocket",
   "Red Ufo",
   "Northern Star"
}

local SelectedBoard = "Basic"

MainTab:CreateDropdown({
   Name = "Select Skateboard",
   Options = Skateboards,
   CurrentOption = {"Basic"},
   MultipleOptions = false,
   Callback = function(Option)
      SelectedBoard = Option[1]
   end,
})

MainTab:CreateButton({
   Name = "Equip Selected Skateboard",
   Callback = function()

      ReplicatedStorage.Remote.Event.UI.EquipBoard
      :FireServer(SelectedBoard)

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = SelectedBoard.." Equipped!",
         Duration = 4
      })

   end,
})

----------------------------------------------------
-- EGG SYSTEM
----------------------------------------------------

local EggNames = {
   ["Egg1 (100)"] = "Egg1",
   ["Egg2 (500)"] = "Egg2",
   ["Egg3 (1K)"] = "Egg3",
   ["Egg4 (10K)"] = "Egg4"
}

local EggOptions = {
   "Egg1 (100)",
   "Egg2 (500)",
   "Egg3 (1K)",
   "Egg4 (10K)"
}

local SelectedEgg = "Egg1"

MainTab:CreateDropdown({
   Name = "Select Egg",
   Options = EggOptions,
   CurrentOption = {"Egg1 (100)"},
   MultipleOptions = false,
   Callback = function(Option)
      SelectedEgg = EggNames[Option[1]]
   end,
})

MainTab:CreateButton({
   Name = "Open Selected Egg",
   Callback = function()

      ReplicatedStorage.Remote.Function.Eggs.OpenEgg
      :InvokeServer(SelectedEgg)

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = SelectedEgg.." opened!",
         Duration = 4
      })

   end,
})

----------------------------------------------------
-- WORLD TELEPORT
----------------------------------------------------

local WorldNames = {
   ["World 1"] = "World 1",
   ["World 2 🔒 (Need Unlock)"] = "World 2"
}

local WorldOptions = {
   "World 1",
   "World 2 🔒 (Need Unlock)"
}

local SelectedWorld = "World 1"

MainTab:CreateDropdown({
   Name = "Select World",
   Options = WorldOptions,
   CurrentOption = {"World 1"},
   MultipleOptions = false,
   Callback = function(Option)
      SelectedWorld = WorldNames[Option[1]]
   end,
})

MainTab:CreateButton({
   Name = "Teleport To World",
   Callback = function()

      local args = {
         [1] = SelectedWorld
      }

      game:GetService("ReplicatedStorage")
      .Modules.RbxNet.net._NetManaged.TeleportToWorld
      :FireServer(unpack(args))

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Teleported to "..SelectedWorld,
         Duration = 4
      })

   end,
})

----------------------------------------------------
-- MESSAGE TAB
----------------------------------------------------

local MsgTab = Window:CreateTab("💬 Message", 4483362458)

MsgTab:CreateButton({
   Name = "Ty for testing my scripts",
   Callback = function()
      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Thanks for testing ❤️",
         Duration = 5
      })
   end,
})

MsgTab:CreateButton({
   Name = "My YT is L1inb7_Scriptss",
   Callback = function()
      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Subscribe on YouTube!",
         Duration = 5
      })
   end,
})----------------------------------------------------
-- MESSAGE TAB
----------------------------------------------------

local MsgTab = Window:CreateTab("💬 Message", 4483362458)

MsgTab:CreateButton({
   Name = "Ty for testing my scripts",
   Callback = function()
      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Thanks for testing ❤️",
         Duration = 5
      })
   end,
})

MsgTab:CreateButton({
   Name = "My YT is L1inb7_Scriptss",
   Callback = function()
      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Subscribe on YouTube!",
         Duration = 5
      })
   end,
})
