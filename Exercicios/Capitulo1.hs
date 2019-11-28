module Capitulo1 where
data Pergunta = Sim | Nao deriving Show
data Temperatura = Celsius | Farenheit | Kelvin deriving Show
data Jogada = Pedra | Papel | Tesoura | Empate deriving Show
data Unidade = Inch | Yard | Foot deriving Show
data Mes = Jan | Fev | Mar | Abr | Mai | Jun | Jul | Ago | Set | Out | Nov | Dez
data Binario = Zero | Um deriving Show
data Funcao = Soma2 | Maior | Menor | Mult2 
--Exercício 1.1 Crie o tipo Pergunta com os value constructors Sim ou Nao. Faça
--as funções abaixo determinando seus tipos explicitamente
--  1. pergNum: recebe via parâmetro uma Pergunta e retorne 0 para Nao e 1
--      para Sim;
pergNum :: Pergunta -> Int
pergNum Sim = 1
pergNum Nao = 0
--  2. listPergs: recebe via parâmetro uma lista de Perguntas e retorna 0’s e 1’s
--      correspondentes aos constructores contidos na lista;
listPergs :: [Pergunta] -> [Int]
listPergs lista = [pergNum x | x <- lista]
--  3. and’: recebe duas Perguntas como parâmetro e retorna a tabela verdade do
--      and lógico usando Sim como verdadeiro e Nao como falso.
and' :: Pergunta -> Pergunta -> Pergunta
and' Sim Sim = Sim
and' _ _ = Nao
--  4. or’: Idem acima, porém, deve ser usado o ou lógico.
or' :: Pergunta -> Pergunta -> Pergunta
or' Nao Nao = Nao
or' _ _ = Sim
--  5. not’: Idem aos anteriores, porém, usando o not lógico.
not' :: Pergunta -> Pergunta
not' Nao = Sim
not' Sim = Nao

--Exercício 1.2 Gere as listas [1,11,121,1331,14641,161051,1771561] e
--[1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]
doisA :: [Int]
doisA = [11^x | x <- [0..6]]

doisB :: [Int]
doisB = [x | x <- [0..40], mod x 4 /= 0]

--Exercicio 1.3 Faça o tipo Temperatura que pode ter valores Celsius, Farenheit
--ou Kelvin. Implemente as funções:
--  1. converterCelsius: recebe um valor double e uma temperatura e faz a conversão
--      para Celsius.
converterCelsius :: Double -> Temperatura -> Double
converterCelsius x Celsius = x
converterCelsius x Farenheit = (x - 32.0) / 1.8
converterCelsius x Kelvin = x - 273.15
--  2. converterKelvin: recebe um valor double e uma temperatura e faz a conversão
--      para Kelvin.
converterKelvin :: Double -> Temperatura -> Double
converterKelvin x Kelvin = x
converterKelvin x Farenheit = (x - 459.67) / 1.8
converterKelvin x Celsius = x + 273.15
--  3. converterFarenheit: recebe um valor double e uma temperatura e faz a conversão
--      para Farenheit.
converterFarenheit :: Double -> Temperatura -> Double
converterFarenheit x Farenheit = x
converterFarenheit x Kelvin = x * 1.8  - 459.67
converterFarenheit x Celsius = x * 1.8 + 32.0

--Exercício 1.4 Faça uma função que simule o vencedor de uma partida de pedra,
--papel e tesoura usando tipos criados (você não poderá usar qualquer outro tipo
--que não seja criado usando o data). Casos de empate devem ser considerados em
--seu tipo.
partida :: Jogada -> Jogada -> Jogada
partida Pedra Papel = Papel
partida Papel Pedra = Papel
partida Papel Tesoura = Tesoura
partida Tesoura Papel = Tesoura
partida Tesoura Pedra = Pedra
partida Pedra Tesoura = Pedra
partida _ _ = Empate

--Exercício 1.5 Faça uma função que retorne uma string com todas as vogais
--maiúsculas e minúsculas eliminadas de uma string passada por parâmetro usando

cinco :: String -> String
cinco input = [c | c <- input, not(elem c ['A'..'Z']), not(elem c ['a'..'z'])]

--Exercício 1.6
--A. ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB", "AgBB"]
--B. [5,8,11,17,20,26,29,32,38,41]
--C. [1.0,0.5,0.25,0.125,0.0625,0.03125]
seisA :: [String]
seisA = ['A':char:"BB"| char <- ['a'..'g']]

seisB :: [Int]
seisB = [x | x <- [5,8..41], x /= 14, x/= 23, x /= 35]

seisC :: [Double]
seisC = [1/(2^x) | x <- [1..6]]

