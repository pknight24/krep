module Lib.ArgParser where

import System.Environment

--define all possible options in the Args data type
data Args = Args {
  exclude :: Bool
}

startsWith :: (Eq a) => a -> [a] -> Bool
startsWith _ [] = False
startsWith a (x:xs)
  | a == x    = True
  | otherwise = False

isWanted l = not (startsWith '-' l)

getWanted :: IO [String]
getWanted = do
  args <- getArgs
  let wanted = filter isWanted args
  return wanted
