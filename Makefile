CXX := g++
CXXFLAGS := -O2 -Wall -std=c++20
LDFLAGS := -shared

DESTDIR :=
PREFIX := /usr/lib/vapoursynth
INCLUDE := -I/usr/include/vapoursynth/
TARGET := libvsplanestatsmod.so

SRC := src/shared.cpp src/PlaneAverage.cpp src/PlaneMinMax.cpp
OBJ := $(patsubst %.cpp, %.o, $(SRC))

all: $(OBJ)
	$(CXX) $(LDFLAGS) -o $(TARGET) $^
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

install:
	install -Dm644 "$(TARGET)" "$(DESTDIR)$(PREFIX)/$(TARGET)"

uninstall:
	rm -f "$(DESTDIR)$(PREFIX)/$(TARGET)"

clean: 
	rm -f "$(OBJ)"