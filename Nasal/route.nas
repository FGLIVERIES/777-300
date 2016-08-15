#########################################
#mfd route display script
#
#by sp-wka ARMINAIR

var nav_stars = func {
if (getprop("/autopilot/route-manager/wp/id")!="" and getprop("/autopilot/route-manager/wp/dist")>0){
setprop("/aaa/route/x1", getprop("/autopilot/route-manager/wp/dist")*math.cos(math.pi*(90-getprop("/autopilot/route-manager/wp/bearing-deg")+getprop("/orientation/heading-magnetic-deg"))/180)*(160/getprop("/instrumentation/efis/inputs/range")));
setprop("/aaa/route/y1", getprop("/autopilot/route-manager/wp/dist")*math.sin(math.pi*(90-getprop("/autopilot/route-manager/wp/bearing-deg")+getprop("/orientation/heading-magnetic-deg"))/180)*(160/getprop("/instrumentation/efis/inputs/range"))-80);
}
if (getprop("/autopilot/route-manager/wp[1]/id")!="" and getprop("/autopilot/route-manager/wp/dist")>0){
setprop("/aaa/route/x2", getprop("/autopilot/route-manager/wp[1]/dist")*math.cos(math.pi*(90-getprop("/autopilot/route-manager/wp[1]/bearing-deg")+getprop("/orientation/heading-magnetic-deg"))/180)*(160/getprop("/instrumentation/efis/inputs/range")));
setprop("/aaa/route/y2", getprop("/autopilot/route-manager/wp[1]/dist")*math.sin(math.pi*(90-getprop("/autopilot/route-manager/wp[1]/bearing-deg")+getprop("/orientation/heading-magnetic-deg"))/180)*(160/getprop("/instrumentation/efis/inputs/range"))-80);
}
if (!getprop("/aaa/route/show")){
props.globals.getNode("/aaa/route/x1", 0).setDoubleValue(0);
props.globals.getNode("/aaa/route/y1", 0).setDoubleValue(100);
props.globals.getNode("/aaa/route/x2", 0).setDoubleValue(0);
props.globals.getNode("/aaa/route/y2", 0).setDoubleValue(100);
}
settimer(nav_stars, 1);
}

props.globals.getNode("/aaa/route/show", 0).setBoolValue(0);
props.globals.getNode("/aaa/route/x1", 0).setDoubleValue(0);
props.globals.getNode("/aaa/route/y1", 0).setDoubleValue(-80);
props.globals.getNode("/aaa/route/x2", 0).setDoubleValue(0);
props.globals.getNode("/aaa/route/y2", 0).setDoubleValue(-80);

settimer(nav_stars, 120);