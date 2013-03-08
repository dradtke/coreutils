-- $ runhaskell echo.hs hello world
import System.Environment (getArgs)

main = fmap unwords getArgs >>= putStrLn