--Exercício 1.7 Sabe-se que as unidades imperiais de comprimento podem ser
--Inch, Yard ou Foot (há outras ignoradas aqui). Sabe-se que 1in = 0.0254m,
--1yd = 0.9144m, 1ft = 0.3048. Faça a função converterMetros que recebe a unidade
--imperial e o valor correspondente nesta unidade e retorna o valor em metros.
--Faça a função converterImperial que recebe um valor em metros e a unidade de
--conversão e retorna o valor convertido para a unidade desejada.
converterMetros :: Double -> Unidade -> Double
converterMetros x Inch = x *0.0254
converterMetros x Yard = x *0.9144
converterMetros x Foot = x *0.3048

converterImperial :: Double -> Unidade -> Double
converterImperial x Inch = x /0.0254
converterImperial x Yard = x /0.9144
converterImperial x Foot = x /0.3048

--Exercício 1.8 Faça um novo tipo chamado Mes que possui como valores todos
--os meses do ano. Implemente
--  1. a função checaFim que retorna o número de dias que cada mês possui (considere
--      Fevereiro tendo 28 dias).
--  2. a função prox que recebe um mês atual e retorna o próximo mês.
--  3. a função estacao que retorna a estacao do ano de acordo com o mes e com
--      o hemisfério. Use apenas tipos criados pela palavra data aqui.
checaFim :: Mes -> Int
checaFim Fev = 28
checaFim Abr = 30
checaFim Jun = 30
checaFim Set = 30
checaFim Nov = 30
checaFim _ = 31

--Exercício 1.9
-- Faça uma função que receba uma String e retorne True se esta for
-- um palíndromo, False caso contrário.
palindromo :: String -> Bool
--palindromo string = take (div (length string) 2) string == take (div (length string) 2) (reverse string)

--Versao recursiva porque sim
palindromo string = if(length string > 1) then (if(head string == last string) then palindromo (tail (init string)) else False) else True
--OBS: como é uma lista ligada, o (length string > 1) poderia ser substituido por algo como "string[0] tem proximo?", aumentando a eficiencia, pq ele ta calculando o length n vezes


--Exercício 1.10
--Faça uma função que elimine todos os números pares, todos os
--ímpares múltiplos de 7 e negativos de uma lista de inteiros passado via parâmetro.
--Você deve retorna esta lista em ordem reversa em comparação a do parâmetro.
dez :: [Int] -> [Int]
dez input = [x | x <- input, mod x 2  /= 0, mod x 7 /= 0, x >= 0]

--Exercício 1.11
-- Faça uma função que recebe três strings x, y e z como parâmetro.
-- A função retorna uma tupla com três coordenadas contendo a ordem reversa em
-- cada. A primeira coordenada deve conter string reversa do primeiro parâmetro e
-- assim por diante.
onze ::  String -> String -> String -> (String, String, String)
onze x y z = (reverse(x), reverse(y), reverse(z))

--Exercício 1.12
-- [1,10,19,28,37,46,55,64]
-- [2,4,8,10,12,16,18,22,24,28,30]
-- [’@’,’A’,’C’,’D’,’E’,’G’,’J’,’L’]
dozeA :: [Int]
dozeA = [1,10..64]

dozeB :: [Int]
dozeB = [x | x <- [2,4..30], not (elem x [6, 14, 20, 26])]

dozeC :: [Char]
dozeC = [x | x <- ['@'..'L'], not (elem x "BFHK")]

--Exercício 1.13
-- Faça uma função, chamada revNum, que receba uma String s e
-- um Int n. Esta deverá retornar as n primeiras letras em ordem reversa e o restante
-- em sua ordem normal.
revNum :: Int -> String -> String
revNum n s = reverse(take n s) ++ drop n s

--Exercício 1.14 Crie o tipo de dado Binario que pode ser Zero ou Um. Crie também
--o tipo de dado Funcao que pode ser Soma2, Maior, Menor e Mult2. Faça a
--função aplicar que recebe uma Funcao e dois Binarios seu retorno consiste em
--executar a operação desejada.
aplicar :: Funcao -> Binario -> Binario -> Binario
aplicar Soma2 Zero Zero = Zero
aplicar Soma2 Um Um = Zero
aplicar Soma2 _ _ = Um

aplicar Mult2 Um Um = Um
aplicar Mult2 _ _ = Zero

aplicar Maior Zero Zero= Zero
aplicar Maior _ _ = Um

aplicar Menor Um Um = Um
aplicar Menor _ _ = Zero

--Exercício 1.15 Faça uma função, chamada binList, usando list compreeshion
--que recebe uma lista de Binarios (ver exercício acima) e retorna outra lista com
--elemento somado Um e convertido para Int.
toInt :: Binario -> Int
toInt Um = 1
toInt Zero = 0
binList :: [Binario] -> [Int]
binList lista = [toInt (aplicar Soma2 Um x) | x <- lista]