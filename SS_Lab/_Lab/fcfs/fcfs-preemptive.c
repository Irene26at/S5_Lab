#include <stdio.h>

int main() {
    // Added pid[10] to track original process IDs
    int n, i, j;
    int at[10], bt[10], ct[10], wt[10], tat[10], pid[10];
    int temp;
    float totaltat = 0, totalwt = 0;

    printf("Enter the total number of processes: ");
    scanf("%d", &n);

    for (i = 0; i < n; i++) {
        pid[i] = i + 1; // Store the original process ID (P1, P2, etc.)
        printf("Enter AT of process [%d]: ", pid[i]);
        scanf("%d", &at[i]);
        printf("Enter BT of process [%d]: ", pid[i]);
        scanf("%d", &bt[i]);
    }

    // Sorting based on Arrival Time (at)
    for (i = 0; i < n - 1; i++) {
        for (j = i + 1; j < n; j++) {
            if (at[i] > at[j]) {
                // Swap Process ID
                temp = pid[i];
                pid[i] = pid[j];
                pid[j] = temp;

                // Swap Arrival Time
                temp = at[i];
                at[i] = at[j];
                at[j] = temp;

                // Swap Burst Time
                temp = bt[i];
                bt[i] = bt[j];
                bt[j] = temp;
            }
        }
    }

    // Calculate metrics with correct logic
    int current_time = 0;
    for (i = 0; i < n; i++) {
        // Handle CPU idle time
        if (current_time < at[i]) {
            current_time = at[i];
        }
        
        ct[i] = current_time + bt[i];
        current_time = ct[i];

        tat[i] = ct[i] - at[i];
        wt[i] = tat[i] - bt[i];

        totaltat += tat[i];
        totalwt += wt[i];
    }

    printf("\n--- FCFS Scheduling Results ---\n");
    printf("Process\tAT\tBT\tCT\tTAT\tWT\n");
    for (i = 0; i < n; i++) {
        // Print the original ID from pid[i]
        printf("P%d\t%d\t%d\t%d\t%d\t%d\n", pid[i], at[i], bt[i], ct[i], tat[i], wt[i]);
    }

    printf("\nAverage TAT: %.2f", totaltat / n);
    printf("\nAverage WT: %.2f\n", totalwt / n);

    return 0;
}
