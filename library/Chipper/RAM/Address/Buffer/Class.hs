module Chipper.RAM.Address.Buffer.Class (Write (..)) where

import qualified Chipper.RAM.Address.Types as RAM
import qualified Chipper.Register.Types    as Register

-- IRegiser holds an address, can only be writen to, no math
class Write m where
  -- ANNN : Store memory address NNN in register I
  store :: RAM.Address -> m ()

  -- FX1E : Add the value stored in reg VX to Reg I
  compoundAdd :: Register.ID -> m ()
