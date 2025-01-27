## Load the tidyverse package
library(tidyverse)

## Read in the data from the web
dat <- read_csv("https://raw.githubusercontent.com/rdpeng/stat322E_public/main/data/maacs.csv")

####


## Summarize the dataset
glimpse(dat)


## Print out the first few rows of the dataset
dat

## Print out the last few rows of the dataset
dat |> 
    tail(10)

## Sample a random 10 rows from the dataset
dat |> 
        sample_n(10)


## Summarize variables
dat |> 
    summary()


################################################################################
## Draw a blank canvas
dat |> 
        ggplot()


## Set the frame of the plot using the eno variable but don't plot any data
## (need to add a geom)
dat |> 
        ggplot(aes(x = eno))



## Histogram of eno variable
dat |> 
        ggplot(aes(x = eno)) + 
        geom_histogram(bins = 10) 
        

## Increase the number of bins to see what difference it makes
dat |> 
        ggplot(aes(x = eno)) + 
        geom_histogram(bins = 15)


## Make a histogram of pm25
dat |> 
        ggplot(aes(x = pm25)) +
        geom_histogram(bins = 20)


## Histogram colored purple (fill = "purple")
dat |> 
        ggplot(aes(x = eno)) + 
        geom_histogram(fill = "purple", bins = 15)


## Check allergic status variable
dat |> 
    count(mopos)


## Scatterplot of pm25 and eno
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point()


## Scatterplot of pm25 and eno with all points colored red
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point(color = "red")


## Scatterplot of pm25 and eno with points colored by mouse allergic status
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point(aes(color = mopos))


## Increase the point size, adjust alpha
dat |> 
        ggplot(aes(x = pm25, y = eno)) +
        geom_point(aes(color = mopos), size = 3, alpha = 1/2)



## Check the mean of eno by mouse allergic status
dat |> 
    group_by(mopos) |> 
    summarize(eno_mean = mean(eno, na.rm = TRUE))


## Histogram of eno colored by mouse allergic status
dat |> 
    ggplot(aes(x = eno)) + 
    geom_histogram(aes(fill = mopos), 
                   bins = 15)


## Make separate scatterplots for mouse allergic status
dat |> 
        ggplot(aes(x = pm25, y = eno)) +
        geom_point() + 
        facet_wrap(vars(mopos))


## Add a x-axis label, y-axis label, and overall plot title, adjust theme
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point() +
        facet_wrap(vars(mopos)) +
        labs(x = "PM2.5") +
        labs(y = "Exhaled nitric oxide") +
        labs(title = "Exhaled Nitric Oxide and PM2.5 by Mouse Allergic Status")


## Adjust the theme style
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point() +
        facet_wrap(vars(mopos)) +
        labs(x = "PM2.5") +
        labs(y = "Exhaled nitric oxide") +
        labs(title = "Exhaled Nitric Oxide and PM2.5 by Mouse Allergic Status") +
        theme_bw()


## Adjust the size of the circle by the amount of bed mouse allergen
dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point(aes(size = duBedMusM), alpha = 1/4) +
        facet_wrap(vars(mopos)) +
        labs(x = "PM2.5") +
        labs(y = "Exhaled nitric oxide") +
        labs(title = "Exhaled Nitric Oxide and PM2.5 by Mouse Allergic Status")


## Save the previous plot to a separate R object
g <- dat |> 
        ggplot(aes(x = pm25, y = eno)) + 
        geom_point(aes(size = duBedMusM), alpha = 1/4) +
        facet_wrap(vars(mopos)) +
        labs(x = "PM2.5") +
        labs(y = "Exhaled nitric oxide") +
        labs(title = "Exhaled Nitric Oxide and PM2.5 by Mouse Allergic Status")

## Make a different plot
dat |> 
        ggplot(aes(x = mopos, y = duBedMusM)) + 
        geom_boxplot()

## Show the previous plot
g

