module RunTracker exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, id, name, type_, value)

type alias Model =
    List { name : String, type_ : String, value : String }

type Msg
  = Change String

view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ h1 [] [ text "Run Tracker" ]
        , form [ id "run-info" ] (List.map viewInput model)
        ]

viewInput field =
  input [ name field.name, type_ field.type_, value field.value ] []

initialModel =
  [ { name = "distance", type_ = "text", value = "" }
  , { name = "time", type_ = "text", value = "" }
  ]

main =
  view initialModel