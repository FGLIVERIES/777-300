#########################################
#some basic window icing script
#
#by sp-wka ARMINAIR

var window_icing = func{
	if (getprop("/environment/temperature-degc")<0 and getprop("/environment/relative-humidity")>40){
		if (getprop("/aaa/deice/di1")==0 and getprop("/aaa/windows_ice/left3")<0.85){
		setprop("/aaa/windows_ice/left3", getprop("/aaa/windows_ice/left3")+0.1);
		setprop("/aaa/windows_ice/left2", getprop("/aaa/windows_ice/left2")+0.1);
		}
		if (getprop("/aaa/deice/di2")==0 and getprop("/aaa/windows_ice/left1")<0.85){
		setprop("/aaa/windows_ice/left1", getprop("/aaa/windows_ice/left1")+0.1);
		}
		if (getprop("/aaa/deice/di3")==0 and getprop("/aaa/windows_ice/right1")<0.85){
		setprop("/aaa/windows_ice/right1", getprop("/aaa/windows_ice/right1")+0.1);
		}
		if (getprop("/aaa/deice/di4")==0 and getprop("/aaa/windows_ice/right3")<0.85){
		setprop("/aaa/windows_ice/right3", getprop("/aaa/windows_ice/right3")+0.1);
		setprop("/aaa/windows_ice/right2", getprop("/aaa/windows_ice/right2")+0.1);
		}		
	}
	if (getprop("/environment/temperature-degc")>3){
		if (getprop("/aaa/windows_ice/left3")>0.05){
		setprop("/aaa/windows_ice/left3", getprop("/aaa/windows_ice/left3")-0.1);
		setprop("/aaa/windows_ice/left2", getprop("/aaa/windows_ice/left2")-0.1);
		}
		if (getprop("/aaa/windows_ice/left1")>0.05){
		setprop("/aaa/windows_ice/left1", getprop("/aaa/windows_ice/left1")-0.1);
		}
		if (getprop("/aaa/windows_ice/right1")>0.05){
		setprop("/aaa/windows_ice/right1", getprop("/aaa/windows_ice/right1")-0.1);
		}
		if (getprop("/aaa/windows_ice/right3")>0.05){
		setprop("/aaa/windows_ice/right3", getprop("/aaa/windows_ice/right3")-0.1);
		setprop("/aaa/windows_ice/right2", getprop("/aaa/windows_ice/right2")-0.1);
		}
	}
settimer(window_icing, 30);
}

if (getprop("/environment/metar/temperature-degc")<0 and getprop("/environment/relative-humidity")>10){
props.globals.getNode("/aaa/windows_ice/left1").setDoubleValue(0.9);
props.globals.getNode("/aaa/windows_ice/left2").setDoubleValue(0.9);
props.globals.getNode("/aaa/windows_ice/left3").setDoubleValue(0.9);
props.globals.getNode("/aaa/windows_ice/right1").setDoubleValue(0.9);
props.globals.getNode("/aaa/windows_ice/right2").setDoubleValue(0.9);
props.globals.getNode("/aaa/windows_ice/right3").setDoubleValue(0.9);
}else{
props.globals.getNode("/aaa/windows_ice/left1").setDoubleValue(0);
props.globals.getNode("/aaa/windows_ice/left2").setDoubleValue(0);
props.globals.getNode("/aaa/windows_ice/left3").setDoubleValue(0);
props.globals.getNode("/aaa/windows_ice/right1").setDoubleValue(0);
props.globals.getNode("/aaa/windows_ice/right2").setDoubleValue(0);
props.globals.getNode("/aaa/windows_ice/right3").setDoubleValue(0);
}
print("Window icing system... ok");
window_icing();