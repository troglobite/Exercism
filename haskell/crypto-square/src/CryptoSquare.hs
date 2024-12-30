module CryptoSquare ( encode ) where

import Data.Char ( isAlphaNum, toLower )

encode :: String -> String
encode = normalizeString . filterString

filterString :: String -> String
filterString = filter isAlphaNum 

normalizeString :: String -> String
normalizeString = map toLower

chunk :: String -> String
chunk xs = take chunks xs
  where
    chunks = sqrt $ length xs 
