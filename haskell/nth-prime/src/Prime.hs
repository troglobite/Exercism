module Prime (nth) where

nth :: Int -> Maybe Integer
nth n = error "You need to implement this function."


-- TRIAL DIVISION METHOD:
-- Start with the number you want to test (let's call it 'n').
-- Check if 'n' is divisible by 2. If it is, 'n' is not prime (unless n is 2).
-- If 'n' is not divisible by 2, check if it's divisible by 3, then 5, then 7, and so on, always using prime numbers.
-- Continue checking divisibility by prime numbers until you reach a prime number greater than the square root of 'n'.
-- If 'n' is not divisible by any prime number less than or equal to its square root, then it is a prime number.

nthTrialDivisionMethod :: Int -> Integer
nthTrialDivisionMethod n = undefined





-- Sieve of Eratosthenes:
-- This is an efficient algorithm for finding all prime numbers up to a specified integer.
-- Create a list of consecutive integers from 2 up to the limit (e.g., from 2 to 100).
-- Start with the first prime number, 2, and mark all its multiples (4, 6, 8, etc.) as composite.
-- Move to the next unmarked number (which is 3) and mark all its multiples as composite.
-- Continue this process until you reach the square root of the limit.
-- All the unmarked numbers in the list are prime numbers
nthSieveOfEratostenesMethod n = undefined

list' :: Int -> [(Int, Bool)]
list' x = map (\x' -> (x', False)) $ consecutiveIntegers x

consecutiveIntegers :: Int -> [Int]
consecutiveIntegers x = [2..x]

multiples :: Int -> Int -> [Int]
multiples x limit = take limit $ map (* x) [1..]

