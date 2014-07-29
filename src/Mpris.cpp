//Mpris.cpp

#include "Mpris-cxx.hpp"

Mpris::Mpris(DBus::Connection& connection, const char* path, const char* name)
		: DBus::ObjectProxy(connection, path, name) 
{

}

Mpris::~Mpris()
{

}

void Mpris::TrackChange(const std::map< std::string, ::DBus::Variant >& argin0)
{

}
void Mpris::StatusChange(const ::DBus::Struct< int32_t, int32_t, int32_t, int32_t >& argin0)
{

}
void Mpris::CapsChange(const int32_t& argin0)
{

}
void Mpris::TrackListChange(const int32_t& argin0)
{

}
