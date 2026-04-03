-- [[ GeminiXhub v3.0 - Versión Final Pro ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

_G.Key = "GXM-2026-TOP1"

local function CrearMenuHacks()
    local MainGui = Instance.new("ScreenGui")
    MainGui.Name = "GeminiX_Oficial"
    MainGui.Parent = CoreGui
    MainGui.ResetOnSpawn = false

    -- BOTON PARA REABRIR (EL QUE APARECE AL CERRAR)
    local OpenBtn = Instance.new("TextButton")
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, 0)
    OpenBtn.Text = "G"
    OpenBtn.Visible = false
    OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Parent = MainGui
    Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(1, 0)

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 220, 0, 260) -- Más grande para que quepa todo
    Frame.Position = UDim2.new(0.5, -110, 0.5, -130)
    Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    Frame.BorderSizePixel = 0
    Frame.Parent = MainGui
    Instance.new("UICorner", Frame)

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Text = "GEMINIXHUB V3"
    Title.TextColor3 = Color3.fromRGB(0, 150, 255)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.Parent = Frame

    -- FUNCION VELOCIDAD
    local SpeedBtn = Instance.new("TextButton")
    SpeedBtn.Size = UDim2.new(0, 190, 0, 45)
    SpeedBtn.Position = UDim2.new(0.5, -95, 0, 50)
    SpeedBtn.Text = "VELOCIDAD FLASH"
    SpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpeedBtn.Parent = Frame
    SpeedBtn.MouseButton1Click:Connect(function()
        LocalPlayer.Character.Humanoid.WalkSpeed = 100
    end)

    -- FUNCION SALTO (MEJORADA)
    local JumpBtn = Instance.new("TextButton")
    JumpBtn.Size = UDim2.new(0, 190, 0, 45)
    JumpBtn.Position = UDim2.new(0.5, -95, 0, 105)
    JumpBtn.Text = "SUPER SALTO"
    JumpBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    JumpBtn.Parent = Frame
    JumpBtn.MouseButton1Click:Connect(function()
        LocalPlayer.Character.Humanoid.UseJumpPower = true
        LocalPlayer.Character.Humanoid.JumpPower = 150
    end)

    -- BOTON MINIMIZAR (PARA QUE NO SE BORRE)
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0, 190, 0, 45)
    CloseBtn.Position = UDim2.new(0.5, -95, 0, 180)
    CloseBtn.Text = "MINIMIZAR MENU"
    CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseBtn.Parent = Frame
    
    CloseBtn.MouseButton1Click:Connect(function()
        Frame.Visible = false
        OpenBtn.Visible = true
    end)

    OpenBtn.MouseButton1Click:Connect(function()
        Frame.Visible = true
        OpenBtn.Visible = false
    end)
end

-- SISTEMA DE LLAVE (SIN CAMBIOS)
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Parent = CoreGui
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 300, 0, 180)
    Main.Position = UDim2.new(0.5, -150, 0.5, -90)
    Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Main.Parent = KeyGui
    Instance.new("UICorner", Main)

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(0, 240, 0, 40)
    Input.Position = UDim2.new(0.5, -120, 0, 50)
    Input.PlaceholderText = "Pega la llave aquí..."
    Input.Parent = Main

    local Enter = Instance.new("TextButton")
    Enter.Size = UDim2.new(0, 240, 0, 45)
    Enter.Position = UDim2.new(0.5, -120, 0, 110)
    Enter.Text = "INGRESAR"
    Enter.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Enter.Parent = Main
    
    Enter.MouseButton1Click:Connect(function()
        if Input.Text == _G.Key then
            KeyGui:Destroy()
            CrearMenuHacks()
        end
    end)
end
StartKeySystem()
