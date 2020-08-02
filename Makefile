EXEC := main

CXX := g++ #main compiler
CXXFLAGS := -Wall -g

INCLUDE_DIR := include
BUILD_DIR := build
SRC_DIR := src

CXXFLAGS += -I$(SRC_DIR)

SOURCE_FILES = main.cpp

OBJECTS = $(patsubst %,$(BUILD_DIR)/%,$(SOURCE_FILES:.cpp=.o))

all: $(BUILD_DIR)/$(EXEC)

$(BUILD_DIR)/$(EXEC): $(OBJECTS)
	$(CXX)-o $(BUILD_DIR)/$(EXEC) $(OBJECTS);

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CXX)-c -o $@ $<

clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: clean

start:
	@$(BUILD_DIR)/$(EXEC);

.PHONY: start