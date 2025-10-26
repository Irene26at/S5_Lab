#include <stdio.h>

int main() {
    int at[10], bt[10], pr[10];
    int n, i, j, temp, time = 0, count, completed = 0;
    int sum_wait = 0, sum_turnaround = 0, start;
    float avg_wait, avg_turn;

    printf("Enter the number of processes: ");
    scanf("%d", &n);

    // Input Arrival and Burst times
    for (i = 0; i < n; i++) {
        printf("Enter the Arrival Time and Burst Time for Process %d: ", i + 1);
        scanf("%d %d", &at[i], &bt[i]);
        pr[i] = i + 1;
    }

    // Sort by Arrival Time
    for (i = 0; i < n - 1; i++) {
        for (j = i + 1; j < n; j++) {
            if (at[i] > at[j]) {
                // Swap arrival time
                temp = at[i];
                at[i] = at[j];
                at[j] = temp;

                // Swap burst time
                temp = bt[i];
                bt[i] = bt[j];
                bt[j] = temp;

                // Swap process number
                temp = pr[i];
                pr[i] = pr[j];
                pr[j] = temp;
            }
        }
    }

    printf("\nProcess\tAT\tBT\tStart\tEnd\tWT\tTAT\n");
    printf("--------------------------------------------------------\n");

    // Scheduling processes
    while (completed < n) {
        count = 0;

        // Find how many have arrived so far
        for (i = completed; i < n; i++) {
            if (at[i] <= time)
                count++;
            else
                break;
        }

        // Sort the arrived processes by Burst Time
        if (count > 1) {
            for (i = completed; i < completed + count - 1; i++) {
                for (j = i + 1; j < completed + count; j++) {
                    if (bt[i] > bt[j]) {
                        // Swap arrival time
                        temp = at[i];
                        at[i] = at[j];
                        at[j] = temp;

                        // Swap burst time
                        temp = bt[i];
                        bt[i] = bt[j];
                        bt[j] = temp;

                        // Swap process number
                        temp = pr[i];
                        pr[i] = pr[j];
                        pr[j] = temp;
                    }
                }
            }
        }

        // If CPU is idle, move time to next arrival
        if (time < at[completed]) {
            time = at[completed];
        }

        // Execute the next process
        start = time;
        time += bt[completed];

        int wt = start - at[completed];
        int tat = time - at[completed];

        printf("P%d\t%d\t%d\t%d\t%d\t%d\t%d\n",
               pr[completed], at[completed], bt[completed],
               start, time, wt, tat);

        sum_wait += wt;
        sum_turnaround += tat;
        completed++;
    }

    avg_wait = (float)sum_wait / n;
    avg_turn = (float)sum_turnaround / n;

    printf("\nAverage Waiting Time: %.2f\n", avg_wait);
    printf("Average Turnaround Time: %.2f\n", avg_turn);

    return 0;
}
