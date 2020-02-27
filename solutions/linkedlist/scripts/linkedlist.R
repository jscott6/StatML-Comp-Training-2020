Rcpp::sourceCpp("solutions/linkedlist/scripts/linkedlist.cpp")

# Verify functionality
x <- new(LinkedList)
for (i in 1:5)
  x$insert(runif(1))
x$head()
x$size()
x$print()
x$remove()
x$print()

# Lets use S4 dispatch for this 

# Helper function
LinkedList <- function() new("Rcpp_LinkedList")

# Want print(x) to result in x$print(). We use the generic function 'show' for this.
setMethod("show", "Rcpp_LinkedList", function(object) object$print())

# create generic function size() and implement method for class "Rcpp_LinkedList
setGeneric("size", function(obj) standardGeneric("size"))
setMethod("size", "Rcpp_LinkedList", function(obj) obj$size())

# same for head and insert
setGeneric("head", function(obj) standardGeneric("head"))
setMethod("head", "Rcpp_LinkedList", function(obj) obj$head())

setGeneric("insert", function(obj, ...) standardGeneric("insert"))
setMethod("insert", "Rcpp_LinkedList", function(obj, val) obj$insert(val))

# We also want a generic for remove. However, we need to ensure safety here.
# Currently if size(x) == 0 then x$remove() will cause a segfault.
# We can implement safety from the R side as follows

setGeneric("remove", function(obj) standardGeneric("remove"))
setMethod(
  "remove", 
  "Rcpp_LinkedList", 
  function(obj) {
    if(size(obj)) 
    obj$remove()
  }
)


y <- LinkedList()
insert(y, 1.0)
print(y)
remove(y)
print(y)
# no memory leak
remove(y)