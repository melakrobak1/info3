#include <stdio.h>
#include <mpi.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]){
  int numprocs, rank, namelen, n;
  double *a;
  double S1,S2, ni,war;
  srand(time(NULL));
  char processor_name[MPI_MAX_PROCESSOR_NAME];
  S1,S2=0;
  MPI_Init(&argc, &argv);
      
      MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
      MPI_Comm_rank(MPI_COMM_WORLD, &rank);
      MPI_Get_processor_name(processor_name, &namelen);
      n=10000*(rank+1);
      a=(double*)malloc(n*sizeof(double));
      for (int i=0;i<n;i++){
        a[i]=(((double) rand())/(RAND_MAX));
        S1+=a[i];
      }
      ni=S1/((double)n);
      for (int i=0;i<n;i++){
        S2+=(a[i]-ni)*(a[i]-ni);
      }
      war=S2/((double)(n-1));
      printf("PROCESS%d\nWylosowano a[0]=%lf\nS1=%lf\nni=%lf\nS2=%lf\nwar=%lf\n",rank,a[0],S1,ni,S2,war);
      printf("Hello World! from process %d out of %d on %s\n",
             rank, numprocs, processor_name);
    MPI_Finalize();
  }

//np number of processes