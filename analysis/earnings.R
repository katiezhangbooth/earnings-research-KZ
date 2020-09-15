#### Task 01 ####
earnings <- read.csv("https://raw.githubusercontent.com/avehtari/ROS-Examples/master/Earnings/data/earnings.csv")

fitted.model <- lm(earnings$earn ~ earnings$height)
summary(fitted.model)

#### Task 02 ####
## Output to .txt file
sink("output/earnings_output.txt", append = FALSE)
print(Sys.time(), quote = FALSE)
print(summary(fitted.model))
sink()

## Visualise data
png(file = "output/scatter_earnings_height.png")
plot(x = earnings$height, y = earnings$earn,
     main = "Scatter of earnings against height",
     xlab = "Height (in)", ylab = "Earnings ($)"
)
abline(lm(earnings$earn ~ earnings$height), col="red")
dev.off()

## Repeat, but with earnings in 1000s
# Re-run regression
fitted.model.k <- lm(earnings$earnk ~ earnings$height)
sink("output/earnings_output_k.txt", append = FALSE)
print(Sys.time(), quote = FALSE)
print(summary(fitted.model.k))
sink()

## Visualise data
png(file = "output/scatter_earnings_height_k.png")
plot(x = earnings$height, y = earnings$earnk,
     main = "Scatter of earnings against height",
     xlab = "Height (in)", ylab = "Earnings ($000s)"
)
abline(lm(earnings$earnk ~ earnings$height), col="red")
dev.off()

#### Task 03 ####
## Modify regression to include male
fitted.model.male <- lm(earnings$earnk ~ earnings$height + earnings$male)
sink("output/earnings_output_male.txt", append = FALSE)
print(Sys.time(), quote = FALSE)
print(summary(fitted.model.male))
sink()

## Modify regression to include interaction
fitted.model.interaction <- lm(earnings$earnk ~ earnings$male * earnings$height)
sink("output/earnings_output_interaction.txt", append = FALSE)
print(Sys.time(), quote = FALSE)
print(summary(fitted.model.interaction))
sink()