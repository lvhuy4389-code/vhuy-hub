-- ===================================================
-- 👑 VHUY HUB - STEAL AN EGG VIP SCRIPT
-- ===================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Thông báo khởi động
pcall(function()
    StarterGui:SetCore("SendNotification", {
        Title = "👑 VHUY HUB",
        Text = "Đã tải VHUY HUB - Steal An Egg!",
        Duration = 4
    })
end)

-- Tạo Giao diện
if CoreGui:FindFirstChild("VhuyHubStealEgg") then
    CoreGui.VhuyHubStealEgg:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VhuyHubStealEgg"
ScreenGui.Parent = CoreGui

-- Nút Bật/Tắt Menu (Tròn)
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Parent = ScreenGui
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleBtn.Position = UDim2.new(0.02, 0, 0.2, 0)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Font = Enum.Font.SourceSansBold
ToggleBtn.Text = "VHUY"
ToggleBtn.TextColor3 = Color3.fromRGB(0, 255, 120)
ToggleBtn.TextSize = 14
ToggleBtn.Draggable = true
ToggleBtn.Active = true

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(1, 0)
BtnCorner.Parent = ToggleBtn

local BtnStroke = Instance.new("UIStroke")
BtnStroke.Parent = ToggleBtn
BtnStroke.Color = Color3.fromRGB(0, 255, 120)
BtnStroke.Thickness = 2

-- Bảng Chức Năng
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Position = UDim2.new(0.3, 0, 0.25, 0)
Frame.Size = UDim2.new(0, 300, 0, 320)
Frame.Visible = false
Frame.Active = true
Frame.Draggable = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 8)
FrameCorner.Parent = Frame

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "👑 VHUY HUB - STEAL AN EGG"
Title.TextColor3 = Color3.fromRGB(0, 255, 120)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 16
Title.BackgroundTransparency = 1

local Container = Instance.new("ScrollingFrame")
Container.Parent = Frame
Container.Position = UDim2.new(0, 10, 0, 45)
Container.Size = UDim2.new(1, -20, 1, -55)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 350)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Container
Layout.Padding = UDim.new(0, 6)

local function AddButton(text, color, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = Container
    btn.Size = UDim2.new(1, -5, 0, 35)
    btn.BackgroundColor3 = color or Color3.fromRGB(40, 40, 40)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 13
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 6)
    c.Parent = btn
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ===================================================
-- CÁC TÍNH NĂNG CHÍNH (STEAL AN EGG)
-- ===================================================

local AutoFarm = false
AddButton("🥚 Bật/Tắt Auto Lấy Trứng", Color3.fromRGB(0, 150, 100), function()
    AutoFarm = not AutoFarm
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "VHUY HUB",
            Text = AutoFarm and "Đã BẬT Auto Trứng" or "Đã TẮT Auto Trứng",
            Duration = 2
        })
    end)
    
    task.spawn(function()
        while AutoFarm do
            task.wait(0.5)
            pcall(function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj.Name:lower():find("egg") and obj:IsA("BasePart") then
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = obj.CFrame
                        end
                    end
                end
            end)
        end
    end)
end)

AddButton("⚡ Chạy Nhanh (Speed 80)", Color3.fromRGB(50, 50, 150), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 80
    end
end)

AddButton("🦘 Nhảy Cao (Jump 120)", Color3.fromRGB(150, 100, 0), function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 120
    end
end)

local Noclip = false
AddButton("🧱 Bật/Tắt Đi Xuyên Tường", Color3.fromRGB(150, 50, 50), function()
    Noclip = not Noclip
    RunService.Stepped:Connect(function()
        if Noclip and LocalPlayer.Character then
            for _, p in pairs(LocalPlayer.Character:GetChildren()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end)

ToggleBtn.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
