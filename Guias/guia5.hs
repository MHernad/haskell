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
sumarN n [] = []
sumarN n (x:xs) = x+n : sumarN n xs

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
    | x == ' ' && longitud xs > 0 && ultimo xs == ' ' = principio xs
    | x == ' ' = xs
    | longitud xs > 0 && ultimo xs == ' ' = x : principio xs
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
    | longitud xs' > 0 = palabra (x':xs') : palabras (quitarPalabra xs')
    | otherwise = [[x']]
    where (x':xs') = espaciosInnecesarios (sacarBlancosRepetidos (x:xs))

palabra :: [Char] -> [Char]
palabra [] = []
palabra (x:xs)
    | longitud xs > 0 && head xs == ' ' = x:[]
    | otherwise = x : palabra xs

quitarPalabra :: [Char] -> [Char]
quitarPalabra [] = []
quitarPalabra (x:xs)
    | x /= ' ' = quitarPalabra xs
    | x == ' ' && longitud xs > 0 && head xs == ' ' = quitarPalabra xs
    | otherwise = xs

-- d

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga = palabraMasLargaAux . palabras

palabraMasLargaAux :: [[Char]] -> [Char]
palabraMasLargaAux [] = []
palabraMasLargaAux (x:xs)
    | longitud x < longitud (palabraMasLargaAux xs) = palabraMasLargaAux xs
    | otherwise = x

-- e

aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs)
    | longitud xs > 0 = palabra x ++ aplanar xs
    | otherwise = x

-- f

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:xs)
    | longitud xs > 0 = palabra x ++ [' '] ++ aplanarConBlancos xs 
    | otherwise = x

-- g

aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos []  _ = []
aplanarConNBlancos (x:xs) n
    | longitud xs > 0 = palabra x ++ nBlancos n ++ aplanarConNBlancos xs n 
    | otherwise = x

nBlancos :: Integer -> [Char]
nBlancos 0 = []
nBlancos x = ' ' : nBlancos (x-1)

-- Ejercicio 5

-- a

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada x = otraSumaAcumulada x 0

otraSumaAcumulada :: (Num t) => [t] -> t -> [t]
otraSumaAcumulada [] _ = []
otraSumaAcumulada (x:xs) n = (x+n) : otraSumaAcumulada xs (x+n)

-- b

esDivisible :: Integer -> Integer -> Bool
esDivisible x 1 = True
esDivisible 1 y = False
esDivisible x y
    | x > y = esDivisible (x-y) y
    | x < y && x /= 0 = False
    | otherwise = True

menorDivisor :: Integer -> Integer
menorDivisor n = buscaDivisor n 2

buscaDivisor :: Integer -> Integer -> Integer
buscaDivisor n m
    | esDivisible n m = m
    | otherwise = buscaDivisor n (m+1)

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = composicionDePrimos x : descomponerEnPrimos xs

composicionDePrimos :: Integer -> [Integer]
composicionDePrimos 1 = [1]
composicionDePrimos n
    | n /= menorDivisor n = menorDivisor n : composicionDePrimos (div n (menorDivisor n))
    | n == menorDivisor n = [n]

-- 6

type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

-- a

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos n (x:xs)
    | n == fst x = True
    | otherwise = enLosContactos n xs

-- b

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto (n,t) [] = [(n,t)]
agregarContacto (n,t) (x:xs)
    | n == fst x && t /= snd x = (n,t) : xs
    | otherwise = (x:xs) ++ [(n,t)]

-- c

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto n (x:xs)
    | n == fst x = xs
    | n /= fst x = x : eliminarContacto n xs

-- Ejercicio 7

type Identificacion = Integer
type Ubicacion = Texto
type Estado = (Disponibilidad, Ubicacion)
type Locker = (Identificacion, Estado)
type MapaDeLockers = [Locker]
type Disponibilidad = Bool
