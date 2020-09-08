module Chipper.Delay.Timer.Class
  ( Read  (..)
  , Write (..)
  ) where

import qualified Chipper.Register.Types as Register

class Write m where
  -- FX15 : Set delay to value in regiter X
  copyFrom :: Register.ID -> m ()

class Read m where
  -- FX07 : Store the current delay timer value in Reg VX
  copyTo :: Register.ID -> m ()
