module Aula13 where
import Control.Applicative

data Departamento = Departamento {nome :: String, sigla :: String} deriving Show

data Form a = Form a deriving Show

instance Functor Form where
    fmap ab (Form a) = Form $ ab a

instance Applicative Form where
    pure = Form
    (Form ab) <*> (Form a) = Form $ ab a