module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Exts.Html exposing (..)

import Types exposing (..)

view : Model -> Html Msg
view model =
    let
        editableExist : Bool
        editableExist =
            List.any (\(n, f) ->
                if f.mode == EditMode then
                    True
                else
                    False) model.fields

        fieldView : (String, Field) -> Html Msg
        fieldView (name, field) =
            case field.mode of
                DisplayMode ->
                    viewDisplayField (name, field, editableExist)

                EditMode ->
                    viewEditField (name, field)
    in
        div []
            (
                ( List.map fieldView model.fields ) ++ [ text <| toString model]
            )

viewDisplayField : (String, Field, Bool) -> Html Msg
viewDisplayField (name, field, editableExist) =
    div []
        [ label [ for name ] [ text field.label ]
        , text nbsp
        , span [ id name ] [ text field.value ]
        , text nbsp
        , button
            [ hidden editableExist
            , onClick (SetMode EditMode name)
            ] [ text "изменить" ]
        ]

viewEditField : (String, Field) -> Html Msg
viewEditField (name, field) =
    div []
        [ label [ for name ] [ text field.label ]
        , text nbsp
        , input
            [ id name
            , value field.value
            , onInput (ChangeField name)
            , autofocus True
            , classList
                [ ("input-field-invalid", field.isValid == Just False) ]
            ] []
        , text nbsp
        , button
            [ disabled (field.isValid == Just False)
            , onClick (SetMode DisplayMode name)
            ] [ text "сохранить" ]
        ]
