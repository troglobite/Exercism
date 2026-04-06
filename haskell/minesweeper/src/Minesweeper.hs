module Minesweeper (annotate) where

import Data.List (length, head)
import Data.Maybe (catMaybes)

import Control.Exception

annotate :: [String] -> [String]
annotate board = undefined
-- TODO: I need to convert the board to a (x, y, char) mapping
-- Or at the very least, (x, y) coordinates

testBoard = ["***", "***", "***"]
-- 02/20: zip3 (concat testBoard) [0..(length $ testBoard !! 0)] [0..(length testBoard)]
-- Not building out the coordinates correctly

mineCount :: [String] -> Int -> Int -> Maybe Int
mineCount board x y
  | x < 0 || x >= (length $ board !! 1) = Nothing
  | y < 0 || y >= (length $ board) = Nothing
  | otherwise = Just $ length $ catMaybes [l, r, t, b]
  where l = valueAt board (x - 1) y
        r = valueAt board (x + 1) y -- board !? y !? (x + 1)
        t = valueAt board x (y + 1) -- board !? (y + 1) !? x
        b = valueAt board x (y - 1) -- board !? (y - 1) !? x

valueAt :: [String] -> Int -> Int -> Maybe Char
valueAt board x y
  | x < 0 || x >= (length $ board !! 1) = Nothing
  | y < 0 || y >= (length $ board) = Nothing
  | otherwise = Just $ board !! y !! x


-- TODO: Map a board over buildRow
--       buildRow take the y position you are building out
--       and the row of xs
makeCoordinates :: [[x]] -> Int -> Int -> [(x, Int, Int)]
makeCoordinates xs x y = undefined


buildRow :: [x] -> Int -> [(Int, Int, x)]
buildRow xs y = zip3 [0..(length xs)] (take (length xs) $ repeat y) (xs !! y)
