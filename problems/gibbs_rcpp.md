# Rcpp Implementation of a Gibbs Sampler

This problem is designed to give you a practical example of using Rcpp to speed up a statistical procedure; namely a Gibbs sampler. The originates from a blog post written by Darren Wilkinson and Dirk Eddelbuettel. Please read [this document](Gibbs_sampler.pdf) for a background to this problem. 

Consider the following Gibbs sampler in R.

```{r}
gibbs_r <- function(N, thin) {
  mat <- matrix(nrow = N, ncol = 2)
  x <- y <- 0

  for (i in 1:N) {
    for (j in 1:thin) {
      x <- rgamma(1, 3, y * y + 4)
      y <- rnorm(1, 1 / (x + 1), 1 / sqrt(2 * (x + 1)))
    }
    mat[i, ] <- c(x, y)
  }
  mat
}
```

The task is to convert this into C++ and use `Rcpp` to expose the function to R. You can then benchmark both the R and C++ versions using either `system.time()` or the function `microbenchmark()` (from the `microbenchmark` package).

Once finished, you may try the package building tutorial, or if interested in an advanced application of Rcpp you can move onto the [linked list problem](linkedlist.md).

