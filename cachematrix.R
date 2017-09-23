## 
##

## This function creates a special 'matrix' object that gets a matrix, sets the value of that matrix
## sets the inverse of that matrix and gets the inverse of that matrix.

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL
  setMatrix<-function(y){
    x<<-y
    inv<<-NULL
  }
getMatrix<-function()x
setInverse<-function(inverse) inv<<-inverse
getInverse<-function()inv
list(setMatrix=setMatrix, getMatrix=getMatrix, setInverse=setInverse, getInverse=getInverse)
}


## This function takes the output from the previous function and checks for its cashed inverse.
## If the cached inverse exists, it returns the message 'getting cached inverse' and the cached value.
## If the cached inverse does not exist, it calculates the inverse with the solve function and returns that value.


cacheSolve <- function(x, ...){
  inv<-x$getInverse()
  if (!is.null(inv)){
    message ("getting cached inverse")
    return (inv)
  }
Matrix <-x$getMatrix()
inv <-solve (Matrix,...)
x$setInverse(inv)
inv ## Return a matrix that is the inverse of 'x'
}

