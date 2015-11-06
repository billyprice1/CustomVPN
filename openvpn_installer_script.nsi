# OpenVPN Application and Configuration Installer
# Based on: http://edoceo.com/creo/openvpn-config-installer
# @version $Id$
# Set Defaults
# Allows for /DOUTPUT_EXE=something.exe /CONFIG_NAME=config\file.cfg

!ifndef CONFIG_NAME
   !define CONFIG_NAME "@@@@@.ovpn" 
!endif

!ifndef OUTPUT_EXE
    !define OUTPUT_EXE "vpn-installer_~~~~~.exe"
!endif

BrandingText "VPN Installer"
Caption "VPN Installer"
CompletedText "Finished"
#ComponentText "OpenVPN"
Icon images\logo.ico
InstallColors 336699 333333
InstProgressFlags colored smooth
Name "VPN Installer"
OutFile ${OUTPUT_EXE}
RequestExecutionLevel admin
ShowInstDetails show
XPStyle off
# TargetMinimalOS 5.1

Section ""

#    Var /GLOBAL targetdir

    # Maybe warn that directory is not here?
    # @todo check for OpenVPN Dir in Registry

    DetailPrint "Checking OpenVPN"
    IfFileExists "$PROGRAMFILES32\OpenVPN\bin\openvpn-gui-1.0.3.exe" goodVPN failVPN
    failVPN:
        MessageBox MB_YESNO "Are you ready to install the VPN Connection on your computer?" IDNO End
        SetOutPath $EXEDIR
        DetailPrint "Extracting OpenVPN $OUTDIR"
        # Bundle OpenVPN Installer
        File source\openvpn-install-2.3.8-I601-i686.exe
        # ExecShell "open" "$EXEDIR\openvpn-2.1.1-install.exe"
		ExecWait '"openvpn-install-2.3.8-I601-i686.exe" /S $0' 
        # Zero == Success, One == Fail, handle
        IntCmp $0 0 goodInstall
            DetailPrint "Failed to Install: $0"
            MessageBox MB_OK|MB_ICONSTOP "Failed to install OpenVPN, this is required to continue. Installation aborted."
            Quit
        goodInstall:
        Goto doneVPN
    goodVPN:
        DetailPrint "OpenVPN Already Installed"
    doneVPN:

    SetOutPath "$PROGRAMFILES32\OpenVPN\config"

    # Full contents of Config
    File /r /x .svn *.ovpn
		
	Delete "$EXEDIR\openvpn-install-2.3.8-I601-i686.exe"
	
	Delete "C:\Users\Public\Desktop\OpenVPN GUI.lnk"
	Delete "C:\Documents and Settings\All Users\Desktop\OpenVPN GUI.lnk"
	
	createShortCut "C:\Documents and Settings\All Users\Desktop\Start_VPN.lnk" "$PROGRAMFILES32\OpenVPN\bin\openvpn-gui.exe" "--connect ${CONFIG_NAME} --show_balloon 2" "$PROGRAMFILES32\OpenVPN\icon.ico"
	ShellLink::SetRunAsAdministrator C:\Documents and Settings\All Users\Desktop\Start_VPN.lnk
	Pop $0
	
	createShortCut "C:\Users\Public\Desktop\Start_VPN.lnk" "$PROGRAMFILES32\OpenVPN\bin\openvpn-gui.exe" "--connect ${CONFIG_NAME} --show_balloon 2" "$PROGRAMFILES32\OpenVPN\icon.ico"
	ShellLink::SetRunAsAdministrator C:\Users\Public\Desktop\Start_VPN.lnk
	Pop $0
	
	MessageBox MB_OK "To start the VPN Connection click on the Start_VPN shortcut on your desktop"
	End:
SectionEnd
