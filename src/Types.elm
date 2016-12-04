module Types exposing (..)

type alias Flags =
    { json : String
    }

type Mode
    = Display
    | Edit

type alias Field =
    { name : String
    , label : String
    , value : String
    , mode : Mode
    , isValid : Maybe Bool
    }

type alias MasterField =
    { name : String
    , label : String
    , fields : List Field
    }

type alias Model =
    { json : String
    , data : List MasterField
    }

type Msg
    = EditField String
    | SaveField String
    | ValidateField String
