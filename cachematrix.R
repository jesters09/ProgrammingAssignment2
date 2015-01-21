## The purpose of these two functions is to be able to create a matrix
## that stores the inputed data, calculate the inverse of the matrix, and store
## this in the cache so the value can be accesssed without having to recalculate
## the inverse matrix every time the value is needed.


## The makeCacheMatrix function creates the initial matrix and stores it. It 
## also cleans out the cache and gets the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
##cleans out cache    
    set <- function(y) {
        x <<- y
        m <<- NULL
    }

#creates vector stored in the CacheMatrix    
    get <- function() x

#sets the inverse of the matrix
    setinverse <- function(solve) 
        m <<- solve

#gets the stored inverse value
    getinverse <- function() m


    getevn<- function() environment()
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse,
         getevn = getevn)
}


## This function cheeck to see if the inverse has been calculated
## If the inverse has already been calculated, it pulls the cached
##values that is stored in the getinverse function
## If the inverse has not been calculated, it gets pulls the matrix data
##from teh get function and calculates the inverse matrix.
##The inverse value M is then set in the setinverse function.

cacheSolve <- function(x, ...) {
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
    
        ## Return a matrix that is the inverse of 'x'
}




