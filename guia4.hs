-- 1

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

-- 2

parteEntera :: Float -> Integer
parteEntera n
    | n < 1 && n > 0 = 0
    | n > -1 && n < 0 = -1
    | n >= -1 = 1 + parteEntera (n-1)
    | otherwise = -1 + parteEntera(n+1)

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
sumaImpares n = 2*n-1 + sumaImpares(n-1)

-- 5

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n * medioFact(n-2)

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
f2 n 0 = 0
f2 n q = q^n + f2 (n-1) q

-- c

f3 :: Integer -> Float -> Float
f3 n = f2 (2*n)

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
eAproxAux n = fromIntegral n * eAproxAux(n-1)

const e = eAprox 10

-- 12

raizDe2Aprox :: Integer -> Float
raizDe2Aprox 1 = 1
raizDe2Aprox n = 2 + (1 / sucesionRaizDe2 (n-1)) - 1

sucesionRaizDe2 :: Integer -> Float
sucesionRaizDe2 1 = 2 + 1 / 2
sucesionRaizDe2 n = 2 + 1 / sucesionRaizDe2 (n-1)

-- 13

