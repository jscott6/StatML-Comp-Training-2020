
require(microbenchmark)


install.packages("profvis")

f <- function() NULL
res <- microbenchmark(NULL, f(), times=1000L)
boxplot(res)

fibR <- function(n) {
  if (n < 3) n
  else fibR(n-1) + fibR(n-2)
}

Rcpp::sourceCpp("fib.cpp")


resR <- sapply(seq(10,30,2), function(n) mean(microbenchmark(fibR(n), times=10L)$time))


resCpp <- sapply(seq(10,30,2), function(n) mean(microbenchmark(fibCpp(n), times=10L)$time))


fibseq <- sapply(seq(10,30,2), fibCpp)


par(mfrow=c(1,2))
plot(log(resR * 1e-9), type = "o", ylim=c(-15,0), col = "red", xlab = "n", ylab = "Log seconds", main = "Timing F_n")
lines(log(resCpp * 1e-9), type = "o", col = "blue")
legend("bottomright", c("fibR", "fibCpp"), col = c("red", "blue"), lty = c(1,1), pch = c(1,1))


plot(resR/fibseq, ylim=c(0,700), type="o", col = "red", main="Normalised for function calls", xlab="n", ylab="Nanoseconds")
lines(resCpp/fibseq, ylim=c(0,600), type="o", col = "blue")
legend("topright", c("fibR", "fibCpp"), col = c("red", "blue"), lty = c(1,1), pch = c(1,1))


profvis::profvis({
  fibR(30)
})




