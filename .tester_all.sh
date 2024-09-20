#!/bin/bash
echo "------------------------------------------------------------"
echo "Verificação Norminette:" 
norminette -R CheckForbiddenSourceHeader

echo "------------------------------------------------------------" 
echo "Arquivo invisiveis encontrados:" 
find . -name ".*" | sort -n
find . -name "*.out"

echo "------------------------------------------------------------"
echo "Resultado do <main>"
read -r -a EXERCISES <<< `find . -name "ex*" | sort -n | sed -r 's/[^0-9]//g' | tr '\n' ' '`
for NUMBER in ${EXERCISES[@]}; do
        if ([ -e ./ex$NUMBER/*.c ]); then
                cat ./ex$NUMBER/*.c | sed -e 's/\/\*.*//g' | sed -e 's/\*\///g' > /tmp/tmp.c
                clang -Wall -Wextra -Werror /tmp/tmp.c -lm
                echo -n -e "Ex$NUMBER: \n"; ./a.out
                rm /tmp/tmp.c
                rm a.out
                echo -e "\n---\n"
        else
                echo "Sem arquivos para compilar"
        fi
done
echo ""

echo "------------------------------------------------------------"
echo "Erros:"
