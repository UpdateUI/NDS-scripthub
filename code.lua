local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- Пароль
local PASSWORD = "2025"

-- Создаем основное GUI для пароля
local PasswordScreenGui = Instance.new("ScreenGui")
PasswordScreenGui.Name = "PasswordScreenGui"
PasswordScreenGui.Parent = game.CoreGui
PasswordScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
PasswordScreenGui.ResetOnSpawn = false

local PasswordFrame = Instance.new("Frame")
PasswordFrame.Name = "PasswordFrame"
PasswordFrame.Parent = PasswordScreenGui
PasswordFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
PasswordFrame.BorderSizePixel = 0
PasswordFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
PasswordFrame.Size = UDim2.new(0, 300, 0, 200)
PasswordFrame.AnchorPoint = Vector2.new(0.5, 0.5)
PasswordFrame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 16)
UICorner.Parent = PasswordFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 90)
UIStroke.Thickness = 2
UIStroke.Parent = PasswordFrame

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
}
BackgroundGradient.Rotation = 45
BackgroundGradient.Parent = PasswordFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = PasswordFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0, 15)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Введите пароль"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 20
TitleLabel.TextTransparency = 0.1

local TitleLabelStroke = Instance.new("UIStroke")
TitleLabelStroke.Color = Color3.fromRGB(200, 200, 200)
TitleLabelStroke.Thickness = 1
TitleLabelStroke.Transparency = 0.7
TitleLabelStroke.Parent = TitleLabel

local PasswordBox = Instance.new("TextBox")
PasswordBox.Name = "PasswordBox"
PasswordBox.Parent = PasswordFrame
PasswordBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
PasswordBox.BorderSizePixel = 0
PasswordBox.Position = UDim2.new(0.1, 0, 0.4, 0)
PasswordBox.Size = UDim2.new(0.8, 0, 0, 40)
PasswordBox.Font = Enum.Font.Gotham
PasswordBox.PlaceholderText = "Пароль..."
PasswordBox.Text = ""
PasswordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PasswordBox.TextSize = 16
PasswordBox.TextWrapped = true
PasswordBox.ClearTextOnFocus = false

local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 12)
UICorner2.Parent = PasswordBox

local PasswordBoxStroke = Instance.new("UIStroke")
PasswordBoxStroke.Color = Color3.fromRGB(60, 60, 70)
PasswordBoxStroke.Thickness = 2
PasswordBoxStroke.Parent = PasswordBox

local SubmitButton = Instance.new("TextButton")
SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = PasswordFrame
SubmitButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
SubmitButton.BorderSizePixel = 0
SubmitButton.Position = UDim2.new(0.25, 0, 0.7, 0)
SubmitButton.Size = UDim2.new(0.5, 0, 0, 40)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.Text = "Подтвердить"
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.TextSize = 16

local UICorner3 = Instance.new("UICorner")
UICorner3.CornerRadius = UDim.new(0, 12)
UICorner3.Parent = SubmitButton

local SubmitButtonGradient = Instance.new("UIGradient")
SubmitButtonGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 80))
}
SubmitButtonGradient.Rotation = 90
SubmitButtonGradient.Parent = SubmitButton

local SubmitButtonStroke = Instance.new("UIStroke")
SubmitButtonStroke.Color = Color3.fromRGB(100, 100, 120)
SubmitButtonStroke.Thickness = 1
SubmitButtonStroke.Parent = SubmitButton

-- Анимация кнопки
SubmitButton.MouseEnter:Connect(function()
    TweenService:Create(SubmitButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0.55, 0, 0, 42)
    }):Play()
    TweenService:Create(SubmitButtonGradient, TweenInfo.new(0.2), {
        Rotation = 180,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 100)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 90))
        }
    }):Play()
    TweenService:Create(SubmitButtonStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(120, 120, 140)
    }):Play()
end)

SubmitButton.MouseLeave:Connect(function()
    TweenService:Create(SubmitButton, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        BackgroundTransparency = 0,
        Size = UDim2.new(0.5, 0, 0, 40)
    }):Play()
    TweenService:Create(SubmitButtonGradient, TweenInfo.new(0.2), {
        Rotation = 90,
        Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 90)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 80))
        }
    }):Play()
    TweenService:Create(SubmitButtonStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(100, 100, 120)
    }):Play()
