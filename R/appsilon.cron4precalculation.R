### Copy from appsilon.loadData
appsilon.cron4precalculation <- function(dataFile =''){
  
  if (file.exists(dataFile)){

    # Can be calculated directly without LAT2 and LON2, its coded like this to be clear.
    vessels <<- read.csv('./data/ships.csv') %>% 
      mutate ( LAT2 = lead (LAT)) %>%
      mutate ( LON2 = lead (LON)) %>%
      mutate(distance = mapply( 
        function(lg, lt,lg2,lt2) distm(c(lg, lt), c(lg2, lt2), fun=distHaversine), LON, LAT,LON2,LAT2 ) )
    
  }
  else {
    stop ("Data file missing") 
  }
  
}