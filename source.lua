--[[
    FE Natural Survival Disaster GUI
    Версия 1.2.1
    Обновлено: 15.07.2023
]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Конфигурация
local PASSWORD = "2025" 
local DEBUG_MODE = true -- Режим отладки

-- Логирование
local function DebugPrint(...)
    if DEBUG_MODE then
        print("[DEBUG]", ...)
    end
end

-- Создаем GUI для пароля
local PasswordScreenGui = Instance.new("ScreenGui")
PasswordScreenGui.Name = "PasswordScreenGui"
PasswordScreenGui.Parent = CoreGui
PasswordScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PasswordScreenGui.ResetOnSpawn = false

-- Основной контейнер
local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordScreenGui
PasswordFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Стилизация
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = PasswordFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 90)
UIStroke.Thickness = 2
UIStroke.Parent = PasswordFrame

-- Элементы интерфейса
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Text = "Введите пароль"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextSize = 20
TitleLabel.Parent = PasswordFrame

local PasswordBox = Instance.new("TextBox")
PasswordBox.PlaceholderText = "Пароль..."
PasswordBox.Parent = PasswordFrame
PasswordBox.Size = UDim2.new(0.8, 0, 0, 40)
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)

local SubmitButton = Instance.new("TextButton")
SubmitButton.Text = "Подтвердить"
SubmitButton.Parent = PasswordFrame
SubmitButton.Size = UDim2.new(0.5, 0, 0, 40)
SubmitButton.Position = UDim2.new(0.25, 0, 0.7, 0)

-- Анимации
local function AnimateButton(button, isHovering)
    local targetSize = isHovering and UDim2.new(0.55, 0, 0, 42) or UDim2.new(0.5, 0, 0, 40)
    TweenService:Create(button, TweenInfo.new(0.2), {Size = targetSize}):Play()
end

-- Проверка пароля
local function CheckPassword()
    DebugPrint("Проверка пароля...")
    
    if PasswordBox.Text == PASSWORD then
        DebugPrint("Пароль верный!")
        
        -- Анимация успеха
        TweenService:Create(PasswordFrame, TweenInfo.new(0.5), {
            BackgroundColor3 = Color3.fromRGB(40, 80, 40),
            Size = UDim2.new(0, 300, 0, 0)
        }):Play()
        
        task.wait(0.5)
        PasswordScreenGui:Destroy()
        CreateMainGUI()
    else
        DebugPrint("Неверный пароль!")
        -- Анимация ошибки
        TweenService:Create(PasswordFrame, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(80, 40, 40)
        }):Play()
        task.wait(0.5)
        TweenService:Create(PasswordFrame, TweenInfo.new(0.5), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        }):Play()
    end
end

-- Создание основного меню
function CreateMainGUI()
    DebugPrint("Создание основного меню...")
    
    local MainScreenGui = Instance.new("ScreenGui")
    MainScreenGui.Name = "MainScreenGui"
    MainScreenGui.Parent = CoreGui
    MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Контейнер меню
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainScreenGui
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true

    -- Кнопки скриптов
    local function CreateScriptButton(name, text, position, scriptUrl)
        local button = Instance.new("TextButton")
        button.Name = name
        button.Text = text
        button.Parent = MainFrame
        button.Size = UDim2.new(0.9, 0, 0, 40)
        button.Position = position
        
        button.MouseButton1Click:Connect(function()
            DebugPrint("Запуск скрипта:", text)
            pcall(function()
                loadstring(game:HttpGet(scriptUrl))()
            end)
        end)
        
        return button
    end

    -- Список скриптов
    local scripts = {
        {"InfinityYield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
        {"SuperRingV6", "https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/main/Bylukaslol"},
        {"BlackHole", "https://pastebin.com/raw/wBsi24w3"}
    }

    -- Создаем кнопки
    for i, script in ipairs(scripts) do
        CreateScriptButton(
            script[1].."Button",
            i..") "..script[1],
            UDim2.new(0.05, 0, 0.1 + (i-1)*0.12, 0),
            script[2]
        )
    end

    -- Анимация появления
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {
        Size = UDim2.new(0, 400, 0, 500)
    }:Play()
end

-- Обработчики событий
SubmitButton.MouseButton1Click:Connect(CheckPassword)
PasswordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then CheckPassword() end
end)

SubmitButton.MouseEnter:Connect(function()
    AnimateButton(SubmitButton, true)
end)

SubmitButton.MouseLeave:Connect(function()
    AnimateButton(SubmitButton, false)
end)

-- Первоначальная настройка
PasswordFrame.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(PasswordFrame, TweenInfo.new(0.5), {
    Size = UDim2.new(0, 300, 0, 200)
}:Play()

DebugPrint("GUI инициализирован!")
