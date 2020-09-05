module Main5 exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Http


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- Model


type alias Model =
    { result : String
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { result = "" }
    , Cmd.none
    )



-- Update


type Msg
    = Click
    | GotRepo (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Click ->
            ( model
            , Http.request
                { url = "https://github.com/elm/core"
                , expect = Http.expectString GotRepo
                , headers = [ Http.header "Access-Control-Allow-Origin" "*" ]
                , method = "GET"
                , body = Http.emptyBody
                , timeout = Nothing
                , tracker = Nothing
                }
            )

        GotRepo (Ok repo) ->
            ( { model | result = repo }, Cmd.none )

        GotRepo (Err error) ->
            ( { model | result = Debug.toString error }, Cmd.none )



-- View


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Click ] [ text "Get Repository Info" ]
        , p [] [ text model.result ]
        ]
