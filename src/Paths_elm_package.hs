{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_elm_package (
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
version = Version [0,18] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
-- TODO: This file should be auto generated, but that's not sorted yet. So fix these paths
bindir     = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/bin"
libdir     = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/lib/x86_64-osx-ghc-8.6.5/elm-package-0.18-K15AUbMFsk4FI9Nae6Dn6h"
dynlibdir  = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/lib/x86_64-osx-ghc-8.6.5"
datadir    = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/share/x86_64-osx-ghc-8.6.5/elm-package-0.18"
libexecdir = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/libexec/x86_64-osx-ghc-8.6.5/elm-package-0.18"
sysconfdir = "/Users/emperor/asrc/haskell/interlang/.stack-work/install/x86_64-osx/518b8b617a5fe518297200e9c92f33d3f670108a295afe6017890e78145f4783/8.6.5/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "elm_package_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "elm_package_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "elm_package_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "elm_package_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "elm_package_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "elm_package_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
