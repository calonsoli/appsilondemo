context("Appsilon Main app")
appsilon.libraries()
appsilon.loadData('../../data/small.csv')

testServer(appsilon.main, {
  # Screen 1 -> Screen 2
  session$setInputs(types = '7')
  session$setInputs(vessels = '2764')
  expect_equal(nrow(ready2RenderObservations()),1)
  print(ready2RenderObservations()$distance)
  expect_equal(ready2RenderObservations()$LAT,54.73847)
  expect_equal(ready2RenderObservations()$LON,18.97842)
  expect_equal(ready2RenderObservations()$SPEED,101)
  expect_equal(ready2RenderObservations()$COURSE,197)
  expect_equal(ready2RenderObservations()$distance,722.3063)
})