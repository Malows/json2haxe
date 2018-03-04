module Msg exposing (Msg(..))

import Model exposing (JsonInput, HaxeOutput)


-- MSG


type Msg
    = NoOp
    | UpdateJson JsonInput
    | UpdateHaxe
    | UpdateMainName String
