#include <stdio.h>

void main()
{
    int nb, np, block[10], process[10], allocation[10], i, j, worstindex;

    printf("\n Enter no of blocks: ");
    scanf("%d", &nb);

    printf("\nEnter size of each block: ");
    for (i = 0; i < nb; i++)
        scanf("%d", &block[i]);

    printf("\nEnter no of processes: ");
    scanf("%d", &np);

    printf("\nEnter size of each process: ");
    for (i = 0; i < np; i++)
    {
        scanf("%d", &process[i]);
        allocation[i] = -1;  // Initialize allocation
    }
    for (i=0;i<np;i++)
    {
        worstindex=-1;
        for (j=0;j<nb;j++)
        {
                if (block[j]>=process[i])
                {
                        if (worstindex==-1)
                                worstindex=j;
                        else if (block[worstindex]<block[j])
                                worstindex=j;
                }

        }
    if (worstindex!=-1)
     {
        allocation[i]=block[worstindex];
        block[worstindex]=block[worstindex]-process[i];
     }
   }

 printf("After Allocation:\n");
    printf("Process No\tProcess Size\tBlock Allocated\n");
    for (i = 0; i < np; i++)
    {
        if (allocation[i] != -1)
            printf("%d\t\t%d\t\t%d\n", i + 1, process[i], allocation[i]);
        else
            printf("%d\t\t%d\t\tCan't be allocated\n", i + 1, process[i]);
    }
}
