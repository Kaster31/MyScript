script_author('Leon')
script_name('Night/Infrared vision')
script_description('Set night or infrared vision')
script_version('1.0')
local Tag = '[{0395fb}Vision{FFFFFF}] '
local vision = {
    night = false,
    infrared = false
}

function main()
    while not isSampAvailable() do wait(0) end
    sampAddChatMessage(Tag .. '����������� {FF0000}/vis [night/inf]{FFFFFF}.', -1)
    sampRegisterChatCommand('vis', function(arg)
        if arg == 'night' and not vision.infrared then
            vision.night = not vision.night
            return setNightVision(vision.night)
        elseif arg == 'night' and vision.infrared then
            return sampAddChatMessage(Tag .. '��������� ������������ ������.', -1)
        end
        if arg == 'inf' and not vision.night then
            vision.infrared = not vision.infrared
            return setInfraredVision(vision.infrared)
        elseif arg == 'inf' and not vision.night then
            return sampAddChatMessage(Tag .. '��������� ������ ������.', -1)
        end
        return sampAddChatMessage(Tag .. '�������� ��������. ����������� night ��� inf.', -1)
    end)
    while true do
        wait(-1)
    end
end