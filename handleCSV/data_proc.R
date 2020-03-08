# dealing with the output datas
library(ggplot2)
library(tidyr)

res =read.csv('data/result.csv',header = FALSE)
names(res) = apply(matrix(1:20), 1, function(i)sprintf("V%02d",i))
bres = cbind(iter = 1:5000, res)
gres=  gather(bres, key="variable", value="v", -iter)

colors <- colorRampPalette(c("orange", "red", "black", "green", "blue"))(20)
colors <- colorRampPalette(c("#FF9D05", "#E80536", "#3512FF", "#0CF0DA", "#2C8E3F"))(20)
ggplot() + geom_line(data = gres, aes(x = iter, y = v, color = variable), size = 0.5) +
  scale_color_manual(values = colors) +
  xlab("iter") +
  ylab("norm")
