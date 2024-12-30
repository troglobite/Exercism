{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_rna_transcription (
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
version = Version [1,3,0,10] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/bin"
libdir     = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/lib/x86_64-osx-ghc-9.2.7/rna-transcription-1.3.0.10-G7a01lGQ32u1w9FWYZnEAy-test"
dynlibdir  = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/lib/x86_64-osx-ghc-9.2.7"
datadir    = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/share/x86_64-osx-ghc-9.2.7/rna-transcription-1.3.0.10"
libexecdir = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/libexec/x86_64-osx-ghc-9.2.7/rna-transcription-1.3.0.10"
sysconfdir = "/Users/brian.parry/Exercism/haskell/rna-transcription/.stack-work/install/x86_64-osx/2c058cf81d558f4615a943eff52c469b55116e72bfeeebc5d5e1877b25d3b07f/9.2.7/etc"

getBinDir     = catchIO (getEnv "rna_transcription_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "rna_transcription_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "rna_transcription_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "rna_transcription_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "rna_transcription_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "rna_transcription_sysconfdir") (\_ -> return sysconfdir)




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
