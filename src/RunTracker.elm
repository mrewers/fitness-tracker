module RunTracker exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)

view model =
    div [ class "content" ]
        [ h1 [] [ text "Run Tracker" ]
        , div [ id "description" ]
          [ img [ src "http://elm-in-action.com/1.jpeg" ] [] ]
        ]

main =
  view "no model yet"