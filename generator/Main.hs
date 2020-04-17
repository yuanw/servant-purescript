{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module Main where

--import           Servant.Subscriber.Subscribable

import ApiType (Scientist)
import Data.Aeson
import Data.Monoid
import Data.Proxy (Proxy (..))
import qualified Data.Set as Set
import Data.Text (Text)
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.IO as T
import Language.PureScript.Bridge
import Servant.API

main :: IO ()
main = writePSTypes frontEndRoot (buildBridge defaultBridge) myTypes
  where
    frontEndRoot = "/frontend/src"
    myTypes =
      [ mkSumType (Proxy :: Proxy Scientist)
      ]
