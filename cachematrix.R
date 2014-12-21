makeCacheMatrix<-function(x){
  get<-function() x
  setInverse<-function(inverse) m<<-inverse
  getInverse<-function() m
  list(get=get,
       setInverse=setInverse,
       getInverse=getInverse)
}

cacheSolve<-function(fun,...){
  m<-fun$getInverse()
  if(!is.null(m)){
    message("caching inverse matrix")
    return(m)
  }
  data<-fun$get()
  m<-solve(data,...)
  fun$setInverse(m)
  m
} 