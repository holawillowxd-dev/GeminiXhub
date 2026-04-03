-- [[ GeminiXhub v2.0 - FINAL VERSION ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

_G.Key = "GXM-2026-TOP1"

local function AbrirMenuHacks()
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "GeminiX_MenuReal"
    MainGui.Parent = CoreGui
    
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 220, 0, 200)
    Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
    Frame.Parent = MainGui
    Instance.new("UICorner", Frame)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Text = "GEMINIXHUB | MENU"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Parent = Frame

    local SpeedBtn = Instance.new("TextButton")
    SpeedBtn.Size = UDim2.new(0, 190, 0, 40)
    SpeedBtn.Position = UDim2.new(0.5, -95, 0, 50)
    SpeedBtn.Text = "VELOCIDAD FLASH"
    SpeedBtn.Parent = Frame
    SpeedBtn.MouseButton1Click:Connect(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    local JumpBtn = Instance.new("TextButton")
    JumpBtn.Size = UDim2.new(0, 190, 0, 40)
    JumpBtn.Position = UDim2.new(0.5, -95, 0, 100)
    JumpBtn.Text = "SUPER SALTO"
    JumpBtn.Parent = Frame
    JumpBtn.MouseButton1Click:Connect(function()
        LocalPlayer.Character.Humanoid.JumpPower = 150
    end)

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 190, 0, 40)
    CloseBtn.Position = UDim2.new(0.5, -95, 0, 150)
    CloseBtn.Text = "CERRAR MENU"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    CloseBtn.Parent = Frame
    CloseBtn.MouseButton1Click:Connect(function()
        MainGui:Destroy()
    end)
end

local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Parent = CoreGui
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 300, 0, 180)
    Main.Position = UDim2.new(0.5, -150, 0.5, -90)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.Parent = KeyGui
    Instance.new("UICorner", Main)

    local Txt = Instance.new("TextLabel")
    Txt.Size = UDim2.new(1, 0, 0, 40)
    Txt.Text = "INGRESA LA KEY DE GEMINIXHUB"
    Txt.TextColor3 = Color3.fromRGB(255, 255, 255)
    Txt.BackgroundTransparency = 1
    Txt.Parent = Main

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(0, 260, 0, 40)
    Input.Position = UDim2.new(0.5, -130, 0, 60)
    Input.PlaceholderText = "Pega la llave aquí..."
    Input.Parent = Main

    local Enter = Instance.new("TextButton")
    Enter.Size = UDim2.new(0, 260, 0, 45)
    Enter.Position = UDim2.new(0.5, -130, 0, 115)
    Enter.Text = "INGRESAR A GEMINIXHUB"
    Enter.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    Enter.Parent = Main
    
    Enter.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then
            KeyGui:Destroy()
            AbrirMenuHacks()
        else
            Enter.Text = "KEY INCORRECTA"
            task.wait(1)
            Enter.Text = "INGRESAR A GEMINIXHUB"
        end
    end)
end
StartKeySystem()
