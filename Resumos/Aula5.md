# Filter

Filtra expressoes baseado em um predicado (função que retorna Bool).

```haskell
filtrarMultiplo7 :: [Int] -> [Int]
filtrarMultiplo7 ns = filter (\n -> mod n 7 == 0) ns

> filtrarMultiplo7 [1..100]
[7,14,21,28,35,42,49,56,63,70,77,84,91,98]
```

# Fold

Propriedade matemática que generaliza contadores e acumuladores.
Ele é recursivo e roda a função para cada elemento da lista, guardando o resultado prévio do função na variável.

```haskell
>foldl (\cont x -> cont + 1) 0 [0..10]
11
```
    
## Exemplo de fatorial no fold

```haskell
foldl (\mult x -> mult * x) 1 [1..5]
```

Ou...

```haskell
foldl (*) 1 [1..5]
```

# Polimorfismo paramétrico

Funções com parâmetros de tipos genéricos.

```haskell
data Foo a = Foo a a
data Bar a b = Bar a b b
```
    
Dessa forma, podemos fazer uma lista encadeada:

```haskell
data Lista a = Vazia | Lista a (Lista a) deriving Show
> Lista 1 (Lista 2 (Lista 3 ( Lista 4 (Vazia))))

empilha :: a -> Lista a -> Lista a
empilha x Vazia = Lista x Vazia
empilha x l = Lista x l
```

Bem como uma árvore binária:

```haskell
data Tree a = Null | Leaf a | Branch a (Tree a) (Tree a) deriving Show
emOrdem :: Tree a -> [a]
emOrdem Null = []
emOrdem (Leaf x) = [x]
emOrdem (Branch r e d) = emOrdem(e) ++ [r] ++ emOrdem(d)

> emOrdem (Branch 10 (Leaf 4) (Branch 15 (Leaf 13) (Leaf 16)))
[4,10,13,15,16]
```