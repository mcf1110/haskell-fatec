module Capitulo2 where

--1 Faça um novo tipo chamado Metros, que possui um value constructor
--de mesmo nome cujos parâmetros são um Int que representa a dimensão e
--um Double que representa o valor da medida e outro chamado MetragemInvalida.
--Implemente as funções

data Metros = Metros Int Double | MetragemInvalida deriving Show

data Valido = Sim String | Nao deriving Show

data Numero = Numero Double | Erro String deriving Show

data Cripto = Mensagem String | Cifrado String deriving Show

areaQuadrado :: Metros -> Metros
areaQuadrado (Metros 1 x) = Metros 2 (x*x)
areaQuadrado _ = MetragemInvalida

areaRet :: Metros -> Metros ->Metros
areaRet (Metros 1 x) (Metros 1 y) = Metros 2 (x*y)
areaRet _ _ = MetragemInvalida

areaCubo :: Metros -> Metros
areaCubo (Metros 1 x) = Metros 2 (x*x*6)
areaCubo _ = MetragemInvalida

isNomeValido :: String -> Valido
isNomeValido "" = Nao
isNomeValido x = Sim x

dividir :: Numero -> Numero -> Numero
dividir _ (Numero 0) = Erro "Divisao por zero!"
dividir (Numero x) (Numero y) = (Numero (x/y))

encriptar :: Cripto -> Cripto
encriptar (Mensagem x) = Cifrado [succ y| y <-x]
encriptar (Cifrado x) = Cifrado x

decriptar :: Cripto -> Cripto
decriptar (Cifrado x) = Mensagem [pred y | y <-x]
decriptar (Mensagem x) = Mensagem x

encriptarTodos :: [Cripto] -> [Cripto]
encriptarTodos x = map encriptar x

