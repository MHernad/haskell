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