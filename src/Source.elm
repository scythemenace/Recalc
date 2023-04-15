
{-https://cs1xd3.online/ShowModulePublish?modulePublishId=8e728172-56fc-4e51-a98e-e5663903b2f5--Main module 


https://cs1xd3.online/ShowModulePublish?modulePublishId=41c0e8c6-0d42-4c99-8737-c31a676de429
--Solid rotation module


https://cs1xd3.online/ShowModulePublish?modulePublishId=9ac0e97f-a099-4fe6-87ba-c9e447e21a8a
--Integrals Module


https://cs1xd3.online/ShowModulePublish?modulePublishId=40fa6327-3791-43b1-ab17-9a4e925e2536
--Derivative Module


https://cs1xd3.online/ShowModulePublish?modulePublishId=2f316675-67fa-474b-8220-9ff9da660cb2
-- Mini game


https://cs1xd3.online/ShowModulePublish?modulePublishId=27da6d46-ed84-4b0f-9cea-c090ddb1a7ec
--Exam TOOL


https://cs1xd3.online/ShowModulePublish?modulePublishId=70aa9259-dd9f-4d5f-9606-0fd8fc25d4b6
--Ressources page-}

-- Note we didn't need to add these particular line of code in McMaster outreach IDE
-- For best experience copy the code and paste it on the McMaster IDE
module Source exposing (..)
import GraphicSVG exposing (..)
-- If you are using the IDE you must delete the above lines
import Html exposing (img)
import Html.Attributes exposing (attribute, height, src, width)
import Tuple exposing (..)
import Xu562.RESSS01
import Xu562.MCQs503
import Pandea23.Integraltut
import Pandea23.Graph1
import Pandea23.Solidrotation
import Pandea23.Derivativetut 

image = group [pixelImg 15 19 "https://www.pngkit.com/png/full/403-4037364_6848425-integral-symbol.png"]
  |> move (1, -18)

image1 = group [pixelImg 22 20 "https://pbs.twimg.com/profile_images/2636215488/d36698dfedf3d0c19fa023a43f369be5_400x400.png"]
  |> move (-96.5, -17)
  
image2 = group [pixelImg 18 16 "http://cdn.onlinewebfonts.com/svg/img_70521.png"]
  |> move (96.5, -17)
  

  
--imagetrial = group [pixelImg 18 16 "https://i.ibb.co/V3Vz43d/contradiction-contingency-tauitology.png"]
 
mm = group [text "Please select a topic to learn"
              |> sansserif
              |> centered
              |> filled black
              |> move (0, 20)
              |> scale 1.15,
            --First
            group [
            roundedRect 42 45 4
              |> filled (rgb 41 47 54)
              |> move (-55, -20)
              |> scale 1.75
              |> notifyTap Tut2D,
            roundedRect 45 48 4
              |> filled (rgb 255 216 88)
              |> move (-193, -35)
              |> scale 0.5,
            text "Derivatives"
              |> sansserif
              |> filled white
              |> scale 0.75
              |> move (-118, -43)
              |> notifyTap Tut2D,
            text "See the derivatives in"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-122, -53)
              |> notifyTap Tut2D,
            text "a new light through"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-119, -59)
              |> notifyTap Tut2D,
            text "visualization"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-111, -65)
              |> notifyTap Tut2D],
            --Second
            group[roundedRect 42 45 4
              |> filled (rgb 41 47 54)
              |> move (0, -20)
              |> scale 1.75
              |> notifyTap Tut2I,
            text "Integrals"
              |> sansserif
              |> filled white
              |> scale 0.75
              |> move (-17, -43)
              |> notifyTap Tut2I,
            text "Experience learning"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-24, -53)
              |> notifyTap Tut2I,
            text "integrals like never"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-22.5, -59)
              |> notifyTap Tut2I,
            text "before"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (-7, -65)
              |> notifyTap Tut2I],
            --Third
            group [roundedRect 42 45 4
              |> filled (rgb 41 47 54)
              |> move (55, -20)
              |> scale 1.75
              |> notifyTap Tut2S,
            roundedRect 45 48 4
              |> filled (rgb 255 216 88)
              |> move (0, -35)
              |> scale 0.5,
            roundedRect 45 48 4
              |> filled (rgb 255 216 88)
              |> move (193, -35)
              |> scale 0.5,
            text "Solid Rotation"
              |> sansserif
              |> filled white
              |> scale 0.75
              |> move (69, -43)
              |> notifyTap Tut2S,
            text "Revolutionize your"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (75, -53)
              |> notifyTap Tut2S,
            text "understanding of"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (77, -59)
              |> notifyTap Tut2S,
            text "solid rotation"
              |> sansserif
              |> filled white
              |> scale 0.45
              |> makeTransparent 0.85
              |> move (82.5, -65)
              |> notifyTap Tut2S]

  ]


