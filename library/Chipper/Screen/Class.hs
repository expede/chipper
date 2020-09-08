module Chipper.Screen.Class
  ( Draw    (..)
  , Prepare (..)
  ) where

import           Chipper.Prelude
import qualified Chipper.Register.Types as Register

class Draw m where
  -- 00E0 : Clear screen
  clear :: m ()

  -- DXYN : Draw sprite at (VX, VY), with N bytes
  -- of sprite data starting at the address stored in I.
  -- ALSO set VF to 01 if any pixes are changed to unset,
  -- and 00 otherwise
  --
  -- NOTE the resulting sprite with always be 8-pixels wide
  -- but N pixels high
  drawAt :: Register.ID -> Register.ID -> Memory Nibble -> m ()

{-
All sprites are drawn XOR mode:
Ths means that the current disply is XOR-ed with the
sprite being added. i.e. erase sprite is the same
as drawing the same spirte to the same location.

Thus the setting of the VF instruiction. If ANY pixels
are "erased", set VF to 01, and 00 otherwise.
-}

class Prepare m where
  -- FX29 : set VI to one of the built-in font characters.
  -- Find the hex code in reg VX
  setChar :: Register.ID -> m ()
