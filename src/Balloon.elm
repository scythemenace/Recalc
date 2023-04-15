-- Note we didn't need to add these particular line of code in McMaster outreach IDE
-- For best experience copy the code and paste it on the McMaster IDE
module Balloon exposing (..)
import GraphicSVG exposing (..)
-- If you are using the IDE you must delete the above lines
import Html
import Html.Attributes exposing (attribute, height, src, width)

skyblue = (rgb 135 206 235)
-- CUSTOM BALLOON TYPE ---
type alias Balloon =
    { position : (Float, Float)
    , width : Float
    , height : Float
    , color : Color
    , size : Float
    , answer : String
    }
    
-- NEW BALLOON --
newBalloon : (Float, Float) -> Float -> Float -> Color -> Float -> String -> Balloon
newBalloon position width height color size answer =
    { position = position
    , width = width
    , height = height
    , color = color
    , size = size
    , answer = answer
    }
    
generateBalloon : Balloon -> (Shape userMsg)
generateBalloon bloon =
             group[oval bloon.width bloon.height
               |> filled bloon.color,
             triangle (bloon.height/8)
               |> filled bloon.color
               |> rotate (degrees 90)
               |> move (0, -15),
             text bloon.answer
               |> centered
               |> filled white
               |> move (0, 0)
               |> if bloon.size <= 1.5 then scale (bloon.size/5) else scale (bloon.size/8)]
                 |> move bloon.position
                 |> scale bloon.size
