module Lib.Run where

import Data.List
import Lib.ArgParser
import Lib.Match
import Control.Monad

--checks for options and calls different run functions based on what is true
--interpret now takes all of the wanted search terms and handles them, rather than handling them in krep.hs
interpret :: [String] -> Opts -> [String] -> IO [String]
interpret [] _  _ = do
  return ["Error: no argument passed to interpret"]
interpret _ _ [] = do
  return ["Error: no source information passed to krep"]
interpret w (Opts False) s = do
  ran <- mapM (run s) w
  return $ concat ran
interpret w (Opts True) s = do
  ranX <- mapM (runX s) w
  return $ concat ranX

--runs the program normally, gets all the items passed by stdin that contain the wanted string
run :: [String] -> String -> IO [String]
run []  _ = do
  return ["Error: no argument passed to run"]
run s w = do
  let onlyMatches = filter (match w) s
  return onlyMatches

--runs the program, but excludes the argument w rather than checking for matches
runX :: [String] -> String -> IO [String]
runX []  _ = do
  return ["Error: no argument passed to runX"]
runX s w = do
  let notMatches = filter (notMatch w) s
  return notMatches

