-- Note we didn't need to add these particular line of code in McMaster outreach IDE
-- For best experience copy the code and paste it on the McMaster IDE
module Solidrot exposing (..)
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
              text "solids of rotation"
                |> sansserif
                |> filled white
                |> scale 0.75
                |> move (0, -15)]
                  |> move (-127, 2),
              group [text "Know how to find"
                |> sansserif
                |> filled white
                |> scale 0.75,
              text "their volume"
                |> sansserif
                |> filled white
                |> scale 0.75
                |> move (10, -15)]
                  |> move (-35, 2),
              group [text "See a small"
                |> sansserif
                |> filled white
                |> scale 0.75,
              text "3D visual of it"
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
        Expl1 ->
            [ rect 300 170 
                |> filled (rgb 196 202 208),
              rect 240 130
                |> filled black
                |> move (0, 0),
              image1,
              arrow
                |> move (90, -50)
                |> notifyTap Transition2
            ]
        Expl2 ->
            [
              rect 300 170 
                |> filled (rgb 196 202 208),
              rect 240 130
                |> filled black
                |> move (0, 0),
              image2,
              arrow
                |> move (90, -50)
                |> notifyTap Transition3
            ]
        Q1 ->
           [
             group [rect 300 170 
                |> filled (rgb 41 47 54),
              rect 200 135
                |> filled white
                |> move (0, 2),
              image3]  
                  |> move (0, -13),
              text "Volume of solid rotated about X - Axis"
                |> sansserif
                |> filled white
                |> scale 0.6
                |> move (-65, 62),
              arrow1
                |> move (100, -70)
                |> notifyTap Transition4
           ]
        Q2 ->
           [
             group [rect 300 170 
                |> filled (rgb 41 47 54),
              rect 150 135
                |> filled white
                |> move (0, 2),
              image4]  
                  |> move (0, -13),
              text "Volume of solid rotated about Y - Axis"
                |> sansserif
                |> filled white
                |> scale 0.6
                |> move (-65, 62),
              arrow1
                |> move (100, -70)
                |> notifyTap Transition5
           ]
        Dimg ->
           [
             group [rect 300 170 
                |> filled (rgb 41 47 54),
              rect 150 135
                |> filled white
                |> move (0, 2),
              image6]  
                  |> move (0, -13),
              text "3D Visual of cone"
                |> sansserif
                |> filled white
                |> scale 0.6
                |> move (-26, 62)
           ]   
        
            
rect2 = rect 200 80
            |> filled black
            |> move (0, -12)
            
arrow = group [ rect 30 10
                  |> filled white,
                text "→"
                  |> sansserif
                  |> filled black
                  |> move (-6, -4) ]
                  
arrow1 = group [ rect 30 10
                  |> filled black,
                text "→"
                  |> sansserif
                  |> filled white
                  |> move (-6, -4) ]

image1 = group [pixelImg 180 110 "https://i.ibb.co/RNgPKjm/IMG-533-F09-E86-FE7-1.jpg"]
  |> move (1, 0)
  
image2 = group [pixelImg 180 120 "https://i.ibb.co/dbMpfxb/Expl2.jpg"]
  |> move (-10, 2)
  
image3 = group [pixelImg 180 120 "https://i.ibb.co/sv6j4v3/VOLQ1.jpg"]
  |> move (1, 0)

image4 = group [pixelImg 130 125 "https://i.ibb.co/1ZJ2PpD/IMG-2550-B2675-B27-1.jpg"]
  |> move (1, 3)
  
image5 = group [pixelImg 130 125 "https://i.ibb.co/1ZJ2PpD/IMG-2550-B2675-B27-1.jpg"]
  |> move (1, 3)

image6 = group [pixelImg 130 125 "https://i.makeagif.com/media/3-12-2015/ZLe4RX.gif"]
  |> move (1, 3)

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


type State = Start
           | Expl1
           | Expl2
           | Q1
           | Q2
           | Dimg

-- Add messages here
type Msg = Tick Float GetKeyState
         | Transition1
         | Transition2
         | Transition3
         | Transition4
         | Transition5

-- This is the type of your model
type alias Model =
    { time : Float
    , state : State
    }

-- Your update function goes here
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Tick t _ -> ( { model | time = t }, Cmd.none )
    Transition1  ->
            case model.state of
                Start  ->
                    ( { model | state = Expl1}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    Transition2  ->
            case model.state of
                Expl1  ->
                    ( { model | state = Expl2}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    Transition3  ->
            case model.state of
                Expl2  ->
                    ( { model | state = Q1}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    Transition4  ->
            case model.state of
                Q1  ->
                    ( { model | state = Q2}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )     
    Transition5  ->
            case model.state of
                Q2  ->
                    ( { model | state = Dimg}, Cmd.none )

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

