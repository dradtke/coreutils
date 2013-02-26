-- $ runhaskell echo.hs hello world
import Data.List
import System.Environment

main = do args <- getArgs
          putStrLn $ unwords args
