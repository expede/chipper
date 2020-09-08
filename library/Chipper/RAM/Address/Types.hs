module Chipper.RAM.Address.Types (Address (..)) where

import           Chipper.Prelude

newtype Address = Address { unaddress :: Memory 12 }
  deriving (Eq, Show)
