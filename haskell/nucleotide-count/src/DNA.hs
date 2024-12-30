module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts "" = Right $ fromList [(A, 0), (C, 0), (G, 0), (T,0)]
nucleotideCounts xs =
  case sequence $ map toNucleotide xs of
    Nothing -> Left xs
    Just nuc -> Right $ fromList [(A, countOf A nuc), (C, countOf C nuc), (G, countOf G nuc), (T, countOf T nuc)]
  where
    countOf n ns =
      length $ filter (== n) ns


toNucleotide :: Char -> Maybe Nucleotide
toNucleotide chr =
  case chr of
    'A' -> Just A
    'C' -> Just C
    'G' -> Just G
    'T' -> Just T
    _   -> Nothing



