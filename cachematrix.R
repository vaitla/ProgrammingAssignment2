## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix 
##This function creates a special "matrix" object that can cache its inverse.


## cacheSolve 
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve will retrieve the inverse from the cache.

## Write a short comment describing this function
## Accepts matrix as an input . 
## Function throws an error  if the argument supplied is not a matrix
## This function initializes a variable "inverse" to null.Also it defines the following functions which act on the supplied matrix.
## get - Returns the supplied matrix.
## set - Sets a new value to the matrix and intializes the cache value to null.
## getInverse - Returns the cached value of  inverse of the matrix.Returns 'NULL' if value is not present in the cache.
## setInverse - Sets the value of the inverse of the matrix . If the inverse has already been calculated 
## (and the matrix has not changed)  will return the inverse from the cache
## makeCacheMatrix will return a list with functions get,set,getInverse and setInverse

makeCacheMatrix <- function(x = matrix()) {
	
	if(!is.matrix(x)) stop("Argument supplied is not of type matrix")
	inverse <<- NULL
	get <- function() x

	set <- function(y) {
        	x <<- y
        	inverse <<- NULL
	}
	getInverse <- function() inverse
	setInverse <- function(inverseValue) inverse <<- inverseValue

	list(get = get,set =set,getInverse = getInverse,setInverse = setInverse)
}


## Write a short comment describing this function.
## This function returns the  "inverse" of the given matrix. It checks if inverse value  exists in cache by  calling getInverse() .
## If inverse doesn't exist in cache , its calculate the inverse and sets on the matrix and returns it.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		 if(!is.null(x$getInverse())) {
                	message("getting cached value for the inverse of the matrix")
                	return(x$getInverse())
        	} else { 
			inverseVal <<- solve(x$get()) 
			x$setInverse(inverseVal)		
		}
		x$getInverse()
}
