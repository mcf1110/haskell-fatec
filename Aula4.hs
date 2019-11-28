module Aula4 where

--RECORD SYNTAX

data Tipo = Planta | Fogo | Agua  deriving Show

--data Aluno = Aluno String Curso Int deriving Show
data Pokemon = Pokemon { nome :: String, tipo :: Tipo, nivel :: Int} deriving Show

levelUp :: Pokemon -> Pokemon
levelUp (Pokemon n t l) = Pokemon n t (l+1)

--com record syntax
levelUp' :: Pokemon -> Pokemon
levelUp' p = Pokemon (nome p) (tipo p) (nivel p +1)

escolhaBulbasaur :: Int -> Pokemon
escolhaBulbasaur n = Pokemon "Bulbasaur" Planta n

somar :: Int -> Int -> Int -> Int
somar x y z = x + y + z

somar' :: Int -> Int
somar' = somar 1 2

--usando lambda : \x = 1 + 2 + x
--usando curryng : (1+2+)

-- High order function
func :: (Int -> Int) -> Int
func f = 1 + f 5

--Pattern matching com map
vs :: Pokemon -> Pokemon -> Pokemon
vs (Pokemon n1 Agua l1) (Pokemon n2 Fogo l2) = (Pokemon n1 Agua l1)
vs (Pokemon n1 Fogo l1) (Pokemon n2 Agua l2) = (Pokemon n2 Agua l2)

vs (Pokemon n1 Fogo l1) (Pokemon n2 Planta l2) = (Pokemon n1 Fogo l1)
vs (Pokemon n1 Planta l1) (Pokemon n2 Fogo l2) = (Pokemon n2 Fogo l2)

vs (Pokemon n1 Planta l1) (Pokemon n2 Agua l2) = (Pokemon n1 Planta l1)
vs (Pokemon n1 Agua l1) (Pokemon n2 Planta l2) = (Pokemon n2 Planta l2)

vs p1 p2
    | nivel p1 >= nivel p2 = p1
    | otherwise = p2