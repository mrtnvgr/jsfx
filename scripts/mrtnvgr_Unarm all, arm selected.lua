-- Idea by DawnShiftAudio

NUM_SELECTED = reaper.CountSelectedTracks(0);

function unarmAll()
    -- Track: Unarm all tracks for recording
    reaper.Main_OnCommand(40491, 0);
end

function areAllSelectedTracksArmed()
    all_armed = true;

    for i = 0, NUM_SELECTED - 1 do
        local track = reaper.GetSelectedTrack(0, i);
        local armed = reaper.GetMediaTrackInfo_Value(track, "I_RECARM");

        if armed == 0 then
            all_armed = false;
            break;
        end
    end

    return all_armed;
end

reaper.PreventUIRefresh(1);
reaper.Undo_BeginBlock();

if NUM_SELECTED == 0 then
    unarmAll();
else
    local all_armed = areAllSelectedTracksArmed();
    local recflag = all_armed and 0 or 1;

    for i = 0, NUM_SELECTED - 1 do
        local track = reaper.GetSelectedTrack(0, i);
        reaper.SetMediaTrackInfo_Value(track, "I_RECARM", recflag);
    end
end

reaper.Undo_EndBlock("Unarm all, arm selected", -1);
reaper.PreventUIRefresh(-1);
