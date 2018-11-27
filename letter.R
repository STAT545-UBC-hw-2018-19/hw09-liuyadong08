library(stringr)
words <- readLines("data/words.txt")
initial_letter <- str_sub(words, 1, 1) %>% tolower()
ending_letter <- str_sub(words, -1, -1) %>% tolower()
myletters <- letters[1:26]
distance <- abs(match(initial_letter, myletters) - match(ending_letter, myletters))
dat_count <- data.frame("same_different"=c("same", "different"), "value" = c(sum(distance==0), sum(distance != 0)))
dat_dist <- table(distance)
dir.create("src")
write.table(dat_count, "src/same_count.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)
write.table(dat_dist, "src/distance.tsv",
						sep = "\t", row.names = FALSE, quote = FALSE)