^+F6::
  Send {Media_Prev}
  Return
^+F8::
  Send {Media_Next}
  Return
^+F7::
  Send {Media_Play_Pause}
  Return
^+F9::
  Send {Volume_Down}
  Return
^+F10::
  Send {Volume_Up}
  Return
^+F11::
  Send {Volume_Mute}
  Return

^+F12:: SaveSongToSpotifyLibrary()

SaveSongToSpotifyLibrary() {
  spotify := "ahk_exe spotify.exe"
  if WinExist(spotify) {
    ; Store starting window ID and mouse position.
    MouseGetPos x, y, startingWinId

    ; Activate Spotify.
    WinActivate %spotify%
    WinWaitActive %spotify%

    ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, E:\Projects\random\SpotifyLike.png
    FoundX := FoundX + 13
    FoundY := FoundY + 13
    if (ErrorLevel = 0) {
      Click %FoundX%, %FoundY%

    } else if (ErrorLevel = 2) {
      MsgBox % "Problem conducting image search. Is the saveToYourLibraryIcon in the correct location?"

    } else if (ErrorLevel = 1) {
      MsgBox % "Unable to save song. Can't find the Add button."
    }

    ; Restore original window and mouse position.
    WinActivate ahk_id %startingWinId%
    MouseMove %x%, %y%
  }
}
