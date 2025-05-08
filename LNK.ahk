;;msgbox % A_Args[1]
;;msgbox % A_Args[2] ;; Issue for root directory
;;msgbox % A_WorkingDir
;;return

if( SubStr( A_Args[2], 0, 1 ) = """" ) {
  A_Args[2] := SubStr( A_Args[2], 1, -1 )
}

items := Clipboard
Loop, Parse, items, `n, `r
{
  ;;msgbox %A_LoopField%
  path := FileExist( A_LoopField )
  if( path ) {
    if( InStr( path, "D" ) ) {
      lnk := ( A_Args[1] = "-h" ) ? "/j" : "/d"
    } else {
      lnk := ( A_Args[1] = "-h" ) ? "/h" : "  "
    }

    SplitPath, A_LoopField, item, path
    if( path = A_Args[2] ) {
      item := "Link_to_" . item
    }
    item := A_Args[2] . "\"  . item
    Run *RunAs %COMSPEC% /C MKLINK %lnk% "%item%" "%A_LoopField%", , Hide
  ;;msgbox %ErrorLevel%
  }
}
