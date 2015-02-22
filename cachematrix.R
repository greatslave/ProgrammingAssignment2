## Cache the Inverse of a Matrix
## R course assignment 2
## As an exercise to show how to create a matrix and cache the inverse
## and store it in a variable that can be used in the parent environment 
## Outside of the function as variables are usually "destroyed"
## outside the function environment where they are called.

## makeCacheMatrix is a function to take a matrix and cache the inverse

makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
                x<<-y ## <<- assigns variable in environment outside current 
                m<<-NULL
        }
        
        get<-function() x
        setmatrix<-function(solve) m<<- solve
        getmatrix<-function() m
        list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)
}
       
## Cache solve tests if cached matrix was inverted and exists
## if so uses cached matrix in memory

cacheSolve <- function(x=matrix(), ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)  #return gives last value of funciton and exits function
        }
        matrix<-x$get # "else" portion of function if m is not null 
        m<-solve(matrix, ...)
        x$setmatrix(m)
        m
}
        
        