quote = [text "Learn Calc, in" |> sansserif|> outlined (solid 0.2) black|>move(0, 15)
         ,text "Learn Calc, in" |> sansserif|> filled black|>move(0, 15)
         ,text "an" |> sansserif|> outlined (solid 0.2) black
         ,text "an" |> sansserif|> filled black
         ,text "interesting" |> sansserif|> outlined (solid 0.2) black|>move(16.7, 0)
         ,text "interesting" |> sansserif|> underline|> filled black|>move(16.7,0)
         ,text "way!" |> sansserif|> outlined (solid 0.2) black|>move(0, -15)
         ,text "way!" |> sansserif|> filled black|>move(0, -15)]|>group
         
board = pixelImg 150 100 "https://iili.io/HX4ULfn.png"

shadow = group[[rect 300 30|> filled (rgb 41 47 54)|> move(0, 70) 
          ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3
          ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75
          ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
          ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75]|>group|>move(0, -1)|>makeTransparent 0.2,
          [rect 300 30|> filled (rgb 41 47 54)|> move(0, 70) 
          ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3
          ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75
          ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
          ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75]|>group|>move(0, -0.75)|>makeTransparent 0.2]
shadowformain = group[[[rect 300 30|> filled (rgb 41 47 54)|> move(0, 70) 
          ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3
          ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75
          ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
          ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75,quote|>scale 1.25|>scaleX 1.05|>move(-135,-0),startbutton|>scale 0.8|>move(-107,-50),roundedRect 150 100 5 |> filled black|>move(60,-10)]|>group|>move(0, -0.75)|>makeTransparent 0.2]|>group
          ,[[rect 300 170 |> filled (rgb 196 202 208)
          ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70) 
          ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3
          ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75
          ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
          ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75,quote|>scale 1.25|>scaleX 1.05|>move(-135,-0),startbutton|>scale 0.8|>move(-107,-50),roundedRect 150 100 5 |> filled black|>move(60,-10)]|>group|>move(0, -1)|>makeTransparent 0.2]|>group
          ]
startbutton=[roundedRect 70 25 1|> filled black,text "Get Started" |> sansserif|> filled white|>scale 0.9|>move(-27, -4)]|>group  

pixelImg : Float -> Float -> String -> Shape userMsg
pixelImg w h url =
    let
        styleString =
            """
            image-rendering: optimizeSpeed;
            image-rendering: -moz-crisp-edges;
            image-rendering: -o-crisp-edges;
            image-rendering: -webkit-optimize-contrast;
            image-rendering: pixelated;
            image-rendering: optimize-contrast;
            -ms-interpolation-mode: nearest-neighbor;
            """
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
        
newbutton = group [pixelImg 24 24 "https://www.freeiconspng.com/thumbs/exit-icon/exit-icon-png-close-0.png"]
  |> move (-120, -60)
  
