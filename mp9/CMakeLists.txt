cmake_minimum_required(VERSION 3.12)
project(mp9 C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(mp9
        mp9.c
        mp9.h
        mp9main.c
        mp9match.c)
