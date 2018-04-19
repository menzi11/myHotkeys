#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;;============================================
;;Fuck Ballmer
^Space::^Shift

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;win+n打开notepad++
#n::
IfWinNotExist ahk_class Notepad++
{
    Run notepad++.exe
    WinActivate
    WinWait ahk_class Notepad++
    WinSet, AlwaysOnTop, On, ahk_class Notepad++
}
Else IfWinNotActive ahk_class Notepad++
{
    WinActivate
}
Else
{
    ;MsgBox, abc11
	WinClose ahk_class Notepad++
	;If WinExists ahk_class Notepad++.exe
	;{
	;	MsgBox abc
	;}
}
Return

;;============================================

#1::
    Run, explore C:\
return

;;============================================

;用Google搜索选中的文字
#g::
Run http://www.google.com.hk/search?q=%clipboard%
return

;百度翻译
#f::
Run https://fanyi.baidu.com/
return

;知乎
#z::
Run https://zhihu.com/
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Win+e打开everything
#e::Run C:\Program Files\Everything\Everything.exe

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CapsLock::Home
PrintScreen::End

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;==================================================
;** 快捷键 Win+` 使当前窗口置顶
;==================================================
#`::
WinSet, AlwaysOnTop, toggle,A
WinGetTitle, getTitle, A
Winget, getTop,ExStyle,A
;if (getTop & 0x8)
    ;TrayTip 已置顶, 窗口标题: `n%getTitle%,10,1
;else
    ;TrayTip 取消置顶, 窗口标题:`n %getTitle%,10,1
;return

;;^w::
;;    IfWinExist new 1 - Notepad++
;;    {
;;        WinClose
;;    }
;;    else
;;    {
;;        Send ^w
;;    }
;;return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#2::cmdHere()

cmdHere() {
    IfWinActive ahk_exe cmd.exe
	{
		WinClose ahk_exe cmd.exe
		;PostMessage, 0x112, 0xF060,,, cmd.exe ahk_class ConsoleWindowClass
	}
	else
	{
	    If WinActive("ahk_class CabinetWClass") || WinActive("ahk_class ExploreWClass") {
	    	WinHWND := WinActive()
	    	For win in ComObjCreate("Shell.Application").Windows
	    		If (win.HWND = WinHWND) {
	    			dir := SubStr(win.LocationURL, 9) ; remove "file:///"
	    			dir := RegExReplace(dir, "%20", " ")
	    			Break
	    		}
	    }
	    Run, cmd, % dir ? dir : A_Desktop
	}
}