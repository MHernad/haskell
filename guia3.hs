{- HLINT ignore "Eta reduce" -}

-- Ej 1
-- a)
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
-- b)
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
-- c)
h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k n = g (f n)

-- 2

-- a

absoluto :: Integer -> Integer
absoluto n
    | n < 0 = (-1)*n
    | otherwise = n

-- b

max' :: Integer -> Integer -> Integer
max' n1 n2
    | n1 > n2 = n1
    | n1 == n2 = n1
    | otherwise = n2

-- b

maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto n1 n2 = max' (absoluto n1) (absoluto n2)

-- c

maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 n1 n2 n3 = max' (max' n1 n2) n3

-- d
-- sin pattern matching
algunoEsCero :: Float -> Float -> Bool
algunoEsCero n1 n2
    | n1 == 0 = True
    | n2 == 0 = True
    | otherwise = False

-- con pattern matching
algunoEsCero' :: Float -> Float -> Bool
algunoEsCero' 0 n2 = True
algunoEsCero' n1 0 = True
algunoEsCero' n1 n2 = False

-- e
-- sin pattern matching
ambosSonCero :: Float -> Float -> Bool
ambosSonCero n1 n2
    | n1 == 0 && n2 == 0 = True
    | otherwise = False

-- con pattern matching
ambosSonCero' :: Float -> Float -> Bool
ambosSonCero' 0 0 = True
ambosSonCero' n1 n2 = False

-- f

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo n1 n2
    | n1 <= 3 && n2 <= 3 = True
    | n1 > 7 && n2 > 7 = True
    | 3 < n1 && n1 <= 7 && 3 < n2 && n2 <= 7 = True
    | otherwise = False

-- g

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n1 n2 n3
    | n1 == n2 && n1 == n3 = 0
    | n1 == n2 && n2 /= n3 = n3
    | n1 /= n2 && n2 == n3 = n1
    | n1 == n3 && n2/= n3 = n2
    | otherwise = n1+n2+n3

-- h

esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n1 n2
    | mod n1 n2 == 0 = True
    | otherwise = False

-- i

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

-- j

digitoDecenas :: Integer -> Integer
digitoDecenas x = div (mod x 100)  10

-- 3

estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados n1 n2 = mod n1 n2 == 0

-- Por qué? La relación esta formada por a^2 + a*b*k = 0 con a, b y k /= 0
-- Si intento despejar k => a^2 = -a*b*k => a^2/a = -b*k => a = -b*k => a/b = -k
-- Como k tiene que ser un valor entero me baso en la congruencia dada como a ≡ 0 (b)

-- 4
-- a

productoInterno :: (Integer, Integer) -> (Integer, Integer) -> Integer
productoInterno (x1, y1) (x2, y2) = x1 * x2 + y1 * y2

-- b

esParMenor :: (Integer, Integer) -> (Integer, Integer) -> Bool
esParMenor (x1, y1) (x2, y2) = x1 < x2 && y1 < y2

-- c

distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) = sqrt((x2-x1)^2 + (y2-y1)^2 )

-- d

sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x,y,z) = x+y+z
