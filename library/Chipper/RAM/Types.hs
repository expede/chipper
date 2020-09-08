module Chipper.RAM.Types
  ( RAM (..)
  -- * Reexport
  , module Chipper.RAM.Address.Types
  ) where

import           Chipper.Prelude
import           Chipper.RAM.Address.Types

newtype RAM  = RAM { unRAM :: Vector (Memory Byte) }
