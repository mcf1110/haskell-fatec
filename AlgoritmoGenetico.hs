module AlgoritmoGenetico where
import Data.List

data Chromo = Chromo [Bool] deriving (Show)
class Individuo a where
    getFitness :: a -> Int
    chromosomeLen :: a -> Int
    crossover :: Int -> a -> a -> (a,a)
    mutate :: Int -> a -> a

boolToInt :: [Bool] -> Int
boolToInt ls = fst $ foldr (\x (res, index) -> if x then ((res + 2^index), index+1) else (res, (index + 1))) (0,0) ls

instance Individuo Chromo where
    getFitness (Chromo ls)= boolToInt ls
    chromosomeLen (Chromo ls) = length ls
    crossover pos (Chromo i) (Chromo j) = (Chromo (take pos i ++ drop pos j), Chromo(take pos j ++ drop pos i))
    mutate p (Chromo ls) =
        let change pos (x:xs) = if pos == 0 then (not x):xs else x:change (pos-1) xs
        in (Chromo (change p ls))

torneio :: (Individuo a) => [a] -> [a]
torneio atual = [x | x<-atual] --maximumBy (compare (getFitness x) (getFitness y)) [x,y] |x <- shuffled atual, y <- shuffled atual
    where qtde = length(atual)

novaGeracao atual = atual