module CryptoSquare ( encode ) where

import Data.Char ( isAlphaNum, toLower )
import GHC.Float ( float2Int, int2Float )
import Data.List


testEncode =
  encode "If man was meant to stay on the ground, god would have given us roots."

-- encode :: String -> String
encode str =
  -- chunk (cols str) str
  unwords . transpose $ splitter (cols normal) normal
  where
    normal = filterString . normalizeString $ str
    -- Normalize  strin
    ns s = normalizeString s
    -- filter out only alphanums
    fs s = filterString $ ns s
    -- calculate rows
    rs s = rows $ fs s
    -- calculate columns
    cols s = columns (rows s) (fs s)
    -- break string up into chunks based on columns
    chunk c s = insertEvery c ' ' (fs s)
    -- transpose lists
    trans cs = transpose cs
    -- add extra spaces so every chunk is same size



-- Takes a string and filters out everything that is not alpha-numeric
filterString :: String -> String
filterString = filter isAlphaNum


-- Takes a string and a lowercase copy with only the alpha numeric values
normalizeString :: String -> String
normalizeString = filterString . map toLower


-- Takes a string and calculates the amount of rows needed for the square cypher
-- rows = the square root of the length of the string
rows :: Foldable t => t a -> Int
rows = float2Int . sqrt . int2Float . length


-- Take the amount of rows and the string and returns and the amount of columns in the squar cypher
-- columns is determined by squaring the row count and adding one until it equals the length of the string
columns :: Foldable t => Int -> t a -> Int
columns rowCount str =
  if rowCount * rowCount < length str
  then columns (rowCount + 1) str
  else rowCount


-- Works
-- Takes the size of the chunk and a string and returns the string broken up into the chunk sizes
splitter :: Int -> [a] -> [[a]]
splitter _ [] = []
splitter i l = h : splitter i t
  where
    split = splitAt i l
    h = fst split
    t = snd split


-- Works
-- Inserts the provided character at the desired desitination of a String
insertEvery :: Int -> Char -> [Char] -> [Char]
insertEvery 0 x xs = xs
insertEvery i x [] = []
insertEvery i x xs
  | length xs < i = xs
  | otherwise = take i xs ++ [x] ++ insertEvery i x (drop i xs)


-- Function that starts at the end of the string and adds the missing row count
-- one at a time every column count
insertAtIndex _ _ [] = []
insertAtIndex i x xs = (take i xs) ++ [x] ++ (drop i xs)


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
