{- HLINT ignore "Eta reduce" -}

-- Ej 1
-- a
f :: Integer -> Integer
f 1 = 8
f 4 = 131
f 16 = 16
-- b
g :: Integer -> Integer
g 8 = 16
g 16 = 4
g 131 = 1
-- c
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

-- e

boolToInt :: Bool -> Integer
boolToInt b
    | not b = 0
    | otherwise = 1

sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (x,y,z) n = x * boolToInt (esMultiploDe x n) + y * boolToInt (esMultiploDe y n) + z * boolToInt (esMultiploDe z n)

-- f

posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (x,y,z)
    | even x = 1
    | even y = 2
    | even z = 3
    | otherwise = 4

-- g

crearPar :: a -> b -> (a,b)
crearPar a b = (a, b)

-- h

invertir :: (a,b) -> (b,a)
invertir (a,b) = (b,a)

-- i

type Punto2D =  (Float, Float)

productoInterno' :: Punto2D -> Punto2D -> Float
productoInterno' (x1,y1) (x2,y2) = x1*x2 + y1*y2

esParMenor' :: Punto2D -> Punto2D -> Bool
esParMenor' (x1, y1) (x2, y2) = x1 < x2 && y1 < y2

distancia' :: Punto2D -> Punto2D -> Float
distancia' (x1, y1) (x2, y2) = sqrt((x2-x1)^2 + (y2-y1)^2 )

-- 5

f' :: Integer -> Integer
f' n
    | n <= 7 = n^2
    | otherwise = 2*n-1

g' :: Integer -> Integer
g' n
    | even n = n `div` 2
    | otherwise = 3*n+1

todosMenores :: (Integer, Integer, Integer) -> Bool
todosMenores (x,y,z) = f' x > g' x && f' y > g' y && f' z > g' z

-- 6

type Anio = Integer
type EsBisiesto = Bool

bisiesto :: Anio -> EsBisiesto
bisiesto y = mod y 4 == 0 || (mod y 100 == 0 && mod y 400 == 0)

-- 7 

abs' :: Float -> Float
abs' n
    | n < 0 = (-1)*n
    | otherwise = n

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1,y1,z1) (x2,y2,z2) = abs' (x1-x2) + abs' (y1-y2) + abs' (z1-z2)

type Punto3D = (Float, Float, Float)

distanciaManhattan' :: Punto3D -> Punto3D -> Float
distanciaManhattan' (x1,y1,z1) (x2,y2,z2) = abs' (x1-x2) + abs' (y1-y2) + abs' (z1-z2)

-- 8

sumaUltimosDosDigitos :: Integer -> Integer
sumaUltimosDosDigitos x = mod x 10 + mod (div x 10) 10

comparar :: Integer -> Integer -> Integer
comparar x y
    | sumaUltimosDosDigitos x < sumaUltimosDosDigitos y = 1
    | sumaUltimosDosDigitos x > sumaUltimosDosDigitos y = -1
    | otherwise = 0