-- Specify Spoons which will be loaded
hspoon_list = {
    -- "AClock",
    "BingDaily",
    -- "Calendar",
    "CircleClock",
    "ClipShow",
    "CountDown",
    "FnMate",
    "HCalendar",
    "HSaria2",
    "HSearch",
    -- "KSheet",
    "SpeedMenu",
    -- "TimeFlow",
    -- "UnsplashZ",
    "WinWin",
}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
hsapp_list = {
    { key = "1", name = "Emacs"},
    { key = "2", name = "iTerm"},
    { key = "3", name = "Google Chrome"},
    { key = "4", name = "Chromium"},
    { key = "5", name = "Safari"},
    { key = "m", name = "Mailplane 3"},
    { key = "h", name = "YakYak"},
    { key = "j", name = "Mattermost"},
    { key = "c", name = "Google Calendar"},
    { key = "x", name = "xScope"},
    { key = "t", name = "Whale"},
    { key = "k", name = "KeePassX"},
    { key = "n", name = "Notes"},
    { key = "i", name = "IntelliJ IDEA CE"},
    { key = "v", name = "Visual Studio Code"},
    { key = "b", name = "Basecamp 3"}
}

local leader = {"cmd", "ctrl", "alt", "shift"};

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = { leader, "Q"}

-- Reload Hammerspoon configuration
hsreload_keys = { leader, "R"}

-- Toggle help panel of this configuration.
hshelp_keys = {{"alt", "shift"}, "/"}

-- aria2 RPC host address
-- hsaria2_host = "http://localhost:6800/jsonrpc"
-- aria2 RPC host secret
-- hsaria2_secret = "token"

----------------------------------------------------------------------------------------------------
-- Those keybindings below could be disabled by setting to {"", ""} or {{}, ""}

-- Window hints keybinding: Focuse to any window you want
hswhints_keys = { leader, "tab"}

-- appM environment keybinding: Application Launcher
hsappM_keys = { leader, "F"}

-- clipshowM environment keybinding: System clipboard reader
-- hsclipsM_keys = {"alt", "C"}

-- Toggle the display of aria2 frontend
-- hsaria2_keys = {"alt", "D"}

-- Launch Hammerspoon Search
-- hsearch_keys = {"alt", "G"}

-- Read Hammerspoon and Spoons API manual in default browser
-- hsman_keys = {"alt", "H"}

-- countdownM environment keybinding: Visual countdown
-- hscountdM_keys = {"alt", "I"}

-- Lock computer's screen
-- hslock_keys = {"alt", "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {leader, "W"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {"alt", "S"}

-- Show digital clock above all windows
-- hsaclock_keys = {"alt", "T"}

-- Type the URL and title of the frontmost web page open in Google Chrome or Safari.
-- hstype_keys = {"alt", "V"}

-- Toggle Hammerspoon console
hsconsole_keys = {"alt", "Z"}


--- INIT OWN MODULES
local myConfig = hs.fs.pathToAbsolute(os.getenv("HOME") .. '/.config/hammerspoon')
local modules = {
    "mappings.lua"
}

for _, v in ipairs(modules) do
    local module_name = myConfig .. '/modules/' .. v
    local module = dofile(module_name)

    if type(module.init) == "function" then
        module.init()
    end
end
