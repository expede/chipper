module Chipper.RAM.Class
  ( FromRAM (..)
  , ToRAM   (..)
  ) where

import qualified Chipper.Register.Types as Register

-- FIXME Maybe load instruction as well?

class ToRAM m where
  -- FX55 : Store values of V0-VX (inclusive) in memory,
  -- starting at stored in the adddress buffer (I).
  -- Afterwards, set I := I+X+1
  fromRegisters0Through :: Register.ID -> m ()

class FromRAM m where
  -- FX65 : Fill registers V0-VX inclusive with memory starting
  -- at address I. Afterwards, set I := I + X + 1
  toRegisters0Through :: Register.ID -> m ()
