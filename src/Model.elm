module Model exposing (Model, JsonInput, HaxeOutput)


type alias Model =
    { json : String
    , haxe : String
    , name : String
    }


type alias JsonInput =
    String


type alias HaxeOutput =
    String
