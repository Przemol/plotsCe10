plotTopBar <- function(M, out) {
    pdf(out, 6 * 4, 2 * 4)
    f = 37
    layout(
        matrix(c(1:100), 2, 4, byrow = FALSE), respect = TRUE,
        heights = c(.3, rep(1,5)), widths = c(1)
    )
    pp <- function() {
        par(mgp = c(0, 2.5, 0))
        axis(
            1, at = c(min(M[[1]]$all_ind), 0, max(M[[1]]$all_ind)),
            labels = c('-1kb', 'TSS', '+1.5kb'), cex.axis = f / 12
        )
        par(mgp = c(0, 1, 0))
    }
    plt <- function(p, ylim = NULL, ...) {
        for (i in 1:p$npaires()) {
            plot(
                p[i], ylim = ylim, keepratio = TRUE, legend = FALSE, ln.h = 0,
                cex.axis = f, cex.lab = f, ln.v = TRUE, xlab = '',
                cex.main = .01, panel.first = pp(), xaxt = "n", col = 'black', ...
            )
        }
    }
    
    par(mgp = c(3, 0, 0))
    
    plot.new(); title(xlab = 'H3K36me3', col.main = 'red', cex.lab = 6)
    plt(unlist(M[1,1]), ylim = c(-0.3, 2.5), main = 'H3K36me3')
    
    par(mgp = c(3, 0, 0))
    
    plot.new(); title(xlab = 'H3K4me3', col.main = 'red', cex.lab = 6)
    plt(unlist(M[1,2]), ylim = c(0, 6.5), main = 'H3K4me3')
    
    par(mgp = c(3, 0, 0))
    
    plot.new(); title(xlab = 'H2A.Z', col.main = 'red', cex.lab = 6)
    plt(unlist(M[1,3]), ylim = c(-0.3, 3.5), main = 'H2A.Z')
    
    par(mgp = c(3, 0, 0))
    
    plot.new(); title(xlab = 'CpG', col.main = 'red', cex.lab = 6)
    plt(unlist(M[1,4]), ylim = c(6, 12), main = 'CpG')
    
    dev.off()
    
}



