gender=c(rep("male",20),rep("female",30)) 
#rep: 반복. rep("반복할 것", 반복횟수)
#예:20명의 "male"과 30명의 "female"을 가지는 gender라는 변수
gender2=factor(gender)
#R은 gender를 nominal 변수로 처리. (내부적으로 1=female, 2=male)
gender2
summary(gender) #gender: vector
summary(gender2) #gender2:nominal