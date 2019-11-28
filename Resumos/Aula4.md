# Aula 4

## Record Syntax

É uma maneira de prover um acesso a campos de um value constructor.
O record syntax funciona de maneira análoga com os getters (orientação a objetos).

```haskell
data Aluno = Aluno { nome :: String, curso :: Curso, idade :: Int} deriving Show

>:t idade
>idade :: Aluno -> Int
    
>idade (Aluno "Matheus" ADS 20)
>20
```

## Currying

É o ato de passar __menos__ argumentos para uma função.

O efeito é que os argumentos faltantes transformar-se-ão em parâmetros de uma nova função.

```haskell
>:t (Aluno "Matheus" ADS)
>Aluno :: Int -> Aluno
```
    
Se você passar um Int como argumento para o value constructor Aluno, teremos construído, de fato, um Aluno.

```haskell
>:t (Aluno "Matheus")
>Aluno :: Curso -> Int -> Aluno
    
>:t (Aluno)
>Aluno :: String-> Curso -> Int -> Aluno
```
    
## Eta Redução

Devido ao Currying, é possível utilizar a seguinte sintaxe:

```haskell
somar :: Int -> Int -> Int -> Int
somar x y z = x + y + z
    
somar' :: Int -> Int
somar' = somar 1 2
```
    
Isso acontece porque:

```haskell 
>:t somar 1 2
>somar 1 2 :: Int -> Int
```
    
## Lamba

São funções sem nome (funções anônimas).

São escritas usando a seguinte sintaxe:

```haskell
\x -> x * x
```
    
O "\\" é feito para lembrar um Lambda (λ)

## High Order Function

É uma função que __recebe__ uma outra função como parâmetro ou __retorna__ uma outra função.

```haskell
func :: (Int -> Int) -> Int
func f = 1 + f 5

>func (2*)
>11
```

## Map

Função que "joga para dentro de uma lista" outra funcao.

A função será calculada tendo como argumento cada elemento da lista.

```haskell
>map (>0) [-1,0,1, -36, 8]
>[False, False, True, False, True]
```
    
Map é uma High Order Function
    
## Guards

É uma maneira de termos uma estrutura condicional Booleana.

Os guards são calculados em ordem até esgotarem todos os casos ou encontrar o _otherwise_.

```haskell
modulo :: Double -> Double
modulo x
    | x >= 0 = x
    | otherwise = -x
```