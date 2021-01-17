module RunTracker exposing (main)

import Html exposing (..)
import Html.Attributes exposing (class, for, id, name, type_, value)

type alias InputField =
  { id: String
  , label: String
  , name : String
  , type_ : String
  , value : String
  }

type alias Model =
  List InputField

type Msg =
  Change String

view : Model -> Html Msg
view model =
  div [ class "content" ]
      [ h1 [] [ text "Run Tracker" ]
      , form [ id "run-info" ] (List.map viewInput model)
      ]

viewInput : InputField -> Html msg
viewInput field =
  label [ for field.id ]
        [ text (field.label ++ ":")
        , input [ id field.id, name field.name, type_ field.type_, value field.value ] []
        ]

initialModel : List { id : String, name : String, label : String, type_ : String, value : String }
initialModel =
  [ { id = "run-info-distance", name = "distance", label = "Distance", type_ = "text", value = "" }
  , { id = "run-info-time", name = "time", label = "Time", type_ = "text", value = "" }
  ]

main : Html Msg
main =
  view initialModel