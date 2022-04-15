data() #모든 내장된 R package를 다 보여준다. 실행시 R data set 이라는 파일이 뜬다
data(iris)
str(iris) #데이터의 구조(structure)를 보여줌
head(iris) #데이터의 앞 6줄만 보여줌
tail(iris) #데이터의 뒤 6줄만 보여줌
head(iris, 10) #원하는 만큼 숫자 지정 가능

iris$Sepal.Length #iris안의 변수를 불러올 때는 $를 사용해 경로 식으로 불러야 한다

attach(iris)#iris를 맨 상위 디렉토리에 위치시키기
search()

Sepal.Length #attach를 이용해 맨 상위 디렉토리에 위치시킨 변수의 경우는 데이터 셋을 생략해 변수명만 사용 가능

