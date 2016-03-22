SHELL = /bin/bash
.PHONY = default objects

SRC = c_code.cpp code2.cpp
OBJ = $(patsubst %.cpp, %.o, $(SRC))
CFLAGS = -fPIC -O0

default: 
	python setup.py build_ext --inplace

objects: $(OBJ)

%.o: %.cpp
	g++ -c $(CFLAGS) $^ -o $@

exe.x: $(OBJ)
	g++ main.cpp $(OBJ) -o $@	

clean:
	rm -rf build cython_wrapper.so cython_wrapper.cpp *.[ox]
