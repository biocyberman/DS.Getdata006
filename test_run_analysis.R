system.time(eval(source("./run_analysis.R")))
conn <- file("raw/test/X_test.txt")
message("testing readLines...")
system.time({
  h <- readLines(conn)
  h <- do.call(rbind, lapply(h, function(x) unlist(strsplit(x, " |  ")))
  )
  h <- h[, -1]         
}
)
close(conn)
conn <- "raw/test/X_test.txt"
message("testing read.fwf...")
system.time(read.fwf(conn, widths=rep(c(-1, 15), 561), colClasses = "character"))


message("test reading with fread of data.table...")
system.time(
{
  dt <- fread(conn, sep= "\n", header = FALSE, stringsAsFactors=FALSE, colClasses = "character") 
  # fread doesn't handle fixed-width well so read the whole line
  dt <- dt[, strsplit(V1, split =" |  ")]
  dt <-t(dt[-1])
})
conn <- file("raw/test/X_test.txt")
message("testing read.fortran which bases on read.fwf...")
system.time(read.fortran(conn, rep(c("1X", "A15"), 561)))
close(conn)

