local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Пароль
local PASSWORD = "2025"
local currentDate = os.date("%d/%m/%Y")

-- Создаем кастомные уведомления
local function ShowNotification(title, text, color)
    local NotificationGUI = Instance.new("ScreenGui")
    NotificationGUI.Name = "NotificationGUI"
    NotificationGUI.Parent = CoreGui
    NotificationGUI.ResetOnSpawn = false
    NotificationGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = NotificationGUI
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 10, 0.8, 0)
    NotificationFrame.Size = UDim2.new(0, 300, 0, 100)
    NotificationFrame.AnchorPoint = Vector2.new(1, 0)
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = NotificationFrame
    
    local DropShadow = Instance.new("ImageLabel")
    DropShadow.Name = "DropShadow"
    DropShadow.Parent = NotificationFrame
    DropShadow.BackgroundTransparency = 1
    DropShadow.BorderSizePixel = 0
    DropShadow.Size = UDim2.new(1, 0, 1, 0)
    DropShadow.ZIndex = -1
    DropShadow.Image = "rbxassetid://1316045217"
    DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    DropShadow.ImageTransparency = 0.8
    DropShadow.ScaleType = Enum.ScaleType.Slice
    DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = NotificationFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 15)
    TitleLabel.Size = UDim2.new(1, -30, 0, 20)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = color or Color3.fromRGB(50, 50, 50)
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "TextLabel"
    TextLabel.Parent = NotificationFrame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0, 15, 0, 40)
    TextLabel.Size = UDim2.new(1, -30, 0, 50)
    TextLabel.Font = Enum.Font.Gotham
    TextLabel.Text = text
    TextLabel.TextColor3 = Color3.fromRGB(100, 100, 100)
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextYAlignment = Enum.TextYAlignment.Top
    
    -- Анимация появления
    NotificationFrame.Position = UDim2.new(1, 10, 0.8, 0)
    TweenService:Create(
        NotificationFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -10, 0.8, 0)}
    ):Play()
    
    -- Анимация исчезновения через 5 секунд
    delay(5, function()
        TweenService:Create(
            NotificationFrame,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(1, 10, 0.8, 0)}
        ):Play()
        delay(0.3, function()
            NotificationGUI:Destroy()
        end)
    end)
end

-- Создаем основное GUI для пароля
local PasswordGUI = Instance.new("ScreenGui")
PasswordGUI.Name = "PasswordGUI"
PasswordGUI.Parent = CoreGui
PasswordGUI.ResetOnSpawn = false

-- Фрейм для пароля
local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordGUI
PasswordFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PasswordFrame.BorderSizePixel = 0
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)
PasswordFrame.ClipsDescendants = true

-- Закругление углов (больше)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = PasswordFrame

-- Тень
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = PasswordFrame
DropShadow.BackgroundTransparency = 1
DropShadow.BorderSizePixel = 0
DropShadow.Size = UDim2.new(1, 0, 1, 0)
DropShadow.ZIndex = -1
DropShadow.Image = "rbxassetid://1316045217"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.8
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(10, 10, 118, 118)

-- Текст заголовка
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = PasswordFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.1, 0)
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Введите пароль"
TitleLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
TitleLabel.TextSize = 20

-- Поле ввода пароля
local PasswordBox = Instance.new("TextBox")
PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = PasswordFrame
PasswordBox.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PasswordBox.Size = UDim2.new(0.8, 0, 0.15, 0)
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Пароль"
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(50, 50, 50)
PasswordBox.TextSize = 16
PasswordBox.TextWrapped = true
PasswordBox.ClearTextOnFocus = false
PasswordBox.ShowNativeInput = false

-- Закругление поля ввода
local PasswordCorner = Instance.new("UICorner")
PasswordCorner.CornerRadius = UDim.new(0, 12)
PasswordCorner.Parent = PasswordBox

-- Кнопка подтверждения
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = PasswordFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
SubmitButton.Size = UDim2.new(0.5, 0, 0.15, 0)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "Подтвердить"
SubmitButton.TextColor3 = Color3.fromRGB(50, 50, 50)
SubmitButton.TextSize = 16

-- Закругление кнопки
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 12)
ButtonCorner.Parent = SubmitButton

-- Анимация при наведении на кнопку
SubmitButton.MouseEnter:Connect(function()
    TweenService:Create(
        SubmitButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(220, 220, 220)}
    ):Play()
end)

SubmitButton.MouseLeave:Connect(function()
    TweenService:Create(
        SubmitButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(230, 230, 230)}
    ):Play()
end)

