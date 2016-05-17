library(plotly)
library(quantmod)

# Download some data
getSymbols(Symbols = c("AAPL", "MSFT"))
ds <- data.frame(Date = index(AAPL), AAPL[,6], MSFT[,6])

# Graph
plot_ly(ds, x = Date, y = AAPL.Adjusted, mode = "lines + markers", name = "Apple") %>% 
  add_trace(x = Date, y = MSFT.Adjusted, name = "Microsoft") %>% 
  layout(
    title = "Stock Prices",
    xaxis = list(
      rangeselector = list(
        buttons = list(
          list(
            count = 3, 
            label = "3 mo", 
            step = "month",
            stepmode = "backward"),
          list(
            count = 6, 
            label = "6 mo", 
            step = "month",
            stepmode = "backward"),
          list(
            count = 1, 
            label = "1 yr", 
            step = "year",
            stepmode = "backward"),
          list(
            count = 1, 
            label = "YTD", 
            step = "year",
            stepmode = "todate"),
          list(step = "all"))),

      rangeslider = list(type = "date")),

    yaxis = list(title = "Price"))