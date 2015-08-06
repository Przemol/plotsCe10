require(seqplots)
devtools::load_all("/Users/przemol/code/seqplotsR")
setwd('/Volumes/raid0/_SeqPlots_paper/SubPlotsCelegans')
source('fn_plotTopBar.R')
plotTopBar <- plotTopBar


tracks <- dir('tracks', pattern = 'bw', full.names = TRUE)
features <- dir('features', pattern = 'bed', full.names = TRUE)

##### Top figures #############
m <- getPlotSetArray(
    tracks = tracks,
    features = features,
    refgenome = 'ce10',
    bin = 10L, xmin = 1000L, xmax = 1000L
)

pdf('a2.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r')
plotAverage(
    m[5,c(3,2,1)], labels = c('H3K4me3', 'H3K36me3', 'H2A.Z'), 
    legend_pos = 'topleft', legend_ext = TRUE, legend_ext_pos = 'topright',
    cex.legend = 18, cex.main = 36, cex.lab = 28, cex.axis = 22,
    main = "Top expression quintile", xlab = "TSS", ylab = "Z-scored ChIP signal"
)
dev.off()


pdf('b2.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r')
plotAverage(
    m[c(5,2,4,3,1),3], labels = c("TSS_top_20%", "TSS_second_20%", "TSS_third_20%", "TSS_fourth_20%", "TSS_bottom_20%"), 
    legend_pos = 'topleft', legend_ext = TRUE, legend_ext_pos = 'topright',
    cex.legend = 17, cex.main = 36, cex.lab = 28, cex.axis = 22,
    main = "H3K4me3 ChIP-seq signal", xlab = "TSS", ylab = "Z-scored ChIP signal"
)
dev.off()

##### Bottom figures C and d  #############
ms <- MotifSetup()
ms$addBigWig(tracks[2])$addBigWig(tracks[3])$addBigWig(tracks[1])
ms$addMotif('CG', revcomp = FALSE, name = "CpG")

M <- getPlotSetArray(
    tracks = ms,
    features = 'test.bed',
    refgenome = 'ce10',
    bin = 10L, xmin = 1000L, xmax = 1500L
)
plotTopBar(M, 'c.pdf')

pdf('d.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r')
plotHeatmap(
    M, raster = TRUE, include = c(F,F,F,T), sortrows = '', 
    clusters = 0,  labels = c('H3K4me3', 'H3K36me3', 'H2A.Z', 'CpG'), 
    cex.legend = 18, cex.main = 36, cex.lab = 28, cex.axis = 22, 
    colvec = list(NA, NA, NA, c('white', '#66ccff', '#000066')),
    o_min = c(-1, -2, -1, 0),
    o_max = c(3, 8, 4, 16)
)
dev.off()

pdf('d_bw.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r')
plotHeatmap(
    M, raster = TRUE, include = c(1,0,0,0), sortrows = 'decreasing', 
    clusters = 3,  labels = c('H3K4me3', 'H3K36me3', 'H2A.Z', 'CpG'), 
    cex.legend = 18, cex.main = 36, cex.lab = 28, cex.axis = 22, 
    colvec = list(NA, NA, NA, c('white', 'darkgreen', 'darkgreen')),
    o_min = c(-1, -2, -1, 8),
    o_max = c(3, 8, 4, 16)
)
dev.off()

##### Bottom figures D and F  #############
flt <- '/Users/przemol/Documents/_SeqPlots_paper/SubPlots/Cluster2.bed'
MF <- getPlotSetArray(
    tracks = ms,
    features = flt,
    refgenome = 'ce10',
    bin = 10L, xmin = 1000L, xmax = 1500L
)
plotTopBar(MF, 'e.pdf')

 
pdf(
    'f.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r'
)
plotHeatmap(
    MF, raster = TRUE, include = c(F,T,T,F), sortrows = 'decreasing',
    clstmethod = 'ssom', ssomt1 = 2, ssomt2 = 2,
    clusters = 3,  labels = c('H3K4me3', 'H3K36me3', 'H2A.Z', 'CpG'),
    cex.legend = 18, cex.main = 36, cex.lab = 28, cex.axis = 22,
    #clspace = c('darkblue', 'white', 'darkred'),
    #colvec = list(NA, NA, NA, 'black'),
    colvec = list(NA, NA, NA, c('blue', 'white', 'red')),
    #clspace = c('white', 'grey', 'black'),
    o_min = c(NA, NA, NA, 4),
    o_max = c(NA, NA, NA, 16)
)
dev.off()

pdf(
    'f_bw.pdf', width = 100.0, height = 100.0, onefile = FALSE, paper = 'a4r'
)
plotHeatmap(
    MF, raster = TRUE, include = c(F,T,T,T), sortrows = 'decreasing',
    clstmethod = 'ssom', ssomt1 = 2, ssomt2 = 2,
    clusters = 3,  labels = c('H3K4me3', 'H3K36me3', 'H2A.Z', 'CpG'),
    cex.legend = 18, cex.main = 36, cex.lab = 28, cex.axis = 22,
    #clspace = c('darkblue', 'white', 'darkred'),
    colvec = list(NA, NA, NA, c('white', 'darkgreen', 'darkgreen')),
    #clspace = c('white', 'grey', 'black'),
    o_min = c(-1, -2, -1, 8),
    o_max = c(3, 8, 4, 16)
)
dev.off()




