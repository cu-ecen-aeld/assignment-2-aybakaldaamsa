# Default target builds the "writer" application
SRC := writer.c
TARGET = write
OBJS := $(SRC:.c=.o)
.PHONY: all clean

# Set the default compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra

# Default target when no CROSS_COMPILE is specified
ifeq ($(CROSS_COMPILE),)
	TARGET = writer
else
	CC := $(CROSS_COMPILE)gcc
	TARGET = writer_cross_compiled
endif

all: $(TARGET)

# Object files needed for the application
OBJ = writer.o

# Compile for the native build platform
writer: $(OBJ)
	$(CC) $(CFLAGS) -o writer $(OBJ)

# Compile for the specified cross-compiler platform
writer_cross_compiled: $(OBJ)
	$(CC) $(CFLAGS) -o writer_cross_compiled $(OBJ)

# Clean target removes the application and all .o files
clean:
	rm -f $(OBJ) writer writer_cross_compiled
