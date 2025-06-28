local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Пароль
local PASSWORD = "2025"
local currentDate = os.date("%d/%m/%Y")

-- Создаем GUI для пароля
local PasswordGUI = Instance.new("ScreenGui")
PasswordGUI.Name = "PasswordGUI"
PasswordGUI.Parent = CoreGui

-- Фрейм для пароля (новый дизайн)
local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordGUI
PasswordFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PasswordFrame.BorderSizePixel = 0
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Закругление (новый дизайн)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = PasswordFrame

-- Тень (новый дизайн)
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = PasswordFrame
DropShadow.BackgroundTransparency = 1
DropShadow.Size = UDim2.new(1, 0, 1, 0)
DropShadow.ZIndex = -1
DropShadow.Image = "rbxassetid://1316045217"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.8

-- Заголовок (новый дизайн)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = PasswordFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "FE Natural Survival Disaster"
TitleLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.TextSize = 18

-- Поле ввода (стиль из нового дизайна)
local PasswordBox = Instance.new("TextBox")
PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = PasswordFrame
PasswordBox.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PasswordBox.Size = UDim2.new(0.8, 0, 0, 30)
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Пароль"
PasswordBox.TextColor3 = Color3.fromRGB(50, 50, 50)

-- Кнопка (стиль из нового дизайна)
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = PasswordFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
SubmitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
SubmitButton.Size = UDim2.new(0.5, 0, 0, 30)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "Подтвердить"
SubmitButton.TextColor3 = Color3.fromRGB(50, 50, 50)

-- Закругление кнопки
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = SubmitButton

-- ДАЛЕЕ ИДЁТ ВАШ ФУНКЦИОНАЛ БЕЗ ИЗМЕНЕНИЙ:
local function CheckPassword()
    -- Ваш код проверки пароля
end

SubmitButton.MouseButton1Click:Connect(CheckPassword)

function CreateMainGUI()
    -- Ваш основной функционал меню:
    -- 1. Категории Troll/Teleport
    -- 2. Все ваши скрипты
    -- 3. Система телепортации
    -- 4. Массовый телепорт
    
    -- Но в новом дизайне:
    local MainGUI = Instance.new("ScreenGui")
    MainGUI.Name = "MainGUI"
    
    local MainFrame = Instance.new("Frame")
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Белый фон
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    
    -- Добавляем закругления и тени (новый дизайн)
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Image = "rbxassetid://1316045217"
    DropShadow.Parent = MainFrame
    
    -- Ваши кнопки и функционал остаются прежними, но с новым стилем:
    local TrollButton = Instance.new("TextButton")
    TrollButton.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Светло-серый
    TrollButton.TextColor3 = Color3.fromRGB(50, 50, 50) -- Темно-серый текст
    TrollButton.Font = Enum.Font.GothamBold -- Новый шрифт
    
    -- ... остальной ваш код ...
end
