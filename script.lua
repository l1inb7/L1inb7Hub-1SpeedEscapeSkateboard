local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "+1 Speed Escape Skateboard [OP & FREE]",
   LoadingTitle = "🎲 L1inb7 Hub",
   LoadingSubtitle = "by L1inb7",
   ConfigurationSaving = {
      Enabled = false,
      FileName = "L1inb7 Hub"
   },
   KeySystem = false
})

local player = game.Players.LocalPlayer

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
-- AUTO WINS
----------------------------------------------------

local autowins = false

MainTab:CreateToggle({
   Name = "Auto Claim Wins",
   CurrentValue = false,
   Callback = function(Value)
      autowins = Value

      while autowins do

         local args = {
            [1] = "Free",
            [2] = Vector3.new(9914.46875, 6.305799961090088, -5766.15771484375)
         }

         game:GetService("ReplicatedStorage").Remote.Event.Player.ClaimWins:FireServer(unpack(args))

         task.wait(1)

      end
   end,
})

----------------------------------------------------
-- EQUIP BEST SKATEBOARD
----------------------------------------------------

MainTab:CreateButton({
   Name = "Equip Best Skateboard (Northern Star)",
   Callback = function()

      local args = {
         [1] = "Northern Star"
      }

      game:GetService("ReplicatedStorage").Remote.Event.UI.EquipBoard:FireServer(unpack(args))

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Northern Star Equipped!",
         Duration = 4
      })

   end,
})

----------------------------------------------------
-- OPEN EGG
----------------------------------------------------

MainTab:CreateButton({
   Name = "Open Egg",
   Callback = function()

      local args = {
         [1] = "Egg4"
      }

      game:GetService("ReplicatedStorage").Remote.Function.Eggs.OpenEgg:InvokeServer(unpack(args))

      Rayfield:Notify({
         Title = "L1inb7 Hub",
         Content = "Egg opened!",
         Duration = 4
      })

   end,
})
-------------------
-- MESSAGE TAB
----------------------------------------------------

local MsgTab = Window:CreateTab("💬 Message", nil)

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
