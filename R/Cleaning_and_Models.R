#-#LIBRERIE-----
library(textclean)
library(tm)
library(ggplot2)
library(SnowballC)
library(dplyr)
library(caTools)
library(randomForest)
library(scales)
library(caret)
library(gamlss)
library(e1071)#per il naive bayes
library(imbalance)#per il bilanciamento
library(party)

#-#IMPORTO DATASET-----
dta <- read.csv("AIMLEA_R/test_etichettato_R.csv")

#si creano due colonne che andremo a rimuovere 
dta$X <- NULL
dta$...1<- NULL

#creo un subset
text <- dta$text
intention <- dta$intention
df <- data.frame(text, intention)
glimpse(df)#controllo dataset 

tab <- data.frame(table(df$intention))
colnames(tab) <- c("Label","Frequency")
control <- ggplot(tab,aes(x=Label,y=Frequency))+
  geom_bar(stat="identity",width=0.3)+
  geom_text(aes(label=Frequency),colour="white",
            hjust=1.25,size=4.0)+
  coord_flip()
control

#-#PULIZIA-----
df$text <- gsub("#","",df$text)
df$text <- gsub("@","",df$text)
df$text <- gsub("(http|www)\\S+", "",df$text)
df$text <- gsub("(<)\\S+", "",df$text)

tryTolower <- function(x){
  y = NA
  try_error= tryCatch(tolower(x), error=function(e) e)
  if (!inherits(try_error, 'error'))
    y=tolower(x)
  return(y)
}

clean.corpus <- function(corpus){
  corpus <- tm_map(corpus,content_transformer(tryTolower))
  corpus <- tm_map(corpus,removeWords,stopwords("en"))
  corpus <- tm_map(corpus,removePunctuation)
  corpus <- tm_map(corpus,stripWhitespace)
  corpus <- tm_map(corpus,removeNumbers)
  corpus <- tm_map(corpus, stemDocument)
  return(corpus)
}

corpus <- SimpleCorpus(VectorSource(df$text))

corpus <- clean.corpus(corpus)


freq <- DocumentTermMatrix(corpus)
sparse <- removeSparseTerms(freq, 0.995)

#-#CREAZIONE DB-----
tSparse <- as.data.frame(as.matrix(sparse))
colnames(tSparse) = make.names(colnames(tSparse))
tSparse$intention = df$intention

na_count_2 <-sapply(tSparse, function(y) 
  sum(length(which(is.na(y)))))
na_count_2 <- data.frame(na_count_2)

prop.table(table(tSparse$intention))

#frequenze delle parole:
tdm <- TermDocumentMatrix(corpus,control=list(weighting=weightTf))
tdm.review <- as.matrix(tdm)
freq_2 <- rowSums(tdm.review)
freq.df <- data.frame(word=names(freq_2), frequency=freq_2) 
freq.df <- freq.df[order(freq.df[,2], decreasing = T),]
freq.df$word <- factor(freq.df$word,
                       levels=unique(as.character(freq.df$word)))
#grafico delle parole più frequenti:
word_graph <- ggplot(freq.df[1:50,],aes(x=reorder(word,frequency),
                                        y=frequency))+
  geom_bar(stat="identity",width=0.9)+
  coord_flip()+
  geom_text(aes(label=frequency),colour="white",
            hjust=1.25,size=3.0)+
  ggtitle('WORDS FREQUENCY')
word_graph

#-#APPRENDIMENTO SBILANCIATO---- 
set.seed(1234)
split <- sample.split(tSparse$intention,SplitRatio=0.7)
train <- subset(tSparse,split==T)
test <- subset(tSparse,split==F)
train$intention <- as.factor(train$intention)
test$intention <- as.factor(test$intention)

length(which(test$intention == "Y"))
length(which(test$intention == "N"))

#-#RANDOM FOREST SB----
##esecuzione sb ---- 
rf_model <- randomForest(intention~., data=train)
rf_model
pred_tr <- predict(rf_model,train)
confusionMatrix(pred_tr,train$intention,positive="Y")
pred_te <- predict(rf_model,test)
confusionMatrix(pred_te,test$intention,positive="Y")

#-#NAIVE BAYES SB----
##esecuzione----
set.seed(120) 
classifier_cl <- naiveBayes(intention ~ ., data = train)

y_train <- predict(classifier_cl, newdata = train)
confusionMatrix(y_train,train$intention,positive="Y")

y_pred <- predict(classifier_cl, newdata = test)
confusionMatrix(y_pred,test$intention,positive="Y")

#-#SVM SB----
##esecuzione----
classifier_svm <- svm(intention~.,data=train,
                      type='C-classification')

svm_train <- predict(classifier_svm,newdata=train)
confusionMatrix(svm_train,train$intention,positive="Y")

svm_pred <- predict(classifier_svm,newdata=test)
confusionMatrix(svm_pred,test$intention,positive="Y")

#-#DECISION TREE SB----
##esecuzione----
d_tree <- ctree(intention~.,data=train)

dtree_train <- predict(d_tree,newdata=train)
confusionMatrix(dtree_train,train$intention,positive="Y")

dtree_pred <- predict(d_tree,newdata=test)
confusionMatrix(dtree_pred,test$intention,positive="Y")

#-#BILANCIAMENTO DEL DB----
z <- tSparse
names(z)[331]<- 'Class'
z$Class <- gsub("N","0",z$Class)
z$Class <- gsub("Y","1",z$Class)
balanced <- mwmote(z,numInstances=1850,classAttr="Class")
names(z)[331]<- 'intention'

names(balanced)[331]<- 'intention'
balanced_dta <- rbind(z,balanced)

#-#APPRENDIMENTO BILANCIATO----
set.seed(1234)
split_b <- sample.split(balanced_dta$intention,SplitRatio=0.7)
train_b <- subset(balanced_dta,split_b==T)
test_b <- subset(balanced_dta,split_b==F)
train_b$intention <- as.factor(train_b$intention)
test_b$intention <- as.factor(test_b$intention)

length(which(test_b$intention == "1"))
length(which(test_b$intention == "0"))

#-#BALANCED RANDOM FOREST----
##esecuzione---- 
rf_model_3 <- randomForest(intention~., data=train_b)

pred_tr_3 <- predict(rf_model_3,train_b)
confusionMatrix(pred_tr_3,train_b$intention,positive="1")

pred_te_3 <- predict(rf_model_3,test_b)
confusionMatrix(pred_te_3,test_b$intention,positive="1")

#-#BALANCED NAIVE BAYES----
##esecuzione----
set.seed(120) 
classifier_cl_2 <- naiveBayes(intention ~ ., data = train_b)

y_train_svm_b <-predict(classifier_cl_2, newdata = train_b)
confusionMatrix(y_train_svm_b,train_b$intention,positive="1")

y_pred_svm_b <- predict(classifier_cl_2, newdata = test_b)
confusionMatrix(y_pred_svm_b,test_b$intention,positive="1")

#-#BALANCED SVM----
##esecuzione----
classifier_svm_b <- svm(intention~.,data=train_b,
                      type='C-classification')

svm_train_b <- predict(classifier_svm_b,newdata=train_b)
confusionMatrix(svm_train_b,train_b$intention,positive="1")

svm_pred_b <- predict(classifier_svm_b,newdata=test_b)
confusionMatrix(svm_pred_b,test_b$intention,positive="1")

#-#BALANCED DECISION TREE----
##esecuzione----
d_tree_b <- ctree(intention~.,data=train_b)

dtree_train_b <- predict(d_tree_b,newdata=train_b)
confusionMatrix(dtree_train_b,train_b$intention,positive="1")

dtree_pred_b <- predict(d_tree_b,newdata=test_b)
confusionMatrix(dtree_pred_b,test_b$intention,positive="1")
