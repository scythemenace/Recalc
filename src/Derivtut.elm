-- Note we didn't need to add these particular line of code in McMaster outreach IDE
-- For best experience copy the code and paste it on the McMaster IDE
module Derivtut exposing (..)
import GraphicSVG exposing (..)
-- If you are using the IDE you must delete the above lines
import Html
import Html.Attributes exposing (attribute, height, src, width)

myShapes model =
    case model.state of
        Start  ->
            [ bodyc,
              text "In this module we will...."
                |> sansserif
                |> filled (rgb 41 47 54)
                |> move (-65, 38),
              group [introblocks,
              introblocks
                |> move (95, 0),
              introblocks
                |> move (190, 0)]
                  |> move (-5, 0),
              group [text "Learn what are"
                |> sansserif
                |> filled white
                |> scale 0.75,
              text "Derivatives"
                |> sansserif
                |> filled white
                |> scale 0.75
                |> move (0, -15)]
                  |> move (-127, 2),
              group [text "Know about some"
                |> sansserif
                |> filled white
                |> scale 0.75,
              text "formulae"
                |> sansserif
                |> filled white
                |> scale 0.75
                |> move (10, -15)]
                  |> move (-35, 2),
              group [text "See some"
                |> sansserif
                |> filled white
                |> scale 0.75,
              text "examples of it"
                |> sansserif
                |> filled white
                |> scale 0.75
                |> move (-2, -15)]
                  |> move (71, 2),
              group [rect 60 20
                |> filled (rgb 41 47 54)
                |> move (0, -65),
              text "Start"
                |> sansserif
                |> filled white
                |> move (-13, -69)]
                    |> notifyTap Transition1
            ]
        Begin ->
          [
            mainb,
            image,
            nextbutton
              |> notifyTap A1,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
        Go1 ->
          [
            mainb,
            image1,
            nextbutton
              |> notifyTap A2,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
        Go2 ->
          [
            mainb,
            image2,
            nextbutton
              |> notifyTap A3,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
        Go3 ->
          [
            mainb,
            image3,
            nextbutton
              |> notifyTap A4,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
        Go4 ->
          [
            mainb,
            image4,
            nextbutton
              |> notifyTap A5,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
        Go5 ->
          [
            mainb,
            image5,
            nextbutton
              |> rotate (degrees 180)
              |> move (0, -140)
              |> notifyTap B
          ]
            
rect2 = rect 200 80
            |> filled black
            |> move (0, -12)
            
introblocks = rect 80 70
              |> filled (rgb 41 47 54)
              |> move (-90, -5)

bodyc = group[rect 300 170 
                |> filled (rgb 196 202 208)
        ,rect 300 30
                |> filled (rgb 41 47 54)|> move(0, 70) 
        ,text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
        ,text "Practice Exam"
                |> filled white
                |> move (-10, 90)
                |> scale 0.75
        ,text "Visualizer"
                |> filled white
                |> move (70, 90)
                |> scale 0.75
        ,text "Resources"
                |> filled white
                |> move (130, 90)
                |> scale 0.75
 ]
 
  

image = group [pixelImg 210 120 "https://i.imgur.com/0J7QsqP.png"]
  |> move (1, 4)
  
image1 = group [pixelImg 210 120 "https://i.imgur.com/ntGJ7uW.png"]
  |> move (1, 4)

image2 = group [pixelImg 195 140 "https://i.imgur.com/SFM4Mmo.png"]
  |> move (1, 0)
  
image3 = group [pixelImg 180 120 "https://i.imgur.com/hNQ0rQF.png"]
                  |> move (1, 0)

image4 = group [pixelImg 180 120 "https://i.imgur.com/yD3sLgI.png"]
                  |> move (1, 0)

image5 = group [pixelImg 195 140 "https://i.imgur.com/EqQ5gSr.png"]
  |> move (1, 0)
  
nextbutton = group [pixelImg 23 22 "https://cdn-icons-png.flaticon.com/512/2879/2879593.png"]
  |> move (120, -70)
  
pixelImg : Float -> Float -> String -> Shape userMsg
pixelImg w h url =
    let
        styleString =
            """image-rendering: optimizeSpeed;
            image-rendering: -moz-crisp-edges;
            image-rendering: -o-crisp-edges;
            image-rendering: -webkit-optimize-contrast;
            image-rendering: pixelated;
            image-rendering: optimize-contrast;
            -ms-interpolation-mode: nearest-neighbor;"""
    in
    html w
        h
        (Html.img
            [ src url
            , width (round w)
            , height (round h)
            , attribute "style" styleString
            ]
            []
        )
        |> move ( -w / 2, h / 2 )

mainb = group[rect 300 170 
                |> filled (rgb 196 202 208)
 ]
 
topbar = group [rect 300 30
                |> filled (rgb 41 47 54)|> move(0, 70) 
        ,text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
        ,text "Practice Exam"
                |> filled white
                |> move (-10, 90)
                |> scale 0.75
        ,text "Visualizer"
                |> filled white
                |> move (70, 90)
                |> scale 0.75
        ,text "Resources"
                |> filled white
                |> move (130, 90)
                |> scale 0.75]
 
type State = Start
           | Begin
           | Go1
           | Go2
           | Go3
           | Go4
           | Go5

-- Add messages here
type Msg = Tick Float GetKeyState
         | Transition1
         | A1
         | A2
         | A3
         | A4
         | A5
         | B

-- This is the type of your model
type alias Model = { time : Float, state : State }

-- Your update function goes here
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Tick t _ -> ( { model | time = t }, Cmd.none )
    A1  ->
            case model.state of
                Begin  ->
                    ( { model | state = Go1}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    A2  ->
            case model.state of
                Go1  ->
                    ( { model | state = Go2}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
                    
    A3  ->
            case model.state of
                Go2  ->
                    ( { model | state = Go3}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
                    
    A4  ->
            case model.state of
                Go3  ->
                    ( { model | state = Go4}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    A5  ->
            case model.state of
                Go4  ->
                    ( { model | state = Go5}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    Transition1  ->
            case model.state of
                Start  ->
                    ( { model | state = Begin}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    B  ->
            case model.state of
                Begin  ->
                    ( { model | state = Start}, Cmd.none )
                Go1  ->
                    ( { model | state = Begin}, Cmd.none )

                Go2  ->
                    ( { model | state = Go1}, Cmd.none )
                
                Go3  ->
                    ( { model | state = Go2}, Cmd.none )
                    
                Go4  ->
                    ( { model | state = Go3}, Cmd.none )
                    
                Go5  ->
                    ( { model | state = Go4}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )

-- Your initial model goes here
init : Model
init = { time = 0, state = Start }

-- Your subscriptions go here
subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

-- Your main function goes here
main : EllieAppWithTick () Model Msg
main = 
  ellieAppWithTick Tick 
    { init = \flags -> (init, Cmd.none)
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- You view function goes here
view : Model -> { title: String, body : Collage Msg }
view model = 
  {
    title = "My App Title"
  , body = collage 300 170 (myShapes model)
  }

