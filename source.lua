local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

-- Пароль
local PASSWORD = "2025"
local currentDate = os.date("%d/%m/%Y")

-- Китайская цветовая палитра (красный, золотой, белый)
local ColorPalette = {
    Background = Color3.fromRGB(250, 245, 240),  -- Кремовый фон
    Card = Color3.fromRGB(255, 255, 255),       -- Белые карточки
    Primary = Color3.fromRGB(200, 16, 46),      -- Китайский красный
    PrimaryLight = Color3.fromRGB(220, 50, 80),
    Secondary = Color3.fromRGB(212, 175, 55),   -- Золотой
    Text = Color3.fromRGB(60, 60, 60),          -- Темный текст
    TextLight = Color3.fromRGB(120, 120, 120),
    Success = Color3.fromRGB(0, 180, 60),       -- Зеленый успех
    Error = Color3.fromRGB(200, 50, 50)         -- Красный ошибка
}

-- Специальные эффекты для китайского стиля
local function createChineseBorder(parent)
    local border = Instance.new("Frame")
    border.Name = "ChineseBorder"
    border.Parent = parent
    border.BackgroundColor3 = ColorPalette.Secondary
    border.BorderSizePixel = 0
    border.Size = UDim2.new(1, 6, 1, 6)
    border.Position = UDim2.new(0, -3, 0, -3)
    border.ZIndex = -1
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.15, 0)
    corner.Parent = border
    
    return border
end

local function createRippleEffect(button)
    local ripple = Instance.new("Frame")
    ripple.Name = "RippleEffect"
    ripple.Parent = button
    ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ripple.BackgroundTransparency = 0.8
    ripple.Size = UDim2.new(0, 0, 0, 0)
    ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.ZIndex = 2
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = ripple
    
    return ripple
end

-- Функция для создания кнопки в китайском стиле
local function createChineseButton(parent, name, size, position)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = parent
    button.BackgroundColor3 = ColorPalette.Primary
    button.BorderSizePixel = 0
    button.Size = size
    button.Position = position
    button.Font = Enum.Font.GothamBold
    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 16
    button.AutoButtonColor = false
    button.ClipsDescendants = true

    -- Закругление
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.1, 0)
    corner.Parent = button

    -- Китайская граница
    createChineseBorder(button)

    -- Эффект при наведении
    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = ColorPalette.PrimaryLight}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = ColorPalette.Primary}
        ):Play()
    end)

    -- Эффект нажатия с волной
    button.MouseButton1Down:Connect(function()
        local ripple = createRippleEffect(button)
        
        TweenService:Create(
            ripple,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(2, 0, 2, 0), BackgroundTransparency = 1}
        ):Play()
        
        TweenService:Create(
            button,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = size - UDim2.new(0.02, 0, 0.02, 0)}
        ):Play()
        
        delay(0.5, function()
            ripple:Destroy()
        end)
    end)

    button.MouseButton1Up:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = size}
        ):Play()
    end)

    return button
end

-- Создаем кастомные уведомления в китайском стиле
local function ShowNotification(title, text, color)
    local NotificationGUI = Instance.new("ScreenGui")
    NotificationGUI.Name = "NotificationGUI"
    NotificationGUI.Parent = CoreGui
    NotificationGUI.ResetOnSpawn = false
    NotificationGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Name = "NotificationFrame"
    NotificationFrame.Parent = NotificationGUI
    NotificationFrame.BackgroundColor3 = ColorPalette.Card
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.Position = UDim2.new(1, 10, 0.8, 0)
    NotificationFrame.Size = UDim2.new(0, 300, 0, 100)
    NotificationFrame.AnchorPoint = Vector2.new(1, 0)
    
    -- Китайский стиль
    createChineseBorder(NotificationFrame)
    createCorner(NotificationFrame, 0.05)
    
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = NotificationFrame
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0, 15)
    TitleLabel.Size = UDim2.new(1, -30, 0, 20)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = title
    TitleLabel.TextColor3 = color or ColorPalette.Primary
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
    TextLabel.TextColor3 = ColorPalette.TextLight
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.TextYAlignment = Enum.TextYAlignment.Top
    
    -- Анимация появления с эффектом скольжения
    NotificationFrame.Position = UDim2.new(1, 10, 0.8, 0)
    local slideTween = TweenService:Create(
        NotificationFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(1, -10, 0.8, 0)}
    )
    slideTween:Play()
    
    -- Анимация исчезновения через 5 секунд
    delay(5, function()
        slideTween:Destroy()
        TweenService:Create(
            NotificationFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Position = UDim2.new(1, 10, 0.8, 0)}
        ):Play()
        delay(0.5, function()
            NotificationGUI:Destroy()
        end)
    end)
