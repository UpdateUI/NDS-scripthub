local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Создаем GUI
local AxeHubGUI = Instance.new("ScreenGui")
AxeHubGUI.Name = "AxeHubGUI"
AxeHubGUI.Parent = CoreGui
AxeHubGUI.ResetOnSpawn = false

-- Основной контейнер
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = AxeHubGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Закругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- Тень
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = MainFrame
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Size = UDim2.new(1, 0, 1, 0)
DropShadow.ZIndex = -1
DropShadow.Image = "rbxassetid://1316045217"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.8
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Font = Enum.Font.GothamBold
Title.Text = "Axe Hub for Natural Disaster Survival"
Title.TextColor3 = Color3.fromRGB(50, 50, 50)
Title.TextSize = 18

-- Закругление заголовка
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = Title

-- Основное содержимое
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
ScrollFrame.Size = UDim2.new(1, 0, 0.8, 0)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 800)
ScrollFrame.ScrollBarThickness = 5

-- Секция Main Info
local MainInfoSection = Instance.new("Frame")
MainInfoSection.Name = "MainInfoSection"
MainInfoSection.Parent = ScrollFrame
MainInfoSection.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
MainInfoSection.BorderSizePixel = 0
MainInfoSection.Position = UDim2.new(0.05, 0, 0, 10)
MainInfoSection.Size = UDim2.new(0.9, 0, 0, 120)

local MainInfoCorner = Instance.new("UICorner")
MainInfoCorner.CornerRadius = UDim.new(0, 8)
MainInfoCorner.Parent = MainInfoSection

local MainInfoTitle = Instance.new("TextLabel")
MainInfoTitle.Name = "MainInfoTitle"
MainInfoTitle.Parent = MainInfoSection
MainInfoTitle.BackgroundTransparency = 1
MainInfoTitle.Position = UDim2.new(0, 10, 0, 5)
MainInfoTitle.Size = UDim2.new(1, -10, 0, 20)
MainInfoTitle.Font = Enum.Font.GothamBold
MainInfoTitle.Text = "Main Info"
MainInfoTitle.TextColor3 = Color3.fromRGB(70, 70, 70)
MainInfoTitle.TextSize = 16
MainInfoTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Элементы Main Info
local infoItems = {
    "Universal",
    "Scripts",
    "Script Hubs"
}

for i, item in ipairs(infoItems) do
    local InfoItem = Instance.new("TextLabel")
    InfoItem.Name = item
    InfoItem.Parent = MainInfoSection
    InfoItem.BackgroundTransparency = 1
    InfoItem.Position = UDim2.new(0, 20, 0, 15 + (i * 25))
    InfoItem.Size = UDim2.new(1, -20, 0, 20)
    InfoItem.Font = Enum.Font.Gotham
    InfoItem.Text = "• "..item
    InfoItem.TextColor3 = Color3.fromRGB(100, 100, 100)
    InfoItem.TextSize = 14
    InfoItem.TextXAlignment = Enum.TextXAlignment.Left
end

-- Секция Admin Commands
local AdminSection = Instance.new("Frame")
AdminSection.Name = "AdminSection"
AdminSection.Parent = ScrollFrame
AdminSection.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
AdminSection.BorderSizePixel = 0
AdminSection.Position = UDim2.new(0.05, 0, 0, 150)
AdminSection.Size = UDim2.new(0.9, 0, 0, 80)

local AdminCorner = Instance.new("UICorner")
AdminCorner.CornerRadius = UDim.new(0, 8)
AdminCorner.Parent = AdminSection

local AdminTitle = Instance.new("TextLabel")
AdminTitle.Name = "AdminTitle"
AdminTitle.Parent = AdminSection
AdminTitle.BackgroundTransparency = 1
AdminTitle.Position = UDim2.new(0, 10, 0, 5)
AdminTitle.Size = UDim2.new(1, -10, 0, 20)
AdminTitle.Font = Enum.Font.GothamBold
AdminTitle.Text = "Admin Commands"
AdminTitle.TextColor3 = Color3.fromRGB(70, 70, 70)
AdminTitle.TextSize = 16
AdminTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Infinite Yield
local InfiniteYield = Instance.new("TextLabel")
InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = AdminSection
InfiniteYield.BackgroundTransparency = 1
InfiniteYield.Position = UDim2.new(0, 20, 0, 30)
InfiniteYield.Size = UDim2.new(1, -20, 0, 20)
InfiniteYield.Font = Enum.Font.GothamBold
InfiniteYield.Text = "• Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(80, 80, 80)
InfiniteYield.TextSize = 14
InfiniteYield.TextXAlignment = Enum.TextXAlignment.Left

