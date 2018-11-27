all: report_yd.html

clean:
	rm -f data/words.txt src/histogram.tsv output/histogram.png report.md report.html src/distance.tsv src/same_count.tsv output/barplot.png output/distance.png report_yd.md report_yd.pdf

report.html: report.Rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'
	
report_yd.html: report_yd.Rmd distance.tsv same_count.tsv barplot.png distance.png
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("src/$<")); ggsave("output/$@")'
	rm Rplots.pdf

barplot.png: same_count.tsv
	Rscript -e 'library(ggplot2); dir.create("output"); ggplot(data=read.delim("src/$<"), aes(same_different, value)) + geom_bar(stat = "identity"); ggsave("output/$@")'
	rm Rplots.pdf
	
distance.png: distance.tsv
	Rscript -e 'library(ggplot2); qplot(distance, Freq, data=read.delim("src/$<")); ggsave("output/$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<
	
distance.tsv: letter.r words.txt
	Rscript $<
	
same_count.tsv: letter.r words.txt
	Rscript $<

words.txt:
	Rscript -e 'dir.create("data"); download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "data/words.txt", quiet = TRUE)'

# words.txt:
#	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
