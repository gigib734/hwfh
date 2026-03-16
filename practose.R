vector1 = c(1,3,5,7,9,12,15)
vector1[1]
vector1[2]
barplot(vector1, vector1>2)
main = "eruk"
xlab = "bar left to right"
ylab = "height of bars"
col = "red"
library(RColorBrewer)
coul <- brewer.pal(5,"Set2")
barplot(col=coul)
barplot(height=vector1>2, vector1, names=vector1, col=coul )
barplot(vector1, vector1>2)
barplot(vector1>2, vector1, names=vector1, col=coul )
graph = barplot(vector1, vector1>2)
grape <- barplot(vector1, vector1>2)
grape (col=coul)
barplot(height=vector1, col=coul)
  names = c("A", "C", "B", "U")
barplot(height = vector1,
        names.arg = c("A","B","C","D","E", "F", "G"),
        col = coul)
  hi sisiyh56