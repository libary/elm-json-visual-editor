module Parsers exposing (parseJson)

import Json.Decode as Decode
import Json.Decode.Pipeline exposing (required,hardcoded,decode)

import Types exposing (..)

parseToField : Decode.Decoder Field
parseToField =
    decode Field
        |> required "label" Decode.string
        |> required "value" Decode.string
        |> hardcoded DisplayMode
        |> hardcoded Nothing

parseFields : Decode.Decoder (List (String, Field))
parseFields =
    Decode.keyValuePairs parseToField

parseJson : String -> Result String (List (String, Field))
parseJson json =
    Decode.decodeString parseFields json
