#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void main() {
    FILE *fp;
    int i, addr1, l, j, straddr1;
    char name[10], line[50], name1[10], addr[10], rec[10], ch, straddr[10];

    printf("Enter the name of the program: ");
    scanf("%s", name);

    fp = fopen("objcode.txt", "r");
    if (fp == NULL) {
        printf("Error opening file!\n");
        return;
    }

    fscanf(fp, "%s", line);
    for (i = 2, j = 0; i < 7; i++, j++)
        name1[j] = line[i];
    name1[j] = '\0';

    printf("name for obj File: %s\n", name1);
    if (strcmp(name, name1) == 0) {
        while (fscanf(fp, "%s", line) != EOF) {
            if (line[0] == 'T') {
                for (i = 2, j = 0; i < 8; i++, j++)
                    straddr[j] = line[i];
                straddr[j] = '\0';
                straddr1 = strtol(straddr, NULL, 16);  // Assuming address is hexadecimal

                i = 12;
                while (line[i] != '\0') {
                    if (line[i] != '^') {
                        if (line[i + 1] != '\0')  // Check for bounds
                            printf("00%d\t%c%c\n", straddr1, line[i], line[i + 1]);
                        straddr1++;
                        i += 2;
                    } else {
                        i++;
                    }
                }
            } else if (line[0] == 'E') {
                printf("\nExecution address: ");
                for (i = 2; i < 8; i++)
                    printf("%c", line[i]);
                break;
            }
        }
    }

    fclose(fp);
}
