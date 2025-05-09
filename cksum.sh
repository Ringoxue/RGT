#!/bin/bash

usr=${0%.*}

gcc -Wall *.c -o ${usr}.exe -O3 -s -static-libgcc 
