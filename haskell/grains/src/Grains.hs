module Grains (square, total) where

square :: Integer -> Maybe Integer
square 0 = Nothing
square n
  | n > boardSize = Nothing
  | n > 0 = Just $ squares !! ((fromIntegral n) - 1)
  | otherwise = Nothing

total :: Integer
total = sum squares

squares :: [Integer]
squares = take 64 $ iterate (*2) 1

boardSize :: Integer
boardSize = 64
