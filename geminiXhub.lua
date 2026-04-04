-- [[ GeminiXhub v10.5 - NOT VISUAL (WIP) ]]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

_G.Key = "GXM-2026-TOP1"
local States = { Speed = false, Jump = false, ESP = false, InfJump = false }

local function EstiloVoid(instancia, radio)
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, radio or 8)
    Corner.Parent = instancia
end

local function CrearMenuTabs()
    local MainGui = Instance.new("ScreenGui", CoreGui)
    MainGui.Name = "GeminiX_WIP"

    local OpenBtn = Instance.new("TextButton", MainGui)
    OpenBtn.Size = UDim2.new(0, 50, 0, 50)
    OpenBtn.Position = UDim2.new(0, 10, 0.5, 0)
    OpenBtn.Text = "G"
    OpenBtn.Visible = false
    OpenBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    OpenBtn.Font = Enum.Font.GothamBold
    EstiloVoid(OpenBtn, 25)

    local MainFrame = Instance.new("Frame", MainGui)
    MainFrame.Size = UDim2.new(0, 480, 0, 320)
    MainFrame.Position = UDim2.new(0.5, -240, 0.5, -160)
    MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    EstiloVoid(MainFrame, 12)
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(0, 170, 255)

    local Sidebar = Instance.new("Frame", MainFrame)
    Sidebar.Size = UDim2.new(0, 130, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
    EstiloVoid(Sidebar, 12)

    local Title = Instance.new("TextLabel", Sidebar)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "GEMINIX V10.5"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 16
    Title.BackgroundTransparency = 1

    local Pages = Instance.new("Frame", MainFrame)
    Pages.Size = UDim2.new(1, -145, 1, -10)
    Pages.Position = UDim2.new(0, 135, 0, 5)
    Pages.BackgroundTransparency = 1

    local function CrearPagina(nombre)
        local P = Instance.new("ScrollingFrame", Pages)
        P.Name = nombre
        P.Size = UDim2.new(1, 0, 1, 0)
        P.BackgroundTransparency = 1
        P.Visible = false
        P.CanvasSize = UDim2.new(0, 0, 1.5, 0)
        P.ScrollBarThickness = 0
        return P
    end

    local PagMain = CrearPagina("Main")
    local PagNotVisual = CrearPagina("Not Visual")
    local PagVisuals = CrearPagina("Visuals")
    local PagInfo = CrearPagina("Info")

    local function MostrarPagina(nombre)
        for _, p in pairs(Pages:GetChildren()) do p.Visible = false end
        Pages[nombre].Visible = true
    end
    MostrarPagina("Main")

    local function BotonTab(texto, yPos)
        local B = Instance.new("TextButton", Sidebar)
        B.Size = UDim2.new(0.9, 0, 0, 35)
        B.Position = UDim2.new(0.05, 0, 0, yPos)
        B.Text = texto
        B.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        B.TextColor3 = Color3.fromRGB(255, 255, 255)
        B.Font = Enum.Font.Gotham
        B.TextSize = 12
        EstiloVoid(B, 6)
        B.MouseButton1Click:Connect(function() MostrarPagina(texto) end)
    end

    BotonTab("Main", 60)
    BotonTab("Not Visual", 100)
    BotonTab("Visuals", 140)
    BotonTab("Info", 180)

    local function CrearToggle(txt, pag, y, callback)
        local T = Instance.new("TextButton", pag)
        T.Size = UDim2.new(0.95, 0, 0, 40)
        T.Position = UDim2.new(0.025, 0, 0, y)
        T.Text = txt .. ": OFF"
        T.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        T.TextColor3 = Color3.fromRGB(220, 220, 220)
        T.Font = Enum.Font.Gotham
        EstiloVoid(T, 6)
        local act = false
        T.MouseButton1Click:Connect(function()
            act = not act
            T.Text = txt .. (act and ": ON" or ": OFF")
            T.BackgroundColor3 = act and Color3.fromRGB(0, 100, 200) or Color3.fromRGB(25, 25, 25)
            callback(act)
        end)
    end

    -- PESTAÑA MAIN
    CrearToggle("Reset Character", PagMain, 10, function() LocalPlayer.Character:BreakJoints() end)

    -- PESTAÑA NOT VISUAL (CON WIP)
    local WipTitle = Instance.new("TextLabel", PagNotVisual)
    WipTitle.Size = UDim2.new(1, 0, 0, 30)
    WipTitle.Position = UDim2.new(0, 0, 0, 0)
    WipTitle.Text = "[ WIP - SECCIÓN EN DESARROLLO ]"
    WipTitle.TextColor3 = Color3.fromRGB(255, 100, 0)
    WipTitle.Font = Enum.Font.GothamBold
    WipTitle.BackgroundTransparency = 1
    WipTitle.TextSize = 12

    CrearToggle("Speed Flash", PagNotVisual, 40, function(s) LocalPlayer.Character.Humanoid.WalkSpeed = s and 100 or 16 end)
    CrearToggle("Super Jump", PagNotVisual, 90, function(s) LocalPlayer.Character.Humanoid.JumpPower = s and 150 or 50 end)
    CrearToggle("Infinite Jump", PagNotVisual, 140, function(s) States.InfJump = s end)
    
    local MoreComing = Instance.new("TextLabel", PagNotVisual)
    MoreComing.Size = UDim2.new(1, 0, 0, 40)
    MoreComing.Position = UDim2.new(0, 0, 0, 190)
    MoreComing.Text = "Próximamente: Fly, Noclip, GodMode..."
    MoreComing.TextColor3 = Color3.fromRGB(100, 100, 100)
    MoreComing.Font = Enum.Font.GothamItalic
    MoreComing.BackgroundTransparency = 1

    -- PESTAÑA VISUALS
    CrearToggle("ESP Wallhack", PagVisuals, 10, function(s)
        States.ESP = s
        if s then
            for _, v in pairs(Players:GetPlayers()) do
                if v ~= LocalPlayer and v.Character then
                    local h = Instance.new("Highlight", v.Character)
                    h.Name = "GeminiESP"
                    h.FillColor = Color3.fromRGB(0, 170, 255)
                end
            end
        else
            for _, v in pairs(Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("GeminiESP") then v.Character.GeminiESP:Destroy() end
            end
        end
    end)

    -- PESTAÑA INFO
    local GoalLabel = Instance.new("TextLabel", PagInfo)
    GoalLabel.Size = UDim2.new(0.9, 0, 0, 40)
    GoalLabel.Position = UDim2.new(0.05, 0, 0, 10)
    GoalLabel.Text = "GOAL: 10,000 LIKES FOR V11.0"
    GoalLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
    GoalLabel.Font = Enum.Font.GothamBold
    GoalLabel.BackgroundTransparency = 1

    local LikeBtn = Instance.new("TextButton", PagInfo)
    LikeBtn.Size = UDim2.new(0.7, 0, 0, 4
        
