#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void main()
{
        char label[10],op[10],oper[10];
        char code[10],mne[10];
        int loc,start;
        FILE * input, * output, * optab, * symtab;
        input=fopen("input.txt","r");
        optab=fopen("optab.txt","r");
        output=fopen("output.txt","w");
        symtab=fopen("symtab.txt","w");
        fscanf(input,"%s\t%s\t%s",label,op,oper);
        if(strcmp(op,"START")==0){
                loc=atoi(oper);
                start=loc;
                fprintf(output,"%s\t%s\t%s\n",label,op,oper);
                fscanf(input,"%s\t%s\t%s",label,op,oper);
        }else
                start=loc=0;
        while(strcmp(op,"END")!=0){
                fprintf(output,"%d\t",loc);
                if(strcmp(label,"")!=0 && strcmp(label,"**")!=0)
                        fprintf(symtab,"%s\t%d\n",label,loc);
                fscanf(optab,"%s\t%s",code,mne);

                while(strcmp(code,"END")!=0){
                        if(strcmp(code,op)==0){
                                loc +=3;
                                break;
                        }
                fscanf(optab,"%s\t%s",code,mne);
                }

                if(strcmp(op,"WORD")==0)
                        loc +=3;
                else if(strcmp(op,"RESW")==0)
                        loc += 3*atoi(oper);
                else if(strcmp(op,"RESB")==0)
                        loc += atoi(oper);
                else
                        loc++;
                fprintf(output,"%s\t%s\t%s\n",label,op,oper);
                fscanf(input,"%s\t%s\t%s",label,op,oper);
        }
        fprintf(output,"%s\t%s\t%s\n",label,op,oper);
        printf("Program length is %d",loc-start);

        fclose(input);
        fclose(output);
        fclose(symtab);
        fclose(optab);
}