myShapes model =
  case model.state of
        Tutorial ->
          [
            rect 300 170 
                |> filled (rgb 196 202 208),
            mm,
            image |> notifyTap Tut2I,
            image1|> notifyTap Tut2D,
            image2|> notifyTap Tut2S
            ,rect 300 30
                |> filled (rgb 41 47 54)|> move(0, 70)
            ,text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
                |> notifyTap Back2Main
          ,text "Minigame"
                |> filled white
                |> move (-60, 95)
                |> scale 0.7
                |> notifyTap Main2Game
          ,text "Practice Exam"
                |> filled white
                |> move (0, 95)
                |> scale 0.7
                |> notifyTap Main2Pra
           ,text "Tutorial"
                |> filled white
                |> move (80, 95)
                |> scale 0.7
                |> notifyTap GoTut
            ,text "Resources"
                |> filled white
                |> move (130, 95)
                |> scale 0.7
                |> notifyTap Main2Res
          ]
        Main  ->
          [rect 300 170 |> filled (rgb 196 202 208)
          ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70)
          ,quote|>scale 1.25|>scaleX 1.05|>move(-135,-0)
{-        ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3 |> notifyTap Back2Main
          ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75|> notifyTap Main2Pra
          ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
          ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75|> notifyTap Main2Res
          ,startbutton|>scale 0.8|>move(-107,-50)|> notifyTap Main2Pra,board|>move(60, -10)
          -}
          ,text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
                |> notifyTap Back2Main
          ,text "Minigame"
                |> filled white
                |> move (-60, 95)
                |> scale 0.7
                |> notifyTap Main2Game
          ,text "Practice Exam"
                |> filled white
                |> move (0, 95)
                |> scale 0.7
                |> notifyTap Main2Pra
           ,text "Tutorial"
                |> filled white
                |> move (80, 95)
                |> scale 0.7
                |> notifyTap GoTut
            ,text "Resources"
                |> filled white
                |> move (130, 95)
                |> scale 0.7
                |> notifyTap Main2Res
          ,startbutton|>scale 0.8|>move(-107,-50)|> notifyTap Main2Pra,board|>move(60, -10)
          
          ]
        Practice ->
          [rect 300 170 |> filled (rgb 196 202 208)
          ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70)
          , Xu562.MCQs503.myShapes model.pModel
            |> group
            |> GraphicSVG.map PMsg 
          ,text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
                |> notifyTap Back2Main
          ,text "Minigame"
                |> filled white
                |> move (-60, 95)
                |> scale 0.7
                |> notifyTap Main2Game
          ,text "Practice Exam"
                |> filled white
                |> move (0, 95)
                |> scale 0.7
                |> notifyTap Main2Pra
           ,text "Tutorial"
                |> filled white
                |> move (80, 95)
                |> scale 0.7
                |> notifyTap GoTut
            ,text "Resources"
                |> filled white
                |> move (130, 95)
                |> scale 0.7
                |> notifyTap Main2Res
          ]
        Resource ->
          [rect 300 170 |> filled (rgb 196 202 208)
          ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70)|> scale 0.7529 
          , Xu562.RESSS01.myShapes model.rModel
            |> group
            |> GraphicSVG.map RMsg
          ,group[
          text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
                |> notifyTap Back2Main
          ,text "Minigame"
                |> filled white
                |> move (-60, 95)
                |> scale 0.7
                |> notifyTap Main2Game
          ,text "Practice Exam"
                |> filled white
                |> move (0, 95)
                |> scale 0.7
                |> notifyTap Main2Pra
           ,text "Tutorial"
                |> filled white
                |> move (80, 95)
                |> scale 0.7
                |> notifyTap GoTut
            ,text "Resources"
                |> filled white
                |> move (130, 95)
                |> scale 0.7
                |> notifyTap Main2Res]
          |> scale 0.7529]
        Derivatut ->
          [Pandea23.Derivativetut.myShapes model.dModel
                |> group
                |> GraphicSVG.map DMsg
           ,newbutton
                |> move (0, 120)
                |> notifyTap Back2Main
                ]
        Solidtut ->
          [Pandea23.Solidrotation.myShapes model.sModel
                |> group
                |> GraphicSVG.map SMsg
           ,rect 300 31|> filled (rgb 41 47 54)|> move(0, 70)
           ,group[
          text "Recalc!"
                |> filled white
                |> move (-105, 50)
                |> scale 1.3
                |> notifyTap Back2Main
          ,text "Minigame"
                |> filled white
                |> move (-60, 95)
                |> scale 0.7
                |> notifyTap Main2Game
          ,text "Practice Exam"
                |> filled white
                |> move (0, 95)
                |> scale 0.7
                |> notifyTap Main2Pra
           ,text "Tutorial"
                |> filled white
                |> move (80, 95)
                |> scale 0.7
                |> notifyTap GoTut
            ,text "Resources"
                |> filled white
                |> move (130, 95)
                |> scale 0.7
                |> notifyTap Main2Res]
                ]
        Integtut ->
          [Pandea23.Integraltut.myShapes model.iModel
                |> group
                |> GraphicSVG.map IMsg
            ,newbutton
                |> move (0, 120)
                |> notifyTap Back2Main
                ]
                  
        Game ->
          [rect 300 170 |> filled (rgb 196 202 208)
              ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70)|> scale 0.7529 
              , Pandea23.Graph1.myShapes model.gModel
                |> group
                |> GraphicSVG.map GMsg
              ,newbutton
                |> notifyTap Back2Main
              ]
          
          
-- Add messages here
type Msg = Tick Float GetKeyState
         | PMsg Xu562.MCQs503.Msg
         | RMsg Xu562.RESSS01.Msg
         | IMsg Pandea23.Integraltut.Msg 
         | SMsg Pandea23.Solidrotation.Msg 
         | DMsg Pandea23.Derivativetut.Msg 
         | GMsg Pandea23.Graph1.Msg 
         | Main2Pra
         | Main2Res
         | Res2Pra
         | Pra2Res
         | Back2Main
         | GoTut
         | Tut2I
         | Tut2S
         | Tut2D
         | Main2Game
         
