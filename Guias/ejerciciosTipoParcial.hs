{- HLINT ignore "Use map" -}
{- HLINT ignore "Use foldr" -}
quitarElemento :: (Eq t) => [t] -> t -> [t]
quitarElemento [] _ = []
quitarElemento (x:xs) e
    | x == e = quitarElemento xs e
    | otherwise = x : quitarElemento xs e

cantidadDeRepeticiones :: (Eq t) => [t] -> t -> Integer
cantidadDeRepeticiones [] _ = 0
cantidadDeRepeticiones (x:xs) e
    | x == e = 1 + cantidadDeRepeticiones xs e
    | otherwise = cantidadDeRepeticiones xs e

generarStock :: [String] -> [(String, Integer)]
generarStock [] = []
generarStock (x:xs) = (x, cantidadDeRepeticiones (x:xs) x) : generarStock (quitarElemento xs x)

stockDeProducto :: [(String, Integer)] -> String -> Integer
stockDeProducto [] _ = 0
stockDeProducto ((producto, stock):xs) p
    | producto == p = stock
    | otherwise = stockDeProducto xs p

precio :: String -> [(String, Float)] -> Float
precio s ((producto, precio'):xs)
    | s == producto = precio'
    | otherwise = precio s xs

dineroEnStock :: [(String, Integer)] -> [(String, Float)] -> Float
dineroEnStock [] _ = 0
dineroEnStock ((producto, stock):xs) p = precio producto p * fromInteger stock + dineroEnStock xs p

aplicarOferta :: [(String, Integer)] -> [(String, Float)] -> [(String, Float)]
aplicarOferta [] _ = []
aplicarOferta ((producto, stock):xs) p
    | stock > 10 = (producto, precio producto p * 0.8) : aplicarOferta xs p
    | otherwise = (producto, precio producto p) : aplicarOferta xs p

-- -- -- --

type Fila = [Integer]
type Tablero = [Fila]
type Posicion = (Integer, Integer)
type Camino = [Posicion]

maximoFila :: Fila -> Integer
maximoFila [] = 0
maximoFila [x] = x
maximoFila (x:xs)
    | x <= head xs = maximoFila xs
    | x > head xs = maximoFila (x : tail xs)


maximo :: Tablero -> Integer
maximo [x] = maximoFila x
maximo (x:xs)
    | maximoFila x <= maximoFila (head xs) = maximo xs
    | maximoFila x > maximoFila (head xs) = maximo (x : tail xs)

repeticiones :: Integer -> Fila -> Integer
repeticiones _ [] = 0
repeticiones n (x:xs)
    | n == x = 1 + repeticiones n xs
    | otherwise = repeticiones n xs

concatenarTablero :: Tablero -> Fila
concatenarTablero [] = []
concatenarTablero (x:xs) = x ++ concatenarTablero xs

masRepetidosAux :: Fila -> Integer
masRepetidosAux [x] = x
masRepetidosAux (x:xs)
    | repeticiones x (x:xs) < repeticiones (head xs) (x:xs) = masRepetidosAux xs
    | otherwise = masRepetidosAux (x : tail xs)
    
masRepetidos :: Tablero -> Integer
masRepetidos t = masRepetidosAux (concatenarTablero t)

tablero = [[1,1,2],[3,5,8],[13,21,34]]

valorDeCelda :: Tablero -> Posicion -> Integer
valorDeCelda (x:xs) (f,c)
    | c /= 1 = valorDeCelda xs (f, c-1)
    | otherwise = valorDeCeldaEnFila x (f,c)

valorDeCeldaEnFila :: Fila -> Posicion -> Integer
valorDeCeldaEnFila (f:fs) (x,y)
    | x /= 1 = valorDeCeldaEnFila fs (x-1,y)
    | otherwise = f

valoresDeCamino :: Tablero -> Camino -> [Integer]
valoresDeCamino _ [] = []
valoresDeCamino t (c:cs) = valorDeCelda t c : valoresDeCamino t cs

fibonacci :: Integer -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci 2 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

esCaminoFibo :: [Integer] -> Integer -> Bool
esCaminoFibo [] _ = True
esCaminoFibo (x:xs) n
    | x == fibonacci n = esCaminoFibo xs (n+1)
    | otherwise = False

-- -- -- --

divisoresAux :: Integer -> Integer -> [Integer]
divisoresAux n d
    | n > d && mod n d == 0 = d : divisoresAux n (d+1)
    | n > d = divisoresAux n (d+1)
    | otherwise = [] 

divisoresPropios :: Integer -> [Integer]
divisoresPropios n = divisoresAux n 1

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

sonAmigos :: Integer -> Integer -> Bool
sonAmigos n m = sumatoria (divisoresPropios n) == m && sumatoria (divisoresPropios m) == n

esPerfecto :: Integer -> Bool
esPerfecto n = sumatoria (divisoresPropios n) == n

buscaNumerosPerfectos :: Integer -> Integer -> [Integer]
buscaNumerosPerfectos _ 0 = []
buscaNumerosPerfectos n i
    | esPerfecto n = n : buscaNumerosPerfectos (n+1) (i-1)
    | otherwise = buscaNumerosPerfectos (n+1) i

primerosNPerfectos :: Integer -> [Integer]
primerosNPerfectos 0 = []
primerosNPerfectos n = buscaNumerosPerfectos 1 n

amigosParticulares :: [Integer] -> [(Integer, Integer)]
amigosParticulares [] = []
amigosParticulares [x] = []
amigosParticulares (x:xs)
    | sonAmigos x (head xs) = (x, head xs) : amigosParticulares (x : tail xs)
    | otherwise = amigosParticulares (x : tail xs)

listaDeAmigos :: [Integer] -> [(Integer, Integer)]
listaDeAmigos [] = []
listaDeAmigos (x:xs) = amigosParticulares (x:xs) ++ listaDeAmigos xs