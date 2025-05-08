#SingleInstance Force
#InstallKeybdHook

;A_MenuMaskKey := "vkFF"

;If GetKeyState("Ctrl")           ; If the OS believes the key to be in (logical state),
;{
;    If !GetKeyState("Ctrl","P")  ; but  the user isn't physically holding it down (physical state)
;    {
;        Send {Blind}{Ctrl Up}
;        MsgBox,,, Ctrl released
;        KeyHistory
;    }
;}


; Monitor escape
monitorCurrent := 1
~LWIN::
{
  Send {Blind}{vkE8}

  global monitorCurrent
  SysGet monitorCount, MonitorCount

  if( monitorCurrent < monitorCount ) {
    monitorCurrent += 1
  } else {
    monitorCurrent := 1
  }

  SysGet monitor, Monitor, %monitorCurrent%
  monitorX := (monitorLeft + monitorRight) / 2
  monitorY := (monitorBottom + monitorTop) / 2
  DllCall( "SetCursorPos", "int", monitorX, "int", monitorY )
  DllCall( "SetCursorPos", "int", monitorX, "int", monitorY )

  Return
}


F14 & Enter::
{
  WinSet AlwaysOnTop
  WinGetTitle title
  WinGet Style, Style
  if( Style & 0x8 ) {
    title := title . " - AlwaysOnTop"
  } else {
    title := RegexReplace( title, " - AlwaysOnTop" )
  }
  WinSetTitle title
  Return
}


`:: WinSet AlwaysOnTop, , A
F23:: WinSet AlwaysOnTop, , A

F14 & Backspace::
{
  InputBox WxH
  WH := StrSplit( WxH, "," )
  WinMove A, , WH[3]-10, WH[4], WH[1]+10+10, WH[2]+10
  Return
}
;F14 & Backspace:: WinMove 0-10, 0, 1600+10+10, 900+10, A

F14 & Tab::
{
  WinGetPos x, y, W, H, A
  WinMove A, , % (A_ScreenWidth - W) / 2, % (A_ScreenHeight - H) / 2
  Return
}


; ESC hotkeys
{
   ;ScrollLock::       Return

    Volume_Mute::      F1
    Volume_Down::      F2
    Volume_Up::        F3
    Media_Prev::       F4
    Media_Play_Pause:: F5
    Media_Next::       F6
    Browser_Back::     F7
    Browser_Home::     F8
    AppsKey::          F9
    <+<#F21::          F10
    <^<!Tab::          F11
   ;<#l::              F12

                ^F1::  Volume_Mute
                ^F2::  Volume_Down
                ^F3::  Volume_Up
                ^F4::  Media_Prev
                ^F5::  Media_Play_Pause
                ^F6::  Media_Next
                ^F7::  Browser_Back
                ^F8::  Browser_Home
                ^F9::  AppsKey
  ;             ^F10:: <+<#F21
  ;             ^F11:: <^<!Tab
  ;             ^F12:: <#l

   ^Volume_Mute::      Volume_Mute
   ^Volume_Down::      Volume_Down
   ^Volume_Up::        Volume_Up
   ^Media_Prev::       Media_Prev
   ^Media_Play_Pause:: Media_Play_Pause
   ^Media_Next::       Media_Next
   ^Browser_Back::     Browser_Back
   ^Browser_Home::     Browser_Home
   ^AppsKey::          AppsKey
  ;^<+<#F21::          <+<#F21
  ;^<^<!Tab::          <^<!Tab
  ;^<#l::              <#l
}


; CAPS hotkeys
{
  F14 &     F1:: ^F1
  F14 &     F2:: ^F2
  F14 &     F3:: ^F3
  F14 &     F4:: ^F4
  F14 &     F5:: ^F5
  F14 &     F6:: ^F6
  F14 &     F7:: ^F7
  F14 &     F8:: ^F8
  F14 &     F9:: ^F9
  F14 &    F10:: ^F10
  F14 &    F11:: ^F11
  F14 &    F12:: ^F12

  F14 &      a:: ^a
  F14 &      b:: ^b
  F14 &      c:: ^c
  F14 &      d:: ^d
  F14 &      e:: ^e
  F14 &      f:: ^f
  F14 &      g:: ^g
  F14 &      h:: ^h
  F14 &      i:: ^i
  F14 &      j:: ^j
  F14 &      k:: ^k
  F14 &      l:: ^l
  F14 &      m:: ^m
  F14 &      n:: ^n
  F14 &      o:: ^o
  F14 &      p:: ^p
  F14 &      q:: ^q
  F14 &      r:: ^r
  F14 &      s:: ^s
  F14 &      t:: ^t
  F14 &      u:: ^u
  F14 &      v:: ^v
  F14 &      w:: ^w
  F14 &      x:: ^x
  F14 &      y:: ^y
  F14 &      z:: ^z
  F14 &      -:: ^-
  F14 &      =:: ^=
  F14 &      `:: ^`
  F14 &  sc027:: ^vkBA
  F14 &      ':: ^'
  F14 &      ,:: ^,
  F14 &      .:: ^.
  F14 &      /:: ^/
  F14 &      \:: ^\
  F14 &      [:: ^[
  F14 &      ]:: ^]

  F14 &    Del:: Insert

  F14 &   PgUp:: Home
  F14 &   PgDn:: End

  F14 &  Space:: ^Space

;;F14 & Enter::
;;{
;;  Send ^c
;;  Run "https://translate.google.com/#view=home&op=translate&sl=en&tl=zh-CN&text=" A_Clipboard
;;}

;;F14 & Backspace::
;;{
;;  run "'C:\Program Files (x86)\Common Files\Pulse Secure\Integration\pulselauncher.exe' -u ringo -p Snps230# -url https://cn45-vpn.synopsys.com/pulse -r user", ,"Min Hide"
;;}


#If WinActive( "ahk_exe OUTLOOK.EXE" )
{
  F14 & sc027:: Ins
  F14 & '::    !Ins
}

#If WinActive( "ahk_exe cvgui.exe" )
{
 ;F14 & LButton:: SendInput "{LButton}{F5}"
 ;F14 & RButton:: SendInput "{RButton}{F5}"

  F14 & r:: Send !w1^y

  F14 & s:: Send !fsa
  F14 & d:: SendInput !w1DER DEF{Enter}
  F14 & g::
  {
    InputBox EVA
    SendInput !w1{raw}EVA (%EVA%) `n
  }

  F14 & h::     Send !wn
  F14 & j::     Send !ly
  F14 & k::     Send !lu
  F14 & l::     Send !w3
  F14 & sc027:: Send !w1
  F14 & '::     Send !fd
  
  F14 & n:: Send ^n
  F14 & m::
  {
     SendInput !ta
     WinWait "Macro"
     ControlClick "..., Macro, , LEFT, , NA"
    Return
  }
  
  F14 & y::
  {
   ;SetTitleMatchMode 2
    SetControlDelay -1
    ControlClick &Save/Load Settings...
    WinWait Save/Load Settings
    ControlClick &Preview Current ...
    WinWait Preview...
    ControlClick RICHEDIT1
    Send ^a^c
    ControlClick &OK
    WinWait Save/Load Settings
    ControlClick &Close
    Return
  }
  F14 & u:: Send !w1^l^z
  F14 & i::
  {
    Run gvim.bat "C:\CVUSER\macro\TST.SEQ"
    Return
  }
  F14 & o:: Send ^o
  F14 & p:: Send !w1DRA{Enter}

  F14 & [:: Send !ev
  F14 & ]:: Send !er

  F14 & =:: Send {Ins}
  F14 & -:: Send {Del}

  F14 & Enter:: Send {F5}
  F14 & Tab:: Send ^{Tab}
  F14 & w:: Send ^{F4}

  F14 & 1:: Send !w1RES CV_LENS:singlet{Enter}
  F14 & 2:: Send !w1RES CV_LENS:doublet{Enter}
  F14 & 3:: Send !w1RES CV_LENS:ag_triplet{Enter}
  F14 & 4:: Send !w1RES CV_LENS:tessar{Enter}
  F14 & 5:: Send !w1RES CV_LENS:telephot{Enter}
  F14 & 6:: Send !w1RES CV_LENS:ag_dblgauss{Enter}
  F14 & 7:: Send !w1RES CV_LENS:wideang{Enter}
  F14 & 8:: Send !w1RES CV_LENS:fisheye{Enter}
  F14 & 9:: Send !w1RES CV_LENS:fisheye2{Enter}
  F14 & 0:: Send !w1IN CV_DOC:ExamplesLibrary\HLM_DigitalCamera\DigicamPatent.seq{Enter}
}
}


