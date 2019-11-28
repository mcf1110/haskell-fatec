module Capitulo3 where

--1
media :: [Double] -> Double
media xs = (foldl (\soma x -> soma + x) 0.0 xs)/ fromIntegral(length xs)

--2
desvioPadrao :: [Double] -> Double
desvioPadrao xs = sqrt (foldl (\soma x -> soma + (x - m)^2) 0.0 xs / fromIntegral((length xs) - 1)) where m = media xs

--3
data Binario = Um | Zero deriving Show

binMaisUmToInt :: Binario -> Int
binMaisUmToInt Zero = 1
binMaisUmToInt Um = 0

binList :: [Binario] -> [Int]
binList = map binMaisUmToInt

--4
palindromo :: String -> Bool
palindromo string = take (div (length string) 2) string == take (div (length string) 2) (reverse string)

filtrarPalindromos :: [String] -> [String]
filtrarPalindromos = filter palindromo

--5 e 6 eu n to a fim
