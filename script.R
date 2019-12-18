# Select dataset

dataset = read.csv('FRvideos_processed.csv', encoding="UTF-8")

# Information

#View(dataset)
#str(dataset)
summary(dataset$time_before_trending)

# Add column

#dataset$trending_date = as.Date(dataset$trending_date, format = '%y.%d.%m')
#dataset$publish_time = as.Date(dataset$publish_time, format = '%Y-%m-%d')

#dataset = transform(dataset, time_before_trending = trending_date - publish_time)

#write.csv(dataset, file = "FRvideos_processed.csv")

#View(dataset)

#Required Packages
library(tm)
#library(SnowballC)
library(wordcloud)
#library(e1071)
#library(gmodels)

# TITRE

corpus = VCorpus(VectorSource(dataset$title))
as.character(corpus[[1]])
lapply(corpus[2:4], as.character)
corpus_clean = tm_map(corpus, content_transformer(tolower))
as.character(corpus[[1]])
as.character(corpus_clean[[1]])
corpus_clean = tm_map(corpus_clean, removeNumbers)
corpus_clean = tm_map(corpus_clean, removeWords, stopwords(kind = "french"))
corpus_clean = tm_map(corpus_clean, removePunctuation)
ms_corpus_clean = tm_map(corpus_clean, stemDocument)
corpus_clean = tm_map(corpus_clean, stripWhitespace)
inspect(corpus_clean[1:2])
lapply(corpus[1:4], as.character)

wordcloud(corpus_clean, min.freq=50, random.order = FALSE)

# DESCRIPTION

corpus = VCorpus(VectorSource(dataset$description))
as.character(corpus[[1]])
lapply(corpus[2:4], as.character)
corpus_clean = tm_map(corpus, content_transformer(tolower))
as.character(corpus[[1]])
as.character(corpus_clean[[1]])
corpus_clean = tm_map(corpus_clean, removeNumbers)
corpus_clean = tm_map(corpus_clean, removeWords, stopwords(kind = "french"))
corpus_clean = tm_map(corpus_clean, removeWords, stopwords(kind = "en"))
corpus_clean = tm_map(corpus_clean, removePunctuation)
ms_corpus_clean = tm_map(corpus_clean, stemDocument)
corpus_clean = tm_map(corpus_clean, stripWhitespace)
inspect(corpus_clean[1:2])
lapply(corpus[1:4], as.character)

wordcloud(corpus_clean, min.freq=50, random.order = FALSE)