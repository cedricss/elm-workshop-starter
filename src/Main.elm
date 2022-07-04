module Main exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    div
        [ class "font-sans p-16 prose antialiased" ]
        [ h1
            []
            [ text "Elm workshop" ]
        , p
            []
            [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
            , text "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
            , text "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
            ]
        ]
