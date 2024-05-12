meniscus <- read.table ("http://mkahn.webspace.wheatoncollege.edu/math151/Datasets/meniscus-repair.txt", 
                        header = T)

load_failure <- c(97.3, 106.4, 118.2, 99.7, 106.5,84.2, 44.9, 46.1, 59.3, 35.5, 50.7, 56.8, 88.0, 119.8,65.8, 82.9, 
                  149.9, 117.1)
displaced <- c(16.9, 20.2, 20.1, 15.7, 13.9, 14.9,7.9, 12.5, 15.5, 10.2,  8.9, 13.3, 18.0, 18.5,  9.2, 18.8, 22.8, 17.5)
stiff  <- c(8.3, 7.2, 6.3, 7.3, 8.7, 8.7, 4.7, 6.1, 5.0, 5.8, 6.6, 8.4, 8.0, 8.3, 7.6, 6.4, 8.2, 7.7)

method <- c(load_failure, displaced, stiff)
Outcome <- rep(c("Load At Failure","Displacement","Stiffness"),c(18,18,18))

totalMethod <- c(method , method)
totalMeasure <- c(Outcome, rep("ZTotal",54))

boxplot(method ~ Outcome, ylab="Measurement")

boxplot(totalMethod ~ totalMeasure,
        names=c("Load At Failure","Displacement","Stiffness", "Total"),
        ylab="Measurement", xlab = "Outcome")

meniscusAOV.aov <- aov(method ~ Outcome)
summary(meniscusAOV.aov)

TukeyHSD(meniscusAOV.aov)
