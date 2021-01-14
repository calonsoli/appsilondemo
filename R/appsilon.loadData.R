appsilon.loadData <- function(dataFile ='./data/ships.csv'){
  if (file.exists(dataFile)){
    vessels <<- read.csv(dataFile) 
    return(TRUE)
  }
  else 
    stop ("Data file missing") 
}


  