local NamelessAdmin = Instance.new("TextLabel")
NamelessAdmin.Name = "NamelessAdmin"
NamelessAdmin.Parent = AdminSection
NamelessAdmin.BackgroundTransparency = 1
NamelessAdmin.Position = UDim2.new(0, 30, 0, 50)
NamelessAdmin.Size = UDim2.new(1, -30, 0, 20)
NamelessAdmin.Font = Enum.Font.Gotham
NamelessAdmin.Text = "Nameless Admin"
NamelessAdmin.TextColor3 = Color3.fromRGB(120, 120, 120)
NamelessAdmin.TextSize = 13
NamelessAdmin.TextXAlignment = Enum.TextXAlignment.Left

-- Секция Universal Scripts
local UniversalSection = Instance.new("Frame")
UniversalSection.Name = "UniversalSection"
UniversalSection.Parent = ScrollFrame
UniversalSection.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
UniversalSection.BorderSizePixel = 0
UniversalSection.Position = UDim2.new(0.05, 0, 0, 250)
UniversalSection.Size = UDim2.new(0.9, 0, 0, 180)

local UniversalCorner = Instance.new("UICorner")
UniversalCorner.CornerRadius = UDim.new(0, 8)
UniversalCorner.Parent = UniversalSection

local UniversalTitle = Instance.new("TextLabel")
UniversalTitle.Name = "UniversalTitle"
UniversalTitle.Parent = UniversalSection
UniversalTitle.BackgroundTransparency = 1
UniversalTitle.Position = UDim2.new(0, 10, 0, 5)
UniversalTitle.Size = UDim2.new(1, -10, 0, 20)
UniversalTitle.Font = Enum.Font.GothamBold
UniversalTitle.Text = "Universal Scripts"
UniversalTitle.TextColor3 = Color3.fromRGB(70, 70, 70)
UniversalTitle.TextSize = 16
UniversalTitle.TextXAlignment = Enum.TextXAlignment.Left

-- Элементы Universal Scripts
local universalItems = {
    "RTX Shaders",
    "FE Invisible",
    "FPS Unlocker",
    "Fling Sniper",
    "Equip All Tools (If you have any)",
    "Fake Lag (R6 & R15)"
}

for i, item in ipairs(universalItems) do
    local UniversalItem = Instance.new("TextLabel")
    UniversalItem.Name = item
    UniversalItem.Parent = UniversalSection
    UniversalItem.BackgroundTransparency = 1
    UniversalItem.Position = UDim2.new(0, 20, 0, 15 + (i * 25))
    UniversalItem.Size = UDim2.new(1, -20, 0, 20)
    UniversalItem.Font = Enum.Font.Gotham
    UniversalItem.Text = "• "..item
    UniversalItem.TextColor3 = Color3.fromRGB(100, 100, 100)
    UniversalItem.TextSize = 14
    UniversalItem.TextXAlignment = Enum.TextXAlignment.Left
end

-- Кнопка закрытия
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.7, 0, 0.9, 0)
CloseButton.Size = UDim2.new(0.25, 0, 0.08, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "Close"
CloseButton.TextColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.TextSize = 14

-- Закругление кнопки
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

-- Анимация кнопки
CloseButton.MouseEnter:Connect(function()
    TweenService:Create(
        CloseButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(235, 235, 235)}
    ):Play()
end)

CloseButton.MouseLeave:Connect(function()
    TweenService:Create(
        CloseButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(245, 245, 245)}
    ):Play()
end)

-- Функция закрытия
CloseButton.MouseButton1Click:Connect(function()
    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 0, 0, 500)}
    ):Play()
    wait(0.3)
    AxeHubGUI:Destroy()
end)

-- Плавное появление
MainFrame.Size = UDim2.new(0, 0, 0, 500)
TweenService:Create(
    MainFrame,
    TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 400, 0, 500)}
):Play()
