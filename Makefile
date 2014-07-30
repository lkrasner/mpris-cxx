SHELL := /bin/bash

INSTALL_DIR := /usr/local
PKGS := dbus-c++-1
CXXFLAGS := -std=c++11 -Iinclude -Wall -Wextra $(shell pkg-config --cflags $(PKGS))
LDLIBS := $(shell pkg-config --libs $(PKGS))
OBJS := $(patsubst %.cpp, %.o, $(wildcard src/*.cpp)) 
LIBS := lib/libmpris-cxx.so

LIB_DIR := lib

all : CXXFLAGS += -O2
all : $(LIBS)

debug : CXXFLAGS += -g
debug : $(LIBS)

$(LIBS) : CXXFLAGS += -fPIC
$(LIBS) : LDFLAGS += -shared
$(LIBS) : $(OBJS)

install : all
	install $(LIB_DIR)/* $(INSTALL_DIR)/lib
	mkdir -p $(INSTALL_DIR)/include/mpris-cxx
	install -D include/* $(INSTALL_DIR)/include/mpris-cxx/

uninstall :
	rm $(INSTALL_DIR)/lib/libmpris-cxx.so
	rm -r $(INSTALL_DIR)/include/mpris-cxx
clean :
	@rm -f src/*.o
	@rm -f lib/*

$(LIB_DIR)/%.so :
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

% : %.o
	$(CXX) $(LDFLAGS) -o $@ $< $(LDLIBS)
.PHONY : all clean debug
