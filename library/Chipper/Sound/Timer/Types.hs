module Chipper.Sound.Timer.Types (Timer (..)) where

import           Chipper.Prelude

newtype Timer = Timer { unTime :: Memory Byte }
  deriving (Show, Eq)
