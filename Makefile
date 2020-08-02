EXEC := main

CXX := g++
CXXFLAGS := -Wall -g

INCLUDE_DIR := include
BUILD_DIR := build
SRC_DIR := src

CXXFLAGS += -I$(INCLUDE_DIR)

SOURCE_FILES = main.cpp

OBJECTS = $(patsubst %,$(BUILD_DIR)/%,$(SOURCE_FILES:.cpp=.o))

all: $(BUILD_DIR)/$(EXEC)

$(BUILD_DIR)/$(EXEC): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $(BUILD_DIR)/$(EXEC) $(OBJECTS);

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: clean

start:
	@$(BUILD_DIR)/$(EXEC);

.PHONY: start