
module Luhn (isValid) where

import Data.List (filter, foldl, mapAccumL, reverse)
import Data.Char (isDigit, digitToInt)

testLuhn = (isValid "4539 3195 0343 6467") == True

isValid :: String -> Bool
isValid n
        | length n <= 1 = False
        | otherwise = checkSum . doubled . integered . filtered $ n


-- strip spaces from string and non-digits from strings
filtered :: String -> String
filtered = filter isDigit

-- convert to list of numbers
integered :: [ Char ] -> [ Int ]
integered s = digitToInt <$> s

-- double every other digit starting from the right
doubled :: [ Int ] -> [ Int ]
doubled is =
  -- snd $ mapAccumL (\a x -> if even a then (increment a, x) else (increment a, subNine $ double x)) 1 is
  case is of
    [] -> []
    [_x] -> []
    [x, y] -> [subNine $ double x, y]
    (x:y:z) -> subNine (double x) : y : doubled z


--doubled' =
--  scanr1 (everyOther double)


everyOther ::( a -> a ) -> [ a ] -> [ a ]
everyOther _ [] = []
everyOther _ [_x] = []
everyOther f (x:y:xs) = x : f y : everyOther f xs


double :: Int -> Int
double = (*) 2

-- if digit is GT 9 subtract 9 from product
subNine :: Int -> Int
subNine i = if i > 9 then i - 9 else i

-- sum all digits, if divisible by 10 then valid
checkSum :: [ Int ] -> Bool
checkSum is = rem (sum is) 10 == 0


-- Test case "059" is wrong as its not valid according to the luhn algorithm.
