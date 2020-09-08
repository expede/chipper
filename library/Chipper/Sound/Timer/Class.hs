module Chipper.Sound.Timer.Class (Write (..)) where

import qualified Chipper.Register.Types as Register

class Write m where
  -- FX18 : Set sound timer to the value in reg VX
  --
  -- NOTE It should be noted that in the COSMAC VIP
  -- manual, it was made clear that the minimum value
  -- that the timer will respond to is 02.
  -- Thus, setting the timer to a value of 01 would have no audible effect.
  copyFrom :: Register.ID -> m ()
