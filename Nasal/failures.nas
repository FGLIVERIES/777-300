#########################################
#failures script
#
#by sp-wka ARMINAIR

var turbulence_stop = func{
	setprop("/environment/turbulence/sensitivity", 1);
}

var failure_roll = func{
coeff=getprop("/aaa/fail-system/coefficient");
if(getprop("/aaa/fail-system/eng-fire")){

	#left engine fire
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("controls/engines/engine[0]/cutoff")==0){
		setprop("/engines/engine[0]/on-fire", 1);
		setprop("/controls/engines/engine[0]/cutoff", 1);
	}

	#right engine fire
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("controls/engines/engine[1]/cutoff")==0){
		setprop("/engines/engine[1]/on-fire", 1);
		setprop("/controls/engines/engine[1]/cutoff", 1);
	}
}	
if(getprop("/aaa/fail-system/eng-fail")){

	#left engine cutoff
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("controls/engines/engine[0]/cutoff")==0){
		setprop("/controls/engines/engine[0]/cutoff", 1);
	}

	#right engine cutoff
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("controls/engines/engine[1]/cutoff")==0){
		setprop("/controls/engines/engine[1]/cutoff", 1);
	}		
}
if(getprop("/aaa/fail-system/hydr-fail")){

	#left hydraulic pump
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("/aaa/hydraulic/air_l")>=0){
		setprop("/aaa/hydraulic/air_l", -1);
		setprop("/aaa/fail-system/hydraulics/left-fail", 1);
	}

	#C1 hydraulic pump
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("/aaa/hydraulic/air_c1")>=0){
		setprop("/aaa/hydraulic/air_c1", -1);
		setprop("/aaa/fail-system/hydraulics/c1-fail", 1);
	}

	#C2 hydraulic pump
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("/aaa/hydraulic/air_c2")>=0){
		setprop("/aaa/hydraulic/air_c2", -1);
		setprop("/aaa/fail-system/hydraulics/c2-fail", 1);
	}

	#right hydraulic pump
	losuj=rand();
	base_val=0.0001;
	base_val=coeff*base_val;
	if (losuj<base_val and getprop("/aaa/hydraulic/air_r")>=0){
		setprop("/aaa/hydraulic/air_r", -1);
		setprop("/aaa/fail-system/hydraulics/right-fail", 1);
	}
}
if(getprop("/aaa/fail-system/turbulence")){
	#are we fucked or not
	losuj=rand();
	base_val=0.001;
	base_val=coeff*base_val;
	if (losuj<base_val){
		setprop("/environment/turbulence/sensitivity", 0.3);
		settimer(turbulence_stop, 60);
	}
}
settimer(failure_roll, 120);
}

props.globals.getNode("/aaa/fail-system/eng-fire", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/eng-fail", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/hydr-fail", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/coefficient", 1).setDoubleValue(1);
props.globals.getNode("/engines/engine[0]/on-fire", 1).setBoolValue(0);
props.globals.getNode("/engines/engine[1]/on-fire", 1).setBoolValue(0);
props.globals.getNode("/engines/engine[0]/extinguished", 1).setBoolValue(0);
props.globals.getNode("/engines/engine[1]/extinguished", 1).setBoolValue(0);
props.globals.getNode("/engines/engine[0]/extinguishing", 1).setBoolValue(0);
props.globals.getNode("/engines/engine[1]/extinguishing", 1).setBoolValue(0);

props.globals.getNode("/aaa/fail-system/hydraulics/left-fail", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/hydraulics/c1-fail", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/hydraulics/c2-fail", 1).setBoolValue(0);
props.globals.getNode("/aaa/fail-system/hydraulics/right-fail", 1).setBoolValue(0);

props.globals.getNode("/aaa/fail-system/turbulence", 1).setBoolValue(0);

props.globals.getNode("/controls/APU/extinguished", 1).setBoolValue(0);
props.globals.getNode("/controls/APU/extinguishing", 1).setBoolValue(0);
print("Failures system... ok");
failure_roll();