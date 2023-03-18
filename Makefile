CXX := g++
CXXFLAGS := -O2 -Wall -std=c++20
LDFLAGS := -shared

INCLUDE := -I/usr/include/vapoursynth/
TARGET := libvsplanestatsmod.so

SRC := src/shared.cpp src/PlaneAverage.cpp src/PlaneMinMax.cpp
OBJ := $(patsubst %.cpp, %.o, $(SRC))

all: $(OBJ)
	$(CXX) $(LDFLAGS) -o $(TARGET) $^
%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

clean: 
	rm -f $(OBJ)