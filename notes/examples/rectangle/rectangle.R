
Rcpp::sourceCpp("rectangle.cpp")

r <- new(Rectangle, 2.5, 3)
r$area()

### S4 dispatch ###

# helper function to create objects
Rectangle <- function(width, height) {
  if(min(width,height) < 0) stop("width and height must be nonnegative.")
  new("Rcpp_Rectangle", width, height)
}

# generic function and method for area
setGeneric("area", function(object) standardGeneric("area"))
setMethod("area", "Rcpp_Rectangle", function(object) object$area())

Rectangle(-1,1)
rec <- Rectangle(2.5, 3)
area(rec)
