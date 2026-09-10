-- 1

-- a
{- HLINT ignore "Use map" -}

longitud :: [t] -> Integer
longitud [] = 0
longitud (_:xs) = 1+ longitud xs

-- b

ultimo :: [t] -> t
ultimo (x:xs)
    | longitud xs == 0 = x
    | otherwise = ultimo xs

-- c

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

-- d

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x]

-- 2

-- a

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs)
    | x == n = True
    | otherwise = pertenece n xs

-- b

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:xs)
    | longitud xs >= 1 && x == ultimo xs = todosIguales xs
    | null xs = True
    | otherwise = False

-- c

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs)
    | pertenece x xs = False
    | otherwise = todosDistintos xs

-- d

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos x = not (todosDistintos x)

-- e

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs)
    | n == x = xs
    | n /= x = x : quitar n xs

-- f

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs)
    | n == x = quitarTodos n xs
    | n /= x = x : quitarTodos n xs

-- g

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | longitud xs > 0 && pertenece x xs = x : eliminarRepetidos (quitarTodos x xs)
    | longitud xs > 0 && not (pertenece x xs) = x : eliminarRepetidos xs
    | otherwise = x:xs

-- h

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos [_] [] = False
mismosElementos [] [_] = False
mismosElementos (x:xs) (y:ys)
    | x `pertenece` (y:ys) && y `pertenece` (x:xs) = mismosElementos (eliminarRepetidos (quitar y xs)) (eliminarRepetidos (quitar x ys))
    | otherwise = False

-- i

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua [x] = True
capicua (x:xs)
    | x == ultimo xs = capicua (principio xs)
    | otherwise = False

-- 3

-- a

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria [x] = x
sumatoria (x:xs)
    | longitud xs > 0 = x + sumatoria xs

-- b

productoria :: [Integer] -> Integer
productoria [] = 1
productoria [x] = x
productoria (x:xs)
    | longitud xs > 0 = x * productoria xs

-- c

maximo :: [Integer] -> Integer
maximo [] = 0
maximo [x] = x
maximo (x:xs)
    | x >= ultimo xs = maximo (x : principio xs)
    | x < ultimo xs = maximo xs

-- d

sumarN :: Integer -> [Integer] -> [Integer]
sumarN n (x:xs) = map (+n) (x:xs)

-- e

sumarPrimero :: [Integer] -> [Integer]
sumarPrimero (x:xs) = sumarN x (x:xs)

-- f

sumarUltimo :: [Integer] -> [Integer]
sumarUltimo (x:xs) = sumarN (ultimo xs) (x:xs)

-- g

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | even x = x : pares xs
    | otherwise = pares xs

-- h

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN 0 [_] = []
multiplosDeN n (x:xs)
    | mod x n == 0 = x : multiplosDeN n xs
    | otherwise = multiplosDeN n xs

-- i

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar x
    | longitud x > 1 = ordenar (quitar (maximo x) x) ++ [maximo x]

-- 4

espaciosInnecesarios :: [Char] -> [Char]
espaciosInnecesarios [] = []
espaciosInnecesarios (x:xs)
    | x == ' ' && ultimo xs == ' ' = principio xs
    | x == ' ' = xs
    | ultimo xs == ' ' = x : principio xs
    | otherwise = x:xs

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:xs)
    | x == ' ' && x == head xs = sacarBlancosRepetidos xs
    | x == ' ' && (x /= head xs) = x : sacarBlancosRepetidos  xs
    | x /= ' ' = x : sacarBlancosRepetidos xs
    | otherwise = xs

-- b

-- The quick brown fox jumps over the lazy dog

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (x:xs)
    | x' == ' ' && longitud xs > 1 = 1 + contarPalabras x's
    | x' /= ' ' && longitud xs == 0 = 1
    | otherwise = contarPalabras x's
    where (x':x's) = espaciosInnecesarios (sacarBlancosRepetidos (x:xs))

-- c

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs)
    | longitud xs' > 1 = [x']:[head xs'] : palabras xs'
    | longitud xs' == 1 = [[x']]
    where (x':xs') = espaciosInnecesarios (sacarBlancosRepetidos (x:xs))