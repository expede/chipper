module Chipper.Register.Types (ID (..)) where

import           Chipper.Prelude

newtype ID = ID
  { raw :: Memory Nibble }
