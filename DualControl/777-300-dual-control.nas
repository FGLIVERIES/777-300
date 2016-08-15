###############################################################################
## 
##  Nasal for dual control of the 777-300 over the multiplayer network.
##
##  This file is licensed under the GPL license version 2 or later.
##
###############################################################################

# Renaming
var DCT = dual_control_tools;

######################################################################
# Pilot/copilot aircraft identifiers. Used by dual_control.
var pilot_type   = "Aircraft/777-300/Models/777-300.xml";
var copilot_type = "Aircraft/777-300/Models/777-300-FO.xml";

var copilot_view = "CoPilot View";

props.globals.initNode("/sim/remote/pilot-callsign", "", "STRING");

######################################################################
# MP enabled properties.
# NOTE: These must exist very early during startup - put them
#       in the -set.xml file.

var pilot_TDM1_mpp       = "sim/multiplay/generic/string[1]";

var l_aileron = "controls/flight/aileron";
var l_elevator = "controls/flight/elevator";
var l_flaps = "controls/flight/flaps";
var l_throttle = ["controls/engines/engine[0]/throttle",
     "controls/engines/engine[1]/throttle"];

var l_battery = "controls/electric/battery-switch";
var l_ohlight = "controls/lighting/dome";
var l_autobrake = "autopilot/autobrake/step";
var l_gear_lever = "controls/gear/gear-down";
var l_ias = "instrumentation/airspeed-indicator/indicated-speed-kt";
var l_alt = "instrumentation/altimeter/indicated-altitude-ft";

var pilot_connect_copilot = func (copilot) {

	return 
        [
			##################################################
			# Set up TDM transmission of slow state properties.
			DCT.TDMEncoder.new
			([
				props.globals.getNode(l_flaps),
				props.globals.getNode(l_aileron),
				props.globals.getNode(l_elevator),
				props.globals.getNode(l_throttle[0]),
				props.globals.getNode(l_throttle[1]),
				
				props.globals.getNode(l_battery),
				props.globals.getNode(l_ohlight),
				props.globals.getNode(l_autobrake),
				props.globals.getNode(l_gear_lever),
				props.globals.getNode(l_ias),
				props.globals.getNode(l_alt),
			],
			props.globals.getNode(pilot_TDM1_mpp),
			),
		];
}	

var pilot_disconnect_copilot = func {
}

var copilot_connect_pilot = func (pilot) {
var p = "sim/current-view/internal";
pilot.getNode(p, 1).alias(props.globals.getNode(p));
pilot.getNode(p).setBoolValue(1);
	# Initialize Nasal wrappers for copilot pick anaimations.
	return
        [
		##################################################
         # Set up TDM reception of slow state properties.
			DCT.TDMDecoder.new
			(pilot.getNode(pilot_TDM1_mpp),
			[
			func (v) {
				pilot.getNode(l_flaps, 1).setValue(v);
				props.globals.getNode(l_flaps).setValue(v);
			},
			func (v) {
				pilot.getNode(l_aileron, 1).setValue(v);
				props.globals.getNode(l_aileron).setValue(v);
			},
			func (v) {
				pilot.getNode(l_elevator, 1).setValue(v);
				props.globals.getNode(l_elevator).setValue(v);
			},
			func (v) {
				pilot.getNode(l_throttle[0], 1).setValue(v);
				props.globals.getNode(l_throttle[0]).setValue(v);
			},
			func (v) {
				pilot.getNode(l_throttle[1], 1).setValue(v);
				props.globals.getNode(l_throttle[1]).setValue(v);
			},
			func (v) {
				pilot.getNode(l_battery, 1).setValue(v);
				props.globals.getNode(l_battery).setValue(v);
			},
			func (v) {
				pilot.getNode(l_ohlight, 1).setValue(v);
				props.globals.getNode(l_ohlight).setValue(v);
			},
			func (v) {
				pilot.getNode(l_autobrake, 1).setValue(v);
				props.globals.getNode(l_autobrake).setValue(v);
			},
			func (v) {
				pilot.getNode(l_gear_lever, 1).setValue(v);
				props.globals.getNode(l_gear_lever).setValue(v);
			},
			func (v) {
				pilot.getNode(l_ias, 1).setValue(v);
				props.globals.getNode(l_ias).setValue(v);
			},
			func (v) {
				pilot.getNode(l_alt, 1).setValue(v);
				props.globals.getNode(l_alt).setValue(v);
			},
			]),
		];
}

var copilot_disconnect_pilot = func {
}

######################################################################
# Copilot Nasal wrappers

var set_copilot_wrappers = func (pilot) {
	pilot.getNode("controls/flight/flaps").
		alias(props.globals.getNode("controls/flight/flaps"));
	pilot.getNode("controls/flight/aileron").
		alias(props.globals.getNode("controls/flight/aileron"));
	pilot.getNode("controls/flight/elevator").
		alias(props.globals.getNode("controls/flight/elevator"));
	pilot.getNode("controls/engines/engine[0]/throttle").
		alias(props.globals.getNode("controls/engines/engine[0]/throttle"));
	pilot.getNode("controls/engines/engine[1]/throttle").
		alias(props.globals.getNode("controls/engines/engine[1]/throttle"));
		
	pilot.getNode("controls/electric/battery-switch-switch").
		alias(props.globals.getNode("controls/electric/battery-switch"));
		
	pilot.getNode("controls/lighting/dome").
		alias(props.globals.getNode("controls/lighting/dome"));
	pilot.getNode("autopilot/autobrake/step").
		alias(props.globals.getNode("autopilot/autobrake/step"));
	pilot.getNode("controls/gear/gear-down").
		alias(props.globals.getNode("controls/gear/gear-down"));
	pilot.getNode("instrumentation/airspeed-indicator/indicated-speed-kt").
		alias(props.globals.getNode("instrumentation/airspeed-indicator/indicated-speed-kt"));
	pilot.getNode("instrumentation/altimeter/indicated-altitude-ft").
		alias(props.globals.getNode("instrumentation/altimeter/indicated-altitude-ft"));		
}