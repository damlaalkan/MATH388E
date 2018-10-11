
getwd()
setwd("C:/Users/Damla/Desktop/math388/homeworks")

cat(Sys.info(),file="../other/hw2-info")

install.packages("RUnit")
library("RUnit")


xs <- rnorm(2500, mean=1, sd=0.5)

checkEquals(length(xs),2500)
checkTrue(ks.test(xs,rnorm(1000,mean=1.0,sd=0.5))$statistic < 0.05)

mean(xs)
sd(xs)
Explanation:

rnorm here generates 2500 numbers from a normal with mean 1 and standart deviation 0.5, this values is for a standart normal distribution."Random" means these values have been taken from distribution randomly. We know from statistics that for a variable with the standard normal distribution, 68% of the observations fall between -1 and 1 (within 1 standard deviation of the mean of 0). No naturally measured variable has this distribution. However, all other normal distributions are equivalent to this distribution when the unit of measurement is changed to measure standard deviations from the mean.

If you make the data set bigger, more than 2500, it will be closer to 1 and 0.5 by law of large theorem. When I tried 9000 as size it was even a little more than 1 for mean and around size 8000, mean and sd were the closest to 1 and 0.5.
ys <- runif(5000, -1, 1)

checkEquals(length(ys),5000)
checkTrue(ks.test(ys,runif(1000,min=-1.0,max=1.0))$statistic < 0.05)

png(file="../images/HW2-task3.png")
par(mfrow=c(2,1))

hist(xs,20)
hist(ys,20)

dev.off()
checkTrue(file.exists("../images/HW2-task3.png"))
Explanation

rnorm(n, mean = 1 , sd = 0.5) is used to generate n normal random numbers with arguments mean and sd; while runif(n, min = , max = ) is used to generate n uniform random numbers lie in the interval (min, max).

rnorm gives the normal distribution. It is a bell-shaped distribution, and it shows up everywhere in nature and probability.
This bell-shape always stays the same, and it is sometimes called the Normal curve. However, there are two parameters that decide where the curve is centered and how wide and short versus thin and tall the curve is. The mean parameterspecifies the center of the distribution, and the sd parameter controls how wide the curve is.

runif gives the uniform distribution. It represents the continuos distribution where every value between min and max is equally likely.


result <- c("head","tails")
theta <- 0.80 
N <- 100 # flip a coin 20 times

result <- sample(result, 
                size = N, 
                replace = TRUE, 
                prob = c(theta, 1 - theta))

table(result)

library(magrittr)
data(mtcars)
subcollection <- mtcars %>% dplyr::filter(cyl <= 4)

checkEquals(subcollection$cyl,rep(4,11))

library(magrittr)
data(mtcars)
mean.mpg <- mtcars %>% dplyr::filter(cyl <= 4)%>%dplyr::summarize(mean(mpg)) %>% as.numeric

checkEqualsNumeric(mean.mpg, 26.66, tolerance = 0.001)

res <- aggregate(mpg ~ cyl, data = mtcars, FUN = mean, na.rm = TRUE)

checkEqualsNumeric(res$mpg,c(26.66,19.74,15.1),tolerance = 0.001)

png(file="../images/hw2-task7a.png")

plot(AirPassengers,ylab='Number of Passengers (in thousands)', xlab='Year')

checkTrue(file.exists("../images/hw2-task7a.png"))

png(file="../images/hw2-task7b.png")

plot(iris$Petal.Length, iris$Petal.Width, main="Edgar Anderson's Iris Data")

dev.off()
checkTrue(file.exists("../images/hw2-task7b.png"))

