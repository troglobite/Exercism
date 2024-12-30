module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA ""     = Right ""
toRNA xs = sequence $ map convertDNAtoRNA' xs

convertDNAtoRNA' :: Char -> Either Char Char
convertDNAtoRNA' dna =
  case dna of
    'G' -> Right 'C'
    'C' -> Right 'G'
    'T' -> Right 'A'
    'A' -> Right 'U'
    e   -> Left e

