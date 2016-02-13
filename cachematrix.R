## The following funtions works together to provide a performant way of doing matrix's 
## inverse calculations. 

## creates a list that holds the following funtions:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the matrix's inverse
## 4. get the value of the matrix's inverse


makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Computes the inverse of the special "matrix" created by the above funtion. Note that, 
## it first checks to see if the inverve has already been calculated. In this case, it just 
## returns the result from cache otherwise it calculates the matrix's inverse and sets the value
## in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  matrix <- x$get()
  i <- solve(matrix)
  x$setinverse(i)
  i
}
