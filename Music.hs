module Music where

data Tone = C | D | E | F | G | A | B deriving (Eq, Show)

data Variance = Natural | Sharp | Flat | DSharp | DFlat deriving (Eq)
instance Show Variance where
    show Natural = ""
    show Sharp = "#"
    show Flat = "b"

data Note = Note Tone Variance deriving (Eq)
instance Show Note where
    show (Note t v) = show t ++ show v

instance Enum Note where
    fromEnum (Note C Natural) = 0
    fromEnum (Note C Sharp) = 1
    fromEnum (Note D Flat) = 1
    fromEnum (Note D Natural) = 2
    fromEnum (Note D Sharp) = 3
    fromEnum (Note E Flat) = 3
    fromEnum (Note E Natural) = 4
    fromEnum (Note E Sharp) = 5
    fromEnum (Note F Flat) = 4
    fromEnum (Note F Natural) = 5
    fromEnum (Note F Sharp) = 6
    fromEnum (Note G Flat) = 7
    fromEnum (Note G Natural) = 7
    fromEnum (Note G Sharp) = 8
    fromEnum (Note A Flat) = 8
    fromEnum (Note A Natural) = 9
    fromEnum (Note A Sharp) = 10
    fromEnum (Note B Flat) = 10
    fromEnum (Note B Natural) = 11
    fromEnum (Note B Sharp) = 0
    fromEnum (Note C Flat) = 11
    --------
    toEnum 0 = (Note C Natural)
    toEnum 1 = (Note C Sharp)
    toEnum 2 = (Note D Natural)
    toEnum 3 = (Note D Sharp)
    toEnum 4 = (Note E Natural)
    toEnum 5 = (Note F Natural)
    toEnum 6 = (Note F Sharp)
    toEnum 7 = (Note G Natural)
    toEnum 8 = (Note G Sharp)
    toEnum 9 = (Note A Natural)
    toEnum 10 = (Note A Sharp)
    toEnum 11 = (Note B Natural)
    toEnum x = toEnum (mod x 12)

type Scale = [Note]
type Triad = (Note, Note, Note)
type Tetrad = (Note, Note, Note, Note)

data TetradType = Maj7 | Maj7p | Min7 | Min7p

data ScaleRule = Major | Minor

transpose :: Int -> Note  -> Note
transpose i n = toEnum $ fromEnum n + i

getScale :: Note -> ScaleRule -> Scale
getScale n Major = [transpose interval n | interval <- [0,2,4,5,7,9,11,12]]
getScale n Minor = [transpose interval n | interval <- [0,2,3,5,7,8,10,12]]

getRelativeMinor :: Note -> Note
getRelativeMinor = transpose (-3)

getRelativeMinorScale :: Note -> Scale
getRelativeMinorScale n = getScale (getRelativeMinor n) Minor

getTriad :: Note -> ScaleRule -> Triad
getTriad n Major = (n, transpose 4 n, transpose 7 n)
getTriad n Minor = (n, transpose 3 n, transpose 7 n)

getTetrad :: Note -> TetradType -> Tetrad
getTetrad n Maj7 = (n, transpose 4 n, transpose 7 n, transpose 10 n)
getTetrad n Maj7p = (n, transpose 4 n, transpose 7 n, transpose 11 n)
getTetrad n Min7 = (n, transpose 3 n, transpose 7 n, transpose 10 n)
getTetrad n Min7p = (n, transpose 3 n, transpose 7 n, transpose 11 n)

isTriadInHarmonicField :: Triad -> Scale -> Bool
isTriadInHarmonicField (root, third, fifth) scale = and [root `elem` scale, third `elem` scale, fifth `elem` scale]

isTetradInHarmonicField :: Tetrad -> Scale -> Bool
isTetradInHarmonicField (root, third, fifth, seventh) scale = and [root `elem` scale, third `elem` scale, fifth `elem` scale, seventh `elem` scale]

getTriadInversions:: Triad -> [Triad]
getTriadInversions (root, third, fifth) = [(root, third, fifth), (third, fifth, root), (fifth, root, third)]

getTetradInversions:: Tetrad -> [Tetrad]
getTetradInversions (root, third, fifth, seventh) = [(root, third, fifth, seventh), (third, fifth,seventh, root), (fifth,seventh, root, third),(seventh, root, third, fifth)]

getTriadProgression :: Note -> ScaleRule -> [Int] -> [Triad]
getTriadProgression n rulee ls = [head $ filter (\t -> isTriadInHarmonicField t scale) [getTriad (transpose x n) Major, getTriad (transpose x n) Minor] | x <- ls ] where scale = getScale n rule