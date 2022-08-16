# Sergio Alías, 20220812
# Last modified 20220816

library(optparse)


## Command line arguments

option_list <- list(
  make_option(c("-r", "--rows"), type = "integer", default = 20,
              help="Number of rows"),
  make_option(c("-c", "--cols"), type = "integer", default = 10,
              help="Number of columns"),
  make_option(c("-o", "--output"), type = "character", default = "demodata",
              help="Output filename prefix"),
  make_option(c("-f", "--format_csv"), action = "store_true", default = FALSE,
              help="Use it whether you wish csv output (default is tsv)")
)

opt <- parse_args(OptionParser(option_list = option_list))


## Main code

if(opt$format_csv){
  ext <- ".csv"
  s <- ","
}else{
  ext <- ".tsv"
  s <- "\t"
}

rows <- opt$rows
cols <- opt$cols
m <- round(matrix(runif(rows*cols), ncol = cols), 4)

write.table(m, 
            file = paste0(opt$output, "_", opt$rows, "r_", opt$cols, "c", ext), 
            row.names = FALSE, 
            col.names = FALSE, 
            sep = s
 )
