module Lib.ArgParser where

import System.Environment

--define all possible options in the Opts data type
data Opts = Opts {
  exclude :: Bool
}

startsWith :: (Eq a) => a -> [a] -> Bool
startsWith _ [] = False
startsWith a (x:xs)
  | a == x    = True
  | otherwise = False

isWanted l = not (startsWith '-' l)

getOpts :: IO Opts
getOpts = do
  args <- getArgs
  let hasExclude = elem "-x" args
  return (Opts hasExclude)
  

getWanted :: IO [String]
getWanted = do
  args <- getArgs
  let wanted = filter isWanted args
  return wanted