end)

-- Анимация при фокусе на TextBox
PasswordBox.Focused:Connect(function()
    TweenService:Create(PasswordBox, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    }):Play()
    TweenService:Create(PasswordBoxStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(80, 80, 90)
    }):Play()
end)

PasswordBox.FocusLost:Connect(function()
    TweenService:Create(PasswordBox, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    }):Play()
    TweenService:Create(PasswordBoxStroke, TweenInfo.new(0.2), {
        Color = Color3.fromRGB(60, 60, 70)
    }):Play()
end)

-- Функция проверки пароля
local function CheckPassword()
    if PasswordBox.Text == PASSWORD then
        -- Правильный пароль
        local successSound = Instance.new("Sound")
        successSound.SoundId = "rbxassetid://170765130" -- Positive sound
        successSound.Parent = PasswordFrame
        successSound:Play()
        
        TweenService:Create(PasswordFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
            BackgroundColor3 = Color3.fromRGB(40, 80, 40),
            Size = UDim2.new(0, 300, 0, 0)
        }):Play()
        TweenService:Create(TitleLabel, TweenInfo.new(0.3), {
            TextTransparency = 1
        }):Play()
        TweenService:Create(PasswordBox, TweenInfo.new(0.3), {
            BackgroundTransparency = 1,
            TextTransparency = 1
        }):Play()
        TweenService:Create(SubmitButton, TweenInfo.new(0.3), {
            BackgroundTransparency = 1,
            TextTransparency = 1
        }):Play()
        
        wait(0.5)
        PasswordScreenGui:Destroy()
        CreateMainGUI()
    else
        -- Неправильный пароль
        local errorSound = Instance.new("Sound")
        errorSound.SoundId = "rbxassetid://1319977959" -- Error sound
        errorSound.Parent = PasswordFrame
        errorSound:Play()
        
        TweenService:Create(PasswordFrame, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(80, 40, 40),
            Position = UDim2.new(0.5, -155, 0.5, -100)
        }):Play()
        wait(0.05)
        TweenService:Create(PasswordFrame, TweenInfo.new(0.2), {
            Position = UDim2.new(0.5, -145, 0.5, -100)
        }):Play()
        wait(0.05)
        TweenService:Create(PasswordFrame, TweenInfo.new(0.2), {
            Position = UDim2.new(0.5, -150, 0.5, -100)
        }):Play()
        wait(0.5)
        TweenService:Create(PasswordFrame, TweenInfo.new(0.5), {
            BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        }):Play()
        PasswordBox.Text = ""
    end
end

SubmitButton.MouseButton1Click:Connect(function()
    TweenService:Create(SubmitButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(100, 100, 120)
    }):Play()
    wait(0.1)
    TweenService:Create(SubmitButton, TweenInfo.new(0.1), {
        BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    }):Play()
    CheckPassword()
end)

PasswordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        CheckPassword()
    end
end)

-- Анимация появления GUI
PasswordFrame.Size = UDim2.new(0, 0, 0, 0)
PasswordFrame.BackgroundTransparency = 1
TitleLabel.TextTransparency = 1
PasswordBox.BackgroundTransparency = 1
PasswordBox.TextTransparency = 1
SubmitButton.BackgroundTransparency = 1
SubmitButton.TextTransparency = 1

wait(0.5)

TweenService:Create(PasswordFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 300, 0, 200),
    BackgroundTransparency = 0
}):Play()

wait(0.3)

TweenService:Create(TitleLabel, TweenInfo.new(0.3), {
    TextTransparency = 0.1
}):Play()

TweenService:Create(PasswordBox, TweenInfo.new(0.3), {
    BackgroundTransparency = 0,
    TextTransparency = 0
}):Play()

TweenService:Create(SubmitButton, TweenInfo.new(0.3), {
    BackgroundTransparency = 0,
    TextTransparency = 0
}):Play()

