//Mpris.hpp

#ifndef MPRIS_HPP
#define MPRIS_HPP

#include <iostream>
#include "MprisProxy.hpp"

class Mpris : public DBus::IntrospectableProxy, public DBus::ObjectProxy,
		public org::freedesktop::MediaPlayer_proxy
{
public:
	Mpris(DBus::Connection& connection, const char* path, const char* name);

	~Mpris();

	void TrackChange(const std::map< std::string, ::DBus::Variant >& argin0);
	void StatusChange(const ::DBus::Struct< int32_t, int32_t, int32_t, int32_t >& argin0);
	void CapsChange(const int32_t& argin0);
	void TrackListChange(const int32_t& argin0);
	
};

#endif
