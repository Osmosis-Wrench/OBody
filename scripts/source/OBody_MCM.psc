Scriptname OBody_MCM extends nl_mcm_module
{Quickly hacked together NL_MCM mcm menu for OBody}

; code
String Pink = "#ff3389"
string OBody = "OBody.esp"
int GVOBorefit = 0x001802
int GVOBNippleRand = 0x001803
int GVOBGenitalRand = 0x001804
int GVOBPrestKey = 0x001805
ObodyScript Property OBodyMain Auto

Event OnInit()
    RegisterModule("OBody Options")
endEvent

Event OnPageInit()
    SetModName("OBody")
    SetLandingPage("OBody Options")
endevent

event OnGameReload()
    OBodyMain.OnGameLoad()
endevent

event OnPageDraw()
    SetCursorFillMode(TOP_TO_BOTTOM)
    AddHeaderOption(FONT_CUSTOM("Unoffical Obody Standalone Patch", pink))
    AddParagraph("This is mostly just to tide people over until OOPapyrus comes out and OBody gets offical standalone support. This version will probably be buggy compared to the proper release.")
    AddHeaderOption(FONT_CUSTOM("OBody Options", pink))
    AddToggleOptionST("SetOBRefit", "Enable ORefit", GetExternalBool(OBody, GVOBorefit))
    AddToggleOptionST("SetOBNippleRand", "Randomize nipples", GetExternalBool(OBody, GVOBNippleRand))
    AddToggleOptionST("SetOBGenitalRand", "Randomize genitals", GetExternalBool(OBody, GVOBGenitalRand))
    AddKeyMapOptionST("SetOBPresetKey", "Edit presets", GetExternalInt(OBody, GVOBPrestKey))
endEvent

state SetOBRefit
    event OnSelectST(string state_id)
        SetExternalBool(OBody, GVOBorefit, !GetExternalBool(OBody, GVOBorefit))
        SetToggleOptionValueST(GetExternalBool(OBody, GVOBorefit), false, "SetOBRefit")
    endevent

    event OnHighlightST(string state_id)
        SetInfoText("(Save and reload to take effect) (CBBE-based-bodies) Edit bodies to simulate them being clothed, when clothed")
    endEvent
endstate

state SetOBNippleRand
    event OnSelectST(string state_id)
        SetExternalBool(OBody, GVOBNippleRand, !GetExternalBool(OBody, GVOBNippleRand))
        SetToggleOptionValueST(GetExternalBool(OBody, GVOBNippleRand), false, "SetOBNippleRand")
    endevent

    event OnHighlightST(string state_id)
        SetInfoText("(Save and reload to take effect) (CBBE-based-bodies) Procedurally generate nipples")
    endEvent
endstate

state SetOBGenitalRand
    event OnSelectST(string state_id)
        SetExternalBool(OBody, GVOBGenitalRand, !GetExternalBool(OBody, GVOBGenitalRand))
        SetToggleOptionValueST(GetExternalBool(OBody, GVOBGenitalRand), false, "SetOBGenitalRand")
    endevent

    event OnHighlightST(string state_id)
        SetInfoText("(Save and reload to take effect) (3bbb/3ba) Procedurally generate genitals")
    endEvent
endstate

state SetOBPresetKey
	event OnKeyMapChangeST(string state_id, int keycode)
		SetExternalInt(OBody, GVOBPrestKey, keycode)
		SetKeyMapOptionValueST(keycode)
	endEvent

    event OnHighlightST(string state_id)
        SetInfoText("(Save and reload to take effect) Press this to show a menu of all installed presets\nSelect one to apply it to you, or if an NPC is in your crosshair, will apply to them")
    endEvent
endstate

bool Function GetExternalBool(string modesp, int id)
	return (game.GetFormFromFile(id, modesp) as GlobalVariable).GetValueInt() == 1
endfunction

int Function GetExternalInt(string modesp, int id)
	return (game.GetFormFromFile(id, modesp) as GlobalVariable).GetValueInt() 
endfunction

Function SetExternalBool(string modesp, int id, bool val)
	int set = 0
	if val
		set = 1
	endif 

	(game.GetFormFromFile(id, modesp) as GlobalVariable).SetValueInt(set)
endfunction

Function SetExternalInt(string modesp, int id, int val)
	(game.GetFormFromFile(id, modesp) as GlobalVariable).SetValueInt(val)
endfunction