setwd("C:/Data_Science_Coursera_Jhon_Hopkin_University/Data Science Foundations using R/2 - R programming/3 - Week 3 - Loop Functions and Debugging/04_programming-assignment")

# @author Zuyufullah Manna  (Github: Zuyuf)

## Pair of functions that cache the inverse of a matrix
## Usage: Pass the result of a makeCacheMatrix call to cacheSolve 

#' Util function that set the matrix and the inverse in an environment
#' @param x an invertible matrix
#' examples
#' x = makeCacheMatrix(matrix(rnorm(9), 3, 3))
#' x$set(matrix(rnorm(16), 4, 4))

## Function to make 'cache' matrix from a given matrix

makeCacheMatrix <- function(x = matrix()) {
    #initialize cache matrix and set it to null
    cacheMatrix <- NULL
    
    setMatrix <- function(y) {
      x <<- y
      cacheMatrix <<- NULL
    }
    
    #method getMatrix(), returns: matrix.
    getMatrix() <- function() x 
    
    
    #method setCache()
    setCache <- function(inverse) cacheMatrix <<- inverse
    
    #method getCache()
    getCache <- function() cacheMatrix
    
    
    #listing named of methods that will be publicly available
    list(setMatrix = setMatrix,
         getMatrix = getMatrix,
         setCache = setCache,
         getCache = getCache)
}


#' Compute and cache the inverse of a matrix
#' @param x the result of a previous makeCacheMatrix call
#' @param ... additional arguments to pass to solve function
#' examples
#' x = makeCacheMatrix(matrix(rnorm(9), 3, 3))
#' cacheSolve(x)

## Function to calculate inverse of 'cache' matrix
## If inverse is already calculated, it returns the data form cache
## If inverse is not calcualted, it calculates and returns the matrix inverse
cacheSolve <- function(x, ...) {
    #Checking for content of the cache matrix
    cacheMatrix <- x$getCache()
    
    #If the content is not null
    if ( !is.null(cacheMatrix) ) {
        message("Load: cache matrix.")
        return(cacheMatrix)
    }
    #If there is no content, get matrix, create, set, update, return cache matrix
    else {
        dMatrix <- x$getMatrix()
        
        cacheMatrix <- solve(dMatrix, ...)
        
        x$setCache(cacheMatrix)
        
        return(cacheMatrix)
    }
}