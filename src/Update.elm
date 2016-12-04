module Update exposing (..)

import Types exposing (..)
import Helpers exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EditField field ->
            model ! []

        SaveField field ->
            model ! []

        ValidateField field ->
            model ! []
