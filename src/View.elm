module View exposing (view)

import Model exposing (Model, JsonInput, HaxeOutput)
import Html exposing (text, p, h4, div, button, hr, textarea, Html, input)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (class, placeholder, spellcheck, value)
import Msg exposing (Msg(UpdateHaxe, UpdateJson, UpdateMainName))


view : Model -> Html Msg
view model =
    div []
        [ h4 [] [ text "Name" ]
        , mainNameInput Nothing
        , h4 [] [ text "JSON input" ]
        , jsonInput model.json
        , button [ onClick UpdateHaxe ] [ text "Convert" ]
        , hr [] []
        , h4 [] [ text "Haxe clasess" ]
        , haxeOutput model.haxe
        ]


jsonInput : JsonInput -> Html Msg
jsonInput json =
    textarea
        [ onInput UpdateJson
        , spellcheck False
        , placeholder "Enter a valid JSON"
        ]
        [ text json ]


mainNameInput : Maybe String -> Html Msg
mainNameInput maybeName =
    let
        name =
            case maybeName of
                Nothing ->
                    "Main"

                Just maybeName ->
                    maybeName
    in
        input
            [ placeholder "Main class name"
            , spellcheck False
            , onInput UpdateMainName
            , value name
            ]
            []


haxeOutput : HaxeOutput -> Html Msg
haxeOutput haxe =
    let
        segments =
            String.split "\n" haxe

        pPased =
            List.map (\x -> p [ class "class_elem" ] [ text x ]) segments
    in
        div [ class "code_display" ] pPased
