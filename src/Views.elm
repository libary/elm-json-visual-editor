module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Types exposing (..)
import Helpers exposing (..)

view : Model -> Html Msg
view model =
    div [] [
        text <| toString model
    ]

viewMasterField : MasterField -> Html Msg
viewMasterField master =
    div [ id master.name ]
        [ label [] [ text master.label ]
        , div [] []
        -- ( List.map (\f ->
        --             if f.mode == Display then
        --                 viewDisplayField
        --             else
        --                 viewEditField) master.fields )
        ]

viewDisplayField : Field -> Html Msg
viewDisplayField field =
    div [ id field.name ]
        [ label [] [ text field.label ]
        , span [] [ text <| toString field.value ]
        , button [ onClick (EditField field.name) ] [ text "изменить" ]
        ]

viewEditField : Field -> Html Msg
viewEditField field =
    div [ id field.name ]
        [ label [] [ text field.label ]
        , input [] [ text <| toString field.value ]
        , button [ onClick (SaveField field.name) ] [ text "сохранить" ]
        ]
