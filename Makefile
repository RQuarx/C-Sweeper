CC = gcc
CFLAGS = -Wall -g -lncurses -lpanel -lmenu

SRC_DIR = src
TARGET_DIR = target

SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(TARGET_DIR)/%.o,$(SRCS))

TARGET = $(TARGET_DIR)/cmine

all: $(TARGET)

# Rule to link object files to create the executable
$(TARGET): $(OBJS)
        $(CC) $(CFLAGS) -o $@ $^

# Rule to compile source files into object files
$(TARGET_DIR)/%.o: $(SRC_DIR)/%.c
        $(CC) $(CFLAGS) -c $< -o $@

clean:
        rm -f $(OBJS) $(TARGET)

$(TARGET_DIR):
        mkdir -p $(TARGET_DIR)

$(TARGET): | $(TARGET_DIR)

.PHONY: all clean