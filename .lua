local worksoace = game:GetService("Workspace")
local WeaponMod = false
local Gravity = workspace.Gravity
local GravityMod = false

local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall
gmt.__namecall = newcclosure(function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" and WeaponMod == true then
		            for _,v in pairs(game.Players:GetPlayers()) do
                      Args[2]["part"] = v.Character.Head
                      Args[2]["h"] = v.Character.Head
		            end
                elseif tostring(self) == "WeaponFired" and tostring(method) == "FireServer" and WeaponMod == true then
		            for _,v in pairs(game.Players:GetPlayers()) do
                      Args[2]["origin"] = v.Character.Head
                      Args[2]["dir"] = v.Character.Head
		            end
		          end
                    return self.FireServer(self, unpack(Args))
                end
                return oldNamecall(self, ...)
            end)

local Library = 
loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window_1 = Library:NewWindow("Pubg Simulator")

local Tab1 = Window_1:NewSection("Damage Mod")
local Tab2 = Window_1:NewSection("Gravity Mod")

Tab1:CreateToggle("Instant Kill", function(value)
WeaponMod = value
end)

Tab2:CreateToggle("Zero Gravity", function(value)
GravityMod = value
if GravityMod == true then
    workspace.Gravity = 0
  else
    workspace.Gravity = Gravity
end
end)
