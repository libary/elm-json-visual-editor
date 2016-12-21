module JsonEditor exposing (..)

import Html exposing (..)

import Types exposing (..)
import Parsers exposing (..)
import Update exposing (..)
import Views exposing (..)

init : Flags -> ( Model, Cmd Msg )
init flags =
    case parseJson flags.json of
        Ok result ->
            Model flags.json result ! []

        Err error ->
            Model flags.json [] ! []

main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , update = update
        , view = view
        , subscriptions = (\_ -> Sub.none) }
