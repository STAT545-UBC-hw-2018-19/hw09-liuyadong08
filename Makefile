all: report_yd.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html distance.tsv same_count.tsv barplot.png distance.png

report.html: report.Rmd histogram.tsv histogram.png
	Rscript -e 'rmarkdown::render("$<")'
	
report_yd.html: report_yd.Rmd distance.tsv same_count.tsv barplot.png distance.png
	Rscript -e 'rmarkdown::render("$<")'

histogram.png: histogram.tsv
	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

barplot.png: same_count.tsv
	Rscript -e 'library(ggplot2); ggplot(data=read.delim("$<"), aes(same_different, value)) + geom_bar(stat = "identity"); ggsave("$@")'
	rm Rplots.pdf
	
distance.png: distance.tsv
	Rscript -e 'library(ggplot2); qplot(distance, Freq, data=read.delim("$<")); ggsave("$@")'
	rm Rplots.pdf

histogram.tsv: histogram.r words.txt
	Rscript $<
	
distance.tsv: letter.r words.txt
	Rscript $<
	
same_count.tsv: letter.r words.txt
	Rscript $<

words.txt:
	Rscript -e 'download.file("https://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'

# words.txt:
#	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
