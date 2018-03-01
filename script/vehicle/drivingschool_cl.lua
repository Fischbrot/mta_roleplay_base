    Drivingschool = {
        button = {},
        window = {},
        radiobutton = {},
        label = {}
    }
function openDrivingSchool()
    local screenW, screenH = guiGetScreenSize()
    Drivingschool.window[1] = guiCreateWindow((screenW - 353) / 2, (screenH - 370) / 2, 353, 370, "Driving School", false)
    guiWindowSetSizable(Drivingschool.window[1], false)
    guiWindowSetMovable ( Drivingschool.window[1], false )
    Drivingschool.label[1] = guiCreateLabel(20, 38, 205, 21, "Car", false, Drivingschool.window[1])
    Drivingschool.label[2] = guiCreateLabel(20, 81, 205, 21, "Motorbike", false, Drivingschool.window[1])
    Drivingschool.label[3] = guiCreateLabel(20, 125, 205, 21, "Truck", false, Drivingschool.window[1])
    Drivingschool.label[4] = guiCreateLabel(20, 169, 205, 21, "Gun License", false, Drivingschool.window[1])
    Drivingschool.label[5] = guiCreateLabel(20, 211, 205, 21, "Plane", false, Drivingschool.window[1])
    Drivingschool.label[6] = guiCreateLabel(20, 257, 205, 21, "Helicopter", false, Drivingschool.window[1])
    Drivingschool.label[7] = guiCreateLabel(225, 38, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.label[8] = guiCreateLabel(225, 81, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.label[9] = guiCreateLabel(225, 125, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.label[10] = guiCreateLabel(225, 169, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.label[11] = guiCreateLabel(225, 211, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.label[12] = guiCreateLabel(225, 257, 94, 21, "1000$", false, Drivingschool.window[1])
    Drivingschool.radiobutton[1] = guiCreateRadioButton(318, 38, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.radiobutton[2] = guiCreateRadioButton(319, 81, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.radiobutton[3] = guiCreateRadioButton(319, 125, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.radiobutton[4] = guiCreateRadioButton(319, 169, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.radiobutton[5] = guiCreateRadioButton(319, 211, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.radiobutton[6] = guiCreateRadioButton(319, 257, 22, 21, "", false, Drivingschool.window[1])
    Drivingschool.button[1] = guiCreateButton(30, 310, 122, 46, "Buy License", false, Drivingschool.window[1])
    Drivingschool.button[2] = guiCreateButton(209, 310, 122, 46, "Cancel", false, Drivingschool.window[1]) 
    showCursor ( true )  
    addEventHandler ( "onClientGUIClick", Drivingschool.button[1], drinvingschool_func, false )
    addEventHandler ( "onClientGUIClick", Drivingschool.button[2], closeDrivingschool, false )
end
addEvent( "showDrivingschool", true )
addEventHandler( "showDrivingschool", localPlayer, openDrivingSchool )

function drinvingschool_func()
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[1]) then
        giveLicense = "carlicense"
    end
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[2]) then
        giveLicense = "bikelicense"
    end
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[3]) then
        giveLicense = "lkwlicense"
    end
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[4]) then
        giveLicense = "gunlicense"
    end
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[5]) then
        giveLicense = "planelicense"
    end
    if guiRadioButtonGetSelected(Drivingschool.radiobutton[6]) then
        giveLicense = "helilicense"
    end
    triggerServerEvent ("resultDrivingschool", localPlayer, giveLicense)
    destroyElement(Drivingschool.window[1])
    showCursor ( false )
end

function closeDrivingschool()
    destroyElement(Drivingschool.window[1]) 
    showCursor ( false )
end