-- Balloons used in Level 1
balloon1 = newBalloon (0, 0) 18 26 darkYellow 1.5 ""
balloon2 = newBalloon (0, 0) 18 26 red 1.5 ""
balloon3 = newBalloon (0, 0) 18 26 blue 1.5 ""
-- Balloons used in Level 1
-- Balloons used in Level 2
balloon4 = newBalloon (-20, 0) 18 26 yellow 1.75 "sinx + C"
balloon5 = newBalloon (10, -10) 18 26 red 1.75 "-cosx + C"
balloon6 = newBalloon (30, 10) 18 26 blue 1.75 "-sinx + C"
balloon7 = newBalloon (-20, 0) 18 26 darkYellow 1.75 "xtanx + C"
-- Balloons used in Level 2
-- Balloons used in Level 3
balloon8 = newBalloon (10, -10) 18 26 red 1.75 "5tanx + C"
balloon9 = newBalloon (30, 10) 18 26 blue 1.75 "5cosx + C"
balloon10 = newBalloon (0, 0) 18 26 orange 1.75 "5cotx+ C"
balloon11 = newBalloon (-20, 10) 18 26 blue 1.5 "1/secx"
balloon12 = newBalloon (-10, 0) 18 26 darkYellow 1.5 "cot^2 x"
balloon13 = newBalloon (0, -10) 18 26 red 1.5 "6x^2/sinx"
balloon14 = newBalloon (15, 10) 18 26 blue 1.5 "2cos2x"
balloon15 = newBalloon (25, 0) 18 26 purple 1.5 "x^2sinx"
-- Balloons used in Level 3
-- Balloons used in Level 4
balloon16 = newBalloon (35, 10) 18 26 orange 1.5 "2sin4x"
balloon17 = newBalloon (45, -10) 18 26 brown 1.5 "sin2x"
balloon18 = newBalloon (-30, 10) 18 26 blue 1.5 "1/(1+x)"
balloon19 = newBalloon (-15, 0) 18 26 orange 1.5 "1/(1+2√x)"
balloon20 = newBalloon (-5, 10) 18 26 brown 1.5 "1/√x"
balloon21 = newBalloon (10, 0) 18 26 darkYellow 1.5 "x^4"
balloon22 = newBalloon (20, -10) 18 26 red 1.5 "x^2 + 2x"
balloon23 = newBalloon (30, 10) 18 26 blue 1.5 "2√x"
balloon24 = newBalloon (35, 0) 18 26 purple 1.5 "x^(3/2)"
balloon25 = newBalloon (45, 10) 18 26 orange 1.5 "x/√2"
balloon26 = newBalloon (55, -10) 18 26 brown 1.5 "1/2√x"
-- Balloons used in Level 4
-- Balloons used in Level 5
balloon27 = newBalloon (-30, 10) 18 26 blue 1.5 "π/3"
balloon28 = newBalloon (-15, 0) 18 26 orange 1.5 "1/3π"
balloon29 = newBalloon (-5, 10) 18 26 brown 1.5 "1/2π"
balloon30 = newBalloon (10, 0) 18 26 darkYellow 1.5 "2π"
balloon31 = newBalloon (-20, -12) 18 26 red 1.5 "2π^2"
balloon32 = newBalloon (30, 10) 18 26 blue 1.5 "1/2π^2"
balloon33 = newBalloon (35, 0) 18 26 purple 1.5 "π/(1 + π)"
balloon34 = newBalloon (50, 10) 18 26 orange 1.5 "π^2/6"
balloon35 = newBalloon (30, -12) 18 26 brown 1.5 "4π + 2"
-- Balloons used in Level 5
-- Balloons used in Level 6
balloon36 = newBalloon (-40, 10) 18 26 blue 1.5 "2ln(ln(x))"
balloon37 = newBalloon (-30, 0) 18 26 orange 1.5 "2ln(ln(x))"
balloon38 = newBalloon (-18, 10) 18 26 brown 1.5 "ln(x)"
balloon39 = newBalloon (0, 0) 18 26 darkYellow 1.5 "(ln(x))^2"
balloon40 = newBalloon (10, -15) 18 26 red 1.5 "ln|ln(x)|"
balloon41 = newBalloon (20, 10) 18 26 blue 1.5 "1/x"
balloon42 = newBalloon (35, 0) 18 26 purple 1.5 "ln(x)^-1"
balloon43 = newBalloon (20, -30) 18 26 orange 1.5 "ln(x)^4"
balloon44 = newBalloon (50, -20) 18 26 brown 1.5 "12ln(x)"
balloon45 = newBalloon (-38, -10) 18 26 darkBlue 1.5 "ln(πx)"
balloon46 = newBalloon (50, 10) 18 26 darkRed 1.5 "ln(x^-1)"
balloon47 = newBalloon (-20, -20) 18 26 darkGreen 1.5 "3ln(x)"
-- Balloons used in Level 6
-- Balloons used in Level 7
balloon48 = newBalloon (-40, 10) 18 26 blue 2 "arcsin(x)"
balloon49 = newBalloon (-30, 0) 18 26 orange 2 "-arccot(x)"
balloon50 = newBalloon (-18, -10) 18 26 brown 2 "arctan(1/x)"
balloon51 = newBalloon (0, 0) 18 26 darkYellow 2 "arcsin(2x)"
balloon52 = newBalloon (10, -15) 18 26 red 2 "arccosec(x)"
balloon53 = newBalloon (20, 10) 18 26 blue 2 "arccos(1/x)"
balloon54 = newBalloon (25, 20) 18 26 purple 2 "arccot(1/x)"
balloon55 = newBalloon (20, -30) 18 26 orange 2 "arctan(x)"
balloon56 = newBalloon (30, -20) 18 26 brown 2 " -arcsin(1/x)"
balloon57 = newBalloon (-38, -20) 18 26 darkBlue 2 "-arctan(1/x)"
balloon58 = newBalloon (40, 10) 18 26 darkRed 2 "arctan(x^2)"
balloon59 = newBalloon (-20, -30) 18 26 darkRed 2 "arctan(3x/4)"
balloon60 = newBalloon (40, -10) 18 26 darkRed 2 "arcsin(x^4)"
balloon61 = newBalloon (-30, -40) 18 26 darkGreen 2 "arccos(x)"
-- Balloons used in Level 7
-- Balloons used in Level 8
balloon62 = newBalloon (-40, 10) 18 26 blue 1.5 "4x-2"
balloon63 = newBalloon (-30, 0) 18 26 orange 1.5 "2x-3"
balloon64 = newBalloon (-18, 10) 18 26 brown 1.5 "2x^2-3x"
balloon65 = newBalloon (0, 0) 18 26 darkYellow 1.5 "4x-3"
balloon66 = newBalloon (10, -15) 18 26 red 1.5 "2x^2-3"
balloon67 = newBalloon (20, 10) 18 26 blue 1.5 "4x^2-3x+4"
balloon68 = newBalloon (35, 0) 18 26 purple 1.5 "2x^2-2x+4"
balloon69 = newBalloon (20, -30) 18 26 orange 1.5 "4x^2-3x"
balloon70 = newBalloon (50, -20) 18 26 brown 1.5 "x^2-2x+3"
balloon71 = newBalloon (-38, -15) 18 26 darkBlue 1.5 "6x^3"
balloon72 = newBalloon (50, 10) 18 26 darkRed 1.5 "5x^3-3x+2"
balloon73 = newBalloon (-30, -20) 18 26 darkGreen 1.5 "2ln(x)"
-- Balloons used in Level 8
-- Balloons used in Level 9
balloon74 = newBalloon (-40, 10) 18 26 blue 1.5 " π/12"
balloon75 = newBalloon (-30, 0) 18 26 orange 1.5 "π/18"
balloon76 = newBalloon (-18, 10) 18 26 brown 1.5 "π/24"
balloon77 = newBalloon (0, 0) 18 26 darkYellow 1.5 "π/30"
balloon78 = newBalloon (10, -15) 18 26 red 1.5 "π/30"
balloon79 = newBalloon (20, 10) 18 26 blue 1.5 "π/42"
balloon80 = newBalloon (35, 0) 18 26 purple 1.5 "π/6"
balloon81 = newBalloon (20, -30) 18 26 orange 1.5 "(π+1)/5"
balloon82 = newBalloon (50, -20) 18 26 brown 1.5 "(π^2+1)/3"
balloon83 = newBalloon (-38, -15) 18 26 darkBlue 1.5 "π/66"
balloon84 = newBalloon (50, 10) 18 26 darkRed 1.5 "3π/17"
balloon85 = newBalloon (-35, -35) 18 26 darkGreen 1.5 "0"
balloon86 = newBalloon (50, 10) 18 26 darkRed 1.5 "none"
balloon87 = newBalloon (-20, -20) 18 26 darkGreen 1.5 "π^2/48"
-- Balloons used in Level 9
-- Balloons used in Level 10
balloon88 = newBalloon (-40, 10) 18 26 blue 1.5 " π/2"
balloon89 = newBalloon (-30, 0) 18 26 orange 1.5 "2π/3"
balloon90 = newBalloon (-18, 10) 18 26 brown 1.5 "π"
balloon91 = newBalloon (0, 0) 18 26 darkYellow 1.5 "4π/3"
balloon92 = newBalloon (10, -15) 18 26 red 1.5 "3π/2"
balloon93 = newBalloon (20, 10) 18 26 blue 1.5 "5π/3"
balloon94 = newBalloon (35, 0) 18 26 purple 1.5 "7π/3"
balloon95 = newBalloon (20, -30) 18 26 orange 1.5 "13π/3"
balloon96 = newBalloon (50, -20) 18 26 brown 1.5 "(11π/3"
balloon97 = newBalloon (-38, -15) 18 26 darkBlue 1.5 "ln(12)"
balloon98 = newBalloon (50, 10) 18 26 darkRed 1.5 "3π/17"
balloon99 = newBalloon (-25, -30) 18 26 darkGreen 1.5 "e^4"
balloon100 = newBalloon (50, 10) 18 26 darkRed 1.5 "none"
balloon101 = newBalloon (-30, -20) 18 26 darkGreen 1.5 "4π"
-- Balloons used in Level 10
myShapes model =
  case model.state of
        Start ->
          [
            commonbg,
            group [cloud
              |> scale 1,
              cloud
                |> scale 1
                |> move (-60, -20),
              group [cloud
                |> scale 1
                |> move (-120, 0),
                text "Pop"
                |> filled black
                |> scale 1.25
                |> move (-110, 0),
                text "Balloons"
                |> filled black
                |> scale 1.25
                |> move (-2, 0)]]
                  |> move (repeatDistance -20 530 300 (4 * model.time), 40),
            group [cloud
              |> scale 0.5,
              cloud
              |> scale 0.75
              |> move (-50, 15),
              group [cloud
              |> scale 0.75
              |> move (-120, 0),
              text "the"
                |> filled black
                |> scale 1.25
                |> move (-45, 15)]]
                  |> move (repeatDistance -20 530 300 (4 * model.time), 10),
            group [generateBalloon balloon1
                  |> move (0, repeatDistance 10 330 -150 (4 * model.time)),
            generateBalloon balloon2
                  |> move (60, repeatDistance 10 330 -180 (4 * model.time)),
            generateBalloon balloon3
                  |> move (-60, repeatDistance 10 330 -210 (4 * model.time))]
            ,group[rect 52 22
                |> filled black
                |> move (0, -40),
                rect 50 20
                |> filled white
                |> move (0, -40),
                text "Start"
                |> filled black
                |> move (-12, -43.5)]
                  |> notifyTap Enter
          ]
        Menu ->
          [
            commonbg
            ,homebutton
              |> move (-78, 70)
              |> notifyTap GoBack
            ,group[rect 64 18
                |> filled black
                |> move (0, 52),
                rect 62 16
                |> filled white
                |> move (0, 52),
                text "Main Menu"
                  |> sansserif
                  |> centered
                  |> filled black
                  |> move (0, 48)]
            --Level 1 - 3--
            ,group [group [group [rect 42 15 
              |> filled white,
              text "Level 1"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap LV1]
                  |> move (-60, 30),
              group [rect 42 15 
              |> filled white,
              text "Level 2"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass1]
                  |> move (-60, 5),
              group [rect 42 15 
              |> filled white,
              text "Level 3"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass2]
                  |> move (-60, -20)]
                    |> move (0, -5)
            --Level 4 - 6
            ,group [group [rect 42 15 
              |> filled white,
              text "Level 4"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass3]
                  |> move (-60, 30),
              group [rect 42 15 
              |> filled white,
              text "Level 5"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass4]
                  |> move (-60, 5),
              group [rect 42 15 
              |> filled white,
              text "Level 6"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass5]
                  |> move (-60, -20)]
                    |> move (60, -5)
            -- level 7 - 9
            ,group [group [rect 42 15 
              |> filled white,
              text "Level 7"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass6]
                  |> move (-60, 30),
              group [rect 42 15 
              |> filled white,
              text "Level 8"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass7]
                  |> move (-60, 5),
              group [rect 42 15 
              |> filled white,
              text "Level 9"
                |> sansserif
                |> filled black
                |> move (-19, -4)
                |> notifyTap Pass8]
                  |> move (-60, -20)]
                    |> move (120, -5)
           -- level 9 - 12
           ,group [group [rect 47 15 
              |> filled white,
              text "Level 10"
                |> sansserif
                |> filled black
                |> move (-22.5, -4)
                |> notifyTap Pass9]
                  |> move (0, -50)]]

          ]
        Level1  ->
          [
            rect 300 170
              |> filled skyblue,
              group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "∫ sin(x) dx"
                |> filled black
                |> move (-30, -43.5)]
                  |> move (0, 90),
            level1 model.time Pass1 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level2 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "∫ 5sec^2 x dx"
                |> filled black
                |> move (-35, -43.5)]
                  |> move (0, 90),
            level2 model.time Pass2 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level3 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "d/dx sin2x"
                |> filled black
                |> move (-28, -43.5)]
                  |> move (0, 90),
            level3 model.time Pass3 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level4 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "d/dx sqrt(x)"
                |> filled black
                |> move (-30, -43.5)]
                  |> move (0, 90),
            level4 model.time Pass4 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level5 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 142 22
                |> filled black
                |> move (10, -40),
                rect 140 20
                |> filled white
                |> move (10, -40),
                group [text "Find the volume of the solid formed by rotating"
                |> filled black
                |> move (-30, -35)
                |> scale 0.6,
                text "the region enclosed by y = x^2, y = 0, x = 1"
                |> filled black
                |> move (-30, -45)
                |> scale 0.6,
                text ", and x-axis about the x-axis."
                |> filled black
                |> move (-30, -55)
                |> scale 0.6]
                  |> move (-40, -15)]
                  |> move (0, 90),
            level5 model.time Pass5 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level6 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "∫ 1/(xln(x)) dx"
                |> filled black
                |> move (-35, -43.5)]
                  |> move (0, 90),
            level6 model.time Pass6 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level7 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "∫ 1/(1+x^2) dx"
                |> filled black
                |> move (-35, -43.5)]
                  |> move (0, 90),
            level7 model.time Pass7 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level8 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "d/dx 2x^2 - 3x + 4"
                |> filled black
                |> move (-44, -43.5)]
                  |> move (0, 90),
            level8 model.time Pass8 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level9 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 102 18
                |> filled black
                |> move (0, -40),
                rect 100 16
                |> filled white
                |> move (0, -40),
                text "∫(x^3 + 1)/(x^6 + 1) dx from 0 to ∞"
                |> filled black
                |> move (-86, -76)
                |> scale 0.55]
                  |> move (0, 90),
            level9 model.time Pass9 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        Level10 -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 142 22
                |> filled black
                |> move (10, -40),
                rect 140 20
                |> filled white
                |> move (10, -40),
                group [text "Find the volume of the solid generated by"
                |> filled black
                |> move (-30, -35)
                |> scale 0.6,
                text "rotating the region bounded by y=x^2 and y="
                |> filled black
                |> move (-30, -45)
                |> scale 0.6,
                text "2x-x^2 in the first quadrant about the line x=3?"
                |> filled black
                |> move (-30, -55)
                |> scale 0.6]
                  |> move (-40, -15)]
                  |> move (0, 90),
            level10 model.time Pass10 Wrong,
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
            ,prevbutton
              |> move (110, -30)
              |> notifyTap Prev
          ]
        WrongS -> 
          [
            rect 300 170
              |> filled black,
            text "Incorrect Answer! Please try again"
              |> bold
              |> centered
              |> sansserif
              |> filled red
              |> scale 1.25
              |> move (0, 30),
            group[rect 92 22
                |> filled black
                |> move (0, -30),
                rect 90 20
                |> filled white
                |> move (0, -30),
                text "Try Again"
              |> bold
              |> sansserif
              |> filled red
              |> notifyTap Prev
              |> move (-28, -33)]
          ]
        Congrats -> 
          [
            rect 300 170
              |> filled skyblue,
            group[rect 162 98
                |> filled black
                |> move (0, -100),
                rect 160 96
                |> filled white
                |> move (0, -100),
                group [text "Congrats! If you are here, then you have"
                |> filled black
                |> move (-35, -105)
                |> scale 0.6,
                text "probably finished the 10th level and cleared"
                |> filled black
                |> move (-35, -125)
                |> scale 0.6,
                text "the game!!!"
                |> filled black
                |> move (-35, -145)
                |> scale 0.6]
                  |> move (-40, -15)]
                  |> move (0, 90),
            text "Thanks for playing!! 😁 😁"
                |> filled black
                |> move (-65, -40),
            homebutton
              |> move (-120, 68)
              |> notifyTap GoBack
          ]


