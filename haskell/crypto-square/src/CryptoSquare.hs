module CryptoSquare ( encode ) where

import Data.Char ( isAlphaNum, toLower )
import GHC.Float ( float2Int, int2Float )
import Data.List

encode :: String -> String
encode str =
  insertEvery c ' ' s
  where
    s = normalizeString . filterString $ str
    r = rows s
    c = columns r s


filterString :: String -> String
filterString = filter isAlphaNum


normalizeString :: String -> String
normalizeString = filterString . map toLower


rows :: Foldable t => t a -> Int
rows = float2Int . sqrt . int2Float . length


columns :: Foldable t => Int -> t a -> Int
columns rowCount str =
  if rowCount * rowCount < length str
  then columns (rowCount + 1) str
  else rowCount


breakIntoColumns :: String -> Int -> [String]
breakIntoColumns str colCount =
  words $ insertEvery colCount ' ' str


insertEvery :: Int -> a -> [a] -> [a]
insertEvery 0 x xs = xs
insertEvery i x [] = []
insertEvery i x xs
  | length xs < i = xs
  | otherwise = take i xs ++ [x] ++ insertEvery i x (drop i xs)

-- remove punctuation and lowercase
-- calculate the size of each chunk using the sqrt of the length of the string
-- create new sublist's based off of chunk size


-- Example Chunk Size:
-- length of a given string: 54
-- squareroot of 54: 7.34846
-- 7 * 7 = 49
-- 7 * 8 = 56
-- rows = 7
-- columns = 8
-- spaces needed: 56 - 54 = 2

-- Need to break the string up into columns ex: ["ifmanwas", "meanttos", "tayonthe", "groundgo", "dwouldha", "vegivenu", "sroots  "
-- finding a way to map (take columns) over the string


-- Data.List.transpose can be used to build the final string once broken up in a list of substrings

-- Need to add the remaining spaces to last element, sqrt is 56 and string length is 54 so i need to add 2 spaces to end