-- This is the type of your model
type alias Model = { time : Float 
                    , state : State
                    , startTime : Float
                    , pModel : Xu562.MCQs503.Model 
                    , rModel : Xu562.RESSS01.Model
                    , iModel : Pandea23.Integraltut.Model 
                    , sModel : Pandea23.Solidrotation.Model 
                    , dModel : Pandea23.Derivativetut.Model 
                    , gModel : Pandea23.Graph1.Model }

type State = Tutorial
           | Main
           | Practice
           | Resource 
           | Integtut
           | Solidtut
           | Derivatut
           | Game
           
           
-- Your update function goes here
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Tick t getKeyState ->
            case model.state of
              Practice ->
                ({ model | time = t, pModel = first(Xu562.MCQs503.update (Xu562.MCQs503.Tick t getKeyState) model.pModel) }, Cmd.none)
              Resource  ->
                ({ model | time = t, rModel = Xu562.RESSS01.update (Xu562.RESSS01.Tick t getKeyState) model.rModel }, Cmd.none)
              Integtut ->
                ({ model | time = t, iModel = first(Pandea23.Integraltut.update (Pandea23.Integraltut.Tick t getKeyState) model.iModel) }, Cmd.none)
              Solidtut ->
                ({ model | time = t, sModel = first(Pandea23.Solidrotation.update (Pandea23.Solidrotation.Tick t getKeyState) model.sModel) }, Cmd.none)
              Derivatut ->
                ({ model | time = t, dModel = first(Pandea23.Derivativetut.update (Pandea23.Derivativetut.Tick t getKeyState) model.dModel) }, Cmd.none)
              Game ->
                ({ model | time = t, gModel = first(Pandea23.Graph1.update (Pandea23.Graph1.Tick t getKeyState) model.gModel) }, Cmd.none)
              _ ->
                ({ model | time = t }, Cmd.none)
    PMsg pMsg ->  
            ({ model | pModel = first(Xu562.MCQs503.update pMsg 
                                                         model.pModel) }, Cmd.none)
    IMsg iMsg ->  
            ({ model | iModel = first(Pandea23.Integraltut.update iMsg 
                                                         model.iModel) }, Cmd.none)
    SMsg sMsg ->  
            ({ model | sModel = first(Pandea23.Solidrotation.update sMsg 
                                                         model.sModel) }, Cmd.none)
    DMsg dMsg ->  
            ({ model | dModel = first(Pandea23.Derivativetut.update dMsg 
                                                         model.dModel) }, Cmd.none)
    GMsg gMsg ->  
            ({ model | gModel = first(Pandea23.Graph1.update gMsg 
                                                         model.gModel) }, Cmd.none)
    RMsg rMsg ->  
            ({ model | rModel = Xu562.RESSS01.update rMsg 
                                                         model.rModel }, Cmd.none) 
    Main2Pra ->
            case model.state of
                _  ->
                    ({ model | state = Practice}, Cmd.none)
    GoTut ->
            case model.state of
                _  ->
                    ({ model | state = Tutorial}, Cmd.none)
 
    Main2Res ->
            case model.state of
                _  ->
                    ({ model | state = Resource}, Cmd.none) 
    Res2Pra ->
            case model.state of
                _  ->
                    ({ model | state = Practice}, Cmd.none)

    Pra2Res ->
            case model.state of
                _  ->
                    ({ model | state = Resource}, Cmd.none)
                    
    Tut2I ->
                case model.state of
                    _  ->
                        ({ model | state = Integtut}, Cmd.none)
    Tut2S ->
                case model.state of
                    _  ->
                        ({ model | state = Solidtut}, Cmd.none)
    Tut2D ->
                case model.state of
                    _  ->
                        ({ model | state = Derivatut}, Cmd.none)
    Main2Game ->
                case model.state of
                    _  ->
                        ({ model | state = Game}, Cmd.none)
    Back2Main ->
            case model.state of
                _  ->
                    ({ model | state = Main}, Cmd.none)                   

-- Your initial model goes here
init : Model
init = { time = 0, state = Main, startTime = 0
       , pModel = Xu562.MCQs503.initialModel
       , rModel = Xu562.RESSS01.init
       , iModel = Pandea23.Integraltut.init
       , sModel = Pandea23.Solidrotation.init
       , dModel = Pandea23.Derivativetut.init
       , gModel = Pandea23.Graph1.init

       }

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
    title = "Recalc"
  , body = 
    case model.state of
          Resource ->  
            collage 226 128 (myShapes model)
          otherwise ->
              collage 300 170 (myShapes model)
  }

