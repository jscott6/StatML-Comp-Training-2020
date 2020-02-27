
fibRec <- function(n) {
  if (n < 3) n
  else fibRec(n-1) + fibRec(n-2)
}