-- Создаем основное GUI после ввода пароля
local function CreateMainGUI()
    local MainScreenGui = Instance.new("ScreenGui")
    MainScreenGui.Name = "MainScreenGui"
    MainScreenGui.Parent = game.CoreGui
    MainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MainScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = MainScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.ClipsDescendants = true

    local UICorner4 = Instance.new("UICorner")
    UICorner4.CornerRadius = UDim.new(0, 16)
    UICorner4.Parent = MainFrame

    local UIStroke2 = Instance.new("UIStroke")
    UIStroke2.Color = Color3.fromRGB(80, 80, 90)
    UIStroke2.Thickness = 2
    UIStroke2.Parent = MainFrame

    local BackgroundGradient2 = Instance.new("UIGradient")
    BackgroundGradient2.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 40)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
    }
    BackgroundGradient2.Rotation = 45
    BackgroundGradient2.Parent = MainFrame

    -- Эффект размытия
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 10
    BlurEffect.Parent = MainFrame

    -- Заголовок
    local MainTitle = Instance.new("TextLabel")
    MainTitle.Name = "MainTitle"
    MainTitle.Parent = MainFrame
    MainTitle.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    MainTitle.BorderSizePixel = 0
    MainTitle.Position = UDim2.new(0, 0, 0, 0)
    MainTitle.Size = UDim2.new(1, 0, 0, 50)
    MainTitle.Font = Enum.Font.GothamBold
    MainTitle.Text = "FE Natural Survival Disaster"
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.TextSize = 18

    local UICorner5 = Instance.new("UICorner")
    UICorner5.CornerRadius = UDim.new(0, 16)
    UICorner5.Parent = MainTitle

    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
    }
    TitleGradient.Rotation = 90
    TitleGradient.Parent = MainTitle

    local TitleStroke = Instance.new("UIStroke")
    TitleStroke.Color = Color3.fromRGB(80, 80, 90)
    TitleStroke.Thickness = 1
    TitleStroke.Parent = MainTitle

    local SubTitle = Instance.new("TextLabel")
    SubTitle.Name = "SubTitle"
    SubTitle.Parent = MainFrame
    SubTitle.BackgroundTransparency = 1
    SubTitle.Position = UDim2.new(0, 0, 0, 50)
    SubTitle.Size = UDim2.new(1, 0, 0, 20)
    SubTitle.Font = Enum.Font.Gotham
    SubTitle.Text = "made by Clezuuu"
    SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    SubTitle.TextSize = 14
    SubTitle.TextTransparency = 0.3

    -- Информация о пользователе
    local UserFrame = Instance.new("Frame")
    UserFrame.Name = "UserFrame"
    UserFrame.Parent = MainFrame
    UserFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    UserFrame.BorderSizePixel = 0
    UserFrame.Position = UDim2.new(0, 10, 0, 80)
    UserFrame.Size = UDim2.new(1, -20, 0, 60)

    local UICorner6 = Instance.new("UICorner")
    UICorner6.CornerRadius = UDim.new(0, 12)
    UICorner6.Parent = UserFrame

    local UserFrameGradient = Instance.new("UIGradient")
    UserFrameGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 50, 60)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 50))
    }
    UserFrameGradient.Rotation = 90
    UserFrameGradient.Parent = UserFrame

    local UserFrameStroke = Instance.new("UIStroke")
    UserFrameStroke.Color = Color3.fromRGB(70, 70, 80)
    UserFrameStroke.Thickness = 1
    UserFrameStroke.Parent = UserFrame

    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Parent = UserFrame
    Avatar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Avatar.BorderSizePixel = 0
    Avatar.Position = UDim2.new(0, 10, 0.5, -20)
    Avatar.Size = UDim2.new(0, 40, 0, 40)
    Avatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..Player.UserId.."&width=420&height=420&format=png"
    
    local UICorner7 = Instance.new("UICorner")
    UICorner7.CornerRadius = UDim.new(1, 0)
    UICorner7.Parent = Avatar

    local AvatarStroke = Instance.new("UIStroke")
    AvatarStroke.Color = Color3.fromRGB(100, 100, 120)
    AvatarStroke.Thickness = 2
    AvatarStroke.Parent = Avatar

    local UserName = Instance.new("TextLabel")
    UserName.Name = "UserName"
    UserName.Parent = UserFrame
    UserName.BackgroundTransparency = 1
    UserName.Position = UDim2.new(0, 60, 0, 10)
    UserName.Size = UDim2.new(0.6, -60, 0, 20)
    UserName.Font = Enum.Font.GothamBold
    UserName.Text = Player.Name
    UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
    UserName.TextSize = 16
    UserName.TextXAlignment = Enum.TextXAlignment.Left

    local DateLabel = Instance.new("TextLabel")
    DateLabel.Name = "DateLabel"
    DateLabel.Parent = UserFrame
    DateLabel.BackgroundTransparency = 1
    DateLabel.Position = UDim2.new(0, 60, 0, 30)
    DateLabel.Size = UDim2.new(0.6, -60, 0, 20)
    DateLabel.Font = Enum.Font.Gotham
    DateLabel.Text = os.date("%d/%m/%Y")
    DateLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    DateLabel.TextSize = 14
    DateLabel.TextXAlignment = Enum.TextXAlignment.Left

    -- Кнопки
    local ButtonsFrame = Instance.new("Frame")
    ButtonsFrame.Name = "ButtonsFrame"
    ButtonsFrame.Parent = MainFrame
    ButtonsFrame.BackgroundTransparency = 1
    ButtonsFrame.Position = UDim2.new(0, 10, 0, 150)
    ButtonsFrame.Size = UDim2.new(1, -20, 0, 300)

    -- Функция создания кнопки
    local function CreateButton(name, text, position, callback, isExpandable)
        local Button = Instance.new("TextButton")
        Button.Name = name
        Button.Parent = ButtonsFrame
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        Button.BorderSizePixel = 0
        Button.Position = position
        Button.Size = UDim2.new(1, 0, 0, 40)
        Button.Font = Enum.Font.GothamBold
        Button.Text = text
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 16
        
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 12)
        UICorner.Parent = Button
        
        local ButtonGradient = Instance.new("UIGradient")
        ButtonGradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 90)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 80))
        }
        ButtonGradient.Rotation = 90
        ButtonGradient.Parent = Button
        
        local ButtonStroke = Instance.new("UIStroke")
        ButtonStroke.Color = Color3.fromRGB(100, 100, 120)
        ButtonStroke.Thickness = 1
        ButtonStroke.Parent = Button
        
        -- Анимация кнопки
        Button.MouseEnter:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(1.02, 0, 0, 42),
                Position = UDim2.new(position.X.Scale, position.X.Offset - 2, position.Y.Scale, position.Y.Offset - 1)
            }):Play()
            TweenService:Create(ButtonGradient, TweenInfo.new(0.2), {
                Rotation = 180,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(80, 80, 100)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 70, 90))
                }
            }):Play()
            TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(120, 120, 140),
                Thickness = 2
            }):Play()
        end)
        
        Button.MouseLeave:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(1, 0, 0, 40),
                Position = position
            }):Play()
            TweenService:Create(ButtonGradient, TweenInfo.new(0.2), {
                Rotation = 90,
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 90)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 80))
                }
            }):Play()
            TweenService:Create(ButtonStroke, TweenInfo.new(0.2), {
                Color = Color3.fromRGB(100, 100, 120),
                Thickness = 1
            }):Play()
        end)
        
        Button.MouseButton1Click:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(100, 100, 120)
            }):Play()
            TweenService:Create(ButtonGradient, TweenInfo.new(0.1), {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 110, 130)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 100, 120))
                }
            }):Play()
            wait(0.1)
            TweenService:Create(Button, TweenInfo.new(0.1), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 80)
            }):Play()
            TweenService:Create(ButtonGradient, TweenInfo.new(0.1), {
                Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(70, 70, 90)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 60, 80))
                }
            }):Play()
            
            callback()
        end)
        
        return Button
    end

    -- Кнопка Infinity Yield
    CreateButton("InfinityYieldButton", "1) Infinity Yield", UDim2.new(0, 0, 0, 0), function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    -- Кнопка Super Ring Parts V6 (с возможностью раскрытия)
    local SuperRingV6Button = CreateButton("SuperRingV6Button", "2) Super Ring Parts V6", UDim2.new(0, 0, 0, 50), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()
    end, true)

    -- Дополнительная кнопка Super Ring Parts V4 (появляется после нажатия на V6)
    local SuperRingV4Button = CreateButton("SuperRingV4Button", "   Super Ring Parts V4", UDim2.new(0, 0, 0, 100), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/super-ring/refs/heads/main/Super%20ring!!"))()
    end)
    SuperRingV4Button.Visible = false

    SuperRingV6Button.MouseButton1Click:Connect(function()
        SuperRingV4Button.Visible = not SuperRingV4Button.Visible
        if SuperRingV4Button.Visible then
            -- Сдвигаем другие кнопки вниз
            TweenService:Create(BlackHoleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 150)
            }):Play()
            TweenService:Create(FlingAllButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 200)
            }):Play()
            TweenService:Create(GravityButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 250)
            }):Play()
            TweenService:Create(AxeHubButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 300)
            }):Play()
            TweenService:Create(CloseButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 350)
            }):Play()
        else
            -- Возвращаем кнопки на место
            TweenService:Create(BlackHoleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 100)
            }):Play()
            TweenService:Create(FlingAllButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 150)
            }):Play()
            TweenService:Create(GravityButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 200)
            }):Play()
            TweenService:Create(AxeHubButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 250)
            }):Play()
            TweenService:Create(CloseButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0, 0, 0, 300)
            }):Play()
        end
    end)

    -- Кнопка Black Hole Script
    local BlackHoleButton = CreateButton("BlackHoleButton", "3) Black Hole Script", UDim2.new(0, 0, 0, 100), function()
        loadstring(game:HttpGet('https://pastebin.com/raw/wBsi24w3'))()
    end)

    -- Кнопка Fling All
    local FlingAllButton = CreateButton("FlingAllButton", "4) Fling All", UDim2.new(0, 0, 0, 150), function()
        -- Ваш код для Fling All здесь
    end)

    -- Кнопка Gravity
    local GravityButton = CreateButton("GravityButton", "5) Gravity", UDim2.new(0, 0, 0, 200), function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hm5650/Gravity-inverter/refs/heads/main/GI", true))()
        end)
    end)

    -- Кнопка AXE HUB
    local AxeHubButton = CreateButton("AxeHubButton", "6) AXE HUB", UDim2.new(0, 0, 0, 250), function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/zeroidxx/axe-hub/refs/heads/main/axehub%20nds.txt'))()
    end)

    -- Кнопка закрытия
    local CloseButton = CreateButton("CloseButton", "Закрыть", UDim2.new(0, 0, 0, 300), function()
        TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.5)
        MainScreenGui:Destroy()
    end)

    -- Функция для скрытия/показа GUI по F5
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
            if MainFrame.Visible then
                TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    Position = UDim2.new(0.5, -200, 1.5, -250)
                }):Play()
                wait(0.3)
                MainFrame.Visible = false
            else
                MainFrame.Visible = true
                TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0.5, -200, 0.5, -250)
                }):Play()
            end
        end
    end)

    -- Анимация появления
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame.BackgroundTransparency = 1
    MainTitle.TextTransparency = 1
    SubTitle.TextTransparency = 1
    UserFrame.BackgroundTransparency = 1
    Avatar.ImageTransparency = 1
    UserName.TextTransparency = 1
    DateLabel.TextTransparency = 1
    ButtonsFrame.Visible = false

    wait(0.5)

    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 500),
        BackgroundTransparency = 0
    }):Play()

    wait(0.3)

    TweenService:Create(MainTitle, TweenInfo.new(0.3), {
        TextTransparency = 0
    }):Play()

    TweenService:Create(SubTitle, TweenInfo.new(0.3), {
        TextTransparency = 0.3
    }):Play()

    TweenService:Create(UserFrame, TweenInfo.new(0.3), {
        BackgroundTransparency = 0
    }):Play()

    TweenService:Create(Avatar, TweenInfo.new(0.3), {
        ImageTransparency = 0
    }):Play()

    TweenService:Create(UserName, TweenInfo.new(0.3), {
        TextTransparency = 0
    }):Play()

    TweenService:Create(DateLabel, TweenInfo.new(0.3), {
        TextTransparency = 0
    }):Play()

    wait(0.2)
    ButtonsFrame.Visible = true
end