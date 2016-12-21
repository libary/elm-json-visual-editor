module Update exposing (..)

import Types exposing (..)
import Helpers exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetMode newMode name ->
            let
                mapper : (String, Field) -> (String, Field)
                mapper (n, f) =
                    if n == name then
                        (n, { f | mode = newMode })
                    else
                        (n, f)

                newFields : List (String, Field)
                newFields = List.map mapper model.fields
            in
                if newMode == DisplayMode then
                    ({ model | fields = newFields }, message Stringify)
                else
                    { model | fields = newFields } ! []

        ChangeField name newValue ->
            let
                mapper : (String, Field) -> (String, Field)
                mapper (n, f) =
                    if n == name then
                        (n, { f | value = newValue })
                    else
                        (n, f)
            in
                ({ model | fields = List.map mapper model.fields }, message (ValidateField name))

        ValidateField name ->
            let
                mapper : (String, Field) -> (String, Field)
                mapper (n, f) =
                    if n == name then
                        (n, { f | isValid = Just (validate f) })
                    else
                        (n, f)
            in
                { model | fields = List.map mapper model.fields } ! []

        Stringify ->
            let
                findNotValid : (String, Field) -> Bool
                findNotValid (n, f) =
                    if f.isValid == Just False then
                        True
                    else
                        False

                doStringify : Bool
                doStringify =
                    not (List.any findNotValid model.fields)

            in
                if doStringify then
                    { model | json = stringify model } ! []
                else
                    model ! []
