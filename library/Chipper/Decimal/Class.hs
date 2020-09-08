module Chipper.Decimal.Class (ToBCD (..)) where

import qualified Chipper.Register.Types as Register

-- | Convert to Binary Coded Decimal
class ToBCD m where
  -- FX33 : Store decimal-equivalent of values in VX to
  -- addresses I, I+1, I+2, MSB in I, LSB in I+2
  storeAsBCD :: Register.ID -> m ()
