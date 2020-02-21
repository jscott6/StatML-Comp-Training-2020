#' Multiply two matrices
#'
#' @param A a matrix.
#' @param B a matrix.
#' @return The product of \code{A} and \code{B}.
#' @examples
#' X <- matrix(1:6,2,3)
#' Y <- matrix(1:15,3,5)
#' multiply(X, Y)
#' @export
multiply <- function(A, B) {

  if(ncol(A) != nrow(B)){stop('matrices A and B have incompatible dimensions')}
  A %*% B
}
