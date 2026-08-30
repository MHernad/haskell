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