---
  title: "R Notebook"
#simple sentiment analysis 
#source:https://www.tidytextmining.com/preface.html


#text to be analysed

text <- c(" The wind blows ",
          "I breathe deeply",
          "I close my eyes so tight",
          "I can barely see light ",
          "It feels as if I float in thin air ",
          "It's relaxing, it's refreshing",
          "It's peace, it's nature",
          "It's as if I can fly" ,
          "And never die")

#Source: https://www.familyfriendpoems.com/poem/relaxation

text

library(dplyr)
text_df <- tibble(line  = 1:9, text = text)

#tibble changes the text into a more parsable table format

text_df


library(tidytext)

tokenised <- text_df %>%
  unnest_tokens(word, text)

#splits sentences into words, "tokenization". word is the column header whilst text is the column from text_df that weve passed through %>% 

tokenised

data(stop_words)
#Dataset with stop words eg the 

tokenised <- tokenised %>% 
  anti_join(stop_words)

#anti_join function is used to compare tables and returns no common values

tokenised 


sentiments

get_sentiments("nrc")


feelings <- tokenised %>% 
  inner_join( get_sentiments("nrc")) %>%
  count(word, sort = TRUE)

feelings


library(wordcloud2)
wordcloud2(feelings)
