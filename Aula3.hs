module Aula3 where

data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Enum, Show)

--Se so tem um value constructor, pode usar o mesmo nome
data Sozinho = Sozinho deriving Show
 
--Phantom Type
data Nada

-- PATTERN MATCHING
--Na entrada da funcao, um padrao no tipo e testado.
--Caso o teste proceda positivamente, o retorno
--correspondente e executado. Pode haver varios
--padroes constantes, e um variavel.
--Os padroes constantes sao apenas value constructors
--e os variaveis sao incognitas (podem ser ignorados
--com o _)
agenda :: Dia -> String
agenda Domingo = "Dia de descanso"
agenda Sabado = "Dia de balada"
agenda Sexta = "Dia de maldade"
agenda Terca = "Dia de Haskell"
agenda _ = "Dia de trabalho"

-- NUNCA ESQUECA DE FORNECER TODOS OS VALUE CONSTRUCTORS NO PATTERN MATCHING
-- SE FALTAR UM (OU MAIS), A FUNCAO SERA CHAMADA DE FUNCAO PARCIAL.
amanha :: Dia -> Dia
amanha Domingo = Segunda
amanha Segunda = Terca
amanha Terca = Quarta
amanha Quarta = Quinta
amanha Quinta = Sexta
amanha Sexta = Sabado
amanha Sabado = Domingo

--1) Faca uma funcao diaToInt que receba um dia e devolva um int. Sendo 1 para Domingo...7 para sabado
diaToInt :: Dia -> Int
diaToInt Domingo = 1
diaToInt Segunda = 2
diaToInt Terca = 3
diaToInt Quarta = 4
diaToInt Quinta = 5
diaToInt Sexta = 6
diaToInt Sabado = 7

--2) Crie um tipo chamado Day que contenha 7 value constructors representando os dias em ingles
data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Show, Enum)

--3) Faca a funcao traduzir que recebe um Day e retorna o Dia correspondente
traduzir:: Day -> Dia
traduzir Monday = Segunda
traduzir Tuesday = Terca
traduzir Wednesday = Quarta
traduzir Thursday = Quinta
traduzir Friday = Sexta
traduzir Saturday = Sabado
traduzir Sunday = Domingo

--Mais legal (:
traduzirEnum :: Day -> Dia
traduzirEnum d = toEnum(fromEnum d)

data Correncia = Real | Euro | Dolar deriving Show

data Moeda = Moeda Double Correncia deriving Show

--Qnd eu tenho campos, o pattern matching usa parenteses
converterReal :: Moeda -> Moeda
converterReal (Moeda valor Dolar) = Moeda (3.12 * valor) Real
converterReal (Moeda valor Euro) = Moeda (3.3 * valor) Real
converterReal x = x