# Jessica Embury
# Lab 2
# Wordcloud from Endangered Species Article

#set dir
setwd("C:/Users/jesse/GitProjects/GEOG594-Embury/594-lab02")

#these are the libraries used in the Word Cloud Tasks
library(twitteR)
library(tm)
library(wordcloud)
library(RColorBrewer)
library(NLP)

#Put your text files inside the temp folder(wordcloud) under working directory(D:\webexercise-2)
#Text Sources:
#https://awionline.org/content/endangered-species
#https://www.nationalgeographic.org/encyclopedia/endangered-species/
#https://blogs.scientificamerican.com/extinction-countdown/the-biggest-issues-for-wildlife-and-endangered-species-in-2019/
my_corpus = Corpus(DirSource("data/wordcloud2"))

#You can add or remove STOPWORDS in the list
tdm = TermDocumentMatrix(my_corpus,
control = list(removePunctuation = TRUE,
stopwords = c("species", "endangered", "population", stopwords("english")),
removeNumbers = TRUE, tolower = TRUE))

# define tdm as matrix
m = as.matrix(tdm)

# get word counts in decreasing order
word_freqs = sort(rowSums(m), decreasing=TRUE)

# create a data frame with words and their frequencies
dm = data.frame(word=names(word_freqs), freq=word_freqs)

# plot wordcloud in R
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0, colors=brewer.pal(8, "Dark2"))

# save the image in png format and a PNG image will be created in the Working Directory
png("output/WordCloud2.png", width=12, height=8, units="in", res=300)
wordcloud(dm$word, dm$freq, random.order=FALSE, random.color=FALSE, rot.per= 0, colors=brewer.pal(8, "Dark2"))

# dev.off will save the output PNG file into the working folder
dev.off()