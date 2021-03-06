#define alpha( i,j ) A[ (j)*ldA + i ]   // map alpha( i,j ) to array A 
#define chi( i )  x[ (i)*incx ]         // map chi( i )  to array x
#define psi( i )  y[ (i)*incy ]         // map psi( i )  to array x

void Axpy( int, double, double *, int, double *, int );

void MyGemv( int m, int n, double *A, int ldA,
           double *x, int incx, double *y, int incy )
{
  for ( int j=0; j<n; j++ )
    for (int i=0; i<m; i++ )
      psi( i ) += alpha( i,j ) * chi( j );
}
