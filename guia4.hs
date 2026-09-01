-- 1

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci n = n + fibonacci (n-1)

-- 2

parteEntera :: Float -> Integer
parteEntera n
    | n < 1 = 0
    | otherwise = 1 + parteEntera (n-1)

-- 3

esDivisible :: Integer -> Integer -> Bool
esDivisible x 1 = True
esDivisible 1 y = False
esDivisible x y
    | x > y = esDivisible (x-y) y
    | x < y && x /= 0 = False
    | otherwise = True

-- 4

esImpar :: Integer -> Bool -- por si hace falta
esImpar n
    | n `mod` 2 == 0 = False
    | not (n `mod` 2 == 0) = True 

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
iesimoDigito n i = mod (div n (10^(cantDigitos(n)-i))) 10