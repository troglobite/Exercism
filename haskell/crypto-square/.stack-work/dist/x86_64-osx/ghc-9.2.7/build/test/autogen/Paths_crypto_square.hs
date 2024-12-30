{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_crypto_square (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [3,2,0,6] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/bin"
libdir     = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/lib/x86_64-osx-ghc-9.2.7/crypto-square-3.2.0.6-HXTSYjGoHTXLuho0qYl5FT-test"
dynlibdir  = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/share/x86_64-osx-ghc-9.2.7/crypto-square-3.2.0.6"
libexecdir = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/libexec/x86_64-osx-ghc-9.2.7/crypto-square-3.2.0.6"
sysconfdir = "/Users/brian.parry/Exercism/haskell/crypto-square/.stack-work/install/x86_64-osx/f635097f35878303ca2ba8df3fe713c50ed0eb6f34600545982745456245171b/9.2.7/etc"

getBinDir     = catchIO (getEnv "crypto_square_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "crypto_square_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "crypto_square_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "crypto_square_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "crypto_square_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "crypto_square_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
