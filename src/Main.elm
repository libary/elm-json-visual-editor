module JsonEditor exposing (..)

import Html exposing (..)

import Types exposing (..)
import Update exposing (..)
import Views exposing (..)

init : Flags -> ( Model, Cmd Msg )
init flags =
    Model flags.json [] ! []

main : Program Flags Model Msg
main =
    programWithFlags
        { init = init
        , update = update
        , view = view
        , subscriptions = (\_ -> Sub.none) }
