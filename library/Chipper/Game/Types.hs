module Chipper.Game.Types (Game (..)) where

import qualified Chipper.Delay.Types      as Delay
import           Chipper.Prelude
import           Chipper.RAM.Types
import qualified Chipper.Screen.Types     as Screen
import qualified Chipper.Sound.Types      as Sound
import qualified Chipper.Subroutine.Types as Subroutine

-- NOTE likely move to IORefs, but want to see it like this for now
data Game = Game
  { ram             :: !RAM
  , screenBuffer    :: !Screen.Buffer
  , timestamps      :: ![UTCTime] -- ^ For calculating FPS
  , programCounter  :: !Address
  , subroutineStack :: !Subroutine.Stack
  , delayTimer      :: !Delay.Timer
  , soundTimer      :: !Sound.Timer
  , addressBuffer   :: !Address -- ^ Register I
  , carryFlag       :: !Bool    -- ^ Register F
  , register0       :: !(Memory Byte)
  , register1       :: !(Memory Byte)
  , register2       :: !(Memory Byte)
  , register3       :: !(Memory Byte)
  , register4       :: !(Memory Byte)
  , register5       :: !(Memory Byte)
  , register6       :: !(Memory Byte)
  , register7       :: !(Memory Byte)
  , register8       :: !(Memory Byte)
  , register9       :: !(Memory Byte)
  , registerA       :: !(Memory Byte)
  , registerB       :: !(Memory Byte)
  , registerC       :: !(Memory Byte)
  , registerD       :: !(Memory Byte)
  , registerE       :: !(Memory Byte)
  }
