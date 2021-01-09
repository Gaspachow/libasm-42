#include <stdio.h>
#include <errno.h>
#include <string.h>


int ft_write(int fd,char *str, int len);

int main() {
    char s1[50] = "wewe";
    char s2[50] = "wewe";

    ft_write(1, "hi\n", 3);

    // int i = ft_strcmp(s1, s2);

     printf("%s\n", strerror(errno));
    return (0);
}