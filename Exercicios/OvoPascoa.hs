module OvoPascoa where
    import Data.List
    data OvoPascoa = OvoPascoa {nome :: String, preco :: Double} deriving Show
    
    maiorPreco = maximumBy (\x y-> compare (preco x) (preco y))