install.packages("tidytext")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("tm")
install.packages("SnowballC")
install.packages("stopwords")

library(tidytext)
library(dplyr)
library(ggplot2)
library(wordcloud)
library(tm)
library(SnowballC)
library(stopwords)

tweets <- read.csv("C:/Users/prana/OneDrive/Documents/PDS/Corona_NLP_test.csv")
#a. Convert the text data into tokens
tokens <- tweets %>% 
  unnest_tokens(word, OriginalTweet
                )
#b. Remove stop words
tokens_sw_removed <- tokens %>%
  anti_join(stop_words)

# C.Count word frequencies
word_freq <- tokens_sw_removed %>%
  count(word, sort = TRUE)

#d. Create word cloud
set.seed(1234)
wordcloud(words = word_freq$word, freq = word_freq$n, max.words = 3000, random.order =FALSE, colors = brewer.pal(8,"Dark2"))

