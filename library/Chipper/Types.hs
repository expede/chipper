module Chipper.Types
  ( ChipperT (..)
  , ChipperIO
  ) where

import           Chipper.Config.Types
import           Chipper.Game.Types
import           Chipper.Prelude

-- TODO Chipper.step :: Chipper -> Chipper
-- TODO insde this funtion, do all IO:
--        * wait for input
--        * keypress
--        * write to display

-- Yes, the State will probably become IORefs. I want to see how this performs first, though
-- Alternately, run the game in one thead, and let the framebuffer update out of band
newtype ChipperT m a = ChipperT { unChip :: ReaderT Config (StateT Game m) a }
  deriving newtype
    ( Functor
    , Applicative
    , Monad
    , MonadFail
    , MonadIO
    )

type ChipperIO = ChipperT IO ()

-- FIXME double check
instance MonadTrans ChipperT where
  lift = ChipperT . lift . lift

-- instance MonadLogger Chipper
