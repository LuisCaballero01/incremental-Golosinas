object bombon{
    const precio = 5
    const sabor = "frutilla"
    var peso = 15

    method esLibreDeGluten() = true
    method precio() = precio
    method sabor() = sabor
    method peso() = peso

    method recibirMordisco(){
        peso = (peso * 0.8) - 1
    }
}

object alfajor{
    const precio = 12
    const sabor = "chocolate"
    var peso = 300

    method esLibreDeGluten() = false
    method precio() = precio
    method sabor() = sabor
    method peso() = peso

    method recibirMordisco(){
        peso *= 0.8
    }
}

object caramelo{
    const precio = 1
    const sabor = "frutilla"
    var peso = 5

    method esLibreDeGluten() = true
    method precio() = precio
    method sabor() = sabor
    method peso() = peso

    method recibirMordisco(){
        peso -= 1
    }
}

object chupetin{
    const precio = 2
    const sabor = "naranja"
    var peso = 7

    method esLibreDeGluten() = true
    method precio() = precio
    method sabor() = sabor
    method peso() = peso

    method recibirMordisco(){
        peso -= if (peso>2) peso*0.1 else 0
    }
}

object oblea{
    const precio = 5
    const sabor = "vainilla"
    var peso = 250

    method esLibreDeGluten() = false
    method precio() = precio
    method sabor() = sabor
    method peso() = peso

    method recibirMordisco(){
        peso *= if (peso>70) 0.5 else 0.25
    }
}

object chocolatin{ // TODO
    const sabor = "chocolate"
    var pesoInicial = 0
    var peso = 0

    method esLibreDeGluten() = false
    method precio() = 0.5*peso
    method sabor() = sabor
    method peso() = peso

    method asignarPesoInicial(unPeso){
        pesoInicial = unPeso
        peso = pesoInicial // O también unPeso
    }
    method recibirMordisco(){}
}

object golosinaBañada{
    var golosinaBase = chocolatin
    var pesoBañado = 4

    method sabor() = golosinaBase.sabor()
    method precio() = golosinaBase.precio() + 2
    method peso() = golosinaBase.peso() + pesoBañado
    method esLibreDeGluten() = golosinaBase.esLibreDeGluten()

    method recibirMordisco(){
        golosinaBase.recibirMordisco()
        pesoBañado = 0.max(pesoBañado-2)

    }
    method cambiarGolosinaBase(unaGolosina){
        golosinaBase = unaGolosina
    }
}

object pastillaTuttiFrutti{
    const peso = 5
    var sabor = "chocolate"
    var contieneGluten = false

    method esLibreDeGluten() = !contieneGluten
    method precio() = if (self.esLibreDeGluten()) 7 else 10
    method sabor() = sabor
    method peso() = peso

    
    method recibirMordisco(){
        if (sabor == "frutiila"){
            sabor = "chocolate"
        }
        else if (sabor == "chocolate"){
            sabor = "naranja"
        }
        else{
            sabor = "frutilla"
        }
    }
    
    method añadirGluten(){
        contieneGluten = true
    }
    
    method quitarGluten(){
        contieneGluten = false
    }
}