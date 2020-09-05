module Main exposing (main)

import Html exposing (Html, a, div, h1, li, text, ul)
import Html.Attributes exposing (href, target)


main : Html msg
main =
    div [] [ header, content ]


header : Html msg
header =
    h1 [] [ text "Useful Links" ]


content : Html msg
content =
    ul []
        [ linkItem "https://elm-lang.org" "homepage"
        , linkItem "https://elm-lang.org" "Elm"
        , linkItem "https://elm-lang.org" "Elm"
        ]


linkItem : String -> String -> Html msg
linkItem url text_ =
    li [] [ a [ href url, target "_blank" ] [ text text_ ] ]
