module Aula2 where

(^*^) :: Int-> Int -> Int
(^*^) a b = a + b

queijo :: Int -> Int -> [Int]
queijo x y = [div x y, mod x y]

exUm :: [Int]
exUm = [2^x | x <- [0..8]]

exDois :: [Int]
--[x | x < [1,3 .. 23], x /= 11, x=/13]
exDois = [x | x <- [1..23], mod x 2 /= 0, x /=11, x/=13]

exTres :: [String]
exTres = ["OLA " ++ x | x <- ["JAVA", "PHP", "HASKELL"]]

-- Lista: numero indeterminado de elementos de um tipo
-- Tupla: numero fixo de elementos de varios tipos

somart :: (Int, Int) -> Int
somart (x , y) = x + y

trd :: (Int, Int, Int) -> Int
trd (t, o, p) = p


baralho :: [(Char, String)]
baralho = [(n, naipe) | n <- ['2'..'9']++['0','J','Q', 'K', 'A'], naipe <- ["Copas", "Espadas", "Ouros", "Paus"]]