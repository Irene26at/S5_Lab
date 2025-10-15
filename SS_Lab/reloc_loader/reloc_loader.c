#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void convert(char h[12]);
char bitmask[12];
char bit[50] = {0};

int main() {
    unsigned int add, length;
    char input[10], relocbit, pn[5];
    int start, len, i, address, opcode, addr, actualadd, tlen;
    FILE *fp1, *fp2;

    printf("\nEnter the actual starting address: ");
    scanf("%x", &start);

    fp1 = fopen("RInput.txt", "r");
    fp2 = fopen("ROutput.txt", "w");

    if (!fp1 || !fp2) {
        printf("Error opening file(s).\n");
        return 1;
    }

    if (fscanf(fp1, "%s", input) == EOF) {
        printf("Empty input file.\n");
        return 1;
    }

    fprintf(fp2, "_________________________\n");
    fprintf(fp2, "ADDRESS\t\tCONTENT\n");
    fprintf(fp2, "_________________________\n");

    while (1) {
        if (strcmp(input, "E") == 0) break;

        if (strcmp(input, "H") == 0) {
            fscanf(fp1, "%s", pn);
            fscanf(fp1, "%x", &add);
            fscanf(fp1, "%x", &length);
            fscanf(fp1, "%s", input);  
        } 
        else if (strcmp(input, "T") == 0) {
            if (fscanf(fp1, "%x", &address) == EOF) break;
            if (fscanf(fp1, "%x", &tlen) == EOF) break;
            if (fscanf(fp1, "%s", bitmask) == EOF) break;

            address += start;
            convert(bitmask);

            len = strlen(bit);
            if (len > 10) len = 10;

            for (i = 0; i < len; i++) {
                if (fscanf(fp1, "%x", &opcode) == EOF) break;
                if (fscanf(fp1, "%x", &addr) == EOF) break;

                relocbit = bit[i];
                if (relocbit == '0')
                    actualadd = addr;
                else
                    actualadd = addr + start;

                fprintf(fp2, "%04X\t\t%02X%04X\n", address, opcode, actualadd);
                address += 3;
            }

            if (fscanf(fp1, "%s", input) == EOF) break;
        } 
        else {
            if (fscanf(fp1, "%s", input) == EOF) break;
        }
    }

    fprintf(fp2, "_________________________\n");
    fclose(fp1);
    fclose(fp2);

    // Display output
    printf("\nThe contents of output file (ROutput.txt):\n\n");
    fp2 = fopen("ROutput.txt", "r");
    if (!fp2) {
        printf("Error opening output file.\n");
        return 1;
    }

    int ch = fgetc(fp2);
    while (ch != EOF) {
        putchar(ch);
        ch = fgetc(fp2);
    }

    fclose(fp2);
    return 0;
}

// Convert hex bitmask to binary string
void convert(char h[12]) {
    int i, l;
    strcpy(bit, "");
    l = strlen(h);

    for (i = 0; i < l; i++) {
switch (h[i]) {
            case '0': strcat(bit, "0000"); break;
            case '1': strcat(bit, "0001"); break;
            case '2': strcat(bit, "0010"); break;
            case '3': strcat(bit, "0011"); break;
            case '4': strcat(bit, "0100"); break;
            case '5': strcat(bit, "0101"); break;
            case '6': strcat(bit, "0110"); break;
            case '7': strcat(bit, "0111"); break;
            case '8': strcat(bit, "1000"); break;
            case '9': strcat(bit, "1001"); break;
            case 'A': case 'a': strcat(bit, "1010"); break;
            case 'B': case 'b': strcat(bit, "1011"); break;
            case 'C': case 'c': strcat(bit, "1100"); break;
            case 'D': case 'd': strcat(bit, "1101"); break;
            case 'E': case 'e': strcat(bit, "1110"); break;
            case 'F': case 'f': strcat(bit, "1111"); break;
            default: strcat(bit, "0000"); break;  // fallback for invalid chars
        }
    }
}
