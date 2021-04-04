module Main where

import Data.Foldable hiding (concat)
import Data.List
import DataHand.Layout
import DataHand.Layouts.ProgrammerDvorak

-- TODO:  create converter for .xml LGS files

main = do

    dumpRawHeader eric
    where 
          join = (concat .) . intersperse
          layerToRawMap EmptyLayer = [0 | _ <- [1..52]] -- XXX 52=number of keys on board. this representation should be handled by typeclass instance
          layerToRawMap layer = map fromEnum . toList . toRaw $ layer
          dump = map show . layerToRawMap
          dumpRawHeader layout = putStrLn $ join "\n" $ [
              "// This header was generated using https://github.com/elitak/hs-datahand" ] ++
             ["const uint16_t PROGMEM  " ++ name ++ "_keys [] = {" ++ join ", " (dump $ tbl layout) ++ "};"
              | (name, tbl) <- tables ]
          tables = [ ("normal", normal)
                   , ("normalS", normalS)
                   , ("nas", nas)
                   , ("nasS", nasS)
                   , ("fn", function)
                   , ("fnS", functionS) ]
