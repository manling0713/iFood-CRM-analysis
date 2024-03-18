
##R code for performing stepwise regression##
ifood <- read.csv("/Users/chaomanling/Desktop/MSBA/Summer/Data Management and SQL/ifood_df.csv", header=T)
head(ifood)

###Total number of purchase #R=0.7833
ifood$sum_purchase <- ifood$NumStorePurchases + ifood$NumWebPurchases + ifood$NumCatalogPurchases
x4 <- colnames(ifood[, -c(12:14, 16:20, 39, 40)])
formula_str4 <- paste("sum_purchase~", paste(x4, collapse = " + "))
TotalPurchase <- lm(formula_str4, data = ifood)
final_TotalPurchase <- step(TotalPurchase, direction = "both")
summary(final_TotalPurchase)

#residula plot
res <- resid(final_TotalPurchase)
plot(fitted(final_TotalPurchase), res)
abline(0,0)

#create Q-Q plot for residuals
qqnorm(res)
#add a straight diagonal line to the plot
qqline(res) 





#predict number of store purchase #R=0.5997
x1 <- colnames(ifood[, -c(12:14, 16:20, 39,40)])
formula_str1 <- paste("NumStorePurchases~", paste(x1, collapse = " + "))
StorePurchase <- lm(formula_str1, data = ifood)
final_StorePurchase <- step(StorePurchase, direction = "both")
summary(final_StorePurchase)

#predict number of web purchase #R=0.5032
x2 <- colnames(ifood[, -c(12:14, 16:20, 39, 40)])
formula_str2 <- paste("NumWebPurchases~", paste(x2, collapse = " + "))
WebPurchase <- lm(formula_str2, data = ifood)
final_WebPurchase <- step(WebPurchase, direction = "both")
summary(final_WebPurchase)

###predict number of catalog purchase #R=0.6791
x3 <- colnames(ifood[, -c(12:14, 16:20, 39, 40)])
formula_str3 <- paste("NumCatalogPurchases~", paste(x3, collapse = " + "))
CataPurchase <- lm(formula_str3, data = ifood)
final_CataPurchase <- step(CataPurchase, direction = "both")
summary(final_CataPurchase)


###Total number of purchase #R=0.7833
ifood$sum_purchase <- ifood$NumStorePurchases + ifood$NumWebPurchases + ifood$NumCatalogPurchases
x4 <- colnames(ifood[, -c(12:14, 16:20, 39, 40)])
formula_str4 <- paste("sum_purchase~", paste(x4, collapse = " + "))
TotalPurchase <- lm(formula_str4, data = ifood)
final_TotalPurchase <- step(TotalPurchase, direction = "both")
summary(final_TotalPurchase)

#residula plot
res <- resid(final_TotalPurchase)
plot(fitted(final_TotalPurchase), res)
abline(0,0)

#create Q-Q plot for residuals
qqnorm(res)
#add a straight diagonal line to the plot
qqline(res) 

##Total spent amount #R:81.99
y <- colnames(ifood[, -c(5:10, 16:20, 37:40)])
formula_stry <- paste("MntTotal~", paste(y, collapse = " + "))
TotalAmount<- lm(formula_stry, data = ifood)
final_TotalAmount <- step(TotalAmount, direction = "both")
warnings()
summary(final_TotalAmount)

#residula plot
res1 <- resid(final_TotalAmount)
plot(fitted(final_TotalAmount), res1)
abline(0,0)

#create Q-Q plot for residuals
qqnorm(res1)
#add a straight diagonal line to the plot
qqline(res1) 
