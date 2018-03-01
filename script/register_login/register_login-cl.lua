RegisterScreen = {
    button = {},
    window = {},
    edit = {},
    label = {}
}
function RegisterScreenShow()
    local screenW, screenH = guiGetScreenSize()
    RegisterScreen.window[1] = guiCreateWindow((screenW - 589) / 2, (screenH - 423) / 2, 589, 423, "Seven Reallife", false)
    guiWindowSetMovable(RegisterScreen.window[1], false)
    guiWindowSetSizable(RegisterScreen.window[1], false)
    RegisterScreen.label[1] = guiCreateLabel(0.00, 0.05, 1.00, 0.34, "Register", true, RegisterScreen.window[1])
    guiSetFont(RegisterScreen.label[1], "sa-header")
    guiLabelSetHorizontalAlign(RegisterScreen.label[1], "center", false)
    guiLabelSetVerticalAlign(RegisterScreen.label[1], "center")
    RegisterScreen.label[2] = guiCreateLabel(-0.00, 0.44, 1.00, 0.13, "Please enter a password!", true, RegisterScreen.window[1])
    guiSetFont(RegisterScreen.label[2], "default-bold-small")
    guiLabelSetHorizontalAlign(RegisterScreen.label[2], "center", false)
    guiLabelSetVerticalAlign(RegisterScreen.label[2], "center")
    RegisterScreen.edit[1] = guiCreateEdit(9, 250, 570, 37, "", false, RegisterScreen.window[1])
    RegisterScreen.button[1] = guiCreateButton(215, 310, 153, 71, "Register", false, RegisterScreen.window[1])
    RegisterScreen.label[3] = guiCreateLabel(252, 40, 15, 15, "", false)    
    showCursor ( true )  
    guiEditSetMasked ( RegisterScreen.edit[1], true )
    addEventHandler ( "onClientGUIClick", RegisterScreen.button[1], RegisterButton )
end  

function RegisterButton()
    password = guiGetText(RegisterScreen.edit[1])
    triggerServerEvent ("getRegisterData", localPlayer, password)
    destroyElement(RegisterScreen.window[1]) 
    showCursor ( false )
end


LoginScreen = {
    button = {},
    window = {},
    edit = {},
    label = {}
}
function LoginScreenShow()
    local screenW, screenH = guiGetScreenSize()
    LoginScreen.window[1] = guiCreateWindow((screenW - 589) / 2, (screenH - 423) / 2, 589, 423, "Seven Reallife", false)
    guiWindowSetMovable(LoginScreen.window[1], false)
    guiWindowSetSizable(LoginScreen.window[1], false)
    LoginScreen.label[1] = guiCreateLabel(0.00, 0.05, 1.00, 0.34, "Login", true, LoginScreen.window[1])
    guiSetFont(LoginScreen.label[1], "sa-header")
    guiLabelSetHorizontalAlign(LoginScreen.label[1], "center", false)
    guiLabelSetVerticalAlign(LoginScreen.label[1], "center")
    LoginScreen.label[2] = guiCreateLabel(-0.00, 0.44, 1.00, 0.13, "Please enter a password!", true, LoginScreen.window[1])
    guiSetFont(LoginScreen.label[2], "default-bold-small")
    guiLabelSetHorizontalAlign(LoginScreen.label[2], "center", false)
    guiLabelSetVerticalAlign(LoginScreen.label[2], "center")
    LoginScreen.edit[1] = guiCreateEdit(9, 250, 570, 37, "", false, LoginScreen.window[1])
    LoginScreen.button[1] = guiCreateButton(215, 310, 153, 71, "Login", false, LoginScreen.window[1])
    LoginScreen.label[3] = guiCreateLabel(252, 40, 15, 15, "", false)     
    showCursor ( true )
    guiEditSetMasked ( LoginScreen.edit[1], true )
    addEventHandler ( "onClientGUIClick", LoginScreen.button[1], LoginButton )
end 

function LoginButton()
    password = guiGetText(LoginScreen.edit[1])
    triggerServerEvent ("getLoginData", localPlayer, password)
    destroyElement(LoginScreen.window[1]) 
    showCursor ( false )
end


addEvent( "showRegisterScreen", true )
addEventHandler( "showRegisterScreen", localPlayer, RegisterScreenShow )
addEvent( "showLoginScreen", true )
addEventHandler( "showLoginScreen", localPlayer, LoginScreenShow )