/*
Esc:: Capslock
Capslock:: Esc

W0 := A_ScreenWidth /2
H0 := A_ScreenHeight/2
W2 := W0 / 2
H2 := H0 / 2

F14 & UP::    DllCall( "MoveWindow", "Ptr", WinExist("A"), "Int", 1920-0, "Int",    0, "Int", 1920+00, "Int", 1040+0 )
F14 & Down::  DllCall( "MoveWindow", "Ptr", WinExist("A"), "Int",    0-0, "Int", 1060, "Int", 1920+00, "Int", 1040+0 )
F14 & Left::  DllCall( "MoveWindow", "Ptr", WinExist("A"), "Int",    0-0, "Int",    0, "Int", 1920+00, "Int", 1040+0 )
F14 & Right:: DllCall( "MoveWindow", "Ptr", WinExist("A"), "Int", 1920-0, "Int", 1060, "Int", 1920+00, "Int", 1040+0 )

F14 & 1:: WinMove A, ,   0-7,   0, 960+14,1040+7
F14 & 2:: WinMove A, , 960-7,   0, 960+14,1040+7
F14 & 3:: WinMove A, ,1920-7,   0, 960+14,1040+7
F14 & 4:: WinMove A, ,2880-7,   0, 960+14,1040+7
F14 & 5:: WinMove A, ,   0-7,1060, 960+14,1040+7
F14 & 6:: WinMove A, , 960-7,1060, 960+14,1040+7
F14 & 7:: WinMove A, ,1920-7,1060, 960+14,1040+7
F14 & 8:: WinMove A, ,2880-7,1060, 960+14,1040+7
F14 & 9:: WinMove A, ,   0-0,   0,1920+00,2120+0
F14 & 0:: WinMove A, ,1920-0,   0,1920+00,2120+0


#HotIf WinActive( "ahk_exe lt.exe" )
{
  F14 & Enter:: Send "!rb"
}

#HotIf WinActive( "SYNOPSYS for Windows" )
{
  F14 & '::
  {
     Send "!fd"
     WinWait "Select"
     Send "{Tab}{Tab}{Tab}"
  }
  F14 & o:: Send "!v1MWL{Enter}"
}

#HotIf WinActive( "ahk_exe vim.exe" )
{
}

#HotIf WinActive( "ahk_exe explorer.exe" )
{
  F14 & Del:: Send "!{Up}{Del}"
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
hide_bar_state := True
#d::
{
  Global hide_bar_state
  If( hide_bar_state ) {
    WinHide "ahk_class Shell_TrayWnd"
  ;;WinHide "Start ahk_class Button"
  } Else {
    WinShow "ahk_class Shell_TrayWnd"
   ;WinShow "Start ahk_class Button"
  }
  hide_bar_state := !hide_bar_state
}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*/
