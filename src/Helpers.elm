module Helpers exposing (..)

import String exposing (..)
import Task

import Types exposing (..)

message : Msg -> Cmd Msg
message msg =
    Task.perform identity (Task.succeed msg)

validate : Field -> Bool
validate field =
    (String.length field.value) > 0

stringify : Model -> String
stringify model =
    "{json}"
