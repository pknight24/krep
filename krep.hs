import Control.Monad
import Lib.Match
import System.Environment

--searches for arg1 in text passed via stdin (similar usage to grep)
main = do
  source <- getContents
  args <- getArgs
  let wanted = head args
  let l = lines source
  let onlyMatches = filter (match wanted) l
  forM onlyMatches (\s -> putStrLn s)
