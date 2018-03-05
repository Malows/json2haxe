module Update exposing (update)

import Msg exposing (Msg(..))
import Model exposing (Model, JsonInput, HaxeOutput)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdateJson newVal ->
            updateJson newVal model

        UpdateHaxe ->
            updateHaxe model

        UpdateMainName newName ->
            updateMainName newName model


updateJson : JsonInput -> Model -> ( Model, Cmd Msg )
updateJson newVal model =
    let
        newJson =
            "\n" ++ newVal ++ "\n"
    in
        { model | json = newJson }
            |> update UpdateHaxe


{-|

    Para disparar la reactividad y evitar dos vueltas por el Elm Runtime tengo dos opciones:
    { newModel } |> update Msg
    { newModel | val1 = ..., val2 = ... }

    Por ahora opto por la primera, ya veré como evoluciona la app
-}
updateHaxe : Model -> ( Model, Cmd Msg )
updateHaxe model =
    ( { model | haxe = "| haxe |" ++ model.json ++ "| haxe |" }, Cmd.none )


updateMainName : String -> Model -> ( Model, Cmd Msg )
updateMainName newName model =
    ( { model | name = String.trim <| newName }, Cmd.none )
