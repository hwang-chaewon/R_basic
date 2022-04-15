rm(list = ls())
install.packages("party")
library(party)


# 아이리스 데이터
data(iris)
str(iris)  #structure
iris

set.seed(1234)  # 샘플 추출값 고정

ind <- sample(2, nrow(iris), replace=TRUE, prob=c(0.7, 0.3)) 
             #sampling takes place from 1:2
#여기서 ind를 출력하면 1또는 2로 돼있다. 1은 training, 2는 test를 의미한다.
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

#Decision tree 생성
iris_ctree <- ctree(Species ~ Sepal.Length + Sepal.Width 
                    + Petal.Length + Petal.Width, data=trainData)
 

print(iris_ctree)

#Decision tree plotting
plot(iris_ctree)
plot(iris_ctree, type="simple")

#Classificatioin with test set
testPred <- predict(iris_ctree, newdata = testData)

#분류결과 plotting
testPred
plot(testPred)

predict_table <- table(testPred, testData$Species)
names(dimnames(predict_table)) <- c("predicted", "observed")#왼쪽: predicted, 오른쪽: 실제 관측값
predict_table
#보면 setosa, versicolor는 분류가 완벽히 되었는데 virginica에서 오류가 났음을 볼 수 있다.


#예측 결과와 실제 데이터의 정확도 확인
sum(testPred==testData$Species)/length(testPred)*100



###### 전립선 암 데이터 ########

rm(list = ls())
install.packages("rpart")
library(rpart) 

data(stagec)	 
str(stagec)

stagec1<- subset(stagec, !is.na(g2))
stagec2<- subset(stagec1, !is.na(gleason))
stagec3<- subset(stagec2, !is.na(eet))
str(stagec3) #stagec3개수를 세 보면 134개가 나올 것

set.seed(1234)
ind <- sample(2, nrow(stagec3), replace=TRUE, prob=c(0.7, 0.3))

ind
trainData <- stagec3[ind==1, ]
testData <- stagec3[ind==2, ]

tree <- ctree(ploidy ~ ., data=trainData)
tree
plot(tree)

testPred = predict(tree, newdata=testData)
predict_table <- table(testPred, testData$ploidy)

names(dimnames(predict_table)) <- c("predicted", "observed")	
predict_table

#예측 결과와 실제 데이터의 정확도 확인
sum(testPred==testData$ploidy)/length(testPred)*100