end

-- Создаем основное GUI для пароля
local PasswordGUI = Instance.new("ScreenGui")
PasswordGUI.Name = "PasswordGUI"
PasswordGUI.Parent = CoreGui
PasswordGUI.ResetOnSpawn = false

-- Фрейм для пароля с китайским стилем
local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordGUI
PasswordFrame.BackgroundColor3 = ColorPalette.Card
PasswordFrame.BorderSizePixel = 0
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)
PasswordFrame.ClipsDescendants = true

-- Китайский стиль
createChineseBorder(PasswordFrame)
createCorner(PasswordFrame, 0.05)

-- Текст заголовка с золотым оттенком
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = PasswordFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.1, 0)
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Введите пароль"
TitleLabel.TextColor3 = ColorPalette.Secondary
TitleLabel.TextSize = 20

-- Поле ввода пароля с анимацией
local PasswordBox = Instance.new("TextBox")
PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = PasswordFrame
PasswordBox.BackgroundColor3 = ColorPalette.Background
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PasswordBox.Size = UDim2.new(0.8, 0, 0.15, 0)
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Пароль"
PasswordBox.Text = ""
PasswordBox.TextColor3 = ColorPalette.Text
PasswordBox.TextSize = 16
PasswordBox.TextWrapped = true
PasswordBox.ClearTextOnFocus = false
PasswordBox.ShowNativeInput = false

-- Стиль фокуса с анимацией
PasswordBox.Focused:Connect(function()
    TweenService:Create(
        PasswordBox,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(245, 245, 245), Size = UDim2.new(0.82, 0, 0.17, 0)}
    ):Play()
end)

PasswordBox.FocusLost:Connect(function()
    TweenService:Create(
        PasswordBox,
        TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = ColorPalette.Background, Size = UDim2.new(0.8, 0, 0.15, 0)}
    ):Play()
end)

-- Кнопка подтверждения в китайском стиле
local SubmitButton = createChineseButton(PasswordFrame, "Подтвердить", UDim2.new(0.5, 0, 0.15, 0), UDim2.new(0.25, 0, 0.7, 0))

