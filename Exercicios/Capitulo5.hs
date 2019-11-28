module Capitulo5 where
import Data.Monoid

data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving Show
data Produto = Produto Double TipoProduto | Nada deriving Show
--1
instance Monoid Produto where
    mempty = Nada
    mappend (Produto x _) (Produto y _)= Produto (x + y) Total
    mappend (Produto x _) Nada= Produto (x) Total
    mappend Nada (Produto x _)= Produto (x) Total

--2
totalGeral :: [Produto] -> Produto
totalGeral = mconcat

--3
data Min = Min Int deriving (Ord, Eq, Show)

instance Monoid Min where
    mempty = Min (maxBound :: Int)
    mappend (Min x) (Min y) = Min (min x y)

--4
minAll :: [Min] -> Min
minAll = mconcat

--5
data Paridade = Par | Impar deriving Show

class ParImpar a where
    decide :: a -> Paridade

instance ParImpar Int where
    decide x
        | mod x 2 == 0 = Par
        | otherwise = Impar

instance ParImpar [a] where
    decide a
        | mod (length a) 2 == 0 = Par
        | otherwise = Impar

instance ParImpar Bool where
    decide False = Par
    decide True = Impar

--6
data Max = Max Int deriving (Ord, Eq, Show)

instance Monoid Max where
    mempty = Max (minBound :: Int)
    mappend (Max x) (Max y) = Max (max x y)
    
maxAll :: [Max] -> Max
maxAll = mconcat