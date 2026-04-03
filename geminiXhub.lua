-- [[ GeminiXhub v2.0 - Official Source Code ]]
-- Desarrollado por: holawillowxd-dev & Gemini AI
-- Estado: ACTIVE (v2.0)

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- [[ CONFIGURACIÓN ]]
_G.Key = "GXM-2026-TOP1" -- Esta es la llave que deben poner
_G.Noclip = false
_G.Flying = false
local flySpeed = 50

-- [[ SISTEMA DE KEY ]]
local function StartKeySystem()
    local KeyGui = Instance.new("ScreenGui")
    KeyGui.Name = "GeminiX_KeySystem"
    KeyGui.Parent = CoreGui

    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 350, 0, 220)
    Main.Position = UDim2.new(0.5, -175, 0.5, -110)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    Main.Parent = KeyGui
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Color = Color3.fromRGB(0, 150, 255)
    Stroke.Thickness = 2

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "GeminiXhub | KEY ACCESS"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.BackgroundTransparency = 1
    Title.Parent = Main

    local GetKeyBtn = Instance.new("TextButton")
    GetKeyBtn.Size = UDim2.new(0, 280, 0, 30)
    GetKeyBtn.Position = UDim2.new(0.5, -140, 0, 55)
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    GetKeyBtn.Text = "key here bro (Copy Key)"
    GetKeyBtn.TextColor3 = Color3.fromRGB(0, 180, 255)
    GetKeyBtn.Font = Enum.Font.GothamItalic
    GetKeyBtn.Parent = Main
    Instance.new("UICorner", GetKeyBtn)

    GetKeyBtn.MouseButton1Click:Connect(function()
        setclipboard("GXM-2026-TOP1") -- Copia la key directo para que no sufran
        GetKeyBtn.Text = "KEY COPIADA!"
        task.wait(2
        
