CenterWindow() {
    WinGetTitle, windowTitleVariable, A
    WinGetPos,,, Width, Height, %windowTitleVariable%
    WinMove, %windowTitleVariable%,, ((A_ScreenWidth - 62) / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2)
}

SelectSoundOutputDevice(numDown) {
    Run, mmsys.cpl 

    WinWait, Sound ; Change "Sound" to the name of the window in your local language

    ControlSend, SysListView321, {Down %numDown%}
    ControlClick, &Set Default ; Change "&Set Default" to the name of the button in your local language 
    ControlClick,OK 
}

^`:: Send { `` }
+`:: Send { ~ }

` & Space:: Send { Media_Play_Pause }
` & Left:: Send { Media_Prev }
` & Right:: Send { Media_Next }
` & Up:: Send { Volume_Up }
` & Down:: Send { Volume_Down }

` & Numpad0:: Send { Volume_Mute }

` & Enter:: CenterWindow()

` & 1:: SelectSoundOutputDevice(1)
` & 2:: SelectSoundOutputDevice(2)
