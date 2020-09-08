module Chipper.Subroutine.Stack.Types (Stack (..)) where

import           Chipper.Prelude
import qualified Chipper.RAM.Types as RAM

-- FIXME newtype Stack = Stack { unStack :: FixedLength.T 16 RAM.Address }
newtype Stack = Stack { unStack :: [RAM.Address] }
  deriving (Show, Eq)
