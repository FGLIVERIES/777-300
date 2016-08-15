######################################
# b773 doors
#
#SP-WKA/Arminair

var doors =
 {
 new: func(name, transit_time)
  {
  doors[name] = aircraft.door.new("aaa/door-positions/" ~ name, transit_time);
  },
 toggle: func(name)
  {
  doors[name].toggle();
  },
 open: func(name)
  {
  doors[name].open();
  },
 close: func(name)
  {
  doors[name].close();
  },
 setpos: func(name, value)
  {
  doors[name].setpos(value);
  }
 };
doors.new("l1", 10);
doors.new("l2", 10);
doors.new("r1", 10);
doors.new("r2", 10);
doors.new("l3", 10);
doors.new("l4", 10);
doors.new("r3", 10);
doors.new("r4", 10);

doors.new("c1", 10);
doors.new("c2", 10);
doors.new("c3", 10);
doors.new("c4", 10);
doors.new("c5", 10);
doors.new("c6", 10);

doors.new("rat", 10);

doors.new("cdoor", 3);

doors.new("pseat", 4);
doors.new("cseat", 4);