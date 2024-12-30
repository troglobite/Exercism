module SumOfMultiples (sumOfMultiples) where

import Data.List (group, sort)

-- TODO: Find better names

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples [0] _ = 0
sumOfMultiples factors limit = sum $ multiplesList factors limit


multiplesList :: [Integer] -> Integer -> [Integer]
multiplesList is bd = dedup $ concat $ map (multiplesUpToBound bd) is


multiplesUpToBound :: Integer -> Integer -> [Integer]
multiplesUpToBound _ 0 = [0]
multiplesUpToBound bound base = takeWhile (< bound) [base, base * 2..(base * (quot bound base))]


dedup :: (Ord a) => [a] -> [a]
dedup = map head . group . sort

