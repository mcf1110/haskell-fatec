# Mônadas

Uma Mônada em uma categoria _C_ é um Monoide na categoria dos Endofuntores de _C_.

Ela deve ter três propriedades.

1. M é um Endofuntor (\*->\*)
2. Return :: a -> m a
3. Join :: m (m a) -> m a

# Bind
A funcao >>= aplica uma funcao em uma monada.