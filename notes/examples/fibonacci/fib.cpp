#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int fibCpp(int n) {
  if (n < 3) return n;
  return fibCpp(n-1) + fibCpp(n-2);
}


