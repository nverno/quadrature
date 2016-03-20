library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Estimating Integrals by Quadrature"),
    sidebarPanel(
      h3('Purpose and Use'),
      p("This app will estimate integrals by summing the area of trapezoids (a method known as quadrature).  It takes as input the number of trapezoids to use, the bounds for the integral, and a function for which to estimate the integral.  The function must be entered as a valid R expression containing only the variable 'x'.  The output will plot the function, the trapezoids estimating the integral, and provide the estimate by quadrature, the actual value computed by the R function 'integrate', and the error of the estimate."),

      h4('_______'),
      h3('Inputs'),
      sliderInput('n', 'Number of trapezoids', value = 20,
        min = 1, max = 200, step = 1,),
      numericInput('a', 'Lower bound for integral', value = 0, step=1),
      numericInput('b', 'Upper bound for integral', value = 20, step=1),
      textInput('f',
        'Function to integrate (must be a valid R expression with "x" as variable)',
        value = "0.5*cos(x) + 20*sin(x) + x^1.5")
    ),

    mainPanel(
      plotOutput('quadrature')
    )
  )
)





