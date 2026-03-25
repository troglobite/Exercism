module Minesweeper (annotate) where

import Data.List (length, head)
import Data.Maybe (catMaybes)
-- TODO: Why is (!!) exposed but (!?) is not?

import Control.Exception

annotate :: [String] -> [String]
annotate board = board
-- TODO: I need to convert the board to a (x, y, char) mapping
-- Or at the very least, (x, y) coordinates
--
testBoard = ["***", "***", "***"]
-- 02/20: zip3 (concat board) [0..(length $ board !! 0)] [0..(length board)]
-- Not building out the coordinates correctly

-- The idea is somewhat sound here but needs more work.
-- Take a board and a (x, y) coordinate and then i can access any element.
mineCount :: [String] -> Int -> Int -> Int
mineCount board x y = length $ catMaybes [l, r, t, b]
  where l = valueAt board (x - 1) y
        r = valueAt board (x + 1) y -- board !? y !? (x + 1)
        t = valueAt board x (y + 1) -- board !? (y + 1) !? x
        b = valueAt board x (y - 1) -- board !? (y - 1) !? x

-- This will be a simple cell lookup
-- Nothing is essentially out of bound
-- Just is inbounds
-- TODO: seems to be returning values for what should be out or bounds
--        mineCount testBoard 0 3, should be 0. Im thinking its technically correct
--        But is starting from a off board position so i need to look at the gaurds
valueAt :: [String] -> Int -> Int -> Maybe Char
valueAt board x y
  | x < 0 || x >= (length $ board !! 1) = Nothing
  | y < 0 || y >= (length $ board) = Nothing
  | otherwise = Just $ board !! y !! x -- == ('*')
