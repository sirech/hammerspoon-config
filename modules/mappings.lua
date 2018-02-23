local wf = hs.window.filter

function remap (letter)
    return hs.hotkey.new({"ctrl"}, letter, nil, function()
            hs.eventtap.keyStroke({"cmd"}, letter)
    end)
end

function enableBinds(binds)
    -- hs.console.printStyledtext("term focused")
    for k,v in pairs(binds) do
        v:enable()
    end
end

function disableBinds(binds)
    -- hs.console.printStyledtext("term unfocused")
    for k,v in pairs(binds) do
        v:disable()
    end
end

function activate(appGroup, bindings)
    for k, v in pairs(appGroup) do
        local app = wf.new{v}

        app:subscribe(wf.windowFocused, function()
                          for k2, bindings in pairs(bindings) do
                              enableBinds(bindings)
                          end
        end)

        app:subscribe(wf.windowUnfocused, function()
                          for k2, bindings in pairs(bindings) do
                              disableBinds(bindings)
                          end
        end)
    end
end

local copyPasteBinds = {
    remap('C'),
    remap('V'),
    remap('X'),
    remap('Z'),
}

local interactionBinds = {
    remap('S'),
    remap('N'),
    remap('T'),
    remap('F'),
    remap('G'),
}

local browserBinds = {
    remap('L'),
    remap('D'),
    remap('R'),
}

local closeBinds = {
    remap('W')
}

local browsers = { "Google Chrome", "Chromium", "Firefox", "Safari" }

local apps = {
  "Basecamp 3",
  "Calendar",
  "Google Calendar",
  "Finder",
  "KeePassX",
  "Mail",
  "Mailplane 3",
  "Notes",
  "Numbers",
  "Preview",
  "SequelPro",
  "VeraCrypt",
  "Whale"
  }

local chats = { "HipChat", "YakYak", "Mattermost" }

return {
    init = function ()
        activate(browsers, { browserBinds,
                             interactionBinds,
                             copyPasteBinds,
                             closeBinds,
        })

        activate(apps, { interactionBinds,
                         copyPasteBinds,
                         closeBinds
        })

        activate(chats, { interactionBinds,
                         copyPasteBinds,
                         closeBinds
        })

        activate({ "KeePassX" }, {{ remap("B") }})
    end
}
