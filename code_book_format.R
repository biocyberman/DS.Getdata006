#' Write codebook template.
#' 
#' @param df a dataframe with column names to translate into codebook.
#' @param out.file a character vector to be used as output file path
#' @param rm.exist a logical value. TRUE means remove existing output file.
#' 
write.CodeBook.Template <- function(df = data.frame(), out.file = NULL, rm.exist = TRUE ) {
  if (file.exists(out.file) && rm.exist) { unlink(out.file) }
  df <- as.data.frame(df)
  fconn <- file(out.file, open = "at")
  writeLines("My Fanastic CodeBook\n=====\n", fconn)
  for (v in names(df)) {
    writeLines(paste0(v, "\n-----\n"), fconn)
    
    col.values <- df[,v]
        
    dtype <- class(col.values)
    width <- max(nchar(as.character(col.values)))
    writeLines(sprintf("\tData Type: %s\n\tData Width: %s", dtype, width), fconn)
    if (dtype == "numeric") {
      s <- summary(col.values)
      writeLines("\tSummary:", fconn)
      writeLines(paste(c("\t", names(s)), collapse="\t"), fconn)
      writeLines(paste(c("\t", unname(s)), collapse="\t"), fconn)
    } else if (dtype == "factor") {
      writeLines("\tFirst 6 levels:", fconn)
      writeLines(paste(c("\t", head(levels(col.values))), collapse="\t"), fconn)
    } else if(dtype == "character") {
      writeLines("\tFirst 6 items:", fconn)
      writeLines(paste(c("\t", head(col.values)), collapse="\t"), fconn)
    }
    writeLines("", fconn)
    #writeLines("\tMeaning: <your expalantion here>\n", fconn)
    
  }
  close(fconn)
}

#' Write Codebook, but simpler output.
#' 
write.CodeBook <- function(df = data.frame(), out.file = NULL, rm.exist = TRUE ) {
  if (file.exists(out.file) && rm.exist) { unlink(out.file) }
  fconn <- file(out.file, open = "at")
  writeLines("My Fanastic CodeBook\n=====\n", fconn)
  for (v in names(df)) {
    col.values <- df[,v]
    dtype <- class(col.values)
    width <- max(nchar(as.character(col.values)))
    writeLines(sprintf("\tData Type: %s\n\tData Width: %s", dtype, width), fconn)
    writeLines("\tMeaning: <your expalantion here>\n", fconn) 
  }
  close(fconn)
}

mfile <- "./test_CodeBook.md"
write.CodeBook.Template(dt.out, out.file=mfile, rm.exist= TRUE)
