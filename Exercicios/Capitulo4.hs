module Capitulo4 where

data Tree a = Null | Leaf a | Branch a (Tree a) (Tree a) deriving Show
emOrdem :: Tree a -> [a]
emOrdem Null = []
emOrdem (Leaf x) = [x]
emOrdem (Branch r e d) = emOrdem(e) ++ [r] ++ emOrdem(d)

--1
mapA :: (a -> b) -> Tree a -> Tree b
mapA _ Null = Null
mapA fn (Leaf x) = Leaf (fn x)
mapA fn (Branch r e d) = Branch (fn r) (mapA fn e) (mapA fn d)

--2
somaCinco :: Tree Int -> Tree Int
somaCinco x = mapA (5+) x

--3
data ListaOrd a = El a (ListaOrd a) | Nulo deriving Show
inserir :: (Ord a) => a -> ListaOrd a -> ListaOrd a
inserir x Nulo = El x (Nulo)
inserir x (El y prox)
    | x < y = El x (El y prox)
    | otherwise = El y (inserir x prox)

remover :: (Eq a) => a -> ListaOrd a -> ListaOrd a
remover _ Nulo = Nulo
remover x (El y prox)
    | x == y = prox
    | otherwise = El y (remover x prox)

tamanho :: ListaOrd a -> Int
tamanho Nulo = 0
tamanho (El y prox) = 1 + tamanho prox

--4
somaArvore :: (Num a) => Tree a -> a
somaArvore Null = 0
somaArvore (Leaf x) = x
somaArvore (Branch r e d) = r + somaArvore e + somaArvore d

--5
preOrdem :: Tree a -> [a] --red
preOrdem Null = []
preOrdem (Leaf x) = [x]
preOrdem (Branch r e d) = [r] ++ preOrdem e ++ preOrdem d

posOrdem :: Tree a -> [a] --edr
posOrdem Null = []
posOrdem (Leaf x) = [x]
posOrdem (Branch r e d) = posOrdem e ++ posOrdem d ++ [r]

--6
inserirArvore :: (Ord a) => a -> Tree a -> Tree a
inserirArvore x Null = Leaf x
inserirArvore x (Leaf y)
    |x < y = Branch y (Leaf x) (Null)
    |otherwise = Branch y (Null) (Leaf x)
inserirArvore x (Branch r e d)
    |x < r = Branch r (inserirArvore x e) d
    |otherwise = Branch r e (inserirArvore x d)

--7
inserirVarios :: (Ord a) => [a] -> Tree a -> Tree a
inserirVarios elementos arvore = foldl (\arv x -> inserirArvore x arv) arvore elementos

--extra FOLD ARVORE
foldA :: (a -> b -> a) -> a -> Tree b -> a
foldA fn acc Null = acc
foldA fn acc (Leaf val) = fn acc val
foldA fn acc (Branch r e d) = foldA fn ( fn (foldA fn acc e) r) d