-- Функция проверки пароля с анимацией
local function CheckPassword()
    local enteredPassword = PasswordBox.Text
    
    if enteredPassword == PASSWORD then
        ShowNotification("Успех", "Пароль верный!", ColorPalette.Success)
        
        -- Анимация успеха
        local particles = Instance.new("ParticleEmitter")
        particles.Parent = PasswordFrame
        particles.LightEmission = 0.8
        particles.Texture = "rbxassetid://296874871"
        particles.Color = ColorSequence.new(ColorPalette.Success)
        particles.Size = NumberSequence.new(0.5)
        particles.Lifetime = NumberRange.new(1)
        particles.Speed = NumberRange.new(5)
        particles.EmissionDirection = Enum.NormalId.Top
        particles.Rate = 50
        
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(220, 255, 220)}
        ):Play()
        
        delay(1, function()
            particles.Enabled = false
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
        ShowNotification("Ошибка", "Неверный пароль!", ColorPalette.Error)
        
        -- Анимация ошибки (тряска)
        local shakeX = 5
        for i = 1, 5 do
            PasswordFrame.Position = UDim2.new(0.5, -150 + shakeX, 0.5, -100)
            shakeX = -shakeX
            wait(0.05)
        end
        PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
        
        -- Красное мерцание
        for i = 1, 3 do
            TweenService:Create(
                PasswordFrame,
                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(255, 220, 220)}
            ):Play()
            wait(0.1)
            TweenService:Create(
                PasswordFrame,
                TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),
                {BackgroundColor3 = ColorPalette.Card}
            ):Play()
            wait(0.1)
        end
        
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
    ShowNotification("Добро пожаловать", "Меню успешно загружено", ColorPalette.Primary)
    
    local MainGUI = Instance.new("ScreenGui")
    MainGUI.Name = "MainGUI"
    MainGUI.Parent = CoreGui
    MainGUI.ResetOnSpawn = false
    MainGUI.Enabled = true

    -- Основной фрейм с китайским стилем
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainGUI
    MainFrame.BackgroundColor3 = ColorPalette.Card
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true

    -- Китайский стиль
    createChineseBorder(MainFrame)
    createCorner(MainFrame, 0.05)

    -- Заголовок с золотым текстом
    local MainTitle = Instance.new("TextLabel")
    MainTitle.Name = "MainTitle"
    MainTitle.Parent = MainFrame
    MainTitle.BackgroundTransparency = 1
    MainTitle.Position = UDim2.new(0, 0, 0.02, 0)
    MainTitle.Size = UDim2.new(1, 0, 0.1, 0)
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.Text = "FE Natural Survival Disaster"
    MainTitle.TextColor3 = ColorPalette.Secondary
    MainTitle.TextSize = 20

    -- Подзаголовок
    local SubTitle = Instance.new("TextLabel")
    SubTitle.Name = "SubTitle"
    SubTitle.Parent = MainFrame
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0, 0, 0.1, 0)
    SubTitle.Size = UDim2.new(1, 0, 0.05, 0)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Text = "made by Clezuuu | 中国风格"
    SubTitle.TextColor3 = ColorPalette.TextLight
    SubTitle.TextSize = 14

    -- Кнопки категорий
    local CategoryFrame = Instance.new("Frame")
    CategoryFrame.Name = "CategoryFrame"
    CategoryFrame.Parent = MainFrame
    CategoryFrame.BackgroundTransparency = 1
    CategoryFrame.Position = UDim2.new(0, 0, 0.15, 0)
    CategoryFrame.Size = UDim2.new(1, 0, 0.05, 0)

    -- Кнопка Troll в китайском стиле
    local TrollButton = createChineseButton(CategoryFrame, "Troll", UDim2.new(0.35, 0, 1, 0), UDim2.new(0.1, 0, 0, 0))

    -- Кнопка Teleport в китайском стиле
    local TeleportButton = createChineseButton(CategoryFrame, "Teleport", UDim2.new(0.35, 0, 1, 0), UDim2.new(0.55, 0, 0, 0))
    TeleportButton.BackgroundColor3 = ColorPalette.Background
    TeleportButton.TextColor3 = ColorPalette.Text

    -- Контейнер для контента
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Name = "ContentFrame"
    ContentFrame.Parent = MainFrame
    ContentFrame.BackgroundTransparency = 1
    ContentFrame.Position = UDim2.new(0, 0, 0.2, 0)
    ContentFrame.Size = UDim2.new(1, 0, 0.6, 0)
    ContentFrame.ClipsDescendants = true

    -- Функция для создания кнопок тролля
    local function CreateTrollButtons()
        -- Очищаем контент
        for _, child in ipairs(ContentFrame:GetChildren()) do
            child:Destroy()
        end

        -- Список кнопок тролля
        local trollButtons = {
            {name = "Infinity Yield", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()"},
            {name = "Super ring Parts V6", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol'))()", 
             subButton = {name = "Super ring Parts V4", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Lukashub-coder/super-ring/refs/heads/main/Super%20ring!!'))()"}},
            {name = "Black Hole Script", script = "loadstring(game:HttpGet('https://pastebin.com/raw/wBsi24w3'))()"},
            {name = "Fling all", script = [[...]]}, -- Оригинальный скрипт
            {name = "Gravity", script = "pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/hm5650/Gravity-inverter/refs/heads/main/GI', true))() end)"},
            {name = "AXE HUB", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/zeroidxx/axe-hub/refs/heads/main/axehub%20nds.txt'))()"}
        }

        -- Создаем кнопки
        local buttonHeight = 0.1
        local buttonSpacing = 0.02
        local startY = 0

        for i, buttonInfo in ipairs(trollButtons) do
            -- Основная кнопка
            local button = createChineseButton(ContentFrame, buttonInfo.name, UDim2.new(0.8, 0, 0.1, 0), UDim2.new(0.1, 0, startY + (i-1)*(buttonHeight + buttonSpacing), 0))
            button.BackgroundColor3 = ColorPalette.Background
            button.TextColor3 = ColorPalette.Text

            -- Если есть подкнопка
            if buttonInfo.subButton then
                local subButtonVisible = false
                local subButton = createChineseButton(ContentFrame, buttonInfo.subButton.name, UDim2.new(0.7, 0, 0.09, 0), UDim2.new(0.15, 0, startY + (i-1)*(buttonHeight + buttonSpacing) + buttonHeight, 0))
                subButton.Visible = false
                subButton.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
                subButton.TextColor3 = ColorPalette.Text

                -- Обработчик подкнопки
                subButton.MouseButton1Click:Connect(function()
                    ShowNotification("Скрипт", "Запускаем "..buttonInfo.subButton.name, ColorPalette.Primary)
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
                            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0.7, 0, 0.09, 0)}
                        ):Play()
                    else
                        TweenService:Create(
                            subButton,
                            TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                            {Size = UDim2.new(0.7, 0, 0, 0)}
                        ):Play()
                        delay(0.2, function()
                            subButton.Visible = false
                        end)
                    end
                end)
            end

            -- Обработчик основной кнопки
            button.MouseButton1Click:Connect(function()
                if not buttonInfo.subButton then
                    ShowNotification("Скрипт", "Запускаем "..buttonInfo.name, ColorPalette.Primary)
                    loadstring(buttonInfo.script)()
                end
            end)
        end
    end

    -- Функция для создания кнопок телепортации
    local function CreateTeleportButtons()
        -- Очищаем контент
        for _, child in ipairs(ContentFrame:GetChildren()) do
            child:Destroy()
        end

        -- Создаем кнопки телепортации
        local teleportButtons = {
            {name = "Teleport to Map", position = Vector3.new(-9.35, 47.43, -1.82)},
            {name = "Teleport to Start map", position = Vector3.new(-269.47, 179.55, 382.10)}
        }

        -- Создаем кнопки
        local buttonHeight = 0.1
        local buttonSpacing = 0.02
        local startY = 0

        for i, buttonInfo in ipairs(teleportButtons) do
            local button = createChineseButton(ContentFrame, buttonInfo.name, UDim2.new(0.8, 0, 0.1, 0), UDim2.new(0.1, 0, startY + (i-1)*(buttonHeight + buttonSpacing), 0))
            button.BackgroundColor3 = ColorPalette.Background
            button.TextColor3 = ColorPalette.Text

            -- Обработчик нажатия
            button.MouseButton1Click:Connect(function()
                ShowNotification("Телепорт", "Переносим вас на "..buttonInfo.name, ColorPalette.Primary)
                
                -- Эффект телепорта
                local teleportEffect = Instance.new("ParticleEmitter")
                teleportEffect.Parent = Player.Character.HumanoidRootPart
                teleportEffect.Texture = "rbxassetid://296874871"
                teleportEffect.LightEmission = 1
                teleportEffect.Color = ColorSequence.new(ColorPalette.Primary)
                teleportEffect.Size = NumberSequence.new(1)
                teleportEffect.Lifetime = NumberRange.new(0.5)
                teleportEffect.Speed = NumberRange.new(10)
                teleportEffect.Rate = 100
                
                -- Создаем временную часть для телепортации
                local part = Instance.new("Part")
                part.Position = buttonInfo.position
                part.Anchored = true
                part.Size = Vector3.new(1, 1, 1)
                part.Transparency = 1
                part.CanCollide = false
                part.Parent = workspace
                
                -- Телепортируем игрока
                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                    Player.Character.HumanoidRootPart.CFrame = CFrame.new(part.Position)
                end
                
                -- Удаляем эффекты через секунду
                delay(1, function()
                    teleportEffect.Enabled = false
                    part:Destroy()
                    teleportEffect:Destroy()
                end)
            end)
        end

        -- Переключатель массового телепорта
        local massTeleportToggle = createChineseButton(ContentFrame, "Массовый телепорт: ВЫКЛ", UDim2.new(0.8, 0, 0.1, 0), UDim2.new(0.1, 0, 0.8, 0))
        massTeleportToggle.BackgroundColor3 = ColorPalette.Primary
        massTeleportToggle.TextColor3 = Color3.fromRGB(255, 255, 255)

        -- Переменная для хранения состояния
        local isMassTeleportActive = false
        local lastTeleportPosition = nil

        -- Обработчик нажатия
        massTeleportToggle.MouseButton1Click:Connect(function()
            isMassTeleportActive = not isMassTeleportActive
            
            if isMassTeleportActive then
                massTeleportToggle.Text = "Массовый телепорт: ВКЛ"
                ShowNotification("Телепорт", "Массовый телепорт активирован", ColorPalette.Success)
                
                -- Запоминаем последнюю позицию телепорта
                for _, buttonInfo in ipairs(teleportButtons) do
                    if buttonInfo.name == "Teleport to Map" then
                        lastTeleportPosition = buttonInfo.position
                        break
                    end
                end
            else
                massTeleportToggle.Text = "Массовый телепорт: ВЫКЛ"
                ShowNotification("Телепорт", "Массовый телепорт деактивирован", ColorPalette.Error)
            end
            
            -- Запускаем цикл массового телепорта
            while isMassTeleportActive do
                if lastTeleportPosition then
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            -- Эффект телепорта для каждого игрока
                            local effect = Instance.new("ParticleEmitter")
                            effect.Parent = player.Character.HumanoidRootPart
                            effect.Texture = "rbxassetid://296874871"
                            effect.Color = ColorSequence.new(ColorPalette.Primary)
                            effect.Lifetime = NumberRange.new(0.5)
                            effect.Speed = NumberRange.new(5)
                            effect.Size = NumberSequence.new(0.5)
                            effect.Rate = 50
                            
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(lastTeleportPosition)
                            
                            delay(0.5, function()
                                effect:Destroy()
                            end)
                        end
                    end
                end
                wait(1)
            end
        end)
    end

    -- По умолчанию показываем кнопки тролля
    CreateTrollButtons()

    -- Обработчики кнопок категорий
    TrollButton.MouseButton1Click:Connect(function()
        TrollButton.BackgroundColor3 = ColorPalette.Primary
        TrollButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TeleportButton.BackgroundColor3 = ColorPalette.Background
        TeleportButton.TextColor3 = ColorPalette.Text
        CreateTrollButtons()
    end)

    TeleportButton.MouseButton1Click:Connect(function()
        TeleportButton.BackgroundColor3 = ColorPalette.Primary
        TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TrollButton.BackgroundColor3 = ColorPalette.Background
        TrollButton.TextColor3 = ColorPalette.Text
        CreateTeleportButtons()
    end)

    -- Информация о пользователе
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = MainFrame
    UserFrame.BackgroundColor3 = ColorPalette.Background
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
    UserFrame.Size = UDim2.new(0.9, 0, 0.1, 0)

    -- Китайский стиль
    createChineseBorder(UserFrame)
    createCorner(UserFrame, 0.1)

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
    Username.TextColor3 = ColorPalette.Text
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
    DateLabel.TextColor3 = ColorPalette.TextLight
    DateLabel.TextSize = 14
    DateLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Кнопка закрытия в китайском стиле
    local CloseButton = createChineseButton(MainFrame, "Закрыть", UDim2.new(0.25, 0, 0.1, 0), UDim2.new(0.7, 0, 0.85, 0))

    CloseButton.MouseButton1Click:Connect(function()
        ShowNotification("Информация", "Меню закрыто", ColorPalette.Primary)
        
        -- Анимация закрытия с эффектом исчезновения
        local closeEffect = Instance.new("ParticleEmitter")
        closeEffect.Parent = MainFrame
        closeEffect.Texture = "rbxassetid://296874871"
        closeEffect.Color = ColorSequence.new(ColorPalette.Primary)
        closeEffect.Lifetime = NumberRange.new(1)
        closeEffect.Speed = NumberRange.new(5)
        closeEffect.Size = NumberSequence.new(1)
        closeEffect.Rate = 100
        
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, 400, 0, 0), BackgroundTransparency = 1}
        ):Play()
        
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.5, -200, 0.5, 0)}
        ):Play()
        
        delay(0.5, function()
            closeEffect.Enabled = false
            MainGUI:Destroy()
        end)
    end)

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

    -- Плавное появление с эффектом
    MainFrame.Size = UDim2.new(0, 400, 0, 0)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, 0)
    MainFrame.BackgroundTransparency = 1
    
    local appearEffect = Instance.new("ParticleEmitter")
    appearEffect.Parent = MainFrame
    appearEffect.Texture = "rbxassetid://296874871"
    appearEffect.Color = ColorSequence.new(ColorPalette.Secondary)
    appearEffect.Lifetime = NumberRange.new(1)
    appearEffect.Speed = NumberRange.new(5)
    appearEffect.Size = NumberSequence.new(1)
    appearEffect.Rate = 100
    
    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 400, 0, 500), BackgroundTransparency = 0}
    ):Play()
    
    TweenService:Create(
        MainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -200, 0.5, -250)}
    ):Play()
    
    delay(1, function()
        appearEffect.Enabled = false
        appearEffect:Destroy()
    end)

    -- Обработчик F5 для скрытия/показа GUI
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
            MainGUI.Enabled = not MainGUI.Enabled
            if MainGUI.Enabled then
                ShowNotification("Информация", "Меню показано", ColorPalette.Primary)
            else
                ShowNotification("Информация", "Меню скрыто", ColorPalette.Primary)
            end
        end
    end)
end
