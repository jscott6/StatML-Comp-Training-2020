#' @export
my_first_package_function <- function(myname = NULL){
  if(is.null(name)){
    stop(" ERROR: please provide a name as the first parameter value ")
  }else{
    print("This function call is from  my.first.package")
    print(paste("Function called by",name))
  }
  return(0)
} 
