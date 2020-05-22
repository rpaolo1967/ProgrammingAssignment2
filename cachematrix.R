## By: Paolo Ramoni Perazzi (5/22/2020)
## This function creates a special "matrix" object that can cache its inverse
## Creates a special "vector", which is really a list containing a function to:
##     1.- set the matrix
##     2.- get the matrix
##     3.- set the inverse
##     4.- get the inverse
## List used as the input to cacheSolve()
## @m: a squared invertible matrix
        inv <- NULL
        set <- function(y) {
                #  "<<-" operator can be used to assign a value to an object in an environment 
                # different from the current environment
                x <<- y
                inv <<- NULL
        }
        get <- function()x
        setinv <- function(solve) inv <<- solve(x)
        getinv <- function(){
            if (!is.null(inv)){ # If "inv" exists....
                return(inv)
            } else {
                cat("\nError: the inverse of the cached matrix hasn't be calculated yet")
           }
        }
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}

## By: Paolo Ramoni Perazzi (5/22/2020)
## "This function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache."
        inv <- x$getinv()  # Looks if the inverse has already been calculated...
        if (!is.null(inv)){ # If "inv" exists....
                # Gets it from the cache
                message("Inverse already available: getting cached data!")
                return(inv)
        }      
        dta <- x$get()   # Otherwise, gets the matrix via get()...
        inv <- solve(dta) # ... and calculates the inverse
        x$setinv(inv)  # Sets the inverse using setinv()
        return(inv)
}

