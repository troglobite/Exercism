module CryptoSquare ( encode ) where

import Data.Char ( isAlphaNum, toLower )
import GHC.Float ( int2Float )
import Data.List ( transpose )


encode :: String -> String
encode str =
  unwords $ (padder rs) <$> (transpose $ splitter cols normal)
  where
    normal = normalizeString $ str
    rs = rows normal
    cols = columns rs normal


-- Add a space to strings that are less then row count
padder :: Int -> String -> String
padder col str =
  if length str < col
  then str <> " "
  else str


-- Takes a string and a lowercase copy with only the alpha numeric values
normalizeString :: String -> String
normalizeString = (filter isAlphaNum) . map toLower


-- Takes a string and calculates the amount of rows needed for the square cypher
-- rows = the square root of the length of the string, rounding up
rows :: Foldable t => t a -> Int
rows = round . sqrt . int2Float . length


-- Take the amount of rows and the string and returns and the amount of columns in the squar cypher
-- columns is determined by squaring the row count and adding one until it equals the length of the string
columns :: Foldable t => Int -> t a -> Int
columns rowCount str =
  if rowCount * rowCount < length str
  then columns (rowCount + 1) str
  else rowCount


-- Takes the size of the chunk and a string and returns the string broken up into the chunk sizes
splitter :: Int -> [a] -> [[a]]
splitter _ [] = []
splitter i l = h : splitter i t
  where
    split = splitAt i l
    h = fst split
    t = snd split

