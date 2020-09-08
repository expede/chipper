module Chipper.Keyboard.Types (Keyboard (..)) where

import           RIO

data Keyboard = Keyboard
  { key0 :: !Char
  , key1 :: !Char
  , key2 :: !Char
  , key3 :: !Char
  , key4 :: !Char
  , key5 :: !Char
  , key6 :: !Char
  , key7 :: !Char
  , key8 :: !Char
  , key9 :: !Char
  , keyA :: !Char
  , keyB :: !Char
  , keyC :: !Char
  , keyD :: !Char
  , keyE :: !Char
  , keyF :: !Char
  }
