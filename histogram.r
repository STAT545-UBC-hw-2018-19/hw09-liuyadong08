words <- readLines("words.txt")
Length <- nchar(words)
hist_dat <- table(Length)
write.table(hist_dat, "src/histogram.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)
