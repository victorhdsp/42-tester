#!/bin/bash
echo "------------------------------------------------------------"
echo "Verificação Norminette:" 
norminette | sort -n
echo "------------------------------------------------------------" 
echo "Arquivo invisiveis encontrados:" 
find . -name "." | sort -n
echo "------------------------------------------------------------"
echo "Executaveis encontrados:"
find . -name ".out" | sort -n
echo "------------------------------------------------------------"
echo "Resultado do <main>"
if ([ $1 ]); then
                EXECUTABLE=$1;
                ARCHIVES=ls -F *.c | sed -e "s/$1/\/tmp\/tmp.c/g";
        else
                EXECUTABLE='.c';
                ARCHIVES='/tmp/tmp.c';
fi;
if ([ -e $EXECUTABLE ]); then
        cat $EXECUTABLE | sed -e 's//*.//g' | sed -e 's/*///g' > /tmp/tmp.c;
        clang -Wall -Wextra $ARCHIVES -lm -lbsd -g;
        ./a.out $2 $3 $4 $6;
else
        echo "Sem arquivos para compilar"
fi;
echo ""
echo "------------------------------------------------------------"
echo "Verificando Memória:"
valgrind ./a.out;
rm a.out;
