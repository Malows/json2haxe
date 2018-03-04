module Main exposing (..)

import View exposing (view)
import Msg exposing (Msg)
import Update exposing (update)
import Model exposing (Model)
import Html


-- INIT STATE


init : ( Model, Cmd Msg )
init =
    ( Model "" "" "Name"
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }
