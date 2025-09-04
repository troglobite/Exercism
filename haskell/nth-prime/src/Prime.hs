module Prime (nth) where

import Data.List (elemIndex, splitAt, nub)

nth :: Int -> Maybe Integer
nth n = error "You need to implement this function."

-- Check divisible by 2, if it is then not prime
divisibleByTwo :: Integer -> Bool
divisibleByTwo x = (rem x 2 :: Integer) == 0

-- divide by small prime numbers starting at 3
-- continue with prime numbers up to square root of number
-- if not divisible by any primes then its a prime


-- Sieve of Eratosthenes:
-- This is an efficient algorithm for finding all prime numbers up to a specified integer.
-- Create a list of consecutive integers from 2 up to the limit (e.g., from 2 to 100).
-- Start with the first prime number, 2, and mark all its multiples (4, 6, 8, etc.) as composite.
-- Move to the next unmarked number (which is 3) and mark all its multiples as composite.
-- Continue this process until you reach the square root of the limit.
-- All the unmarked numbers in the list are prime numbers


-- PRIMES: 2, 5, 11, 17, 23, 29, 41, 47, 53, 59, 71, 83, 89, 101
testPrime n = nub $ fst <$> (filterPrimes $ markConsecutiveMultiples n)

-- TODO: Need to flatten the list or reuse the same list of compsites
-- markConsecutiveMultiples :: Int -> [(Int, Bool)]
markConsecutiveMultiples n =
  -- IDEA: try a while with a count of found primes, EDIT: this lead me to the main issue with this approach
  concat ((\x -> markComposites (multiples x n) (composites n)) <$> (consecutiveIntegers n))


squareRoot :: Int -> Int
squareRoot = floor . sqrt . fromIntegral

-- TODO: should order the list
-- filterPrimes :: [(Int, Bool)] -> [(Int, Bool)]
filterPrimes = filter (\x -> snd x == False)


composites :: Int -> [(Int, Bool)]
composites n =
  let buildComposite x = if x == 2 then (x, True) else (x, False)
  in buildComposite <$> [2..n]


-- TODO: Some here is not generating primes correctly. 2 is prime but 9 is not
-- EXAMPLE: [3,5,7,9], these are not prime numbers, they are odd numbers somehow

-- Need to create new list where the composite is marked as true
markComposite :: [(Int, Bool)] -> Int -> [(Int, Bool)]
markComposite composites int =
  -- Only need to mark False composites
  case elemIndex (int, False) composites of
    Just index -> do
      let (x, _:y) = splitAt index composites in
        x ++ (int, True) : y
    Nothing -> composites
  

-- Take a list of ints and a list of potential composites and set each int found in composite to true
markComposites :: [Int] -> [(Int, Bool)] -> [(Int, Bool)]
markComposites [] composites = composites
markComposites (x:xs) composites = markComposites xs (markComposite composites x) 


-- May not be needed, composites does this
-- TODO: need to consider negative numbers
consecutiveIntegers :: Int -> [Int]
consecutiveIntegers n = [2..n]


multiples :: Int -> Int -> [Int]
multiples x n = take n $ (* x) <$> [1..]




-- 08/27/25
-- I need to rethink this approach as there are a few issues with it. First of all the task is to find the nth prime,
-- that means if i get a 10 i need to find the 10th prime number. My current approach is to find the all the prime numbers
-- up to 10 which is not the same thing as there is only 4 prime numbers less then 10. I need a way to generate a list of infinite
-- prime numbers and then just take n of them. My current approach might be able to be repurposed for this eventually but
-- there are still bugs to work out. I think that instead of sending a limit with the consecutiveIntegers function, i can
-- instead have that work on an infinite range. I just need to be careful when using the inifinte range


-- 08/29/15
-- filter method may not be the best approach for this problem. The filter method is really good at find all primes up
-- to a certain number, not a certain number of primes. I dont think its a good candidate for infinite prime numbers
-- due to the fact that you dont know how many primes you have until the end. So i will need to switch to the Trial method.
-- That way i can repeate the method until i have the desired amount of prime numbers which will work better on an infinite scale
--
-- After reviewing the trial method and thinking about how it applies its obvious that the solution will involve both methods.
-- The trial method involves dividing by the prime numbers up to a numbers square root.
-- Getting all the primes up to the square root is exactly the sieve method, then its just a matter of looping through each prime
-- and checking if its divisble by any of them. You continue to repeat this until you have n primes. 
--
-- So i need to get the sieve method working, then i hook that up to the trial method. Im pretty confident in this approach.
-- It has taken a while but i really want to crack this on my own. Getting the Sieve method is probably the hardest part.
-- I still had some bugs to work out its mostly there
