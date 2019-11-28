# Typeclasses
Define um comportamento para um tipo.

## Instancias

```haskell
data Dia = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo
instance Show Dia where
    show Segunda = "Segunda eh complicado"
    show Terca = "Terca eh dia de Haskell"
    show Sexta = "Sexta eh dia de maldade"
    show Sabado = "Sabado eh legal"
    show _ = "Nao me importo"
```


Quando é feita uma instancia, é bom olhar a documentação, em especial o *Minimal complete definition*

Quando o tipo for kind * -> *, cuidado com a restrição


```haskell
data Bolsa a = Nada | UmaCoisa a | DuasCoisas a a deriving Show

instance (Eq a) => Eq (Bolsa a) where
    Nada == Nada = True
    (UmaCoisa x) == (UmaCoisa y) = x == y
    (DuasCoisas x1 x2) == (DuasCoisas y1 y2) = (x1 == y1 && x2 == y2) || (x1 == y2 && x2 == y1)
```

## Criando nossos proprios Typeclasses


```haskell    
class SimNao a where
simnao :: a -> Bool

instance SimNao Int where
    simnao x = x > 0

instance SimNao Char where
    simnao ' ' = False
    simnao _ = True

instance SimNao Bool where
    simnao = id
```

Toda função criada sob uma classe está automaticamente restringida

```haskell
> :t simnao
simnao :: SimNao a => a -> Bool
```

# Monoide

Um tipo M com uma operação binária (<>) :: M -> M -> M é dito um monoide se satisfizer:

1) Elemento Neutro :
    - e <> x = x
    - x <> e = x
2) Associoatividade:
    - (a <> b) <> c = a <> (b <> c)

```haskell
instance Monoid Bool where
    mempty = True
    mappend = (&&)
```