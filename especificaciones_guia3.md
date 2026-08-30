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
    
    asegura : { n1 mod 0 (n2) -> True }
    
}

problema digitoUnidades (x: Z) : Z {
    
    req: {True}
    
    asegura: {Ultimo digito de X}

}

problema digitoDecenas (x: Z) : Z {
    
    req: {x > 9}
    
    asegura: {Anteultimo digito de X}

}


problema nombre (d : T) : T {

    requiere : {  }
    
    asegura : { }
    
}