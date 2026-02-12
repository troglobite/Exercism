module Prime (nth) where

import Data.List (elemIndex, splitAt, nub)

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth 1 = Just 2
nth n = Just $ primes !! (n-1)

primes :: [Integer]
primes = 2 : filter isPrime [3,5..]


isPrime :: Integer -> Bool
isPrime n 
  | n < 2 = False
  | n == 2 = True
  | mod n 2 == 0 = False
  | otherwise = do
    let odds = [2..floor . sqrt . fromIntegral $ n]
    all ((/=0) . mod n) odds

