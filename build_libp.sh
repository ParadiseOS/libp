#!/bin/bash

set -e

INCLUDE_DIR="include"
SRC_DIR="src"
BUILD_DIR="build"

mkdir -p "$BUILD_DIR"

OBJS=()

echo "Building libp"

rm -f "$BUILD_DIR"/*.o

USE_PMATH=false
for arg in "$@"; do
    if [ "$arg" = "-lm" ]; then
        USE_PMATH=true
    fi
done

# Compile .c files to .o
for file in "$SRC_DIR"/*.c; do
    base=$(basename "$file")
    if [ "$USE_PMATH" = false ] && [ "$base" = "pmath.c" ]; then
        continue
    fi

    echo "Compiling $file"
    obj="$BUILD_DIR/$(basename "${file%.c}.c.o")"
    gcc -c "$file" -o "$obj" -Wall -Wextra -fno-pic -fno-asynchronous-unwind-tables -m32 -masm=intel -mpreferred-stack-boundary=2 -I"$INCLUDE_DIR"
    OBJS+=("$obj")
done

# Assemble .asm or .s files with fasm or as
for file in "$SRC_DIR"/*.s; do
    echo "Compiling $file"
    obj="$BUILD_DIR/$(basename "${file%.s}.s.o")"
    fasm "$file" "$obj"
    OBJS+=("$obj")
done

# Link all objects into a single relocatable .o
ld -r -m elf_i386 "${OBJS[@]}" -o "$BUILD_DIR/libp.o"
echo "Built libp"
