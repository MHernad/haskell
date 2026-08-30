import Text.XHtml (base)
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x <= 100
    then x*2
    else x

removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']] -- Como en matemática (x | x pertenece a R)
addThree x y z = x + y + z

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1) -- Recursividad

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a) -- Pattern matching
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

head' :: [a] -> a
head' [] = error "Lista vacio"
head' (x:_) = x

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs -- pattern matching y recursividad

-- as patterns => @

capital :: String -> String
capital "" = "String vacio bolas"
capital all@(x:xs) = "La primera letra de " ++ all ++ " es " ++ [x]

-- Guards

density :: (RealFloat a) => a -> a -> String
density m v
    | dense < air = "We all float down here. You'll float too"
    | dense <= water = "BOOOOOOOOOOORING"
    | otherwise = "If it's sink or swim you're cooked"
    where dense = m/v
          (air, water) = (1.2, 1000.0)

max' :: (Ord a) => a -> a -> a
max' a b
    | a > b = a
    | otherwise = b

densities :: (RealFloat a) => [(a,a)] -> [a]
densities xs = [density m v | (m,v) <- xs]
    where density mass volume = mass / volume