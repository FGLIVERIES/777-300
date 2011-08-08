#var EFB = gui.Dialog.new("/sim/gui/dialogs/EFB/dialog",
#        "Aircraft/777-300/Systems/EFB-dlg.xml");
var Radio = gui.Dialog.new("/sim/gui/dialogs/radios/dialog",
        "Aircraft/777-300/Systems/tranceivers.xml");
var ap_settings = gui.Dialog.new("/sim/gui/dialogs/autopilot/dialog",
        "Aircraft/777-300/Systems/autopilot-dlg.xml");
var tiller_steering = gui.Dialog.new("/sim/gui/dialogs/tiller_steering/dialog",
		"Aircraft/777-300/Systems/tiller_steering.xml");

gui.menuBind("radio", "dialogs.Radio.open()");
gui.menuBind("autopilot-settings", "dialogs.ap_settings.open()");
