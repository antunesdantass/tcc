{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_lojao (
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

bindir     = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/bin"
libdir     = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/lib/x86_64-osx-ghc-8.6.5/lojao-0.1.0.0-EjiHh5KLWcDDaWHZPpzIFl-lojao"
dynlibdir  = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/share/x86_64-osx-ghc-8.6.5/lojao-0.1.0.0"
libexecdir = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/libexec/x86_64-osx-ghc-8.6.5/lojao-0.1.0.0"
sysconfdir = "/Users/antunesdantas/Documents/tcc/haskell/lojao/.stack-work/install/x86_64-osx/04ed846ee435c6df10de1cc72cfea02caa32eaebd0d658e6f3d041cea7328875/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lojao_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lojao_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lojao_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lojao_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lojao_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lojao_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