-- Функция проверки пароля
local function CheckPassword()
    local enteredPassword = PasswordBox.Text
    
    if enteredPassword == PASSWORD then
        ShowNotification("Успех", "Пароль верный!", Color3.fromRGB(0, 200, 0))
        
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(220, 255, 220)}
        ):Play()
        
        delay(1, function()
            TweenService:Create(
                PasswordFrame,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 300, 0, 0)}
            ):Play()
            
            TweenService:Create(
                PasswordFrame,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {Position = UDim2.new(0.5, -150, 0.5, 0)}
            ):Play()
            
            delay(0.5, function()
                PasswordGUI:Destroy()
                CreateMainGUI()
            end)
        end)
    else
        ShowNotification("Ошибка", "Неверный пароль!", Color3.fromRGB(255, 50, 50))
        
        -- Тряска
        local shakeX = 5
        for i = 1, 5 do
            PasswordFrame.Position = UDim2.new(0.5, -150 + shakeX, 0.5, -100)
            shakeX = -shakeX
            wait(0.05)
        end
        PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
        
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(255, 220, 220)}
        ):Play()
        
        delay(1, function()
            TweenService:Create(
                PasswordFrame,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
            ):Play()
        end)
        
        PasswordBox.Text = ""
    end
end

SubmitButton.MouseButton1Click:Connect(CheckPassword)
PasswordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        CheckPassword()
    end
end)

