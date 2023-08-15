module Main exposing (main)

import Browser
import Css exposing (height, px, width)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (checked, class, classList, css, for, id, name, type_)
import Html.Styled.Events exposing (onClick)
import List.Extra
import Piece exposing (Piece)
import Random


type Size
    = Small
    | Medium
    | Large


type Msg
    = ClickedSize Size
    | ClickedInvert
    | ClickedPiece Piece
    | ClickedRandom
    | GotRandomPosition Int


type alias Model =
    { board : List Piece
    , config : Config
    }


type alias Config =
    { squareSize : Size
    , squaresPerRow : Int
    }


initialModel : Model
initialModel =
    let
        board =
            (config.squaresPerRow ^ 2)
                |> List.range 0
                |> List.map (\position -> Piece position Piece.Front)

        config =
            { squareSize = Large
            , squaresPerRow = 16
            }
    in
    { board = board
    , config = config
    }


viewBoard : Model -> Html Msg
viewBoard model =
    let
        squareSize =
            case model.config.squareSize of
                Small ->
                    8

                Medium ->
                    16

                Large ->
                    32

        boardEdgeSize =
            squareSize * toFloat model.config.squaresPerRow
    in
    div
        [ class "flex items-center justify-center flex-wrap"
        , class "rounded-xl overflow-hidden"
        , class "border-2 border- gray-800 box-content"
        , css
            [ height (px boardEdgeSize)
            , width (px boardEdgeSize)
            ]
        ]
    <|
        List.indexedMap (viewSquare squareSize) model.board


viewSquare : Float -> Int -> Piece -> Html Msg
viewSquare squareSize index piece =
    div
        [ class "select-none cursor-pointer"
        , classList
            [ ( "bg-gray-800", piece.side == Piece.Back )
            , ( "bg-white hover:bg-gray-200", piece.side == Piece.Front )
            ]
        , class "flex items-center justify-center"
        , class "tracking-tighter text-xs text-gray-400"
        , css
            [ height (px squareSize)
            , width (px squareSize)
            ]
        , onClick (ClickedPiece piece)
        ]
        []


viewSizeRadioButton : Size -> Size -> Html Msg
viewSizeRadioButton currentSize size =
    let
        sizeName =
            case size of
                Small ->
                    "small"

                Medium ->
                    "medium"

                Large ->
                    "large"
    in
    div [ class "flex items-center" ]
        [ input
            [ id sizeName
            , checked (currentSize == size)
            , class "focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300"
            , type_ "radio"
            , name "size"
            , onClick (ClickedSize size)
            ]
            []
        , label
            [ for sizeName
            , class "ml-2 block text-sm font-medium text-gray-700"
            ]
            [ text sizeName ]
        ]


view : Model -> Html Msg
view model =
    div
        [ class "font-sans p-16 prose antialiased" ]
        [ h1 [] [ text "Let's draw!" ]
        , button
            [ class "rounded px-3 mb-4"
            , class "text-white hover:bg-gray-800 bg-gray-900"
            , onClick ClickedInvert
            ]
            [ text "Invert" ]
        , button
            [ class "rounded px-3 mb-4 ml-2"
            , class "hover:bg-gray-200 bg-gray-100"
            , onClick ClickedRandom
            ]
            [ text "Random" ]
        , viewBoard model
        , div
            [ class "fixed bottom-0 py-6 bg-white"
            , class "flex space-x-4 mt-4"
            ]
          <|
            List.map (viewSizeRadioButton model.config.squareSize) [ Small, Medium, Large ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedPiece piece ->
            ( { model | board = List.Extra.updateAt piece.position Piece.flip model.board }
            , Cmd.none
            )

        ClickedInvert ->
            ( { model | board = List.map Piece.flip model.board }
            , Cmd.none
            )

        ClickedSize size ->
            ( { model | config = updateSquareSize model.config size }
            , Cmd.none
            )

        ClickedRandom ->
            ( model
            , Random.int 0 (model.config.squaresPerRow ^ 2)
                |> Random.generate GotRandomPosition
            )

        GotRandomPosition position ->
            ( { model | board = List.Extra.updateAt position Piece.flip model.board }
            , Cmd.none
            )


updateSquareSize : Config -> Size -> Config
updateSquareSize config size =
    { config | squareSize = size }


main : Program () Model Msg
main =
    Browser.element
        { init = \flags -> ( initialModel, Cmd.none )
        , view = view >> toUnstyled
        , update = update
        , subscriptions = \model -> Sub.none
        }