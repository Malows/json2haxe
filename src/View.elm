module View exposing (view)

import Model exposing (Model, JsonInput, HaxeOutput)
import Html exposing (text, p, h1, h4, h6, div, button, hr, Html, input, textarea)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (class, placeholder, spellcheck, value, id)
import Msg exposing (Msg(UpdateHaxe, UpdateJson, UpdateMainName))


view : Model -> Html Msg
view model =
    div
        [ class "main" ]
        [ headerSection
        , inputSection model
        , outputSection model
        ]


headerSection : Html Msg
headerSection =
    div
        [ class "header" ]
        [ h1 [] [ text "json2haxe" ]
        , h4 [ class "margin-left" ] [ text "Handy json schema parsing tool" ]
        ]


inputSection : Model -> Html Msg
inputSection model =
    div
        [ class "json-input padding" ]
        [ h6 [ class "padding" ] [ text "Name" ]
        , mainNameInput Nothing
        , h6 [ class "padding" ] [ text "JSON input" ]
        , jsonInput model.json
        ]


outputSection : Model -> Html Msg
outputSection model =
    div
        [ class "haxe-output" ]
        [ h6 [ class "padding" ] [ text "Haxe clasess" ]
        , haxeOutput model.haxe
        ]


jsonInput : JsonInput -> Html Msg
jsonInput json =
    textarea
        [ class "margin-left"
        , onInput UpdateJson
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
            , class "margin-left"
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
