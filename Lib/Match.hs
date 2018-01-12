module Lib.Match where


match :: String -> String -> Bool
match "" _ = True
match _ "" = False
match wanted (y:ys)
  | length wanted > length (y:ys)         = False
  | take (length wanted) (y:ys) == wanted = True
  | otherwise                             = match wanted ys

notMatch a b = not (match a b)


--takes two lists and returns a list consisting of only elements in both of the two lists
inBoth :: (Eq a) => [a] -> [a] -> [a]
inBoth [] _ = []
inBoth _ [] = []
inBoth (x:xs) ys
  | elem x ys == True = [x] ++ (inBoth xs ys)
  | otherwise         = inBoth xs ys
