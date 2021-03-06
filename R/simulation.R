##' Simulate 1-dimension Brownian motion
##'
##' Simulate 1-dimension Brownian motion
##' @title 1-dimension Brownian motion simulation
##' @param n Number of points to simulate(must be larger than 1 point) 
##' @param sigma The standard deviation of the step
##' @return A vector showing the Brownian motion
##' @examples x <- sim1dBM(1000, 2)
##' @export
##' @author Ye Zheng
sim1dBM <- function(n, sigma = 1){

  if(n < 2){

    stop("The number of simulation points should be larger than 1.")
  }
  if(sigma <=  0){

    stop("The standard deviation for the step should be larger than 0.")
  }
   x <- rnorm(n, 0, sigma)
  
  cumsum(x)
}

##' Simulate 2-dimension Brownian motion
##'
##' Simulate 2-dimension Brownian motion
##' @title 2-dimension Brownian motion simulation
##' @param n Number of points to simulate(must be larger than 1 point) 
##' @param sigma  The standard deviation of the step
##' @return Matrix with two columns showing the (X, Y) positions of simulated Brownina modtion
##' @examples x <- sim2dBM(1000, 2)
##' @export
##' @author Ye Zheng
sim2dBM <- function(n, sigma = 1){

  if(n < 2){

    stop("The number of simulation points should be larger than 1.")
  }
  if(sigma <=  0){

    stop("The standard deviation for the step should be larger than 0.")
  }
  x <- matrix( rnorm(2*n, 0, sigma), ncol=2)
  colnames(x) <- c("x", "y")
  apply(x, 2, cumsum)
}

##' Plot 1-dimension or 2-dimension Brownian motion simulation path
##'
##' Plot 1-dimension or 2-dimension Brownian motion simulation path
##' @title Plot Brownian motion simulation 
##' @param x A vector or a matrix of Brownian motion path
##' @param type Plotting type (line/points/etcs) which is passed to plot() function
##' @param pointcolor Colors of starting and ending points
##' @param cex Points size for the starting and ending points
##' @param ... Other parameters passed to plot() function
##' @return Brownina motion simulation path figure
##' @examples x <- sim1dBM(1000, 2)
##' plotBM(x)
##' @export
##' @author Ye Zheng
plotBM <- function(x, type = "l", pointcolor = c("purple", "blue"), cex = 2, ... ){

  if(!is.matrix(x)){
    main = "1 Dimension Brownian Motion Simulation"
    xlab = "Time"
    ylab = "Position"
    plot(x, type = type, main = main, xlab = xlab, ylab = ylab)
  }else{
    main = "2 Dimension Brownian Motion Simulation"
    xlab = "X"
    ylab = "Y"
    plot(x, type=type, main = main, xlab = xlab, ylab = ylab, ...)
    if(!is.null(pointcolor))
      points(x[c(1, nrow(x)),], pch=21, bg=pointcolor, cex=cex)
  }

  
}
