module Lib.Run where

import Data.List
import Lib.ArgParser
import Lib.Match
import Control.Monad

--checks for options and calls different run functions based on what is true
interpret :: String -> Opts -> [String] -> IO [String]
interpret "" _  _ = do
  return ["Error: no argument passed to interpret"]
interpret _ _ [] = do
  return ["Error: no source information passed to krep"]
interpret w (Opts False) s = do
  run w s
interpret w (Opts True) s = do
  runX w s

--runs the program normally, gets all the items passed by stdin that contain the wanted string
run :: String -> [String] -> IO [String]
run ""  _ = do
  return ["Error: no argument passed to run"]
run w s = do
  let onlyMatches = filter (match w) s
  return onlyMatches

--runs the program, but excludes the argument w rather than checking for matches
runX :: String -> [String] -> IO [String]
runX ""  _ = do
  return ["Error: no argument passed to runX"]
runX w s = do
  let notMatches = filter (notMatch w) s
  return notMatches

