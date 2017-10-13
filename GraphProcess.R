n=nrow(completedata)
maleYes=0
maleNo=0
femaleYes=0
femaleNo=0
maleNeu=0
femaleNeu=0
for(i in 1:307){
  if((grepl("male",completedata$userGender[i]))&&(grepl("positive",completedata$val2[i]))){
      maleYes=maleYes+1
  }
  if((grepl("male",completedata$userGender[i]))&&(grepl("negative",completedata$val2[i]))){
    maleNo=maleNo+1
  }
  if((grepl("male",completedata$userGender[i]))&&(grepl("neutral",completedata$val2[i]))){
    maleNeu=maleNeu+1
  }
  
  if((grepl("female",completedata$userGender[i]))&&(grepl("positive",completedata$val2[i]))){
    femaleYes=femaleYes+1
  }
  if((grepl("female",completedata$userGender[i]))&&(grepl("negative",completedata$val2[i]))){
    femaleNo=femaleNo+1
  }
  if((grepl("female",completedata$userGender[i]))&&(grepl("neutral",completedata$val2[i]))){
    femaleNeu=femaleNeu+1
  }
  
}

library(plotrix)
slices1 <- c(maleYes,maleNo,maleNeu) 
lbls1 <- c("Positive","Negative", "Neutral")
pie3D(slices1,labels=lbls1,explode=0.3,
      main="Male")

slices2 <- c(femaleYes,femaleNo,femaleNeu) 
lbls2 <- c("Positive","Negative", "Neutral")
pie3D(slices2,labels=lbls2,explode=0.3,
      main="FeMale")