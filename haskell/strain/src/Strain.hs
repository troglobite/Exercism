module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard pred []     = []
discard pred (x:xs) = if pred x then discard pred xs else x : discard pred xs 

keep :: (a -> Bool) -> [a] -> [a]
keep pred []     = []
keep pred (x:xs) = if pred x then x : keep pred xs else keep pred xs 
