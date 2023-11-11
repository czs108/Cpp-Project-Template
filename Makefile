# GoogleTest is not supported.
SHELL := /bin/sh

INC_DIR := ./include
SRC_DIR := ./src
BUILD_DIR := ./build

# Set the C++ compiler.
CXX := clang++

# Set the C++ version and include path.
CXXFLAGS := -std=c++11 -I$(INC_DIR)

# Set search paths.
vpath %.h $(INC_DIR):$(SRC_DIR)
vpath %.cpp $(SRC_DIR)
vpath %.d $(BUILD_DIR)
vpath %.o $(BUILD_DIR)

# Build the main program.
.PHONY: all
all: $(BUILD_DIR)/cpp-sample

# Clean up building files.
.PHONY: clean
clean:
# Delete dependency files.
	$(RM) $(shell find $(BUILD_DIR) -name '*.d')
# Delete object files.
	$(RM) $(shell find $(BUILD_DIR) -name '*.o')
# Delete empty folders.
	find $(BUILD_DIR) -empty -type d -delete

#########################################################################################

# Search for source files except GoogleTest files.
SRC := $(filter-out %_test.cpp,$(shell find $(SRC_DIR) -name '*.cpp'))

# Get object file paths in the building folder.
# e.g. `src\foo\foo.cpp` -> `build\foo\foo.o`.
OBJS := $(addprefix $(BUILD_DIR),$(patsubst $(SRC_DIR)%.cpp,%.o,$(SRC)))

# Get dependency file paths in the building folder.
# e.g. `src\foo\foo.cpp` -> `build\foo\foo.d`.
INC_PREQS := $(addprefix $(BUILD_DIR),$(patsubst $(SRC_DIR)%.cpp,%.d,$(SRC)))

$(INC_PREQS): $(BUILD_DIR)/%.d: %.cpp
	@mkdir -p $(dir $@)
# Generate a dependency file for each source file.
	$(CXX) -MM -I$(INC_DIR) -I$(dir $<) -I$(subst $(SRC_DIR),$(INC_DIR),$(dir $<)) $< > $@
# Add the full path for the source file in each dependency file.
# e.g. `foo.cpp: include\foo\foo.h` -> `src\foo\foo.cpp: include\foo\foo.h`.
	sed -Ei 's#^(.*\.o: *)$(SRC_DIR:./%=%)/(.*/)?(.*\.cpp)#$(BUILD_DIR:./%=%)/\2\1$(SRC_DIR:./%=%)/\2\3#' $@

include $(INC_PREQS)

# Generate object files.
$(OBJS): $(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -I$(dir $<) -I$(subst $(SRC_DIR),$(INC_DIR),$(dir $<)) -c $< -o $@

# Link object files.
$(BUILD_DIR)/cpp-sample: $(OBJS)
	$(CXX) $^ -o $@