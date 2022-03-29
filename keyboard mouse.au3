#NoTrayIcon

#Include <Misc.au3>
#Include <Restart.au3>
#include <MsgBoxConstants.au3>
Global $aPos = MouseGetPos()
Global $ix=$aPos[0],$iy=$aPos[1]
Global $sMDHk, $sMUHk,$sMRHk, $sMLHk,$sMCHk="!{HOME}",$sMCRHk="!{END}",$sDEFAULTK= "!"
Global $bguicreated, $hguicreated=0
global $Save, $Default,$LC,$RC,$Close, $AS
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
Load()
HotKeySet("{F8}","Exitp")
HotKeySet("{F1}","HELP")
Func HELP()
   $hguicreated=1
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 615, 437, 192, 124)
$AS = GUICtrlCreateButton("About Us", 16, 400, 75, 25)
$Close = GUICtrlCreateButton("Close", 104, 400, 75, 25)
$Label1 = GUICtrlCreateLabel("KeyBoard Mouse", 48, 32, 85, 17)
$Label2 = GUICtrlCreateLabel("By BGF", 48, 48, 40, 17)
GUICtrlSetFont(-1, 4, 400, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("You can open the settings menu by pressing f2.", 48, 80, 228, 17)
$Label4 = GUICtrlCreateLabel("You can close this menu by pressing ALT+F4 or choosing the close button below", 48, 112, 385, 17)
$Label5 = GUICtrlCreateLabel("What is a menu key ", 48, 144, 101, 17)
$Label6 = GUICtrlCreateLabel("The menu key is required to use the software you need to press the menu key to use the programs features", 48, 168, 507, 17)
$Label7 = GUICtrlCreateLabel("Tip:", 48, 208, 22, 17)
$Label8 = GUICtrlCreateLabel("You can move the cursor with the menu key+ arrows.", 48, 240, 255, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



EndFunc
Func Exitp()
Exit
EndFunc
Func Load()

   $sMCHk=IniRead("config.ini","Hotkeys","LC","{HOME}")
   $sMCRHk=IniRead("config.ini","Hotkeys","RC","{END}")
   $sDEFAULTK=IniRead("config.ini","Hotkeys","DEF","!")

   Switch $sDEFAULTK
	  case "!"
	  HotKeySet("!{DOWN}", "MD")
	  HotKeySet("!{UP}", "MU")
	  HotKeySet("!{RIGHT}", "MR")
	  HotKeySet("!{LEFT}", "ML")
	  HotKeySet($sDEFAULTK&"{"&$sMCHK&"}", "MC")
	  HotKeySet($sDEFAULTK&"{"&$sMCRHK&"}", "MCR")

	  case "^"
      HotKeySet("^{DOWN}", "MD")
	  HotKeySet("^{UP}", "MU")
	  HotKeySet("^{RIGHT}", "MR")
	  HotKeySet("^{LEFT}", "ML")
	  HotKeySet($sDEFAULTK&"{"&$sMCHK&"}", "MC")
	  HotKeySet($sDEFAULTK&"{"&$sMCRHK&"}", "MCR")

	  case "+"
	  HotKeySet("+{DOWN}", "MD")
	  HotKeySet("+{UP}", "MU")
	  HotKeySet("+{RIGHT}", "MR")
	  HotKeySet("+{LEFT}", "ML")
	  HotKeySet($sDEFAULTK&"{"&$sMCHK&"}", "MC")
	  HotKeySet($sDEFAULTK&"{"&$sMCRHK&"}", "MCR")

	  EndSwitch


EndFunc
if IniRead("config.ini","Defconf","ISF","1" )==1 Then
   Help()
   iniWrite("config.ini","Defconf","ISF","0" )
EndIf
HotKeySet("{F2}","MENU")
Func MENU()
$bguicreated=1
$menu = GUICreate("Menu", 345, 246, 747, 135)
$LC = GUICtrlCreateInput($sMCHK, 40, 40, 161, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
$LeftClick = GUICtrlCreateLabel("LeftClick", 208, 40, 45, 17)
$RC = GUICtrlCreateInput($sMCRHK, 40, 72, 161, 21, BitOR($GUI_SS_DEFAULT_INPUT,$ES_CENTER))
$RightClick = GUICtrlCreateLabel("RightClick", 208, 72, 52, 17)
$Default = GUICtrlCreateInput($sDEFAULTK, 40, 104, 161, 21)
$MenuKey = GUICtrlCreateLabel("MenuKey", 208, 104, 49, 25)
$Save = GUICtrlCreateButton("Save", 128, 176, 75, 25)
GUISetState(@SW_SHOW)
EndFunc
#EndRegion ### END Koda GUI section ###

While 1
   $nMsg = GUIGetMsg()
   if $bguicreated then
	  $nMsg = GUIGetMsg()

	Switch $nMsg
	  Case $GUI_EVENT_CLOSE
			GUIDelete()

	  Case $Save


		 $sDEFAULTK=GUICtrlRead($Default)

		 $sMCHK=GUICtrlRead($LC)
		 $sMCRHK=GUICtrlRead($RC)
		 iniWrite("config.ini","hotkeys","LC",$sMCHK )
		 iniWrite("config.ini","hotkeys","RC",$sMCRHK )
		 iniWrite("config.ini","hotkeys","DEF",$sDEFAULTK )
		 RestartSC()
	  Case else
	  EndSwitch
	  EndIf
   if $hguicreated then
	  $nMsg = GUIGetMsg()

	Switch $nMsg
	  Case $GUI_EVENT_CLOSE
			GUIDelete();
		 Case $Close
			GUIDelete();
		 Case $AS
			$sUrl='http://google.com'
		 Case else
	  EndSwitch
   EndIf
   Switch $nMsg
	  Case $GUI_EVENT_CLOSE
			GUIDelete()

   EndSwitch
WEnd




Func MD()
   $iy=$iy+10;
   MouseMove($ix,$iy,1)


EndFunc
Func MU()
   $iy=$iy-10;
   MouseMove($ix,$iy,1)

EndFunc
Func MR()
   $ix=$ix+10;
   MouseMove($ix,$iy,1)

EndFunc
Func ML()
   $ix=$ix-10;
   MouseMove($ix,$iy,1)

EndFunc
Func MC()
   sleep(300)
   MouseClick("Left")


EndFunc
Func MCR()
   sleep(300)
   MouseClick("RIGHT")

EndFunc
Func RestartSC()
    _ScriptRestart()

EndFunc