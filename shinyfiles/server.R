################################################################################
##
##              Functions to use quadrature to estimate integral
##
################################################################################
## sample function for testing
f <- function(x) {
  sin(x)
}

## Sums trapezoids under curve
##'
##' @title Sum trapezoids
##' @param f function to integrate
##' @param a lower bound
##' @param b upper bound
##' @param n number of trapezoids
trapezoid <- function(f, a, b, n) {
  h = (b - a) / n
  xj = seq(a, b, length.out = n+1)
  fj = f(xj)
  int_trapezoid = h * sum(fj) - 0.5*h*(fj[1] + fj[length(fj)])
  return ( abs(int_trapezoid) )
}

## Wrapper for trapezoid function
## Estimates integral with trapezoid() via quadrature,
##   using the builtin integrate function to calculate the 'real' value.
##' @title Estimate integral
##' @param f function to integrate
##' @param a lower bound
##' @param b upper bound
##' @param n number of trapezoids
##' @return estimate, actual value, and error of estimate
quadrature <- function(f, a, b, n) {
  actual <- integrate(f, a, b)$value
  est <- trapezoid(f, a, b, n)
  error <- abs(est - actual)
  structure(list("f"=f, "a"=a, "b"=b, "n"=n,
    "estimate" = est, "actual" = actual, "error" = error),
    class="quad")
}

## Plot trapezoids and the function they estimate
## this method operates on class "quad"
plot.quad <- function(q, main=NULL, ...) {
  xs <- seq(q$a, q$b, length.out = q$n+1)
  ys <- q$f(xs)
  if (is.null(main))
    main <- sprintf("Quadrature for\n%s", paste(deparse(q$f), collapse=''))
  curve(q$f(x), from = q$a-0.5, to = q$b+0.5, ylab=deparse(q$f), main=main)
  abline(h = 0, lty = 2)

  ## Fill in polygons
  for (i in (seq_along(xs) + 1))
    polygon(c(xs[i-1],xs[i],xs[i],xs[i-1]),
      c(ys[i-1],ys[i],0,0), col = "salmon", lty = 3, ...)

  legend("topleft", legend = c(
    paste("Estimate =", round(q$estimate, 3)), 
    paste("Actual =", round(q$actual, 3)), 
    paste("Error =", round(q$error, 3))))
}

################################################################################
##
##                               Shiny Server
##
################################################################################
require(shiny)
shinyServer(
  function(input, output) {
    output$quadrature <- renderPlot({

      f <- function(x) eval(parse(text = input$f)) # text to function
      a <- input$a                                 # lower bound
      b <- input$b                                 # upper bound
      n <- input$n                                 # num trapezoids
      q <- quadrature(f, a, b, n)
      plot(q, main=parse(text=input$f))
    })
  }
)
