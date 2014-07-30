mpris-cxx
=========

A C++ implementation of the MPRIS standard to control media players using the dbus-C++ library

Requirements
============

make

gcc

pkg-config

libdbus-C++ (http://dbus-cplusplus.sourceforge.net/)

Installation
===========

``` bash
./configure
make
sudo make install
```

Example
=======
``` c++
//test.cpp

#include <mpris-cxx.hpp>

int main(int argc, char** argv)
{
	//initiallize a DBus dispatcher
	DBus::BusDispatcher dispatcher;
	//Set as defualt
	DBus::default_dispatcher = &dispatcher;
	//initialize the bus connection
	DBus::Connection bus = DBus::Connection::SessionBus();

	//connect to the Root object of clementines mpris interface
	Mpris Root(bus, "/", "org.mpris.clementine");
	//Attach to the Player as well
	Mpris Player(bus, "/Player", "org.mpris.clementine");

	//Print the Identity, pause, and quit
	std::cout << Root.Identity() << std::endl;
	Player.Pause();
	Root.Quit();
}
```
