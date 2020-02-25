#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double dot(const NumericVector& a,const NumericVector& b) {
  return sum(a * b);
}
