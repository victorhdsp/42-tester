#include "libft.h"
#include <limits.h>
#include <stdio.h>

int main(void)
{
    int number;

    // ft_atoi
    int atoi = ft_atoi("42");
    printf("ft_atoi: %d, %s\n", atoi, atoi == 42 ? "PASS": "ERROR");

    // ft_bzero
    char    bzero[6] = "123456";
    ft_bzero(bzero, 5);
    printf("ft_bzero: %s, %s\n", bzero[0] == 0 ? "PASS": "ERROR", bzero[5] == '6' ? "PASS": "ERROR");

    // ft_calloc
    char    *calloc = NULL;
    printf("ft_calloc: %s, ", calloc == NULL ? "PASS": "ERROR");
    calloc = ft_calloc(1, sizeof(char));
    printf("%s\n", calloc != NULL ? "PASS": "ERROR");

    // ft_isalnum
    printf("ft_isalnum: %s, %s\n", ft_isalnum('1') == 1 ? "PASS": "ERROR", ft_isalnum('~') != 1 ? "PASS": "ERROR");

    // ft_isalpha
    printf("ft_isalpha: %s, %s\n", ft_isalpha('a') == 1 ? "PASS": "ERROR", ft_isalpha('1') != 1 ? "PASS": "ERROR");

    // ft_isascii
    printf("ft_isascii: %s, %s\n", ft_isascii(0) == 1 ? "PASS": "ERROR", ft_isascii(127) == 1 ? "PASS": "ERROR");

    // ft_isdigit
    printf("ft_isdigit: %s, %s\n", ft_isdigit('0') == 1 ? "PASS": "ERROR", ft_isdigit('9') == 1 ? "PASS": "ERROR");

    // ft_isprint
    printf("ft_isprint: %s, %s\n", ft_isprint(32) == 1 ? "PASS": "ERROR", ft_isprint(126) == 1 ? "PASS": "ERROR");

    // ft_itoa
    number = 1001;
    char    *itoa = ft_itoa(number);
    printf("ft_itoa: %s, %d\n", itoa, number);

    // ft_memchr
    char    *memchr = "12345";
    printf("ft_memchr: %s\n", ((char *)ft_memchr(memchr, '4', 5)));

    // ft_memcmp
    char    *memcmp = "123456";
    printf("ft_memcmp: %s\n", ft_memcmp(memcmp, "345", 6) != 0 ? "PASS": "ERROR");
}
