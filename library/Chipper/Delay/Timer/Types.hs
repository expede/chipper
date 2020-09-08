module Chipper.Delay.Timer.Types (Timer (..)) where

import           Chipper.Prelude

newtype Timer = Timer { unDelay :: Memory Byte }
  deriving (Show, Eq)
