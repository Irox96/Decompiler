local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Idk Decompiler",
    Icon = 0,
    LoadingTitle = "Idk Decompiler",
    LoadingSubtitle = "by Irox",
    Theme = "Default",
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "Decompiler Settings"
    },
 
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
 
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"}
    }
}) 

-- Tab
local Settingstab = Window:CreateTab("Settings")
local Decompilertab = Window:CreateTab("Decompiler")
local othertab = Window:CreateTab("Other")

-- Settings
local Option = {
    SafeMode = false,
    timeout = 0,
    SaveByte = false,
    DecompileWithGui = false,
    NoScripts = false,
    ShutdownWhenDone = false,
    AntiIdle = false
}

local Button = othertab:CreateButton({
    Name = "Exit",
    Callback = function()
        Rayfield:Destroy()
    end
})

local Button = Decompilertab:CreateButton({
    Name = "Decomp",
    Callback = function()
 
          
        local Params = {
            RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
            SSI = "saveinstance",
        }
        
        local success, synsaveinstance = pcall(function()
            return loadstring(game:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
        end)
        
        synsaveinstance(Option)

        if not success then
            print("Error loading script: " .. tostring(synsaveinstance))
        end
    end
})

-- Settings toggle Buttons
local SafeModeToggle = Settingstab:CreateToggle({
    Name = "SafeMode",
    CurrentValue = false,
    Flag = "Toggle1", 
    Callback = function(Value)
        Option.SafeMode = Value
        print("SafeMode: " .. tostring(Value))
    end,
})

local DecompileGuiToggle = Settingstab:CreateToggle({
    Name = "Decompile with Gui",
    CurrentValue = false,
    Flag = "Toggle2", 
    Callback = function(Value)
        print("Decompile with Gui: " .. tostring(Value))
    end,
})

local SaveBytecodeToggle = Settingstab:CreateToggle({
    Name = "SaveBytecode",
    CurrentValue = false,
    Flag = "Toggle3", 
    Callback = function(Value)
        Option.SaveByte = Value
        print("SaveBytecode: " .. tostring(Value))
    end,
})

local NoScriptsToggle = Settingstab:CreateToggle({
    Name = "noscripts",
    CurrentValue = false,
    Flag = "Toggle4", 
    Callback = function(Value)
        print("noscripts: " .. tostring(Value))
    end,
})

local ShutdownToggle = Settingstab:CreateToggle({
    Name = "ShutdownWhenDone",
    CurrentValue = false,
    Flag = "Toggle5", 
    Callback = function(Value)
        print("ShutdownWhenDone: " .. tostring(Value))
    end,
})

local AntiIdleToggle = Settingstab:CreateToggle({
    Name = "AntiIdle",
    CurrentValue = false,
    Flag = "Toggle6", 
    Callback = function(Value)
        print("AntiIdle: " .. tostring(Value))
    end,
})
