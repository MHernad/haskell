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
h n = f(g n)

k :: Integer -> Integer
k n = g(f n)

-- problema maximo3 (n1, n2, n3: Z) : Z {
--    requiere : { True }
--    asegura : { res >= n1 y >= n2 y >= n3 }
--    }

max' :: Integer -> Integer -> Integer
max' n1 n2
    | n1 > n2 = n1
    | n1 == n2 = n1
    | otherwise = n2

maximo3 :: Integer -> Integer -> Integer -> Integer 
maximo3 n1 n2 n3 = max' (max' n1 n2) n3

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