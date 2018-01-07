module Lib.Match where


match :: String -> String -> Bool
match "" _ = True
match _ "" = False
match wanted (y:ys)
  | length wanted > length (y:ys)         = False
  | take (length wanted) (y:ys) == wanted = True
  | otherwise                             = match wanted ys

