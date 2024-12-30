module Anagram (anagramsFor) where

import Data.List ( sort )
import Data.Char ( toLower )

anagramsFor :: String -> [String] -> [String]
anagramsFor [] _ = []
anagramsFor _ [] = []
anagramsFor subject canidates =
  filter (anagramCheck subject) $ filterSubject subject canidates


anagramCheck :: String -> String -> Bool
anagramCheck subject canidate =
  alphabetize subject == alphabetize canidate


filterSubject :: String -> [String] -> [String]
filterSubject subject = filter (\x -> lowerCased subject /= lowerCased x)


alphabetize :: String -> String
alphabetize = sort . lowerCased


lowerCased :: String -> String
lowerCased = map toLower


