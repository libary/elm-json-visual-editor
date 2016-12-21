module Types exposing (..)

type alias Flags
    = { json : String }

type Mode
    = DisplayMode
    | EditMode

-- type alias Field =
--     { name : String
--     , label : String
--     , value : String
--     , mode : Mode
--     , isValid : Maybe Bool
--     }

type alias Field =
    { label : String
    , value : String
    , mode : Mode
    , isValid : Maybe Bool
    }

-- type alias MasterField =
--     { name : String
--     , label : String
--     , fields : List Field
--     }

type alias Model =
    { json : String
    , fields : List (String, Field)
    }

type Msg
    = SetMode Mode String
    | ChangeField String String
    | ValidateField String
    | Stringify
