-- Define the hotkey modifier
local hyper = {"ctrl", "alt", "shift"}

-- Define the hotkey to launch Brave Browser
hs.hotkey.bind(hyper, 'b', function()
    hs.application.launchOrFocus("Brave Browser")
end)

-- Define the hotkey to launch Warp
hs.hotkey.bind(hyper, 'w', function()
    hs.application.launchOrFocus("iTerm")
end)

-- Define the hotkey to launch Microsoft Teams (work or school)
hs.hotkey.bind(hyper, 't', function()
    hs.application.launchOrFocus("Microsoft Teams (work or school)")
end)