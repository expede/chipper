{-# LANGUAGE DataKinds #-}

-- |

module Chipper.Instruction where

import           Membrain
import           RIO

newtype ProgramCounter = ProgramCounter
  { unCounter :: Memory 16 }

newtype RegisterId = RegisterId
  { registerId :: Memory Nibble }

newtype Address = Address
  { unaddress :: Memory 12 }

-- in practice will be a monad, but the class doesn't need
-- a monad or aplpicative constraint. We're going to have them in a
-- vector, and addressed manually with a pointer.

class RegisterStorage m where
  -- 6XNN : store number NN in vergister VX
  -- e.g. `0x42 `storeIn` regA
  storeIn :: Memory Byte -> RegisterId -> m ()

  -- 8XY0 : store the value of register VY in register VX
  -- e.g. reg0 `copyTo` regE
  copyTo :: RegisterId -> RegisterId -> m ()

class RegisterArithmatic m where
  -- 7XNN : Add the value NN to register VX
  -- NOTE does NOT set the carry flag
  -- e.g. 0x12 `addTo` regD
  -- NOTE Overflow MUST be handled as mod 255
  addTo :: Memory Byte -> RegisterId -> m ()

  -- 8XY4 : Add the value of register VY to VX
  -- set VF to 01 is a carry occurs
  -- set VF to 00 if a carry does not occur
  -- e.g. reg7 `sum` reg2
  -- NOTE Also mod 255
  derefAndAddTo :: RegisterId -> RegisterId -> m () -- FIXME better name
  -- NOTE perhaps dereference is more primitive? `addTo . deref`
  -- NOTE addValueTo?

  -- 8XY5 : Subtract the value of register VY from register VX
  -- Set VF to 00 if borrow DOES occur
  -- Set VF to 01 if borrow DOES NOT occur
  derefAndSubtractFromAndStore :: RegisterId -> RegisterId -> m ()

  -- 8XY7 : Set regiser VX to the value of VY minus VX
  -- Set VF to 00 if borrow DOES occur
  -- Set VF to 01 if borrow DOES NOT occur
  setVXtoVYminusVX :: RegisterId -> RegisterId -> m ()

class RegisterBitwise m where
  -- 8XY2 : Set VX to VX AND VY
  regAND :: RegisterId -> RegisterId -> m ()

  -- 8XY1 : Set VX to VX OR VY
  regOR :: RegisterId -> RegisterId -> m ()

  -- 8XY3 : Set VX to VX XOR VY
  regXOR :: RegisterId -> RegisterId -> m ()

class RegisterBitShift m where
  -- 8XY6 : Store the value of VY shifted right one bit in VX
  -- Set VF to the LSB prior to shift
  regShiftRight :: RegisterId -> RegisterId -> m ()

  -- 8XYE : Store the value of VY shifted left one bit in VX
  -- Set VF to the MSB prior to shift
  regShiftLeft :: RegisterId -> RegisterId -> m ()

class RegisterRandom m where
  -- CXNN : Set X to a number with a mask of NN
  -- i.e. random number and then bitwise AND with
  setRandomWithMask :: RegisterId -> Memory Byte -> m ()

class ControlJump m where
  -- 1NNN : Jumo to address NNN
  jumpTo :: Address -> m ()

  -- BNNN : Jump to address NNN + V0
  jumpWithOffsetTo :: Address -> m ()

class Subroutine m where
  -- 2NNN : Execute subroutine starting at address NNN
  startAt :: Address -> m ()

  -- 00EE : Return from subroutine
  end :: m ()

-- WIP class Conditional m where
