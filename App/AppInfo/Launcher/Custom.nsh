${SegmentFile}

Var FullAppDir

${SegmentInit}
    ${If} $Bits = 64
        StrCpy $FullAppDir "$EXEDIR\App\simplewall\64"
        ${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\simplewall\64"
    ${Else}
        StrCpy $FullAppDir "$EXEDIR\App\simplewall\32"
        ${SetEnvironmentVariablesPath} FullAppDir "$EXEDIR\App\simplewall\32"
    ${EndIf}
!macroend

${SegmentPostPrimary}
    ExecWait '"$FullAppDir\simplewall.exe" -uninstall'

    ${IfNot} ${FileExists} "$EXEDIR\Data\simplewall\simplewall.ini"
        CopyFiles /SILENT "$FullAppDir\simplewall.ini" "$EXEDIR\Data\simplewall\"
    ${EndIf}

    Delete "$FullAppDir\simplewall.ini"
!macroend
