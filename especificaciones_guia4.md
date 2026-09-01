Ejercicio 3

problema esDivisible (x, y : N) : Bool {

    requiere : { x, y > 0 }
    
    asegura : { x ≡ 0 (y) -> res = True }

    asegura : { x ≡ k /= 0 (y) -> res = False }
    
}

Ejercicio 4

problema sumaImpares (x : N) : N {

    requiere : { True }
    
    asegura : { Suma los números impares hasta x }
    
}

Ejercicio 8

problema sumaDigitos (x : N) : N {

    requiere : { True }
    
    asegura : { Suma los digitos de un número natural }
    
}