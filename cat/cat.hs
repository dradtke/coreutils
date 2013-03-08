-- $ runhaskell cat.hs file.txt
import System.Environment (getArgs)

main = do args <- getArgs
          mapM_ (\x -> readFile x >>= putStr) args
