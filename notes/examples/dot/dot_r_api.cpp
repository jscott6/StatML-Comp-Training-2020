#include <R.h>
#include <Rinternals.h>

SEXP dot(SEXP a, SEXP b) {
  int n;
  SEXP sum;
  a = PROTECT(coerceVector(a, REALSXP));
  b = PROTECT(coerceVector(b, REALSXP));
  n = length(a);
  sum = PROTECT(allocVector(REALSXP, 1));
  REAL(sum)[0] = 0;
  for (int i = 0; i < n; i++) {
    REAL(sum)[0] += REAL(a)[i] * REAL(b)[i]
  }
  UNPROTECT(3);
  return sum;
}

