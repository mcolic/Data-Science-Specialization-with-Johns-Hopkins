
## This assignment is aiming creation of two functions; where one
## creates a special object that stores a matrix and other caches its inverse.


## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(m = matrix()) {
  inv <- NULL
  set <- function(y) {
    m <<- y
    inv <<- NULL
  }

  get <- function() m
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## This function produces the inverse of the matrix returned by
## makeCacheMatrix function previously defined. If the inverse has already
## been calculated and the matrix did not change then the cachesolve sould
## recall the inverse from the cache.


cacheSolve <- function(m, ...) {
  inv <- m$getinverse()
  if(!is.null(inv)) {
    message("get previously cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  m$setinverse(inv)
  inv
}
