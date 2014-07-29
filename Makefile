SHELL := /bin/bash

INSTALL_PATH := /usr/local
PKGS := dbus-c++-1
CXXFLAGS := -std=c++11 -Iinclude -Wall -Wextra $(shell pkg-config --cflags $(PKGS))
LDLIBS := $(shell pkg-config --libs $(PKGS))
OBJS := $(patsubst %.cpp, %.o, $(wildcard src/*.cpp)) 
LIBS := lib/libmpris-cxx.so

LIBDIR := lib

all : CXXFLAGS += -O2
all : $(LIBS)

debug : CXXFLAGS += -g
debug : $(LIBS)

$(LIBS) : CXXFLAGS += -fPIC
$(LIBS) : LDFLAGS += -shared
$(LIBS) : $(OBJS)

install : all
	install $(LIBDIR)/* $(INSTALL_PATH)/lib
	install -D include/* $(INSTALL_PATH)/include/mpris-cxx/

clean :
	@rm -f src/*.o
	@rm -f lib/*

$(LIBDIR)/%.so :
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

% : %.o
	$(CXX) $(LDFLAGS) -o $@ $< $(LDLIBS)
.PHONY : all clean debug
