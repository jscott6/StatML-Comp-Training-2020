#include <Rcpp.h>
#include <vector>
using namespace Rcpp;

// [[Rcpp::plugins(cpp11)]]

// [[Rcpp::export]]
std::vector<double> timesTwo(std::vector<double> x) {
  
  for(auto &a: x)
    a *= 2;
  
  return x;
}


