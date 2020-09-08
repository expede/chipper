module Chipper.Subroutine.Class (Subroutine (..)) where

import qualified Chipper.RAM.Types as RAM

class Subroutine m where
  -- 2NNN : Execute subroutine starting at address NNN
  startAt :: RAM.Address -> m ()

  -- 00EE : Return from subroutine
  end :: m ()
