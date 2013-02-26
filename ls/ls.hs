import Prelude hiding (catch)
import Control.Exception
import Data.List
import System.Directory
import System.Environment

listFiles :: FilePath -> IO String
listFiles dir = catch f handler
        where f = do files <- fmap removeDotDirs $ getDirectoryContents dir
                     return $ unlines files

              handler e = return $ show (e :: IOError) ++ "\n"

listFilesWithHeader :: FilePath -> IO String
listFilesWithHeader dir = do
        files <- listFiles dir
        return $ "[" ++ dir ++ "]\n" ++ files

removeDotDirs :: [FilePath] -> [FilePath]
removeDotDirs = filter (\x -> not $ x `elem` [".", ".."])

main = do args <- getArgs
          if length args == 0
                  then listFiles "." >>= putStr
                  else do result <- mapM listFilesWithHeader args
                          let output = intersperse "\n" result
                          mapM_ putStr output
