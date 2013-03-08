-- $ runhaskell ls.hs
import Control.Monad          (liftM)
import Control.Exception as E (catch)
import Data.List              (intersperse)
import System.Directory       (getDirectoryContents)
import System.Environment     (getArgs)

listFiles :: FilePath -> IO String
listFiles dir = E.catch f handler
        where f = fmap (unlines . removeDotDirectories) $ getDirectoryContents dir
              handler e = return $ show (e :: IOError) ++ "\n"

listFilesWithHeader :: FilePath -> IO String
listFilesWithHeader dir = liftM (("[" ++ dir ++ "]\n") ++) $ listFiles dir

removeDotDirectories :: [FilePath] -> [FilePath]
removeDotDirectories = filter (\x -> not $ x `elem` [".", ".."])

main = do args <- getArgs
          case null args of
              True  -> putStr =<< listFiles "."
              False -> mapM_ putStr =<< (mapM listFilesWithHeader args >>= return . intersperse "\n")
