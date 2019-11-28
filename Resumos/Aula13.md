# 1. Aplicação de função

## 1.1 $
`$ :: (a -> b) -> a -> b`

Função sem contêiner e valor sem contêiner

Ex: `dobro $ 5`

## 1.2 <$>

`<$> :: Functor f => (a -> b) -> f a -> f b`

Função sem contêiner e valor com contêiner

Ex: `dobro <$> [5]`

## 1.3 <*>

`<*> :: Applicative f => f (a -> b) -> f a -> f b`

Função com contêiner e valor com contêiner

Ex: `[dobro] <*> [5]`