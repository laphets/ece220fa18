cmake_minimum_required(VERSION 3.12)
project(mp11 C)

set(CMAKE_C_STANDARD 11)

include_directories(.)

add_executable(mp11
        ece220_label.c
        ece220_label.h
        ece220_lex.h
        ece220_parse.h
        ece220_parse.tab.c
        ece220_parse.tab.h
        ece220_lex.yy.c
        ece220_symtab.c
        ece220_symtab.h
        mp11.c
        mp11base.c)
