module Chipper.Config.Types (Config (..)) where

import           Chipper.Keyboard.Types
import           Chipper.Prelude

data Config = Config
  { logFunc  :: !LogFunc
  , keyboard :: !Keyboard
  }
