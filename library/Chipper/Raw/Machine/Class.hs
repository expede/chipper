module Chipper.Raw.Machine.Class (MachineLanguage (..)) where

import qualified Chipper.RAM.Address.Types as RAM

class MachineLanguage m where
  -- 0NNN : Execute machine language subrouting at addr NNN
  -- NOTE ignorede in modern interpreters. Would be good to log, IMO.
  executeRawStartingAt :: RAM.Address -> m ()
