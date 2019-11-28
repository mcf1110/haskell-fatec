module Aula6 where
import Data.Monoid

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo

instance Show Dia where
    show Segunda = "Segunda eh complicado"
    show Terca = "Terca eh dia de Haskell"
    show Sexta = "Sexta eh dia de maldade"
    show Sabado = "Sabado eh legal"
    show _ = "NAO ME IMPORTO"

data RPS = Pedra | Papel | Tesoura deriving Show

instance Num RPS where
    Pedra + Tesoura = Pedra
    Pedra + Papel = Papel
    Tesoura + Pedra = Pedra
    Tesoura + Papel = Tesoura
    Papel + Pedra = Papel
    Papel + Tesoura = Tesoura
    x + _ = x
    
    Pedra * Tesoura = Papel
    Pedra * Papel = Tesoura
    Papel * Tesoura = Pedra
    Papel * Pedra = Tesoura
    Tesoura * Papel = Pedra
    Tesoura * Pedra = Papel
    x * _ = x
    
    Pedra - Tesoura = Tesoura
    Pedra - Papel = Pedra
    Tesoura - Papel = Papel
    Tesoura - Pedra = Tesoura
    Papel - Pedra = Pedra
    Papel - Tesoura = Papel
    x - _ = x
    
    abs = id
    signum = id
    
    fromInteger x
        | mod x 3 == 0 = Pedra
        | mod x 3 == 1 = Tesoura
        | otherwise = Papel

--QUANDO O TIPO FOR KIND * -> *, cuidado com a restrição
data Bolsa a = Nada | UmaCoisa a | DuasCoisas a a deriving Show

instance (Eq a) => Eq (Bolsa a) where
    Nada == Nada = True
    (UmaCoisa x) == (UmaCoisa y) = x == y
    (DuasCoisas x1 x2) == (DuasCoisas y1 y2) = (x1 == y1 && x2 == y2) || (x1 == y2 && x2 == y1)

class SimNao a where
    simnao :: a -> Bool

instance SimNao Int where
    simnao x = x > 0

instance SimNao Char where
    simnao ' ' = False
    simnao _ = True

instance SimNao Bool where
    simnao = id

negarSimNao :: (SimNao a) => a -> Bool
negarSimNao = not . simnao


--MONOIDE
instance Monoid Bool where
    mempty = False
    mappend = (||)

data And = And Bool deriving Show
data Or = Or Bool deriving Show

instance Monoid And where
    mempty = And True
    mappend (And x) (And y) = And (x && y)

instance Monoid Or where
    mempty = Or False
    mappend (Or x) (Or y) = Or (x || y)

instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Nada
    mappend Nada x = x
    mappend x Nada = Nada
    
    mappend (UmaCoisa x) (UmaCoisa y) = UmaCoisa (x <> y)
    mappend (DuasCoisas a b) (DuasCoisas c d) = DuasCoisas (a <> c) (b <> d)

maiorQue :: (Monoid a, Eq a, Ord a) => a -> Bool
maiorQue x = x <> x > mempty