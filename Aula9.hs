module Aula9 where
infixl 0 |>

(|>) :: a -> (a->b) -> b
(|>) = flip ($)