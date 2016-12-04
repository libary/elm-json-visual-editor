module Helpers exposing (..)

import String exposing (..)
import Task

import Types exposing (..)

message : msg -> Cmd msg
message x =
    Task.perform identity (Task.succeed x)

parseJson : String -> List MasterField
parseJson json =
    -- List.map (\_ -> MasterField) json
    []
