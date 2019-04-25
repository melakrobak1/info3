#include <stdio.h>
#include <mpi.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]){
  int numprocs, rank, namelen, n;
  double *a;
  double S1,S2, ni,war,wynik1,wynik2;
  
  char processor_name[MPI_MAX_PROCESSOR_NAME];
  S1=S2=0;
//double *wsk_S1;
//double *wsk_S2, *wsk_wynik1, *wsk_wynik2;
//wsk_S1=&S1;
//wsk_S2=&S2;
//wsk_wynik1=&wynik1;
//wsk_wynik2=&wynik2;

  MPI_Init(&argc, &argv);
      
      MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
      MPI_Comm_rank(MPI_COMM_WORLD, &rank);
      MPI_Get_processor_name(processor_name, &namelen);
      
      srand(time(NULL)+3*rank);
      n=10000*(rank+1);
      a=(double*)malloc(n*sizeof(double));
      for (int i=0;i<n;i++){
        a[i]=(((double) rand())/(RAND_MAX));
        S1+=a[i];
      }
	double S1_g,ni_g;
	int n_g;
	MPI_Allreduce(&S1, &S1_g, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
	MPI_Allreduce(&n,&n_g ,1,MPI_INT,MPI_SUM,MPI_COMM_WORLD);
        ni=S1/((double)n);
	printf("proces %d, srednia lokalna: %lf\n",rank,ni);
	ni_g = S1_g / n_g;

      for (int i=0;i<n;i++){
        S2+=(a[i]-ni)*(a[i]-ni);
      }
      wynik2=S2;
      war=S2/((double)(n-1));
      printf("PROCESS%d\nWylosowano a[0]=%lf\nS1=%lf\nni=%lf\nS2=%lf\nwar=%lf\n",rank,a[0],S1,ni,S2,war);
      fflush(stdout);
      MPI_Barrier(MPI_COMM_WORLD);
      printf("Hello World! from process %d out of %d on %s\n",
             rank, numprocs, processor_name);
      fflush(stdout);
      MPI_Barrier(MPI_COMM_WORLD);
	
      MPI_Finalize();
      free(a);
  }

//np number of processes
