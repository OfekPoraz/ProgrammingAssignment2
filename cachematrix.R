## Put comments here that give an overall description of what your
## functions do


##downloading matlib library
##install.packages("matlib")
library(matlib)

## Write a short comment describing this function

## Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  ## Initialize the inverse property
  i <- NULL
  ## Method to set the matrix
  setOriginal <- function(matrix) {
    x <<- matrix
    i <<- NULL
  }
  
  ## Method the get the matrix
  getOriginal <- function() {
    x
  }
  
  ## Method to set the inverse of the matrix
  setInverse <- function(matrixInversed) {
    i <<- matrixInversed
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    i
  }

  ## Return a list of the methods
  list(setOriginal = setOriginal,
       getOriginal = getOriginal,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix" above.
## If the inverse has already been calculated then the "cachesolve" should get the inverse from the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    ##Getting the inversed matrix from cache
    i <- x$getInverse()
    ##Checking if the matrix is not null
    if(!is.null(i)) {
      message("getting cached inversed matrix")
      return(m)
    }
    ##Getting the matrix
    data <- x$getOriginal()
    ## Calculate the inverse
    i <- inv(data)
    ##Setting the inverted matrix in the cache
    x$setInverse(i)
    i
}
