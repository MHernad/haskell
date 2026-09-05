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

Ejercicio 10

problema f1 (n : N) : N {

    requiere : { n >= 0 }
    
    asegura : { La suma de 2 elevado a todos los numeros hasta n }
    
}

problema f2 (n : N, q : R) : R {

    requiere : { n > 0 }
    
    asegura : { La suma de q elevado a todos los numeros hasta n }
    
}

problema f3 (n : N, q : R) : R {

    requiere : { n > 0 }
    
    asegura : { La suma de q elevado a todos los numeros hasta el doble de n }
    
}

problema f4 (n : N, q : R) : R {

    requiere : { n > 0 }
    
    asegura : { La suma de q elevado a todos los numeros desde n hasta su doble }
    
}

Ejercicio 11

problema eAprox (n : N) : R {

    requiere : { n >= 0 }
    
    asegura : { La suma de 1 sobre el factorial todos los numeros hasta n }
    
}

Ejercicio 12

problema raizDe2Aprox (n : N) : R {

    requiere : { n > 0 }

    asegura : { La aproximación de raíz de 2 dada por a(n+1) - 1 siendo a la sucesion dada por a1 = 2, a(n+1) = 2 + (1 / a(n-1)) } 

}

Ejercicio 13

problema dobleSumatoria (n, q : N) : R {

    requiere : { n, q > 0 }
    
    asegura : { La suma de la suma de todos los i^j para cada j para cada i }
    
}

Ejercicio 14

problema sumaPotencias (q, n, m : N) : N {

    requiere : { n, m > 0 }

    asegura : { La suma de todos los posibles q^(a+b) para todo 1 =< a <= n y 1 =< b <= m }

}