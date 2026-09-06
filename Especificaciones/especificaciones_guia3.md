Ejemplo de especificación

problema nombre (d : T) : T {

    requiere : {  }
    
    asegura : { }
    
}

Ejercicio 2

problema absoluto (n: Z) : Z {

    requiere : { True }

    asegura : { |n| }

}



problema maximoAbsoluto (n1, n2: Z) : Z {

    requiere : { True }

    asegura : { res >= |n1| y res >= |n2| }

}



problema maximo3 (n1, n2, n3: Z) : Z {

    requiere : { True }

    asegura : { res >= n1 y >= n2 y >= n3 }

}

problema algunoEsCero (n1, n2: R) : R {

    requiere : { True }
    
    asegura : { (n1 == 0 || n2 == 0) -> res = True }

}

problema ambosSonCero (n1, n2: R) : R {

    requiere : { True }
    
    asegura : { (n1 == 0 && n2 == 0) -> res = True }
    
}

problema enMismoIntervalo (n1, n2: R) : R {

    requiere : { True }
    
    asegura : { (n1 =< 3 && n2 =< 3 || n1 > 7 && n2 > 7 || 3 < n1 && n2 => 7 ) -> res = True }
    
}

problema sumaDistintos (n1, n2, n3: Z) : Z {
    requiere: { True }

    asegura:  {( (x != y) && (x != z) && (y != z) ) -> res = x+y+z}

    asegura:  {( (x != y) && (x != z) && (y == z) ) -> res = x}

    asegura:  {( (x != y) && (x == z) && (y != z) ) -> res = y}

    asegura:  {( (x == y) && (x != z) && (y != z) ) -> res = z}

    asegura:  {( (x == y) && (x == z) && (y == z) ) -> res = 0}

}

problema esMultiploDe (n1, n2 : R) : Bool {

    requiere : { True }
    
    asegura : { n1 ≡ 0 (n2) -> True }
    
}

problema digitoUnidades (x: Z) : Z {
    
    req: {True}
    
    asegura: {Ultimo digito de X}

}

problema digitoDecenas (x: Z) : Z {
    
    req: {x > 9}
    
    asegura: {Anteultimo digito de X}

}

Ejercicio 4

problema productoInterno ((x1, y1), (x2, y2) : R) : R {

    requiere : { True }
    
    asegura : { res = x1*x2 + y1*y2 }
    
}

problema esParMenor ((x1, y1), (x2, y2) : R) : R {

    requiere : { True }
    
    asegura : { (x1<x2 && y1<y2) -> res }
    
}

problema distancia ((x1, y1), (x2, y2) : R) : R {

    requiere : { True }
    
    asegura : { res = sqrt((x2-x1)^2 + (y2-y1)^2) }
    
}

problema sumaTerna ((x, y, z): R) : R {

    requiere : { True }
    
    asegura : { res = x+y+z }
    
}

problema sumarSoloMultiplos ((x, y, z), n: R) : R {

    requiere : { True }
    
    asegura : { (f(x)+f(y)+f(z)) con f(p) = p si p ≡ 0 (n) o 0 en caso contrario }
    
}

problema posPrimerPar ((x, y, z): R) : R {

    requiere : { True }
    
    asegura : { x ≡ 0 (2) -> res = 1}

    asegura : { y ≡ 0 (2) -> res = 2}
    
    asegura : { z ≡ 0 (2) -> res = 3}

    asegura : { res = 4 }
    
}

problema crearPar (x, y: R) : (R, R) {

    requiere : { True }

    asegura: { (x, y) }

}

problema invertir ((x, y): R) : (R, R) {

    requiere : { True }

    asegura: { (y, x) }

}

Ejercicio 9

a) Devuelve 0 si el número es, ironicamente, distinto de 0, en cuyo caso devuelve 1

problema f1 (x : R) : R {

    requiere : { True }

    asegura: { x ≠ 0 -> res = 0 }

    asegura: { x = 0 -> res = 1 }

}

b) Toma un signo y lo multiplica por 15

problema f2 (x : R) : R {

    requiere : { True }

    asegura: { x = 1 -> res = 15 }

    asegura: { x = -1 -> res = -15 }

}

c) Transforma todos los números menores a 9 en 7, e intenta transformar todos los números mayores a 3 en 5, solo consiguiendolo con aquellos que son tambien mayores a 9

problema f3 (x : R) : R {

    requiere : { True }

    asegura: { x <= 9 -> res = 7 }

    asegura: { x >= 3 -> res = 5 }

}

d) Devuelve el promedio entre dos numeros

problema f4 (x, y : R) : R {

    requiere : { True }

    asegura: { res = (x+y)/2 }

}

e) Devuelve el promedio entre los valores de un par

problema f5 ((x,y) : R) : R {

    requiere : { True }

    asegura: { res = (x+y)/2 }

}

f) Confirma si la parte entera del número racional es igual al entero

problema f6 (x : R, y : N) : R {

    requiere : { True }

    asegura: { parte entera de x == y -> res = True }

}