module RunTracker exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, for, id, name, type_, value)
import Html.Events exposing(onClick)
import Dict exposing (update)

type alias InputField =
  { id: String
  , label: String
  , name : String
  , type_ : String
  , value : String
  }

type alias Model =
 { fields : List InputField
 , distance : String
 }

type alias Msg =
  { action: String, data: String }

view : Model -> Html Msg
view model =
  div [ class "content" ]
      [ h1 [] [ text "Run Tracker" ]
      , form [ id "run-info" ]
        [ div [] ( List.map viewInput model.fields )
        , button 
          [ onClick { action = "SetDistance", data = model.distance }
          , type_ "submit"
          ]
          [text "Save"]
        ]
      , p [] [ text ( "You ran " ++ model.distance ++ " miles") ]
      ]

viewInput : InputField -> Html msg
viewInput field =
  label [ for field.id ]
        [ text (field.label ++ ":")
        , input [ id field.id, name field.name, type_ field.type_, value field.value ] []
        ]

initialModel : Model
initialModel =
  { fields =
      [ { id = "run-info-distance", name = "distance", label = "Distance", type_ = "text", value = "" }
      , { id = "run-info-time", name = "time", label = "Time", type_ = "text", value = "" }
      ]
    , distance = "0"
  }

update : Msg -> Model -> Model
update msg model =
  if msg.action == "SetDistance" then
    { model | distance = msg.data }
  else
    model

main : Program () Model Msg
main =
  Browser.sandbox
    { init = initialModel
    , view = view
    , update = update
    }