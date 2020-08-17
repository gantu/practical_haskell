{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_chapter2 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/wild/.cabal/bin"
libdir     = "/home/wild/.cabal/lib/x86_64-linux-ghc-8.6.5/chapter2-0.1.0.0-inplace"
dynlibdir  = "/home/wild/.cabal/lib/x86_64-linux-ghc-8.6.5"
datadir    = "/home/wild/.cabal/share/x86_64-linux-ghc-8.6.5/chapter2-0.1.0.0"
libexecdir = "/home/wild/.cabal/libexec/x86_64-linux-ghc-8.6.5/chapter2-0.1.0.0"
sysconfdir = "/home/wild/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "chapter2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "chapter2_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "chapter2_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "chapter2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "chapter2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "chapter2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
