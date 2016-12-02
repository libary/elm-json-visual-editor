module JsonEditor exposing (..)

import Html exposing (..)
import Html.Attributes exposing(..)
import Html.Events exposing (..)
import Task

type alias Flags =
    { json : String }

type alias JSON = String

type alias Model =
    { address : String
    , geo : Geo
    }

init : Flags -> ( Model, Cmd Msg )
init flags =
    ( Model "" (Geo 0 0), Cmd.none )

type Msg
    = EditField String
    | SaveFiels String String
    | Suggest Geo

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Change newAddress ->
         ( { model | address = newAddress }, Cmd.none )
            -- ( { model | address = newAddress }, message Process )

        Process ->
         ( model, process model.address )

        Suggest newGeo ->
         ( { model | geo = newGeo }, Cmd.none )

view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", id "address" ] [] --[ text <| toString model.address ]
        , button [onClick Process] [text "Найти"]
        , text (toString model)
        ]

subscriptions : Model -> Sub Msg
subscriptions model =
    suggestions Suggest

message : msg -> Cmd msg
message x =
  Task.perform identity (Task.succeed x)

main : Program Flags Model Msg
main =
  programWithFlags { init = init, update = update, view = view, subscriptions = subscriptions }