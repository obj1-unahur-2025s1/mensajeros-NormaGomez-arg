object puente {
  method dejarPasar(alguien) = alguien.peso() <= 1000
}
object matrix {
  method dejarPasar(alguien) = alguien.puedeLlamar()
}

object neo {
  
  var tieneCredito = true
  method peso() = 0
  method puedeLlamar() = tieneCredito 
  method cargar() {
    tieneCredito = true
   }
  method hablar() {
    tieneCredito = false
  }
  method puedeEntregar(paquete) = paquete.estaPago() and self.puedeLlamar()
}
object chuck {
  
  method peso() = 80
  method puedeLlamar() = true
  method puedeEntregar(paquete) = paquete.estaPago() and self.puedeLlamar()
}
object roberto {
  var vehiculo = null
  var peso = 90
  method peso() = peso + vehiculo.peso()
  method puedeLlamar() = false
  method asignarVehiculo(unVehiculo) {
  vehiculo = unVehiculo
}
  method puedeEntregar(paquete) = paquete.estaPago() and self.puedeLlamar()
}
object pato {
  method peso() {
    
  }
  method puedeLlamar() {
    
  }
}
object bicicleta {
  method peso() = 5  
}
object camion {
  var acoplado = 1
  method peso() = acoplado * 500 

}
object paquete {
  method estaPago() = true
}
object empresa {
  const mensajeros = [chuck, roberto, neo]
  method mensajeros() = mensajeros
    
  method contratar(empleado) {
    mensajeros.add(empleado)
    
  }
  method despedir(alguien) {
    mensajeros.remove(alguien)
  }
  method despedirTodos() {
    mensajeros.clear()
  }
  method esGrande() = mensajeros.size() >= 2
  method entregaRapida() {
    self.mensajeros().first().puedeEntregar(paquete)
  }
}