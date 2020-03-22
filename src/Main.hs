module Main where

import System.Exit (exitFailure)
import System.IO
import GHC.IO.Encoding (setLocaleEncoding)

import qualified EPCommandLine.Arguments as Arguments
import qualified Manager
import qualified EPReporting.Error as Error


main :: IO ()
main =
  do  setLocaleEncoding utf8

      manager <- Arguments.parse
      result <- Manager.run manager

      case result of
        Right () ->
          return ()

        Left err ->
          do  Error.toStderr err
              exitFailure
