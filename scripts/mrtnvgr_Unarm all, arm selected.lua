-- Idea by DawnShiftAudio

reaper.PreventUIRefresh(1);

reaper.Undo_BeginBlock();

-- Track: Unarm all tracks for recording
reaper.Main_OnCommand(40491, 0);

-- Xenakios/SWS: Set selected tracks record armed
local arm = reaper.NamedCommandLookup("_XENAKIOS_SELTRAX_RECARMED");
reaper.Main_OnCommand(arm, 0);

reaper.Undo_EndBlock("Unarm all, arm selected", -1);

reaper.PreventUIRefresh(-1);
