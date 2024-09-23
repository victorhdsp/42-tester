#!/bin/bash

cd __test__

COMPILADOR="clang -Wall -Wextra -Werror";
HEADER_FOLDER="../src/headers/"; #Relativo a pasta de testes.
C_FOLDER="../src/src"; #Relativo a pasta de testes.
TEST_SRC="./src"; #Relativo a pasta de testes.

ALL="unity.o main.o $(ls "$C_FOLDER" | tr "\n" " " | sed -e 's|\.c|\.o|g')"

(
    echo "test: $ALL";
    echo -e "\t$COMPILADOR -o test $ALL";
    echo "";
    echo "unity.o: $TEST_SRC/unity.c";
    echo -e "\t$COMPILADOR -c $TEST_SRC/unity.c -o unity.o";
    echo "";
    echo "main.o: main.c";
    echo -e "\t$COMPILADOR -I $TEST_SRC -I $HEADER_FOLDER -c main.c -o main.o";
    echo "";
    for C_FILE in $(ls "$C_FOLDER/"); do
        O_FILE=$(echo "$C_FILE" | sed -e 's|\.c|\.o|g')
        echo -e "$O_FILE: $C_FOLDER/$C_FILE";
        echo -e "\t$COMPILADOR -I $HEADER_FOLDER -c $C_FOLDER/$C_FILE -o $O_FILE";
    done
    echo "";
    echo "clean:";
    echo -e "\trm -f *.o test";
) > makefile

make
./test
