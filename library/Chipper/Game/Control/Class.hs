module Chipper.Game.Control.Class
  ( Branch (..)
  , Jump   (..)
  ) where

import           Chipper.Prelude
import qualified Chipper.RAM.Types      as RAM
import qualified Chipper.Register.Types as Register

class Jump m where
  -- 1NNN : Jump to address NNN
  jumpTo :: RAM.Address -> m ()

  -- BNNN : Jump to address NNN + V0
  jumpWithOffsetTo :: RAM.Address -> m ()

class Branch m where
  -- 3XNN : SKip the following instruction if the
  -- value of register VX == NN
  skipNextIfEquals :: Register.ID -> Memory Byte -> m ()

  -- 4XNN : Skip following instruction if value in
  -- VX != NN
  skipNextIfNotEqual :: Register.ID -> Memory Byte -> m ()

  -- 5XY0 : skip following instruction if the value of
  -- the register VX == reg VY
  skipIfDerefEqual :: Register.ID -> Register.ID -> m ()

  -- 9XY0 :: Skip following instruction if the value
  -- of register VX is NOT equal to the value of
  -- register VY
  skipIfDerefNotEqual :: Register.ID -> Register.ID -> m ()
