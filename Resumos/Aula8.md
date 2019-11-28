# Composição de funções

Dadas duas funcoes `f :: A -> B` e `g :: B -> C`, elas podem ser compostas de forma a criar uma terceira funcao com o formato `A -> C`.

```haskell
dobro:: Int -> Int
dobro = (2*)

tamanho :: String -> Int
tamanho = length

--Composicao do Java
>dobro (tamanho "PHP")
>6

--Composicao do Haskell
>(dobro . tamanho) "PHP"
>6
```

# Teoria das categorias

Uma categoria é uma coleção de objetos e seus morfismos (ligações).

Uma categoria deve seguir 3 axiomas:

1. Para cada x da categoria ob(_C_), existe o morfismo _id_
2. A relação _id_ é o elemento neutro dos morfismos. Ou seja: _f . id = f_
3. A composição de morfismos é associativa: _(f . g) . h = f . (g . h)_

# Funtores Covariantes

Pode ser pensado como um morfismo entre duas categorias.
Mapeia objetos em objetos e morfismos em morfismos.

Todo funtor em Haskell é um Endofuntor. Ou seja, a categoria de entrada é igual à de saída (Hask).

Um Funtor é uma typeclass cuja _definição mínima completa_ é a função fmap, que leva uma função de uma categoria para outra.

```haskell
--Functor f => (a -> b) -> f a -> f b
data Tripla a = Tripla a Int a deriving Show

-- (a -> b) -> Tripla a -> Tripla b
instance Functor Tripla where
    fmap ab (Tripla x i y) = Tripla (ab x) i (ab y)
```

# Funtores Contravariantes

Mapeia objetos em objetos e morfismos e morfismos, invertendo as setas.

# Profuntor

Um funtor que possui dois funtores: um covariante e outro contravariante

------------------

Fun with Profunctors = Phil Freeman