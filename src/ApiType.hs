{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module ApiType where

import Data.Proxy ()
import Servant

data Scientist
  = Scientist
      { sId :: Int,
        sFirstName :: String,
        sLastName :: String
      }
  deriving (Eq, Show)

--type UserAPI = "users" :> QueryParam "sortby" SortBy :> Get '[JSON] [User]
--type MyApi = "static" :> Raw
type MyApi = Raw

server :: Server MyApi
server = serveDirectory "dist"

myAPI :: Proxy MyApi
myAPI = Proxy

app :: Application
app = serve myAPI server
