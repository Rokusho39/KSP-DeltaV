#Class for caclulating the delta V needed for moving between two bodies
class DeltaVCalc
  constructor(@_system): ->
  
  #Returns DeltaV needed to transfer from one circular orbit to another
  calcHohmannTransfer(gravParam, initOrbit, targetOrbit, parentRadius): ->
    toElliptical = caclHohmannToElliptical(gravParam, initOrbit, targetOrbit, parentRadius)
    toCircularize = caclHohmannToCircularise(gravParam, initOrbit, targetOrbit, parentRadius)
    toElliptical + toCircularize
  
  #Returns DeltaV needed to transfer from a circular to elliptical orbit
  calcHohmannToElliptical(gravParam, initOrbit, tragetOrbit, parentRadius): ->
    firstProd = Math.sqrt(gravParam / (initOrbit + parentRadius)
    secondProd = Math.sqrt((2 * (tragetOrbit + parentRadius)) / (targetOrbit + initOrbit + 2 * parentRadius))
    firstProd * (secondProd - 1)
  
  #Returns DeltaV needed to transfer from an elliptical to a cicular orbit
  caclHohmannToCircularise(gravParam, initOrbit, tragetOrbit, parentRadius): ->
    firstProd = Math.sqrt(gravParam / (tragetOrbit + parentRadius)
    secondProd = Math.sqrt((2 * (initOrbit + parentRadius)) / (targetOrbit + initOrbit + 2 * parentRadius))
    firstProd * (1 - secondProd)

exports.DeltaVCalc = DeltaVCalc

  #http://space.stackexchange.com/questions/1380/how-to-calculate-delta-v-required-for-a-planet-to-planet-hohmann-transfer
  #For more information on planet to planet trasnfers
  #http://space.stackexchange.com/questions/2046/delta-v-chart-mathematics/2048#2048
  #For more on lunar injections