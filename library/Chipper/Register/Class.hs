module Chipper.Register.Class
  ( Write       (..)
  , Arithmatic  (..)
  , BinaryLogic (..)
  , BitShift    (..)
  ) where

import           Chipper.Prelude
import qualified Chipper.Register.Types as Register

class Write m where
  -- 6XNN : store number NN in vergister VX
  -- e.g. `0x42 `storeIn` regA
  storeIn :: Memory Byte -> Register.ID -> m ()

  -- 8XY0 : store the value of register VY in register VX
  -- e.g. reg0 `copyTo` regE
  copyTo :: Register.ID -> Register.ID -> m ()

  -- CXNN : Set reg X to a number with a mask of NN
  -- i.e. random number and then bitwise AND with
  setRandomWithMask :: Register.ID -> Memory Byte -> m ()

class Arithmatic m where
  -- 7XNN : Add the value NN to register VX
  -- NOTE does NOT set the carry flag
  -- e.g. 0x12 `addTo` regD
  -- NOTE Overflow MUST be handled as mod 255
  addTo :: Memory Byte -> Register.ID -> m ()

  -- 8XY4 : Add the value of register VY to VX
  -- set VF to 01 is a carry occurs
  -- set VF to 00 if a carry does not occur
  -- e.g. reg7 `sum` reg2
  -- NOTE Also mod 255
  derefAndAddTo :: Register.ID -> Register.ID -> m () -- FIXME better name
  -- NOTE perhaps dereference is more primitive? `addTo . deref`
  -- NOTE addValueTo?

  -- 8XY5 : Subtract the value of register VY from register VX
  -- Set VF to 00 if borrow DOES occur
  -- Set VF to 01 if borrow DOES NOT occur
  derefAndSubtractFromAndStore :: Register.ID -> Register.ID -> m ()

  -- 8XY7 : Set regiser VX to the value of VY minus VX
  -- Set VF to 00 if borrow DOES occur
  -- Set VF to 01 if borrow DOES NOT occur
  setVXtoVYminusVX :: Register.ID -> Register.ID -> m ()

class BinaryLogic m where
  -- 8XY2 : Set VX to VX AND VY
  regAND :: Register.ID -> Register.ID -> m ()

  -- 8XY1 : Set VX to VX OR VY
  regOR :: Register.ID -> Register.ID -> m ()

  -- 8XY3 : Set VX to VX XOR VY
  regXOR :: Register.ID -> Register.ID -> m ()

class BitShift m where
  -- 8XY6 : Store the value of VY shifted right one bit in VX
  -- Set VF to the LSB prior to shift
  regShiftRight :: Register.ID -> Register.ID -> m ()

  -- 8XYE : Store the value of VY shifted left one bit in VX
  -- Set VF to the MSB prior to shift
  regShiftLeft :: Register.ID -> Register.ID -> m ()