level1 time correctAns wrongAns = group [generateBalloon balloon5
              |> move (20 * sin (-3 * cos time), 20 * cos (-3 * sin time))
              |> notifyTap correctAns,
            generateBalloon balloon4
              |> move (25 * cos (-3 * sin time), 30 * sin (-3 * cos time))
              |> notifyTap wrongAns,
            generateBalloon balloon6
              |> move (10 * cos (-3 * sin time), 15 * sin (-3 * cos time))
              |> notifyTap wrongAns]
              
level2 time correctAns wrongAns = group [generateBalloon balloon7
              |> move (20 * sin (-3 * cos time), repeatDistance 10 330 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon8
              |> move (25 * cos (-3 * sin time), repeatDistance 10 330 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon9
              |> move (10 * cos (-3 * sin time), repeatDistance 10 330 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon10
              |> move (20 * sin (-3 * cos time), repeatDistance 10 330 -150 (4 * time))]
level3 time correctAns wrongAns = group [generateBalloon balloon11
              |> move (20 * sin (-3 * cos time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon12
              |> move (25 * cos (-3 * sin time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon13
              |> move (10 * sin (-3 * cos time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon14
              |> move (20 * cos (-3 * sin time), repeatDistance 10 300 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon15
              |> move (20 * sin (-3 * cos time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon16
              |> move (20 * cos (-3 * sin time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon17
              |> move (20 * sin (-3 * cos time), repeatDistance 10 300 -150 (4 * time))|> notifyTap wrongAns]

level4 time correctAns wrongAns = group [generateBalloon balloon18
              |> move (20 * sin (-3 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon19
              |> move (25 * cos (-3 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon20
              |> move (10 * sin (-3 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon21
              |> move (20 * cos (-3 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon22
              |> move (20 * sin (-3 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon23
              |> move (20 * cos (-3 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon24
              |> move (20 * sin (-3 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon25
              |> move (20 * cos (-3 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon26
              |> move (20 * sin (-3 * cos time), repeatDistance 15 300 -150 (4 * time))
              |> notifyTap correctAns]
          
level5 time correctAns wrongAns = group [generateBalloon balloon27
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon28
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon29
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon30
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon31
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon32
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon33
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon34
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon35
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns]

level6 time correctAns wrongAns = group [generateBalloon balloon36
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon37
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon38
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon39
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon40
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon41
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon42
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon43
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon44
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon45
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon46
              |> move (25 * cos (-5 * sin time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon47
              |> move (25 * sin (-5 * cos time), repeatDistance 15 300 -150 (4 * time))|> notifyTap wrongAns]

level7 time correctAns wrongAns = group [generateBalloon balloon48
              |> move (20 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon49
              |> move (25 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon50
              |> move (10 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon51
              |> move (20 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon52
              |> move (20 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon53
              |> move (20 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon54
              |> move (20 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon55
              |> move (25 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon56
              |> move (10 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon57
              |> move (20 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon58
              |> move (20 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon59
              |> move (20 * sin (-3 * cos time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon60
              |> move (20 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon61
              |> move (25 * cos (-3 * sin time), repeatDistance 15 340 -150 (4 * time))|> notifyTap wrongAns]

level8 time correctAns wrongAns = group [generateBalloon balloon62
              |> move (40 * sin (-3 * cos time), repeatDistance 20 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon63
              |> move (40 * cos (-3 * sin time), repeatDistance 20 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon64
              |> move (40 * sin (-3 * cos time), repeatDistance 20 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon65
              |> move (40 * cos (-3 * sin time), repeatDistance 20 300 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon66
              |> move (40 * sin (-3 * cos time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon67
              |> move (40 * cos (-3 * sin time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon68
              |> move (40 * sin (-3 * cos time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon69
              |> move (40 * cos (-3 * sin time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon70
              |> move (40 * sin (-3 * cos time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon71
              |> move (40 * sin (-3 * sin time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon72
              |> move (40 * cos (-3 * sin time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns,
            generateBalloon balloon73
              |> move (40 * sin (-3 * cos time), repeatDistance 20 310 -150 (5 * time))|> notifyTap wrongAns]

level9 time correctAns wrongAns = group [generateBalloon balloon74
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon75
              |> move (25 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon76
              |> move (10 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon77
              |> move (20 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon78
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon79
              |> move (20 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon80
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon81
              |> move (25 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon82
              |> move (10 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon83
              |> move (20 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon84
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon85
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon86
              |> move (20 * sin (-6 * cos time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon87
              |> move (20 * cos (-6 * sin time), repeatDistance 28 320 -150 (4 * time))|> notifyTap wrongAns]

level10 time correctAns wrongAns = group [generateBalloon balloon88
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon89
              |> move (45 * cos (-3 * sin time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon90
              |> move (30 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon91
              |> move (40 * cos (-3 * sin time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon92
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon93
              |> move (40 * cos (-3 * sin time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon94
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon95
              |> move (45 * cos (-3 * sin time), repeatDistance 28 300 -150 (4 * time))
              |> notifyTap correctAns,
            generateBalloon balloon96
              |> move (30 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon97
              |> move (40 * cos (-3 * sin time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon98
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon99
              |> move (40 * sin (-3 * sin time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon100
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns,
            generateBalloon balloon101
              |> move (40 * sin (-3 * cos time), repeatDistance 28 300 -150 (4 * time))|> notifyTap wrongAns]
              
    
commonbg = rect 300 170
                    |> filled skyblue
cloud = group [circle 10
                    |> filled white,
                  circle 10
                    |> filled white
                    |> move (5, 10),
                  circle 10
                    |> filled white
                    |> move (15, 15),
                  circle 15
                    |> filled white
                    |> move (32, 12),
                  circle 10
                    |> filled white
                    |> move (47, 15),
                  circle 15
                    |> filled white
                    |> move (10, 0),
                  circle 15
                    |> filled white
                    |> move (25, 0),
                  circle 10
                    |> filled white
                    |> move (50, 0),
                  circle 10
                    |> filled white
                    |> move (40, -5),
                  circle 10
                    |> filled white
                    |> move (54, 10)]

homebutton = group [pixelImg 20 20 "https://static.thenounproject.com/png/610387-200.png"]
  |> move (1, -18)

prevbutton = group [pixelImg 20 20 "https://cdn-icons-png.flaticon.com/512/93/93634.png"]
  |> move (1, -18)

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
        
type Levels = Start
           | Menu
           | Level1
           | Level2
           | Level3
           | Level4
           | Level5
           | Level6
           | Level7
           | Level8
           | Level9
           | Level10
           | Congrats
           | WrongS


-- Add messages here
type Msg = Tick Float GetKeyState
           | Enter
           | GoBack
           | GoMenu
           | Prev
           | Pass1
           | Pass2
           | Pass3
           | Pass4
           | Pass5
           | Pass6
           | Pass7
           | Pass8
           | Pass9
           | Pass10
           | LV1
           | Wrong

-- This is the type of your model
type alias Model =
    { time : Float
    , state : Levels
    }

-- Your update function goes here
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model = 
  case msg of
    Tick t _ -> ( { model | time = t }, Cmd.none )
    Enter  ->
            case model.state of
                Start  ->
                    ( { model | state = Menu}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
                    
    GoMenu  ->
            case model.state of
                Start  ->
                    ( { model | state = Menu}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    LV1  ->
            case model.state of
                Menu  ->
                    ( { model | state = Level1}, Cmd.none )

                otherwise ->
                    ( model, Cmd.none )
    Pass1  ->
            case model.state of
                _  ->
                    ( { model | state = Level2}, Cmd.none )

    GoBack  ->
            case model.state of
                _  ->
                    ( { model | state = Start}, Cmd.none )
    Pass2  ->
            case model.state of
                _  ->
                    ( { model | state = Level3}, Cmd.none )

    Pass3  ->
            case model.state of
                _  ->
                    ( { model | state = Level4}, Cmd.none )

    Pass4  ->
            case model.state of
                _  ->
                    ( { model | state = Level5}, Cmd.none )

    Pass5  ->
            case model.state of
                _  ->
                    ( { model | state = Level6}, Cmd.none )

    Pass6  ->
            case model.state of
                _  ->
                    ( { model | state = Level7}, Cmd.none )

    Pass7  ->
            case model.state of
                _  ->
                    ( { model | state = Level8}, Cmd.none )

    Pass8  ->
            case model.state of
                _  ->
                    ( { model | state = Level9}, Cmd.none )

    Pass9  ->
            case model.state of
                _  ->
                    ( { model | state = Level10}, Cmd.none )

    Pass10 ->
            case model.state of
                _  ->
                    ( { model | state = Congrats}, Cmd.none )
    Wrong ->
            case model.state of
                _  ->
                    ( { model | state = WrongS}, Cmd.none )
    Prev ->
            case model.state of
                Start ->
                    (model, Cmd.none)
                Menu ->
                    ( { model | state = Start }, Cmd.none )
                Level1 ->
                    ( { model | state = Menu }, Cmd.none )
                Level2 ->
                    ( { model | state = Level1 }, Cmd.none )
                Level3 ->
                    ( { model | state = Level2 }, Cmd.none )
                Level4 ->
                    ( { model | state = Level3 }, Cmd.none )
                Level5 ->
                    ( { model | state = Level4 }, Cmd.none )
                Level6 ->
                    ( { model | state = Level5 }, Cmd.none )
                Level7 ->
                    ( { model | state = Level6 }, Cmd.none )
                Level8 ->
                    ( { model | state = Level7 }, Cmd.none )
                Level9 ->
                    ( { model | state = Level8 }, Cmd.none )
                Level10 ->
                    ( { model | state = Level9 }, Cmd.none )
                Congrats ->
                    ( { model | state = Level10 }, Cmd.none )
                WrongS ->
                    ( { model | state = Menu }, Cmd.none )
   
                    
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