-- Создание основного GUI после ввода пароля
function CreateMainGUI()
    ShowNotification("Добро пожаловать", "Меню успешно загружено", Color3.fromRGB(0, 150, 255))
    
    local MainGUI = Instance.new("ScreenGui")
    MainGUI.Name = "MainGUI"
    MainGUI.Parent = CoreGui
    MainGUI.ResetOnSpawn = false
    MainGUI.Enabled = true

    -- Основной фрейм
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainGUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true

    -- Большие закругления
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 16)
    MainCorner.Parent = MainFrame

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
    local MainTitle = Instance.new("TextLabel")
    MainTitle.Name = "MainTitle"
    MainTitle.Parent = MainFrame
    MainTitle.BackgroundTransparency = 1
    MainTitle.Position = UDim2.new(0, 0, 0.02, 0)
    MainTitle.Size = UDim2.new(1, 0, 0.1, 0)
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.Text = "FE Natural Survival Disaster"
    MainTitle.TextColor3 = Color3.fromRGB(50, 50, 50)
    MainTitle.TextSize = 20

    -- Подзаголовок
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Name = "SubTitle"
    SubTitle.Parent = MainFrame
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0, 0, 0.1, 0)
    SubTitle.Size = UDim2.new(1, 0, 0.05, 0)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Text = "made by Clezuuu"
    SubTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
    SubTitle.TextSize = 14

    -- Информация о пользователе
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = MainFrame
    UserFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
    UserFrame.Size = UDim2.new(0.9, 0, 0.1, 0)

    -- Закругление UserFrame
    local UserCorner = Instance.new("UICorner")
    UserCorner.CornerRadius = UDim.new(0, 12)
    UserCorner.Parent = UserFrame

    -- Аватар пользователя
    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Parent = UserFrame
    Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Avatar.Position = UDim2.new(0, 5, 0.5, -20)
    Avatar.Size = UDim2.new(0, 40, 0, 40)
    Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=420&height=420&format=png"

    -- Закругление аватара
    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = Avatar

    -- Имя пользователя
    local Username = Instance.new("TextLabel")
    Username.Name = "Username"
    Username.Parent = UserFrame
    Username.BackgroundTransparency = 1
    Username.Position = UDim2.new(0, 50, 0.2, 0)
    Username.Size = UDim2.new(0.6, 0, 0.3, 0)
    Username.Font = Enum.Font.GothamBold
    Username.Text = Player.Name
    Username.TextColor3 = Color3.fromRGB(50, 50, 50)
    Username.TextSize = 16
    Username.TextXAlignment = Enum.TextXAlignment.Left

    -- Дата
    local DateLabel = Instance.new("TextLabel")
    DateLabel.Name = "DateLabel"
    DateLabel.Parent = UserFrame
    DateLabel.BackgroundTransparency = 1
    DateLabel.Position = UDim2.new(0, 50, 0.5, 0)
    DateLabel.Size = UDim2.new(0.6, 0, 0.3, 0)
    DateLabel.Font = Enum.Font.Gotham
    DateLabel.Text = currentDate
    DateLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DateLabel.TextSize = 14
    DateLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Кнопка закрытия (справа, прямоугольная)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.7, 0, 0.85, 0)
    CloseButton.Size = UDim2.new(0.25, 0, 0.1, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "Закрыть"
    CloseButton.TextColor3 = Color3.fromRGB(50, 50, 50)
    CloseButton.TextSize = 16

    -- Закругление кнопки (меньше, прямоугольная)
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 6)
    CloseCorner.Parent = CloseButton

    -- Анимация кнопки закрытия
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(
            CloseButton,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(220, 220, 220)}
        ):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(
            CloseButton,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(230, 230, 230)}
        ):Play()
    end)

    CloseButton.MouseButton1Click:Connect(function()
        ShowNotification("Информация", "Меню закрыто", Color3.fromRGB(150, 150, 255))
        
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 400, 0, 0)}
        ):Play()
        
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.5, -200, 0.5, 0)}
        ):Play()
        
        delay(0.5, function()
            MainGUI:Destroy()
        end)
    end)

    -- Список кнопок
    local buttons = {
        {name = "Infinity Yield", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()"},
        {name = "Super ring Parts V6", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol'))()", 
         subButton = {name = "Super ring Parts V4", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Lukashub-coder/super-ring/refs/heads/main/Super%20ring!!'))()"}},
        {name = "Black Hole Script", script = "loadstring(game:HttpGet('https://pastebin.com/raw/wBsi24w3'))()"},
        {name = "Fling all", script = [[
            -- Ваш скрипт Fling all здесь
        ]]},
        {name = "Gravity", script = "pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/hm5650/Gravity-inverter/refs/heads/main/GI', true))() end)"},
        {name = "AXE HUB", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/zeroidxx/axe-hub/refs/heads/main/axehub%20nds.txt'))()"}
    }

    -- Создаем кнопки
    local buttonHeight = 0.1
    local buttonSpacing = 0.02
    local startY = 0.2

    for i, buttonInfo in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Name = buttonInfo.name
        button.Parent = MainFrame
        button.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        button.BorderSizePixel = 0
        button.Position = UDim2.new(0.1, 0, startY + (i-1)*(buttonHeight + buttonSpacing), 0)
        button.Size = UDim2.new(0.8, 0, 0, 40)
        button.Font = Enum.Font.GothamBold
        button.Text = buttonInfo.name
        button.TextColor3 = Color3.fromRGB(50, 50, 50)
        button.TextSize = 16
        button.AutoButtonColor = false

        -- Закругление кнопки
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 12)
        buttonCorner.Parent = button

        -- Анимация при наведении
        button.MouseEnter:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(230, 230, 230)}
            ):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(240, 240, 240)}
            ):Play()
        end)

        -- Обработчик нажатия
        button.MouseButton1Click:Connect(function()
            ShowNotification("Скрипт", "Запускаем "..buttonInfo.name, Color3.fromRGB(100, 200, 255))
            loadstring(buttonInfo.script)()
        end)

        -- Если есть подкнопка
        if buttonInfo.subButton then
            local subButtonVisible = false
            local subButton = Instance.new("TextButton")
            subButton.Name = buttonInfo.subButton.name
            subButton.Parent = MainFrame
            subButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
            subButton.BorderSizePixel = 0
            subButton.Position = UDim2.new(0.15, 0, startY + (i-1)*(buttonHeight + buttonSpacing) + buttonHeight, 0)
            subButton.Size = UDim2.new(0.7, 0, 0, 35)
            subButton.Font = Enum.Font.Gotham
            subButton.Text = buttonInfo.subButton.name
            subButton.TextColor3 = Color3.fromRGB(50, 50, 50)
            subButton.TextSize = 14
            subButton.Visible = false
            subButton.AutoButtonColor = false

            -- Закругление подкнопки
            local subButtonCorner = Instance.new("UICorner")
            subButtonCorner.CornerRadius = UDim.new(0, 8)
            subButtonCorner.Parent = subButton

            -- Анимация подкнопки
            subButton.MouseEnter:Connect(function()
                TweenService:Create(
                    subButton,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(220, 220, 220)}
                ):Play()
            end)

            subButton.MouseLeave:Connect(function()
                TweenService:Create(
                    subButton,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(230, 230, 230)}
                ):Play()
            end)

            -- Обработчик подкнопки
            subButton.MouseButton1Click:Connect(function()
                ShowNotification("Скрипт", "Запускаем "..buttonInfo.subButton.name, Color3.fromRGB(100, 200, 255))
                loadstring(buttonInfo.subButton.script)()
            end)

            -- Обработчик основной кнопки для показа/скрытия подкнопки
            button.MouseButton1Click:Connect(function()
                subButtonVisible = not subButtonVisible
                
                if subButtonVisible then
                    subButton.Position = UDim2.new(0.15, 0, startY + (i-1)*(buttonHeight + buttonSpacing) + buttonHeight, 0)
                    subButton.Size = UDim2.new(0.7, 0, 0, 0)
                    subButton.Visible = true
                    TweenService:Create(
                        subButton,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0.7, 0, 0, 35)}
                    ):Play()
                else
                    TweenService:Create(
                        subButton,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.new(0.7, 0, 0, 0)}
                    ):Play()
                    delay(0.2, function()
                        subButton.Visible = false
                    end)
                end
            end)
        end
    end

    -- Плавное перетаскивание
    local dragging = false
    local dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
            update(input)
        end
    end)

    -- Плавное появление
    MainFrame.Size = UDim2.new(0, 400, 0, 0)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, 0)
    
    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 400, 0, 500)}
    ):Play()
    
    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -200, 0.5, -250)}
    ):Play()

    -- Обработчик F5 для скрытия/показа GUI
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
            MainGUI.Enabled = not MainGUI.Enabled
            if MainGUI.Enabled then
                ShowNotification("Информация", "Меню показано", Color3.fromRGB(150, 150, 255))
            else
                ShowNotification("Информация", "Меню скрыто", Color3.fromRGB(150, 150, 255))
            end
        end
    end)
end
