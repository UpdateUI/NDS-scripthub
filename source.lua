local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- Пароль
local PASSWORD = "2025"
local currentDate = os.date("%d/%m/%Y")

-- Создаем основное GUI для пароля
local PasswordGUI = Instance.new("ScreenGui")
PasswordGUI.Name = "PasswordGUI"
PasswordGUI.Parent = CoreGui
PasswordGUI.ResetOnSpawn = false

-- Фрейм для пароля
local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordGUI
PasswordFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PasswordFrame.BackgroundTransparency = 0.2
PasswordFrame.BorderSizePixel = 0
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)

-- Закругление углов
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = PasswordFrame

-- Размытие фона
local BlurEffect = Instance.new("BlurEffect")
BlurEffect.Size = 10
BlurEffect.Parent = game:GetService("Lighting")

-- Текст заголовка
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = PasswordFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.1, 0)
TitleLabel.Size = UDim2.new(1, 0, 0.2, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Введите пароль"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20

-- Поле ввода пароля
local PasswordBox = Instance.new("TextBox")
PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = PasswordFrame
PasswordBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PasswordBox.Size = UDim2.new(0.8, 0, 0.15, 0)
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Пароль"
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.TextSize = 16
PasswordBox.TextWrapped = true
PasswordBox.ClearTextOnFocus = false
PasswordBox.ShowNativeInput = false

-- Закругление поля ввода
local PasswordCorner = Instance.new("UICorner")
PasswordCorner.CornerRadius = UDim.new(0, 8)
PasswordCorner.Parent = PasswordBox

-- Кнопка подтверждения
local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = PasswordFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
SubmitButton.Size = UDim2.new(0.5, 0, 0.15, 0)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "Подтвердить"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 16

-- Закругление кнопки
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = SubmitButton

-- Анимация при наведении на кнопку
SubmitButton.MouseEnter:Connect(function()
    TweenService:Create(
        SubmitButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}
    ):Play()
end)

SubmitButton.MouseLeave:Connect(function()
    TweenService:Create(
        SubmitButton,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}
    ):Play()
end)

-- Функция проверки пароля
local function CheckPassword()
    local enteredPassword = PasswordBox.Text
    
    if enteredPassword == PASSWORD then
        -- Правильный пароль - зеленый цвет и анимация
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(50, 150, 50)}
        ):Play()
        
        wait(1)
        PasswordGUI:Destroy()
        BlurEffect:Destroy()
        CreateMainGUI()
    else
        -- Неправильный пароль - красный цвет и анимация
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(150, 50, 50)}
        ):Play()
        
        wait(1)
        
        TweenService:Create(
            PasswordFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}
        ):Play()
        
        PasswordBox.Text = ""
    end
end

-- Обработчик нажатия кнопки
SubmitButton.MouseButton1Click:Connect(CheckPassword)

-- Обработчик нажатия Enter в поле ввода
PasswordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        CheckPassword()
    end
end)

