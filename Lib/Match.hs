module Lib.Match where
import Text.Parsec
import Text.Parsec.String


match :: String -> String -> Bool
match "" _ = True
match _ "" = False
match wanted (y:ys) = case parse (string wanted) "krep" (y:ys) of
  (Left _) -> match wanted ys
  (Right _) -> True

notMatch a b = not (match a b)


--takes two lists and returns a list consisting of only elements in both of the two lists
inBoth :: (Eq a) => [a] -> [a] -> [a]
inBoth [] _ = []
inBoth _ [] = []
inBoth (x:xs) ys
  | elem x ys == True = [x] ++ (inBoth xs ys)
  | otherwise         = inBoth xs ys
