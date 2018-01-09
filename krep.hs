import Data.List
import Control.Monad
import Control.Concurrent
import System.Environment
import Lib.Match
import Lib.ArgParser
import Lib.Run

--searches for arg1 in text passed via stdin (similar usage to grep)
main = do
  source <- getContents
  wanted <- getWanted
  opts <- getOpts
  let l = lines source
  results <- interpret wanted opts l
  forM_ results (\r -> putStrLn r)
