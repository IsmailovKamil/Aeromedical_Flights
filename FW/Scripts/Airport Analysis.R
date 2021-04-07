library(tidyverse)
library(ggplot2)

setwd("~/OneDrive - George Mason University/GMU/Spring 2021/DAEN_690/FW/Datasets/NEW")

data <- read.csv('FW_airport_analysis.csv')
str(data)

# convert to factor
data$LPV.or.LP = factor(data$LPV.or.LP)
data$DA.OR.MDA = factor(data$DA.OR.MDA)
data$ILS...Arpt..Y.N. = factor(data$ILS...Arpt..Y.N.)
data$ILS.to.Rwy..Y.N. = factor(data$ILS.to.Rwy..Y.N.)

# LPV or LP
data %>% group_by(LPV.or.LP) %>%
        summarise(count = n(),
                  avg_visibility = mean(avg_visibility),
                  max_visibility = max(max_visibility),
                  min_visibility = min(min_visibility),
                  median_visibility = median(median_visibility))

ggplot(data = data, aes(x = avg_visibility, fill = LPV.or.LP)) + 
  geom_histogram(aes(y = ..density..), color = "white", bins = 20) +
  facet_wrap(~ LPV.or.LP, nrow = 2) +
  labs(title = "Visibility Distribution by Status (LPV or LP - Yes/No)",
       x = "miles", y = "Proportion of visibility") + scale_fill_discrete(name = "GPS type")

wilcox.test(avg_visibility ~ LPV.or.LP, data)

# ILS at Airport
data %>% group_by(ILS...Arpt..Y.N.) %>%
  summarise(count = n(),
            avg_visibility = mean(avg_visibility),
            max_visibility = max(max_visibility),
            min_visibility = min(min_visibility),
            median_visibility = median(median_visibility))

ggplot(data = data, aes(x = avg_visibility, fill = ILS...Arpt..Y.N.)) + 
  geom_histogram(aes(y = ..density..), color = "white", bins = 20) +
  facet_wrap(~ ILS...Arpt..Y.N., nrow = 2) +
  labs(title = "Visibility Distribution by Status (ILS at Airport - Yes/No)",
       x = "miles", y = "Proportion of visibility") + scale_fill_discrete(name = "ILS at Airport")
 
wilcox.test(avg_visibility ~ ILS...Arpt..Y.N., data)

# ILS to the runway
data %>% group_by(ILS.to.Rwy..Y.N.) %>%
  summarise(count = n(),
            avg_visibility = mean(avg_visibility),
            max_visibility = max(max_visibility),
            min_visibility = min(min_visibility),
            median_visibility = median(median_visibility))

ggplot(data = data, aes(x = avg_visibility, fill = ILS.to.Rwy..Y.N.)) + 
  geom_histogram(aes(y = ..density..), color = "white", bins = 20) +
  facet_wrap(~ ILS.to.Rwy..Y.N., nrow = 2) +
  labs(title = "Visibility Distribution by Status (ILS to Runway - Yes/No)",
       x = "miles", y = "Proportion of visibility") + scale_fill_discrete(name = "ILS at Airport")

wilcox.test(avg_visibility ~ ILS.to.Rwy..Y.N., data)

model1 = glm(data = data, ILS...Arpt..Y.N. ~ avg_visibility, family = binomial)
summary(model1)

newdata = data.frame(avg_visibility = c(10,5,1))
predict(model1, newdata=newdata, type='response')


model2 = glm(data = data, ILS.to.Rwy..Y.N. ~ avg_visibility, family = binomial)
summary(model2)
predict(model2, newdata=newdata, type='response')
