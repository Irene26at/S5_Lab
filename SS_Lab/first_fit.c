include<stdio.h>
void main ()
{
        int nb,np,block[10],process[10],allocation[10],i,j;
        printf ("\n Enter no of blocks: ");
        scanf ("%d",&nb);
        printf ("\nEnter size of each block: ");
        for (i=0;i<nb;i++)
                scanf ("%d",&block[i]);
        printf ("\nEnter no of processes: ");
        scanf ("%d",&np);
        printf ("\nEnter size of each processes: ");
        for (i=0;i<np;i++)
        {
                scanf ("%d",&process[i]);
                allocation[i]=-1;
        }

        for (i=0;i<np;i++)
        {
                for (j=0;j<nb;j++)
                {
                        if (block[j]>=process[i])
                        {
                                allocation[i]=block[j];
                                block[j]=block[j]-process[i];
                                break;
                        }
                }
        }
        printf ("After Allocation: \n");
        printf ("Process NO \t Process Size \t Block Size \n");
        for (i=0;i<np;i++)
        {
                if (allocation[i]!=-1)
                        printf ("%d\t\t\t%d\t\t%d\n",i+1,process[i],allocation[i]);
                else
                {
                        printf ("%d\t\t\t%d",i+1,process[i]);
                        printf ("\t\t Cant be allocated \n");
                }
        }

}
