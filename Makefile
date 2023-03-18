CC = g++
CFLAGS  = -shared -O2 -Wall -std=c++17

EXT_DEP = /usr/include/vapoursynth
TARGET = libvsplanestatsmod.so

$(TARGET): src/shared.cpp src/PlaneAverage.cpp src/PlaneMinMax.cpp
		$(CC) $(CFLAGS) -I$(EXT_DEP) -o $@ $^