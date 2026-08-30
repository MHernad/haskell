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
algunoEsCero :: Integer -> Integer -> Bool
algunoEsCero n1 n2
    | n1 == 0 = True
    | n2 == 0 = True
    | otherwise = False

-- con pattern matching
algunoEsCero' :: Integer -> Integer -> Bool
algunoEsCero' 0 n2 = True
algunoEsCero' n1 0 = True
algunoEsCero' n1 n2 = False

--e
-- sin pattern matching
ambosSonCero :: Integer -> Integer -> Bool
ambosSonCero n1 n2
    | n1 == 0 && n2 == 0 = True
    | otherwise = False

-- con pattern matching
ambosSonCero' :: Integer -> Integer -> Bool
ambosSonCero' 0 0 = True
ambosSonCero' n1 n2 = False

-- problema sumaDistintos (n1, n2, n3: Z) : Z {
--    requiere: { True }
--    asegura:  {( (x != y) && (x != z) && (y != z) ) -> res = x+y+z}
--    asegura:  {( (x != y) && (x != z) && (y == z) ) -> res = x}
--    asegura:  {( (x != y) && (x == z) && (y != z) ) -> res = y}
--    asegura:  {( (x == y) && (x != z) && (y != z) ) -> res = z}
--    asegura:  {( (x == y) && (x == z) && (y == z) ) -> res = 0}
--    }

sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos n1 n2 n3
    | n1 == n2 && n1 == n3 = 0
    | n1 == n2 && n2 /= n3 = n3
    | n1 /= n2 && n2 == n3 = n1
    | n1 == n3 && n2/= n3 = n2
    | otherwise = n1+n2+n3

-- digitoUnidades (x: Z) : Z {
--  req: {True}
--  asegura: {Ultimo digito de X}
--}

digitoUnidades :: Integer -> Integer
digitoUnidades x = mod x 10

digitoDecenas :: Integer -> Integer
digitoDecenas x = mod x 100