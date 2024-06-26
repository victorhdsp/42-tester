#!/bin/bash
echo "------------------------------------------------------------"
echo "Verificação Norminette:" 
norminette | sort -n
echo "------------------------------------------------------------" 
echo "Arquivo invisiveis encontrados:" 
find . -name ".*" | sort -n
echo "------------------------------------------------------------"
echo "Resultado do <main>"
if ([ -e ./*.c ]); then
	cat ./*.c | sed -e 's/\/\*.*//g' | sed -e 's/\*\///g' > /tmp/tmp.c 
	cc -Wall -Wextra -Werror /tmp/tmp.c
	./a.out
	rm a.out
else
	echo "Sem arquivos para compilar"
fi
echo ""
echo "------------------------------------------------------------"

read -r -a EXERCISES <<< `
find . -name "ex*.c" |
sed -r 's/[^0-9]//g' |
tr '\n' ' '
`

for COUNT in ${EXERCISES[@]}; do
cat ./*.c | sed -e 's/\/\*.*//g' | sed -e 's/\*\///g' > /tmp/tmp.c
cc -Wall -Wextra -Werror /tmp/tmp.c
EXERCISE=`/tmp/a.out`
rm /tmp/tmp.c /tmp/a.out
echo -e "
Exercício $COUNT: ${EXERCISE}
------------------------------"
done
