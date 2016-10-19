
png('sep1.png', height = 500, width = 70)
par(mar=c(0,0,0,0))
plot.new()
abline(v = 1, lwd=10);
text(c(.5),c(.5), c('Top expression quintile'), srt = 90, cex=3.7)
dev.off()


png('sep2.png', height = 500, width = 70)
par(mar=c(0,0,0,0))
plot.new()
abline(v = 1, lwd=10);
text(c(.5),c(.5), c('2nd cluster'), srt = 90, cex=3.7)
dev.off()


png('sep3.png', height = 500, width = 70)
oset=0.03
par(mar=c(0,0,0,0))
plot.new()
lines(c(0,0),c(.33+oset, .66+oset), lwd=10)
arrows(0, 0.5+oset, 0.82, 0.5+oset, lwd = 12)
#abline(h = 0.5, lwd=15);

abline(v = 1, lwd=10);
dev.off()

