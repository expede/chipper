module Chipper.Screen.Buffer.Types (Buffer (..)) where

import           Chipper.Prelude

-- FIXME constrain to size... though phantom param may be sufficient
-- newtype Buffer heightXWidth
newtype Buffer = Buffer { unBuffer :: Vector (Memory Byte) }
  deriving (Eq, Show)
