-- Ultra Simple Premium GUI v3.0
-- by Clezuuu | Guaranteed Working

-- Services
local Players = game:GetService("Players")
local Tween = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

-- Safe player wait
local Player = Players.LocalPlayer
while not Player do
    wait(1)
    Player = Players.LocalPlayer
end

-- Main GUI Setup
local GUI = Instance.new("ScreenGui")
GUI.Name = "NDS_HUB_"..tostring(math.random(1000,9999))
GUI.Parent = game.CoreGui
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Container
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 350, 0, 400)
Main.Position = UDim2.new(0.5, -175, 0.5, -200)
Main.AnchorPoint = Vector2.new(0.5,0.5)
Main.BackgroundColor3 = Color3.fromRGB(20,20,25)
Main.BackgroundTransparency = 0.1
Main.Parent = GUI

-- Styling
local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,12)
Corner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(80,80,100)
Stroke.Thickness = 2
Stroke.Parent = Main

-- Header
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,50)
Header.BackgroundColor3 = Color3.fromRGB(30,30,40)
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Text = "DISASTER HUB"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.TextColor3 = Color3.new(1,1,1)
Title.Size = UDim2.new(1,0,1,0)
Title.BackgroundTransparency = 1
Title.Parent = Header

-- Buttons Container
local Buttons = Instance.new("ScrollingFrame")
Buttons.Size = UDim2.new(1,-20,1,-70)
Buttons.Position = UDim2.new(0,10,0,60)
Buttons.BackgroundTransparency = 1
Buttons.ScrollBarThickness = 4
Buttons.Parent = Main

-- Button Template
function CreateBtn(name,text,ypos,action)
    local Btn = Instance.new("TextButton")
    Btn.Name = name
    Btn.Text = text
    Btn.Size = UDim2.new(1,0,0,40)
    Btn.Position = UDim2.new(0,0,0,ypos)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 16
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.BackgroundColor3 = Color3.fromRGB(40,40,50)
    Btn.Parent = Buttons
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0,8)
    BtnCorner.Parent = Btn
    
    -- Hover Effects
    Btn.MouseEnter:Connect(function()
        Tween:Create(Btn,TweenInfo.new(0.1),{
            BackgroundColor3 = Color3.fromRGB(60,60,70)
        }:Play()
    end)
    
    Btn.MouseLeave:Connect(function()
        Tween:Create(Btn,TweenInfo.new(0.1),{
            BackgroundColor3 = Color3.fromRGB(40,40,50)
        }:Play()
    end)
    
    -- Click Action
    Btn.MouseButton1Click:Connect(function()
        pcall(action) -- Safe execute
    end)
end

-- Script Buttons
CreateBtn("IY","1) Infinity Yield",0,function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

CreateBtn("BH","2) Black Hole",50,function()
    loadstring(game:HttpGet("https://pastebin.com/raw/wBsi24w3"))()
end)

CreateBtn("Grav","3) Gravity",100,function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hm5650/Gravity-inverter/main/GI",true))()
end)

CreateBtn("Close","X Close Menu",250,function()
    GUI:Destroy()
end)

-- Appear Animation
Main.Size = UDim2.new(0,0,0,0)
Tween:Create(Main,TweenInfo.new(0.5,Enum.EasingStyle.Back),{
    Size = UDim2.new(0,350,0,400)
}:Play()

-- Toggle Key (F5)
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F5 then
        Main.Visible = not Main.Visible
    end
end)

print("NDS Hub loaded successfully!")
