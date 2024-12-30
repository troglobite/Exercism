{-# LANGUAGE OverloadedStrings #-}

module Acronym (abbreviate) where

import Data.Char (isLetter, isSpace, toUpper, isUpper)
import Data.Text (Text)
import qualified Data.Text as T

abbreviate :: Text -> Text
abbreviate = 
  filterLowerCase . upperCaseAllWords . replaceHyphens . handleAllCapsWords . cleanInput


cleanInput :: Text -> Text
cleanInput = 
  T.filter (\x -> isLetter x || isSpace x || x == '-')

handleAllCapsWords :: Text -> Text
handleAllCapsWords text =
  T.unwords $ abbreviateAllCaps <$> T.words text

abbreviateAllCaps :: Text -> Text
abbreviateAllCaps text =
  if T.all isUpper text
  then T.toTitle text
  else text

replaceHyphens :: Text -> Text
replaceHyphens =
  T.map (\c -> if c == '-' then ' ' else c)

upperCaseAllWords :: Text -> Text
upperCaseAllWords text =
  T.concat $ map upperCaseFirstChar $ T.words text

filterLowerCase :: Text -> Text
filterLowerCase =
  T.filter isUpper

upperCaseFirstChar :: Text -> Text
upperCaseFirstChar text =
  let h = toUpper . T.head $ text
      l = T.tail text
  in
    T.cons h l


