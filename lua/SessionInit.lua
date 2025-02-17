-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
--

-- This is the user-side session specific top-level lua initialization
-- file.  It is loaded into a fresh lua state when a new session is
-- initialized.

-- Do global init
doscript '/lua/userInit.lua'

-- Add UI-only mods to the list of mods to use
for i, m in ipairs(import("/lua/mods.lua").GetUiMods()) do
    table.insert(__active_mods, m)
end

LOG('Active mods in session:')
for _, mod in __active_mods do
    LOG(string.format('\t"%-30s v%02d (%-37s by %s', tostring(mod.name) .. '"', tostring(mod.version), tostring(mod.uid) .. ')', tostring(mod.author)))
end

doscript '/lua/UserSync.lua'
