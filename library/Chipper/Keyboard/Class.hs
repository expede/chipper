module Chipper.Keyboard.Class (Input (..)) where

import qualified Chipper.Register.Types as Register

class Input m where
  -- FX0A : Wait for keypress and store the result
  -- in register VX
  waitAndStoreIn :: Register.ID -> m ()

  -- EX9E : Skip following instruction if key
  -- corresponding to hex value currently stored in VX
  -- is pressed
  skipNextIfKeyPressedMatching :: Register.ID -> m ()

  -- EXA1 : Skip the following instruction if the
  -- key corresponding to the hex value is NOT pressed
  skipNextUnlessKeyPressedMatching :: Register.ID -> m ()
