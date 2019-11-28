module Aula8 where

--Functor f => (a -> b) -> f a -> f b
data Tripla a = Tripla a Int a deriving Show

-- (a -> b) -> Tripla a -> Tripla b
instance Functor Tripla where
    fmap ab (Tripla x i y) = Tripla (ab x) i (ab y)

data Arvore a = Raiz a (Arvore a) (Arvore a) | Folha a | Nulo deriving Show

instance Functor Arvore where
    fmap fn (Raiz info e d) = Raiz (fn info) (fmap fn e) (fmap fn d)
    fmap fn (Folha a) = Folha (fn a)
    fmap _ Nulo = Nulo

safeDiv :: Double -> Double -> Maybe Double
safeDiv _ 0 = Nothing
safeDiv x y = Just (x/y)

--FUNTOR CONTRAVARIANTE

class Contravariant f where
    contramap :: (a->b) -> f b -> f a

data Pred a = Pred {runPred :: a -> Bool}

--(a -> b) -> Pred b -> Pred a
instance Contravariant Pred where
    contramap ab (Pred bBool) = Pred (bBool . ab)
    


--PROFUNTOR

class Profunctor p where
    dimap :: (a->b) -> (c->d) -> p b c -> p a d

--se p = ->
-- dimap :: (a->b) -> (c->d) -> (b-> c) -> (a -> d)
-- dimap :: ab ->
instance Profunctor (->) where
    dimap ab cd pbc =  cd . pbc . ab

data Forget r a b = Forget {runForget :: a -> r}
--Pred = Forget Bool a b
instance Profunctor (Forget r) where
    dimap ab _ (Forget br) = Forget (br . ab)

data Star f a b = Star {runStar :: a -> f b}

instance (Functor f) => Profunctor (Star f) where
    dimap ab cd (Star bfc) = Star (fmap cd . bfc . ab)


--Star [] Int
range :: Int -> [Int]
range x = [0..x]