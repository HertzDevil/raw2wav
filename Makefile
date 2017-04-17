NAME = raw2wav
CXXFLAGS = -std=c++11 -Wall -pedantic -O3

ifeq (Windows_NT, $(OS))
CXX = mingw32-g++
TARGET = $(NAME).exe
REMOVE = del $(TARGET) >nul 2>&1
else
CXX = g++
TARGET = $(NAME).out
REMOVE = rm -f $(TARGET)
endif

all: $(TARGET)

$(TARGET): raw2wav.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(NAME).cpp

clean:
	$(REMOVE)

.PHONY: clean
