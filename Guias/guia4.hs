-- 1

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- 2

parteEntera :: Float -> Integer
parteEntera n
    | n < 1 && n > 0 = 0
    | n > -1 && n < 0 = -1
    | n >= -1 = 1 + parteEntera (n-1)
    | otherwise = -1 + parteEntera (n+1)

-- 3

esDivisible :: Integer -> Integer -> Bool
esDivisible x 1 = True
esDivisible 1 y = False
esDivisible x y
    | x > y = esDivisible (x-y) y
    | x < y && x /= 0 = False
    | otherwise = True

-- 4

sumaImpares :: Integer -> Integer
sumaImpares 1 = 1
sumaImpares n = 2*n-1 + sumaImpares (n-1)

-- 5

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact (n-2)

-- 6

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n <= 9 = True
    | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
    -- si pensamos el número como una lista [n..m] estoy verificando si m = m-1
    | otherwise = False

-- 7

cantDigitos :: Integer -> Integer
cantDigitos 0 = 1
cantDigitos n
    | n <= 9 = 1
    | otherwise = 1 + cantDigitos (div n 10)

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n (10^(cantDigitos n-i))) 10

-- 8

sumaDigitos :: Integer -> Integer
sumaDigitos n
    | div n 10 > 0 = mod n 10 + sumaDigitos (div n 10)
    | otherwise = n

-- 9

esCapicua :: Integer -> Bool
esCapicua n
    | i == 0 = True
    | i == 1 = True
    | iesimoDigito n i == iesimoDigito n 1 = esCapicua numeroSinExtremos
    | otherwise = False
    where numeroSinExtremos = mod (div n 10) (10^(cantDigitos n-2))
          i = cantDigitos n

-- 10

-- a

f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2^n + f1 (n-1)

-- b

f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = q^n + f2 (n-1) q

-- c

f3 :: Integer -> Float -> Float
f3 0 q = 0
f3 n q = f2 (2*n) q

-- d

f4 :: Integer -> Float -> Float
f4 n = f4Aux n (2*n)

f4Aux :: Integer -> Integer -> Float -> Float
f4Aux n m q | n == m = q^n
            | otherwise = q^n + f4Aux (n+1) m q

-- 11

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / eAproxAux n) + eAprox (n-1)

eAproxAux :: Integer -> Float
eAproxAux 0 = 1
eAproxAux n = fromIntegral n * eAproxAux (n-1)

e = eAprox 10

-- 12

raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = 1
raizDe2Aprox n = 2 + (1 / sucesionRaizDe2 (n-1)) - 1

sucesionRaizDe2 :: Integer -> Float
sucesionRaizDe2 1 = 2 + 1 / 2
sucesionRaizDe2 n = 2 + 1 / sucesionRaizDe2 (n-1)

-- 13

sumatoria :: Integer -> Integer -> Integer
sumatoria 0 m = 0
sumatoria n m = sumatoriaAux n m + sumatoria (n-1) m

sumatoriaAux :: Integer -> Integer -> Integer
sumatoriaAux 1 j = j
sumatoriaAux i 1 = i
sumatoriaAux i j = i^j + sumatoriaAux i (j-1)

-- 14

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q 0 m = 0
sumaPotencias q n 0 = 0
sumaPotencias q n m = sumatoriaAux q n * sumatoriaAux q m

-- 15

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 m = 0
sumaRacionales n m = sumatoriaAux' n m + sumaRacionales (n-1) m

sumatoriaAux' :: Integer -> Integer -> Float
sumatoriaAux' i 1 = fromIntegral i
sumatoriaAux' i j = fromIntegral i / fromIntegral j + sumatoriaAux' i (j-1)

-- 16

-- a 

menorDivisor :: Integer -> Integer
menorDivisor n = buscaDivisor n 2

buscaDivisor :: Integer -> Integer -> Integer
buscaDivisor n m
    | esDivisible n m = m
    | otherwise = buscaDivisor n (m+1)

-- b

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = menorDivisor n == n

-- c

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m = mcd n m (menor n m) == 1

mcd :: Integer -> Integer -> Integer -> Integer
mcd n m c
    | mod n c == 0 && mod m c == 0 = c
    | otherwise = mcd n m (c-1)

menor ::  Integer -> Integer -> Integer
menor n m
    | n < m = n
    | m < n = m

-- d

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = buscarPrimos n 0 0

buscarPrimos :: Integer -> Integer -> Integer -> Integer
buscarPrimos lim p n
    | n < lim && esPrimo p = buscarPrimos lim (p+1) (n+1)
    | n < lim && not (esPrimo p) = buscarPrimos lim (p+1) n
    | n == lim = p-1

-- 17

esFibonacci :: Integer -> Bool
esFibonacci 0 = False
esFibonacci 2 = True
esFibonacci 3 = True
esFibonacci n = esFibonacci' n n

esFibonacci' :: Integer -> Integer -> Bool
esFibonacci' n m
    | n > fibonacci m = False
    | n == fibonacci m = True
    | otherwise = esFibonacci' n (m-1)

-- 18

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigito n (-1)


mayorDigito :: Integer -> Integer -> Integer
mayorDigito n max
    | n == 0 = max
    | even n && mod n 10 > max = mayorDigito (div n 10) (mod n 10)
    | otherwise = mayorDigito (div n 10) max

-- 19

esSumaInicialDePrimos :: Integer -> Bool
esSumaInicialDePrimos 1 = False
esSumaInicialDePrimos n = sumaDePrimos n 3 2

sumaDePrimos :: Integer -> Integer -> Integer -> Bool
sumaDePrimos n suma cantP
    | n == suma = True
    | n < suma = False
    | otherwise = sumaDePrimos n (suma + nEsimoPrimo (cantP + 1)) (cantP + 1)

-- 20

tomaValorMax :: Integer -> Integer -> Integer
tomaValorMax n1 n2
    | n1 < n2 && sumaDivisores n1 < sumaDivisores n2 = tomaValorMax (n1+1) n2
    | n1 < n2 && sumaDivisores n1 > sumaDivisores n2 = tomaValorMax n1 (n2-1)
    | n1 == n2 = n1

sumaDivisores :: Integer -> Integer
sumaDivisores n = sumaDeDivisores n n

sumaDeDivisores :: Integer -> Integer -> Integer
sumaDeDivisores n m
    | m > 0 && esDivisible n m = m + sumaDeDivisores n (m-1)
    | m > 0 && not (esDivisible n m) = sumaDeDivisores n (m-1)
    | m == 0 = 0

-- 21

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras x y h
    | x > 0 && y > 0 = pitagorasCadaX x y h + pitagorasCadaY x (y-1) h + pitagoras (x-1) (y-1) h
    | x == 0 && y > 0 = pitagorasCadaY x y h + pitagoras x (y-1) h
    | y == 0 && x > 0 = pitagorasCadaY x y h + pitagoras (x-1) y h
    | x == 0 && y == 0 = 0


pitagorasCadaX :: Integer -> Integer -> Integer -> Integer
pitagorasCadaX x y h
    | x >= 0 && x^2 + y^2 <= h^2 = 1 + pitagorasCadaX (x-1) y h
    | x >= 0 && x^2 + y^2 > h^2 = pitagorasCadaX (x-1) y h
    | x < 0 = 0

pitagorasCadaY :: Integer -> Integer -> Integer -> Integer
pitagorasCadaY x y h
    | y >= 0 && x^2 + y^2 <= h^2 = 1 + pitagorasCadaY x (y-1) h
    | y >= 0 && x^2 + y^2 > h^2 = pitagorasCadaY x (y-1) h
    | y < 0 = 0
