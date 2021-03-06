#!/bin/bash

set -e

echo "Compiling (if needed)..."
javac main.java
g++ -O2 main.cpp -omain-cpp
gcc -O2 main.c -omain-c
gccgo -g main.go -omain-go
yasm -f elf64 -a x86 main.asm -o main.o
ld main.o -o main-asm
gmcs main.cs
ghc hworld.hs -o main-haskell

echo "Running ..."
echo
echo "Java:"
java Main
echo
echo "C++:"
./main-cpp
echo
echo "C:"
./main-c
echo
echo "Go:"
./main-go
echo
echo "Python3:"
python3 main.py
echo
echo "Perl:"
perl main.pl
echo
echo "ASM:"
./main-asm
echo
echo "Shell:"
sh main.sh
echo
echo "Lua:"
lua main.lua
echo
echo "C-Sharp (Mono):"
mono main.exe
echo
echo "PHP:"
php main.php
echo
echo "Ruby:"
ruby main.rb
echo
echo "Haskell:"
./main-haskell
echo

rm Main.class main-haskell main-c main-cpp main-go main.o main-asm main.exe *.hi hworld.o
