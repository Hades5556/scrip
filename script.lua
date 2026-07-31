-- ** INTERFAZ DE TRADE: STEAL A BRAINROT **
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

-- Evitar duplicados si ya está abierto
if CoreGui:FindFirstChild("TradeGuiPanel") then
    CoreGui.TradeGuiPanel:Destroy()
end

local TradeGuiPanel = Instance.new("ScreenGui")
TradeGuiPanel.Name = "TradeGuiPanel"
TradeGuiPanel.Parent = CoreGui

-- Ventana Principal
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 180)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = TradeGuiPanel

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Trade Panel"
Title.TextColor3 = Color3.fromRGB(255, 25, 25)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

-- Botón Auto Accept
local AcceptButton = Instance.new("TextButton")
AcceptButton.Size = UDim2.new(0.85, 0, 0, 45)
AcceptButton.Position = UDim2.new(0.075, 0, 0, 50)
AcceptButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
AcceptButton.Text = "Auto Accept: OFF"
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.TextSize = 14
AcceptButton.Font = Enum.Font.GothamSemibold
AcceptButton.Parent = MainFrame

local AcceptCorner = Instance.new("UICorner")
AcceptCorner.CornerRadius = UDim.new(0, 6)
AcceptCorner.Parent = AcceptButton

-- Botón Freeze Trade
local FreezeButton = Instance.new("TextButton")
FreezeButton.Size = UDim2.new(0.85, 0, 0, 45)
FreezeButton.Position = UDim2.new(0.075, 0, 0, 110)
FreezeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
FreezeButton.Text = "Cancel / Freeze"
FreezeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeButton.TextSize = 14
FreezeButton.Font = Enum.Font.GothamSemibold
FreezeButton.Parent = MainFrame

local FreezeCorner = Instance.new("UICorner")
FreezeCorner.CornerRadius = UDim.new(0, 6)
FreezeCorner.Parent = FreezeButton

-- Lógica de Funcionalidad con los Remotes del juego
local TradeService = ReplicatedStorage:FindFirstChild("TradeService")
local autoAcceptActive = false

-- Auto Accept Toggle
AcceptButton.MouseButton1Click:Connect(function()
    autoAcceptActive = not autoAcceptActive
    if autoAcceptActive then
        AcceptButton.Text = "Auto Accept: ON"
        AcceptButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    else
        AcceptButton.Text = "Auto Accept: OFF"
        AcceptButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end
end)

-- Loop para el Auto Accept en tiempo real
task.spawn(function()
    while task.wait(0.5) do
        if autoAcceptActive and TradeService then
            pcall(function()
                local readyEvent = TradeService:FindFirstChild("Ready")
                if readyEvent then
                    readyEvent:FireServer()
                end
            end)
        end
    end
end)

-- Botón Freeze / Cancelar Trade
FreezeButton.MouseButton1Click:Connect(function()
    if TradeService then
        pcall(function()
            local cancelEvent = TradeService:FindFirstChild("CancelTrade")
            if cancelEvent then
                cancelEvent:FireServer()
            end
        end)
    end
end)
