---
title       : Quadrature Shiny App
subtitle    : Coursera Developing Data Products class
author      : NVP
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : standalone # {standalone, draft}
knit        : slidify::knit2slides
---

## Purpose

The purpose of this app is to provide an interactive environment to both estimate the integral of functions and to visualize the process to help see what is going on.  Estimates of the integrals are computed by a method known as quadrature.

The app is deployed at http://nverno.shinyapps.io/quadrature/.

--- .class #id

## Quadrature

Quadrature is a simple way to estimate integrals by summing the area of trapezoids under a curve.  This method is quite accurate when using fairly low numbers of trapezoids to estimate the integral.  As functions become more complicated (i.e curvy) more trapezoids will be required to get accurate estimates of the integral.  This app provides a nice visualization of this process.

## Quadrature equation
$$ h\sum_{j=0}^{n-1} f(x_j) - \frac{h}{2} ( f(a) + f(b) )$$
where $h$ is the width of each trapezoid, $n$ is the number of trapezoids, $a$ and $b$ are the lower and upper bounds of the integral, and $f$ is the function being integrated.

--- .class #id 

## Example


On the next slide we will look at an example of estimating the following integral with different numbers of trapezoids.  

$$\int_0^{20} {0.5\cos x + 20\sin x + x^{1.5}}$$

In the first case, an estimate using 5 trapezoids yields an estimate with an error of 0.0501265.  The second example uses 20 trapezoids and yields an estimate of the integral with an error of 0.0501687.

--- .class #id

## Estimate the integral with different numbers of trapezoids
![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)
