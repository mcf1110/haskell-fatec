module Aula5 where

filtrarMultiplo7 :: [Int] -> [Int]
filtrarMultiplo7 ns = filter (\n -> mod n 7 == 0) ns

fat :: Int -> Int
fat n = foldl (*) 1 [1..n]

contaPar :: [Int] -> Int
contaPar ns = foldl ehPar 0 ns

ehPar :: Int -> Int -> Int
ehPar cont v
    | even v = cont + 1
    | otherwise = cont
    
--Exercicio 1:
--Faça uma funcao que conte quantas vogais tem em uma palavra

contaVogais :: String -> Int
contaVogais = foldl ehVogal 0

ehVogal :: Int -> Char -> Int
ehVogal cont ch
    | elem ch "AEIOUaeiou" = cont + 1
    | otherwise = cont

--Exercicio 2:
--Faça uma função que retorne a soma dos tamanhos de uma lista de strings

contaTamanhos :: [String] -> Int
contaTamanhos = foldl (\cont str -> cont + length str) 0

--
data Foo a b = Foo a b deriving Show
data Coisa a = Nada | UmaCoisa a | DuasCoisas a a deriving Show
data Lista a = Vazia | Lista a (Lista a) deriving Show

rabo :: Lista a -> Lista a
rabo Vazia = Vazia
rabo (Lista info prox) = prox

empilha :: a -> Lista a -> Lista a
empilha x Vazia = Lista x Vazia
empilha x l = Lista x l

data Tree a = Null | Leaf a | Branch a (Tree a) (Tree a) deriving Show
emOrdem :: Tree a -> [a]
emOrdem Null = []
emOrdem (Leaf x) = [x]
emOrdem (Branch r e d) = emOrdem(e) ++ [r] ++ emOrdem(d)