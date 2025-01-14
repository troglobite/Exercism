module CryptoSquare ( encode ) where

import Data.Char ( isAlphaNum, toLower )
import GHC.Float ( float2Int, int2Float )

encode :: String -> String
encode = normalizeString . filterString

filterString :: String -> String
filterString = filter isAlphaNum

normalizeString :: String -> String
normalizeString = filterString . map toLower

chunk :: String -> String
chunk xs = take (chunkSize xs) xs


chunkSize :: Foldable t => t a -> Int
chunkSize = undefined


strLength :: Foldable t => t a -> Int
strLength = length

rows :: Foldable t => t a -> Int
rows = float2Int . sqrt . int2Float . length


-- columns :: Int -> Int
columns str rowCount =
  if rowCount * rowCount < length str
  then columns str (rowCount + 1)
  else rowCount


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

