--1

-- a

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
quitar n (x:y:xs)
    | longitud (x::xs) == 1 && x == n = []
    | longitud (x:xs) > 1 && not (pertenece n (x:xs)) = x:xs
    | longitud (x:xs) > 1 && x == n = xs
    | otherwise = quitar n xs