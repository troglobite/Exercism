
module Luhn (isValid) where

import Data.List (filter, foldl, mapAccumL, reverse)
import Data.Char (isDigit, digitToInt)

testLuhn = (isValid "4539 3195 0343 6467") == True

isValid :: String -> Bool
isValid n
        | length n <= 1 = False
        | otherwise     = checkSum . everyOtherDoubled . reverse . integered . filtered $ n


-- strip spaces from string and non-digits from strings
filtered :: String -> String
filtered = filter isDigit

-- convert to list of numbers
integered :: [ Char ] -> [ Int ]
integered s = digitToInt <$> s

-- double every other digit starting from the right
everyOtherDoubled :: [ Int ] -> [ Int ]
everyOtherDoubled []      = []
everyOtherDoubled [x]     = [subNine . double $ x]
everyOtherDoubled (x:y:z) = x : (subNine . double $ y) : everyOtherDoubled z


double :: Int -> Int
double = (*) 2

-- if digit is GT 9 subtract 9 from product
subNine :: Int -> Int
subNine i = if i > 9 then i - 9 else i

-- sum all digits, if divisible by 10 then valid
checkSum :: [ Int ] -> Bool
checkSum [0] = False
checkSum is = rem (sum is) 10 == 0

