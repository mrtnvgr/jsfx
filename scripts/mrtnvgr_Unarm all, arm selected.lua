-- Idea by DawnShiftAudio

reaper.Undo_BeginBlock();

-- Track: Unarm all tracks for recording
reaper.Main_OnCommand(40491, 0);

-- Track: Toggle record arm for selected tracks
reaper.Main_OnCommand(9, 0);

reaper.Undo_EndBlock("Unarm all, arm selected", -1);
