module Piece exposing (Piece, Side(..), flip)


type Side
    = Front
    | Back


type alias Piece =
    { position : Int
    , side : Side
    }


flip : Piece -> Piece
flip piece =
    case piece.side of
        Back ->
            { piece | side = Front }

        Front ->
            { piece | side = Back }