{-# LANGUAGE RecordWildCards #-}
module Main where
import Jhc.Type.Ptr (Ptr(..))-- instead of Foreign.Ptr
import Jhc.Addr (nullPtr, plusPtr)
import Jhc.Prim.Bits (Addr_(..))
import Foreign.Storable

import Control.Monad hiding (join)
import Data.Foldable (toList)
import Data.List (intersperse)
import DataHand.Layout
import DataHand.Layouts.ProgrammerDvorak
import DataHand.USB.Descriptors
import Data.Bits

foreign import ccall "c_extern.h Delay" c_delay :: Word32 -> IO ()
-- FIXME importing anything from stm32f10x.h causes error because it has a typedef bool that interferes with the one in HsFFI.h
foreign import ccall "stm32f10x.h RCC_DeInit" rccDeinit :: IO ()
foreign import ccall "stm32f10x.h RCC_APB2PeriphClockCmd" rccApb2periphclockcmd :: Word32 -> Bool -> IO ()
foreign import ccall "stm32f10x.h GPIO_Init" gpioInit :: Word32 -> Word32 -> IO () -- FIXME
#include "stm32f10x.h"
rccApb2periphGpioa = #const RCC_APB2Periph_GPIOA
rccApb2periphGpiob = #const RCC_APB2Periph_GPIOB
rccApb2periphGpioc = #const RCC_APB2Periph_GPIOC
-- TODO figure out type and eliminate plusPtr usage
--gpioaBase :: Ptr a 
--gpioaBase = Ptr ((#const GPIOA_BASE))
gpioaBase = nullPtr `plusPtr` #const GPIOA_BASE
gpiobBase = nullPtr `plusPtr` #const GPIOB_BASE
gpiocBase = nullPtr `plusPtr` #const GPIOC_BASE
-- TODO: import the struct and use names as offsets via ffi (sounds like this isnt supported)

data GPIO = GPIO { crl :: Word32
                 , crh :: Word32
                 , idr :: Word32
                 , odr :: Word32
                 , bsrr :: Word32
                 , brr :: Word32
                 , lckr :: Word32
                 }
instance Storable GPIO where
    sizeOf _                     = (#size GPIO_TypeDef)
    alignment                    = sizeOf
    peek ptr                     = do crl   <- (#peek GPIO_TypeDef, CRL)      ptr
                                      crh   <- (#peek GPIO_TypeDef, CRH)      ptr
                                      idr   <- (#peek GPIO_TypeDef, IDR)      ptr
                                      odr   <- (#peek GPIO_TypeDef, ODR)      ptr
                                      bsrr  <- (#peek GPIO_TypeDef, BSRR)     ptr
                                      brr   <- (#peek GPIO_TypeDef, BRR)      ptr
                                      lckr  <- (#peek GPIO_TypeDef, LCKR)     ptr
                                      return $ GPIO crl crh idr odr bsrr brr lckr
    poke ptr (GPIO crl crh idr odr bsrr brr lckr) = do
                           (#poke GPIO_TypeDef, CRL)   ptr crl
                           (#poke GPIO_TypeDef, CRH)   ptr crh
                           (#poke GPIO_TypeDef, IDR)   ptr idr
                           (#poke GPIO_TypeDef, ODR)   ptr odr
                           (#poke GPIO_TypeDef, BSRR)  ptr bsrr
                           (#poke GPIO_TypeDef, BRR)   ptr brr
                           (#poke GPIO_TypeDef, LCKR)  ptr lckr

data GPIO_InitTypeDef = GPIO_InitTypeDef { pin :: Word16
                                         , speed :: GPIOSpeed_TypeDef
                                         , mode :: GPIOMode_TypeDef
                                         }
instance Storable GPIO_InitTypeDef where
        sizeOf _ = (#size GPIO_InitTypeDef)
        alignment = sizeOf
        peek ptr = do
                pin   <- (#peek GPIO_InitTypeDef, GPIO_Pin)   ptr
                speed <- (#peek GPIO_InitTypeDef, GPIO_Speed) ptr
                mode  <- (#peek GPIO_InitTypeDef, GPIO_Mode)  ptr
                return $ GPIO_InitTypeDef pin speed mode
        poke ptr (GPIO_InitTypeDef pin speed mode) = do (#poke GPIO_InitTypeDef, GPIO_Pin)   ptr pin
                                                        (#poke GPIO_InitTypeDef, GPIO_Speed) ptr speed
                                                        (#poke GPIO_InitTypeDef, GPIO_Mode)  ptr mode

newtype GPIOSpeed_TypeDef = GPIOSpeed_TypeDef #type GPIOSpeed_TypeDef
                            --deriving (Storable)
instance Storable GPIOSpeed_TypeDef --where
--        sizeOf (GPIOSpeed_TypeDef a) = sizeOf a
--        alignment (GPIOSpeed_TypeDef a) = alignment a
--        --peek (Ptr addr) = GPIOSpeed_TypeDef (peek addr)
--        peek ptr = do
--                val <- peek ptr
--                --return $ GPIOSpeed_TypeDef val
--                return $ val
--        --peek (Ptr (GPIOSpeed_TypeDef a)) = (peek a)
--        --poke (Ptr (GPIOSpeed_TypeDef a)) (GPIOSpeed_TypeDef a) = (poke a)
--        --poke ptr var = do poke ptr var
--        --pokeByteOff = pokeByteOff
#enum GPIOSpeed_TypeDef, GPIOSpeed_TypeDef \
  , GPIO_Speed_10MHz \
  , GPIO_Speed_2MHz \
  , GPIO_Speed_50MHz

newtype GPIOMode_TypeDef = GPIOMode_TypeDef Word32
instance Storable GPIOMode_TypeDef
#enum GPIOMode_TypeDef, GPIOMode_TypeDef \
  , GPIO_Mode_AIN \
  , GPIO_Mode_IN_FLOATING \
  , GPIO_Mode_IPD \
  , GPIO_Mode_IPU \
  , GPIO_Mode_Out_OD \
  , GPIO_Mode_Out_PP \
  , GPIO_Mode_AF_OD \
  , GPIO_Mode_AF_PP


-- see table 20 in manual for the 4 bits that control each pin on every port
-- (CNF1,CNF0,MODE1,MODE0) are the 4 bits, msb->lsb.
-- (0,0,0,1) is push-pull output, max speed 10Mhz
--crl :: Ptr Word32 -> Ptr Word32
--crl = (`plusPtr` 0x00) -- port control register (1st uint32 in the struct)
--crl = (#poke GPIO_TypeDef, CRL)
--odr :: Ptr Word32 -> Ptr Word32
--odr = (`plusPtr` 0x0c) -- Output Data Register pins (4th uint32 in the struct)
--odr = (#poke GPIO_TypeDef, ODR)

gpioOut :: Word32 -> IO ()
gpioOut regval = do
  forM_ [ gpioaBase
        , gpiobBase
        , gpiocBase ] $ \port -> do
            gpio :: GPIO <- peek port
            poke port gpio{odr=regval}
  c_delay 0xaffff --720k microseconds? seems maybe to be based on clock?

join :: String -> [String] -> String
join = (concat .) . intersperse

main :: IO ()
main = do
    --let layerToRawMap EmptyLayer = []
    --    layerToRawMap l = map fromEnum $ (toList . toRaw) l
    --return $ layerToRawMap (normal experimental)


    rccDeinit
    rccApb2periphclockcmd rccApb2periphGpioc True
    --gpioInit gPIOA
    -- configure the pins. needed? manual says they default to input...
    forM_ [ gpioaBase
          , gpiobBase
          , gpiocBase ] $ \port -> do
                    gpio :: GPIO <- peek port
                    poke port gpio{crl=0x11111111}
    c_delay 0xaffff

    forever $ do
        mapM_ gpioOut pat

    --GOTCHA use everything in where clause, else get a compile error!
    where
      o13 = (1 `shiftL` 13)
      o7 = (1 `shiftL` 7)
      pat = [o13, o13 .|. o7, o7, 0]