-- Создание основного GUI после ввода пароля
function CreateMainGUI()
    local MainGUI = Instance.new("ScreenGui")
    MainGUI.Name = "MainGUI"
    MainGUI.Parent = CoreGui
    MainGUI.ResetOnSpawn = false
    MainGUI.Enabled = true

    -- Основной фрейм
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainGUI
    MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MainFrame.BackgroundTransparency = 0.2
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)

    -- Закругление углов
    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Parent = MainFrame

    -- Размытие фона
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 10
    BlurEffect.Parent = game:GetService("Lighting")

    -- Заголовок
    local MainTitle = Instance.new("TextLabel")
    MainTitle.Name = "MainTitle"
    MainTitle.Parent = MainFrame
    MainTitle.BackgroundTransparency = 1
    MainTitle.Position = UDim2.new(0, 0, 0.02, 0)
    MainTitle.Size = UDim2.new(1, 0, 0.1, 0)
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.Text = "FE Natural Survival Disaster"
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
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
    SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubTitle.TextSize = 14

    -- Информация о пользователе
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = MainFrame
    UserFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
    UserFrame.Size = UDim2.new(0.9, 0, 0.1, 0)

    -- Закругление UserFrame
    local UserCorner = Instance.new("UICorner")
    UserCorner.CornerRadius = UDim.new(0, 8)
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
    Username.TextColor3 = Color3.fromRGB(255, 255, 255)
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
    DateLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DateLabel.TextSize = 14
    DateLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Кнопка закрытия
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.Parent = MainFrame
    CloseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    CloseButton.BorderSizePixel = 0
    CloseButton.Position = UDim2.new(0.7, 0, 0.85, 0)
    CloseButton.Size = UDim2.new(0.25, 0, 0.1, 0)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "Закрыть"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 16

    -- Закругление кнопки закрытия
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton

    -- Анимация при наведении на кнопку закрытия
    CloseButton.MouseEnter:Connect(function()
        TweenService:Create(
            CloseButton,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}
        ):Play()
    end)

    CloseButton.MouseLeave:Connect(function()
        TweenService:Create(
            CloseButton,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}
        ):Play()
    end)

    -- Обработчик кнопки закрытия
    CloseButton.MouseButton1Click:Connect(function()
        MainGUI:Destroy()
        BlurEffect:Destroy()
    end)

    -- Список кнопок
    local buttons = {
        {name = "Infinity Yield", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()"},
        {name = "Super ring Parts V6", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol'))()", 
         subButton = {name = "Super ring Parts V4", script = "loadstring(game:HttpGet('https://raw.githubusercontent.com/Lukashub-coder/super-ring/refs/heads/main/Super%20ring!!'))()"}},
        {name = "Black Hole Script", script = "loadstring(game:HttpGet('https://pastebin.com/raw/wBsi24w3'))()"},
        {name = "Fling all", script = [[
            local scriptActive = true
            local Targets = {"All"} -- "All", "Target Name"
            local Welcome = false

            -- Сервисы
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local UserInputService = game:GetService("UserInputService")
            local GuiService = game:GetService("GuiService")

            -- Глобальные переменные
            local AllBool = false
            getgenv().OldPos = nil
            getgenv().FPDH = workspace.FallenPartsDestroyHeight

            -- Функция для уведомлений
            local Message = function(_Title, _Text, Time)
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = _Title, 
                    Text = _Text, 
                    Duration = Time
                })
            end

            -- Функция поиска игрока
            local GetPlayer = function(Name)
                Name = Name:lower()
                if Name == "all" or Name == "others" then
                    AllBool = true
                    return
                elseif Name == "random" then
                    local GetPlayers = Players:GetPlayers()
                    if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
                    return GetPlayers[math.random(#GetPlayers)]
                elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
                    for _,x in next, Players:GetPlayers() do
                        if x ~= Player then
                            if x.Name:lower():match("^"..Name) then
                                return x;
                            elseif x.DisplayName:lower():match("^"..Name) then
                                return x;
                            end
                        end
                    end
                else
                    return
                end
            end

            -- Основная функция флинга
            local SkidFling = function(TargetPlayer)
                if not scriptActive then return end
                
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart

                local TCharacter = TargetPlayer.Character
                local THumanoid
                local TRootPart
                local THead
                local Accessory
                local Handle

                if TCharacter:FindFirstChildOfClass("Humanoid") then
                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                end
                if THumanoid and THumanoid.RootPart then
                    TRootPart = THumanoid.RootPart
                end
                if TCharacter:FindFirstChild("Head") then
                    THead = TCharacter.Head
                end
                if TCharacter:FindFirstChildOfClass("Accessory") then
                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                end
                if Accessory and Accessory:FindFirstChild("Handle") then
                    Handle = Accessory.Handle
                end

                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then
                        getgenv().OldPos = RootPart.CFrame
                    end
                    if THumanoid and THumanoid.Sit and not AllBool then
                        return Message("Error", "Target is sitting", 5)
                    end
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif not THead and Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end
                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                        return
                    end

                    local FPos = function(BasePart, Pos, Ang)
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0

                        repeat
                            if RootPart and THumanoid and scriptActive then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100

                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                else
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                                    task.wait()

                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until not scriptActive or BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
                    end

                    workspace.FallenPartsDestroyHeight = 0/0

                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "EpixVel"
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRootPart and THead then
                        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                            SFBasePart(THead)
                        else
                            SFBasePart(TRootPart)
                        end
                    elseif TRootPart and not THead then
                        SFBasePart(TRootPart)
                    elseif not TRootPart and THead then
                        SFBasePart(THead)
                    elseif not TRootPart and not THead and Accessory and Handle then
                        SFBasePart(Handle)
                    else
                        return Message("Error", "Target missing parts", 5)
                    end

                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = Humanoid

                    repeat
                        if scriptActive then
                            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                            Humanoid:ChangeState("GettingUp")
                            table.foreach(Character:GetChildren(), function(_, x)
                                if x:IsA("BasePart") then
                                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                                end
                            end)
                            task.wait()
                        end
                    until not scriptActive or (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                else
                    return Message("Error", "Script failed", 5)
                end
            end

            -- Функция для запуска флинга
            local StartFling = function()
                if Targets[1] then 
                    for _,x in next, Targets do 
                        GetPlayer(x) 
                    end 
                else 
                    return 
                end

                if AllBool then
                    for _,x in next, Players:GetPlayers() do
                        SkidFling(x)
                    end
                end

                for _,x in next, Targets do
                    if GetPlayer(x) and GetPlayer(x) ~= Player then
                        if GetPlayer(x).UserId ~= 2924145477 then
                            local TPlayer = GetPlayer(x)
                            if TPlayer then
                                SkidFling(TPlayer)
                            end
                        else
                            Message("ERROR", "Cannot fling this user", 8)
                        end
                    elseif not GetPlayer(x) and not AllBool then
                        Message("ERROR", "Target not found", 8)
                    end
                end
            end

            -- Создание GUI меню
            local ScreenGui = Instance.new("ScreenGui")
            local Frame = Instance.new("Frame")
            local ToggleButton = Instance.new("TextButton")
            local StatusLabel = Instance.new("TextLabel")
            local TitleLabel = Instance.new("TextLabel")

            ScreenGui.Name = "FlingMenu"
            ScreenGui.Parent = game.CoreGui
            ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

            Frame.Name = "MainFrame"
            Frame.Parent = ScreenGui
            Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            Frame.BorderSizePixel = 0
            Frame.Position = UDim2.new(0.8, 0, 0.5, 0)
            Frame.Size = UDim2.new(0, 150, 0, 120)
            Frame.Active = true
            Frame.Draggable = true

            TitleLabel.Name = "TitleLabel"
            TitleLabel.Parent = Frame
            TitleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            TitleLabel.BorderSizePixel = 0
            TitleLabel.Size = UDim2.new(1, 0, 0, 30)
            TitleLabel.Font = Enum.Font.SourceSansBold
            TitleLabel.Text = "Fling Menu"
            TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TitleLabel.TextSize = 18

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = Frame
            ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            ToggleButton.Position = UDim2.new(0.1, 0, 0.35, 0)
            ToggleButton.Size = UDim2.new(0.8, 0, 0, 30)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = "Toggle Script"
            ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.TextSize = 16

            StatusLabel.Name = "StatusLabel"
            StatusLabel.Parent = Frame
            StatusLabel.BackgroundTransparency = 1
            StatusLabel.Position = UDim2.new(0.1, 0, 0.7, 0)
            StatusLabel.Size = UDim2.new(0.8, 0, 0, 20)
            StatusLabel.Font = Enum.Font.SourceSans
            StatusLabel.Text = "Status: Active"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            StatusLabel.TextSize = 14

            -- Обработчик кнопки
            ToggleButton.MouseButton1Click:Connect(function()
                scriptActive = not scriptActive
                if scriptActive then
                    StatusLabel.Text = "Status: Active"
                    StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                    Message("Script", "Enabled", 2)
                    StartFling()
                else
                    StatusLabel.Text = "Status: Inactive"
                    StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                    Message("Script", "Disabled", 2)
                end
            end)

            -- Приветственное сообщение
            if not Welcome then 
                Message("Fling Script", "Press the toggle button to start", 6) 
            end
            Welcome = true
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
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        button.BorderSizePixel = 0
        button.Position = UDim2.new(0.1, 0, startY + (i-1)*(buttonHeight + buttonSpacing), 0)
        button.Size = UDim2.new(0.8, 0, 0, 40)
        button.Font = Enum.Font.GothamBold
        button.Text = buttonInfo.name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 16

        -- Закругление кнопки
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button

        -- Анимация при наведении
        button.MouseEnter:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(80, 80, 80)}
            ):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(
                button,
                TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}
            ):Play()
        end)

        -- Обработчик нажатия
        button.MouseButton1Click:Connect(function()
            loadstring(buttonInfo.script)()
        end)

        -- Если есть подкнопка
        if buttonInfo.subButton then
            local subButtonVisible = false
            local subButton = Instance.new("TextButton")
            subButton.Name = buttonInfo.subButton.name
            subButton.Parent = MainFrame
            subButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            subButton.BorderSizePixel = 0
            subButton.Position = UDim2.new(0.15, 0, startY + (i-1)*(buttonHeight + buttonSpacing) + buttonHeight, 0)
            subButton.Size = UDim2.new(0.7, 0, 0, 35)
            subButton.Font = Enum.Font.Gotham
            subButton.Text = buttonInfo.subButton.name
            subButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            subButton.TextSize = 14
            subButton.Visible = false

            -- Закругление подкнопки
            local subButtonCorner = Instance.new("UICorner")
            subButtonCorner.CornerRadius = UDim.new(0, 6)
            subButtonCorner.Parent = subButton

            -- Анимация подкнопки
            subButton.MouseEnter:Connect(function()
                TweenService:Create(
                    subButton,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(70, 70, 70)}
                ):Play()
            end)

            subButton.MouseLeave:Connect(function()
                TweenService:Create(
                    subButton,
                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
                ):Play()
            end)

            -- Обработчик подкнопки
            subButton.MouseButton1Click:Connect(function()
                loadstring(buttonInfo.subButton.script)()
            end)

            -- Обработчик основной кнопки для показа/скрытия подкнопки
            button.MouseButton1Click:Connect(function()
                subButtonVisible = not subButtonVisible
                subButton.Visible = subButtonVisible
                
                -- Анимация появления/исчезновения
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
                    wait(0.2)
                    subButton.Visible = false
                end
            end)
        end
    end

    -- Делаем фрейм перемещаемым
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- Обработчик F5 для скрытия/показа GUI
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
            MainGUI.Enabled = not MainGUI.Enabled
        end
    end)
end
