-- Note we didn't need to add these particular line of code in McMaster outreach IDE
-- For best experience copy the code and paste it on the McMaster IDE
module Exam exposing (..)
import GraphicSVG exposing (..)
-- If you are using the IDE you must delete the above lines
import List exposing (head,length)
import Maybe exposing (withDefault)
import Random exposing (..)

type Question =
      Question (QuestionDetails)
    
type alias QuestionDetails =
    { ques : String           -- the question
    , id : Int                -- id's of the question
    , options : List String   -- 4 answer options (1-4)
    , ans : Int               -- correct answer (1-4)
    }
    
---------------------------------------------------------------------------------------
-----------------------------IMPORTANT FUNCTIONS---------------------------------------------

questionCons : String -> Int -> List String -> Int -> Question
questionCons q i o a = Question { ques = q, id = i, options = o, ans = a}

getStrings : Question -> String
getStrings (Question { ques }) = ques

getId : Question -> Int
getId (Question { id }) = id

getAns : Question -> Int
getAns (Question { ans }) = ans

getOption : Question -> Int -> String
getOption (Question { options }) optionNumber =
    List.indexedMap (\index option -> if index + 1 == optionNumber then option else "") options
        |> String.join ""  

getQuestionStr : Int -> Int -> Int -> String
getQuestionStr x id int = getStrings (getQuestionById (choosenquestionBank x int) id)

getQuestionById : List Question -> Int -> Question
getQuestionById questions id =
    List.filter (\(Question questionDetails) -> questionDetails.id == id) questions
        |> List.head
        |> Maybe.withDefault (Question { ques = "", id = -1, options= [], ans = -1})

stringSize : String -> Int
stringSize str =
    String.length str

replaceAtIndex : Int -> a -> List a -> List a
replaceAtIndex index value list =
    List.indexedMap (\i x -> if i == index then value else x) list  
                   
getAtIndex : Int -> List Int -> Int
getAtIndex index list =
    case (index, list) of
        ( _, [] ) -> -1
        (0, x :: _) -> x
        (n, _ :: xs) -> getAtIndex (n - 1) xs   
        
getQuestionByIndex : List Question -> Int -> Question
getQuestionByIndex questions index =
    case questions of
        [] ->
            Question { ques = "", id = -1, options = [], ans = -1 }

        question :: rest ->
            if index == 0 then
                question
            else
                getQuestionByIndex rest (index - 1)
    
compareLists : List Int -> List Int -> Int
compareLists list1 list2 =
    let
        matchingElements =
            List.filter (\(x, y) -> x == y) <| List.map2 Tuple.pair list1 list2
    in
    List.length matchingElements

timeToMinutesAndSeconds : Int -> List Int
timeToMinutesAndSeconds timeInSeconds =
    let
        minutes = timeInSeconds // 60
        seconds = timeInSeconds - minutes * 60
    in
        [minutes, seconds]

timeFormat model = timeToMinutesAndSeconds model.time

shuffle : List Int -> Generator (List Int)
shuffle list =
    let
        len = List.length list
        randomIndexes = Random.list len (Random.int 0 (len - 1))
    in
    Random.map
        (\indexes -> 
            List.foldl
                (\i acc ->
                    let
                        j = getAtIndex i indexes
                        element = getAtIndex j acc
                    in
                    replaceAtIndex j (getAtIndex i acc ) (replaceAtIndex i element acc)
                )
                list
                (List.range 0 (len - 1))
        )
        randomIndexes
        
runGenerator : Generator a -> Random.Seed -> (a, Random.Seed)
runGenerator generator seed =
    Random.step generator seed    
    
shuffleToList : List Int -> Random.Seed -> List Int
shuffleToList list seed =
    let
        (shuffledList, _) = runGenerator (shuffle list) seed
    in
    shuffledList  
    
getIds : List Question -> List Int
getIds questions =
    List.map getId questions
    
getAnsS : List Question -> List Int
getAnsS questions =
    List.map getAns questions    

questionBank int = List.map (\index -> getQuestionById questionBank1 index) 
  (shuffleToList [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50] (Random.initialSeed int))

answerBank int = getAnsS (questionBank int)
idList int = getIds (questionBank int)

-------------------------------------------------------------------------
--------------------------------SHAPES----------------------------------- 
topBar=[rect 300 170 |> filled (rgb 196 202 208)
        ,rect 300 30|> filled (rgb 41 47 54)|> move(0, 70) 
        ,text "Recalc!" |> filled white |>move (-105, 50) |> scale 1.3
        ,text "Practice Exam" |> filled white |>move (-10, 90) |> scale 0.75
        ,text "Visualizer" |> filled white |>move (70, 90) |> scale 0.75
        ,text "Resources" |> filled white |>move (130, 90) |> scale 0.75
       ]|>group       
 
quesBox=[rect 270 100 |> filled (rgb 41 47 54) |> move (0,-15)
        ]|>group

maintext=[rect 85 72 |> filled (rgb 217 217 217) |> move (-90,-40)
       ,rect 85 72 |> filled (rgb 217 217 217) |> move (90,-40)
       ,rect 85 72 |> filled (rgb 217 217 217) |> move (0,-40)
       ,rect 77 66 |> filled (rgb 255 174 66) |> move (-90,-40) |> makeTransparent 0.6
       ,rect 77 66 |> filled (rgb 255 174 66) |> move (0,-40) |> makeTransparent 0.6
       ,rect 77 66 |> filled (rgb 255 174 66) |> move (90,-40) |> makeTransparent 0.6
       ,rect 65 38 |> filled (rgb 217 217 217) |> move (-90,-46)
       ,rect 65 38 |> filled (rgb 217 217 217) |> move (0,-46)
       ,rect 65 38 |> filled (rgb 217 217 217) |> move (90,-46)
       ,text "Variable Exam Size"|>centered |> bold |> filled black  |> scale 0.65 |>move (-90, -22) 
       ,text "Randomized Exam"|>centered |> bold|> filled black |> scale 0.65 |>move (0, -22) 
       ,text "Review Answers"|>centered |> bold |> filled black |> scale 0.65 |>move (90, -22) 
       ,text "Choose how"|>centered |> filled black |> scale 0.6 |>move (-90, -36)
       ,text "many question(s)"|>centered |> filled black |> scale 0.6 |>move (-90, -44)
       ,text "you want on your" |>centered |> filled black |> scale 0.6 |>move (-90, -52)
       ,text "practice exam!"|>centered |> filled black |> scale 0.6 |>move (-90, -60)
       ,text "Questions are "|>centered |> filled black |> scale 0.6 |>move (0, -36)
       ,text "randomized each"|>centered |> filled black|> scale 0.6 |>move (0, -44)
       ,text "time! Multiple" |>centered |> filled black|> scale 0.6 |>move (0, -52)
       ,text "Choice Format." |>centered |> filled black |> scale 0.6 |>move (0, -60) 
       ,text "" |>centered |> filled black |> scale 0.6 |>move (0, -68)    
       ,text "Review your"|>centered |> filled black|> scale 0.6|>move (90, -36) 
       ,text "exam to see"|>centered |> filled black|> scale 0.6|>move (90, -44) 
       ,text "which questions" |>centered |> filled black|> scale 0.6|>move (90, -52) 
       ,text "you got wrong!"|>centered |> filled black|> scale 0.6 |>move (90, -60)   
          ]|>group
                 
mainpageother model=[text "Mock Calculus Exam" |>centered |> bold |> filled black |> scale 1.6 |>move (0,20)
       ,maintext |> move (0,18)
       ,mainstartExambutton model |> scale 0.9 |> move (50,-70)
       ,progressTrackButton |> scale 0.9 |> move (-50,-70)
       ]|>group  

timer model modelInput min sec =[
        roundedRect 85 12 0|> filled (rgb 41 47 54)|> move(0, 45)  
        ,text "Time Left:"|> filled white |>move (-42, 65.5) |>scale 0.65
        ,if ((modelInput.inputNumber*120) - round (model.time) < 60) then
        text ((String.fromInt min) ++ ":" ++ (if sec <10 then ("0"++(String.fromInt sec)) else (String.fromInt sec)))
              |> filled red |>move (18, 65.5) |>scale 0.65  
        else
        text ((String.fromInt min) ++ ":" ++ (if sec <10 then ("0"++(String.fromInt sec)) else (String.fromInt sec)))
              |> filled white |>move (18, 65.5) |>scale 0.65    
        ]|>group

timealloted x =[
        roundedRect 85 12 0|> filled (rgb 41 47 54)|> move(0, 45)  
        ,text "Alloted Time:    "|> centered |> filled white  |>scale 0.65 |>move (-8, 42.5)
        ,text ((Debug.toString (x*2)) ++ ":00") |> centered |> filled white  |>scale 0.65 |>move (24, 42.5)  
        ]|>group

questionInput x int =[text "Choose number of questions on exam"|>centered |> filled white|> scale 1 |>move (0,10)
               ,roundedRect 50 20 5 |> filled (rgb 196 202 208) |> move (0,-20) |> makeTransparent 0.75
               ,text (Debug.toString x) |>centered |> filled white |> scale 1.3 |> move (0,-25) 
               ,circle 10 |> filled white |> move (40,-20)  |> makeTransparent 0.5
               ,text "+1" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (34,-23.5) 
               ,circle 10 |> filled white |> move (65,-20)  |> makeTransparent 0.5
               ,text "+5" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (58.5,-23.5) 
               ,circle 10 |> filled white |> move (-40,-20) |> makeTransparent 0.5
               ,text "-1" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (-47,-23.5) 
               ,circle 10 |> filled white |> move (-65,-20) |> makeTransparent 0.5
               ,text "-5" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (-72,-23.5)
              
               ,if x < 50 then increment1 x else rect 0 0 |> filled blue
               ,if x < 46 then increment5 x else rect 0 0 |> filled blue
               ,if x > 1 then decrement1 x else rect 0 0 |> filled blue
               ,if x > 5 then decrement5 x else rect 0 0 |> filled blue              
               ]|>group  
            
scoreDisplay model x int scoreper=[text ("Your Score:  " ++ (Debug.toString (scoreper) ++ "%")) |>centered |> filled white |>move (0,0)|> scale 1.2               
                   ,text ((Debug.toString (compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)))++ (" / " ++ Debug.toString(x)))
                   |> centered |> filled white |> move (0,-18)
                   ]|>group  
                         
confirmSubmission model x int examsTaken averageScore highest = [topBar,quesBox
                    ,text "Are you sure you want to submit?"|>centered |> filled white|>move (0,0)  |> scale 1.2   
                    ,submitButtonConf model x int examsTaken averageScore highest
                    ,backtoExamConf 
                    ]|> group
                    
formulas=[rect 271 101 |> filled (rgb 196 202 208) |> move (0,-15)
         ,rect 30 20 |> filled (rgb 196 202 208) |> move (121,42)
         ,rect 30 20 |> filled (rgb 196 202 208) |> move (-121,42)
         ,rect 271 101 |> filled (hsl (degrees 41) 0.011 0.86)|> move (0,-15)
         ,formulaToPage2
         ,text "Commonly Used Integration Formulas" |> bold |> filled black |> scale 0.7|> move (-130,20)
         ,text "1. ∫ 1 dx = x + C" |> filled black |> scale 0.6|> move (-125,10)
         ,text "2. ∫ a dx = ax+ C" |> filled black |> scale 0.6|> move (-125,0)
         ,text "3. ∫ xⁿ  dx = ( (xⁿ + 1) / (n + 1) ) + C ; n ≠ 1" |> filled black |> scale 0.6|> move (-125,-10)
         ,text "4. ∫ sin x dx = – cos x + C" |> filled black |> scale 0.6|> move (-125,-20)     
         ,text "5. ∫ cos x dx = sin x + C" |> filled black |> scale 0.6|> move (-125,-30)    
         ,text "6. ∫ sec²x dx = tan x + C" |> filled black |> scale 0.6|> move (-125,-40)            
         ,text "7. ∫ csc²x dx = -cot x + C" |> filled black |> scale 0.6|> move (-125,-50)            
         ,text "8. ∫ (1/x) dx = ln |x| + C" |> filled black |> scale 0.6|> move (-125,-60)            
         ,text "9. ∫ eˣ dx = eˣ + C" |> filled black |> scale 0.6|> move (0,10)            
         ,text "10. ∫ aˣ dx = (aˣ / ln a) + C ; a > 0,  a ≠ 1" |> filled black |> scale 0.6|> move (0,0) 
         ,text "Commonly Used Derivative Formulas" |> bold |> filled black |> scale 0.7|> move (-10,-20)
         , text "1. f (x) = C   f ' (x) = 0" |> filled black |> scale 0.6 |> move (0,-30)
         ,text "2. f (x) = xⁿ  f ' (x) = ( n - 1 ) * x ⁿ - ¹" |> filled black |> scale 0.6 |> move (0,-40)
         ,text "3. f (x) = sin x  f ' (x) = cos x" |> filled black |> scale 0.6 |> move (0,-50)
         ,text "4. f (x) = cos x  f ' (x) = - sin x" |> filled black |> scale 0.6 |> move (0,-60)
        ]|> group
        
formulas2=[rect 271 101 |> filled (rgb 196 202 208) |> move (0,-15)
         ,formulaToPage1
         ,rect 30 20 |> filled (rgb 196 202 208) |> move (121,42)
         ,rect 30 20 |> filled (rgb 196 202 208) |> move (-121,42)
         ,rect 271 101 |> filled (hsl (degrees 41) 0.011 0.86)|> move (0,-15)
         ,formulaToPage1
         ,text "5. f (x) = aˣ  f ' (x) = ln a * aˣ" |> filled black |> scale 0.6 |> move (-125,20)
         ,text "6. f (x) = ln x  f ' (x) = 1/x" |> filled black |> scale 0.6 |> move (-125,10)
         ,text "7. f (x) = tan x  f ' (x) = sec² x" |> filled black |> scale 0.6 |> move (-125,0)
         ,text "7. f (x) = arcsin x  f ' (x) = 1/(√1 - x²)" |> filled black |> scale 0.6 |> move (-125,-10)
         ,text "8. f (x) = arccos x  f ' (x) = - 1/(√1 - x²)" |> filled black |> scale 0.6 |> move (-125,-20)
         ,text "9. f (x) = arctan x  f ' (x) = 1/(1 + x²)" |> filled black |> scale 0.6 |> move (-125,-30)
         ,text "10. f (x) = arccot x  f ' (x) = - 1/(1 + x²)" |> filled black |> scale 0.6 |> move (-125,-40)
         ,text "11. f (x) = arcsec x  f ' (x) = 1/(x * √x² -1 )" |> filled black |> scale 0.6 |> move (-125,-50)
         ,text "12. f (x) = arccsc x  f ' (x) = - 1/(x * √x² -1)" |> filled black |> scale 0.6 |> move (-125,-60)
         ,text "Commonly Used Area Finding Formulas" |> bold |> filled black |> scale 0.7 |> move (-25,20)
         ,text "1. Area = ∫ ( a to b ) f ( x ) dx " |> filled black |> scale 0.6 |> move (0,10)
         ,text "2. Area = ∫ ( a to b ) [ f ( x ) - g ( x ) ] dx " |> filled black |> scale 0.6 |> move (0,0)
         ,text "3. Area = ∫ ( c to d ) [ f ( y ) - g ( y ) ] dx " |> filled black |> scale 0.6 |> move (0,-10)
         ,text "Commonly Used Volume Formulas" |> bold |> filled black |> scale 0.7 |> move (-5,-20)
         ,text "1. V = ∫ ( a to b ) 2 * πr * h dx" |> filled black |> scale 0.6 |> move (0,-30)
         ,text "2. V = π * ∫ ( a to b ) ( f ( x ) ) ^ 2 dx" |> filled black |> scale 0.6 |> move (0,-40)
         ,text "3. V = π * ∫ ( a to b ) ((f(x)) ^ 2 - (g(x)) ^ 2) dx" |> filled black |> scale 0.6 |> move (0,-50)
        ]|> group    

progress avg examstaken recent highestS avgwithout=[topBar,rect 130 80 |> filled (hsl (degrees 41) 0.011 0.86)|> move (-70,-20)
         ,rect 130 80 |> filled (hsl (degrees 41) 0.011 0.86)|> move (70,-20)
         ,roundedRect 110 18 0|> filled (rgb 41 47 54)|> move(0, 40) 
         ,roundedRect 80 14 0|> filled (rgb 41 47 54)|> move(-70, 19) 
         ,roundedRect 80 14 0|> filled (rgb 41 47 54)|> move(70, 19)          
         ,text "Statistics" |> centered |> sansserif|> filled white |> scale 0.75 |> move (-70, 16)
         ,text "Progress"|> centered |> sansserif |> filled white |> scale 0.75 |> move (70, 16)
         ,text "Progress Tracker" |> centered |> sansserif |> filled white |> move (0, 36)
         ,tomainButton
         ,text ("Average Of All Exams : " ++ (Debug.toString avg)++"%") |> centered |> filled black |> scale 0.65 |> move (-70,-5)
         ,text ("Avg Without Recent Attempt : " ++ (if (examstaken-1 < 1) then "0" else (Debug.toString avgwithout)) ++"%") |> centered |> filled black |> scale 0.65 |> move (-70,-15)
         ,text ("Highest Score : " ++ (Debug.toString highestS)++"%")|> centered |> filled black |> scale 0.65 |> move (-70,-25)
         ,text ("Exams Taken : " ++ (Debug.toString examstaken))|> centered |> filled black |> scale 0.65 |> move (-70,-35)
         ,text ("Most Recent Score : " ++ (Debug.toString recent)++"%")|> centered |> filled black |> scale 0.65 |> move (-70,-45)
         ,text (if examstaken < 2 then "Complete at least 2 practice" else "")|> centered |> filled black |> scale 0.65 |> move (70,-5)
         ,text (if examstaken < 2 then "exams to see your progress." else "")|> centered |> filled black |> scale 0.65 |> move (70,-15)        
         ,if examstaken > 1 then text (if recent > avgwithout then "Your most recent score is higher" else "")|> centered |> filled black |> scale 0.65 |> move (70,-5) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent > avgwithout then "than your average. Your overall" else "")|> centered |> filled black |> scale 0.65 |> move (70,-15) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent > avgwithout then "average has increased." else "")|> centered |> filled black |> scale 0.65 |> move (70,-25) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent < avgwithout then "Your most recent score is lower" else "")|> centered |> filled black |> scale 0.65 |> move (70,-5) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent < avgwithout then "than your average. Your overall" else "")|> centered |> filled black |> scale 0.65 |> move (70,-15) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent < avgwithout then "average has decreased." else "")|> centered |> filled black |> scale 0.65 |> move (70,-25) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent == avgwithout then "Your most recent score is the" else "")|> centered |> filled black |> scale 0.65 |> move (70,-5) else rect 0 0 |> filled black
         ,if examstaken > 1 then text (if recent == avgwithout then "same as your average." else "")|> centered |> filled black |> scale 0.65 |> move (70,-15) else rect 0 0 |> filled black          
        ]|> group

---------------------------------------------------------------------------------------
-----------------------------QUESTION BANK---------------------------------------------
questionBank1 = [questionCons "Find the Derivative of the following equation.\n (y) = (y - 4)(2y + y²)"  1 ["3y²-4y-8","6y²-4y-8","6y²-8y-4","y²-4y-8"] 1
              , questionCons "Find the Integration of F(x) = sin x" 2 ["cos x + C","-cos x + C","sin x + C","-sin x + C"] 2
              , questionCons "Find the Area of F(x) = √x - 1/(√x) from 1 to 9" 3 ["20/3","40/3","10√2","10√3"] 2
              , questionCons "Find the Derivative of F(x) = 2x³ - 5x² +4x - 1" 4 ["6x² - 10x + 4"," 6x² + 10x + 4","6x³ - 10x² + 4x","6x³ - 10x² + 4"] 1            
              , questionCons "Find the Integration of F(x) = xⁿ" 5 ["(xⁿ⁺¹)/n + C","xⁿ/(n+1) + C","(xⁿ)/n + C","(xⁿ⁺¹)/(n+1) + C"] 4
              , questionCons "Find the Area of F(x) = xe⁻ˣ from 0 to 5" 6 ["6e⁻⁵ + 1","6e⁻⁵ + 3","-6e⁻⁵ + 1","-6e⁻⁵ + 3"] 3
              , questionCons "Find the Derivative of F(x) = e²ˣ⁺¹" 7 [" e²ˣ⁺¹","2e²ˣ⁺¹"," e²ˣ","2e²ˣ"] 2
              , questionCons "Find the Integration of F(x) = eˣsin x" 8 ["eˣ(sin x - cos x)","eˣ(sin x - cos x)/2","eˣ(cos x - sin x)","eˣ(cos x - sin x)/2"] 2 
              , questionCons "Find the Area of F(x) = x³lnx from 1 to e" 9 ["3e⁴/16 + 1/16","5e⁴/16 - 1/16","2e⁴/9 + 1/9","2e³/9 + 1/9"] 1              
              , questionCons "Find the Derivative of r(θ) = eᵗᵃⁿ ᶿ " 10 ["(sin θ)(eᵗᵃⁿ ᶿ)/cos²θ","eᵗᵃⁿ ᶿ/cos θ","eᵗᵃⁿ ᶿ/cos²θ","eᵗᵃⁿ ᶿ/sin²θ"] 3              
              , questionCons "Find the Integration of F(x) = e²ˣ⁺¹ + sin x + x² + 1" 11 ["e²ˣ⁺¹ - cos x + x³/3 + x + c","(e²ˣ⁺¹)/2 + cos x + x³/3 + x + c","2e²ˣ⁺¹ + cos x + 2x","(e²ˣ⁺¹)/2 - cos x + x³/3 + x + c"] 4
              , questionCons "Find the Area of F(x) = xe⁴ˣ⁽ˣ⁾⁺³ from 0 to 1" 12 ["(1/8)(e⁶ - e²)","(1/8)(e⁷ - e³)","(1/6)(e⁷ - e³)","(1/6)(e⁶ - e²)"] 2
              , questionCons "Find the Derivative of F(x) = (x² + x + 1)eˣ" 13 ["x²eˣ + 3xeˣ + 2eˣ","x²eˣ + 2xeˣ + eˣ","x²eˣ - 2xeˣ + eˣ","x²eˣ + 3xeˣ + eˣ"] 1
              , questionCons "Find the Integration of F(x) = (1 + 9sin x)/cos²x" 14 ["tan x + 9 csc x + x − C","tan x + 9 sec x + x − C","tan x + 9 cos x − C","tan x + 9 sec x − C"] 4           
              , questionCons "Find the Area of F(x) = xsin(2x) from 0 to π" 15 ["π/2","-π/2","0","-π"] 2  
              , questionCons "Find the Derivative of F(x) = xˣ" 16 ["xˣ + ln(x)","xˣ(ln(x) - 1)","xˣ(ln(x) + 1)","xˣ⁻¹(ln(x - 1))"] 3
              , questionCons "Find the Integration of F(x) = ln(x)" 17 ["-xln(x) + x + C","ln(x) + x + C","xln(x) + x + C","xln(x) - x + C"] 4
              , questionCons "Find the Area of F(x) = x√(x - t) from 0 to t" 18 ["(4/15)(-t)^(5/2)","(-t)^(5/2)","(2/3)(-t)^(5/2)","(2/3)(-t)^(7/2)"] 1
              , questionCons "Find the Derivative of F(x) = ln(ln(x))" 19 ["1/(xln(x))","1/x","-1/(xln(x))","1/ln(x)"] 1             
              , questionCons "Find the Integration of F(x) = 2ˣ" 20 ["ln(2)2ˣ + C","ln(2)2ˣ⁻¹ + C","2ˣ + C","1/ln(2)2ˣ + C"] 4
              , questionCons "Find the Area of F(x) = xcos(πx) from 1/2 to 1" 21 ["1/(2π)","-1/(2π)","1/(2π) + 1/π²","-1/(2π) - 1/π²"] 4
              , questionCons "Find the Derivative of F(x) = sin(2x)/(1 - cos(2x))" 22 ["-1/(cos²x)","-1/(sin²x)","1/(cos²x)","1/(sin²x)"] 2
              , questionCons "Find the Integration of F(x) = sin(x)cos(x)" 23 ["sin(x)cos(x) + C","1/2 * sin2x + C", "1/2 * sin(x)cos(x) + C","1/2 * (sin(x) + cos(x)) + C"] 2
              , questionCons "Find the Area of F(x) = -xcos(x) from π/2 to π" 24 ["(3π)/2","(3π)/2 - 1","1 + π/2","1 - π/2"] 3             
              , questionCons "Find the Derivative of F(x) = |sin³x|" 25 ["cos(2x)|sinx|","(3/2)|cos(2x)|sinx","(3/2)cos(2x)|sinx|","(3/2)sin(2x)|sinx|"] 4 
              , questionCons "Find the Integration of F(x) = sin(1/x)/x²" 26 ["sin(1/x) + C","cos(1/x) + C","-cos(1/x) + C","xcos(1/x) + C"] 2
              , questionCons "Find the Area of F(x) = 1/(x(x + 1)) from 1 to 2" 27 ["ln(4/3)","ln(5/3)","-ln(4/3)","ln(6/3)"] 1
              , questionCons "Find the Derivative of ⌊x⌋sin²(πx) HINT: ⌊x⌋' = 0" 28 ["π⌊x⌋sin(2πx) + π⌊x⌋cos(2πx)","π⌊x⌋sin(2πx) - π⌊x⌋cos(2πx)","π⌊x⌋sin(2πx)","π⌊x⌋cos(2πx)"] 3 
              , questionCons "Find the Integration of F(x) = cos(4x)/(2 + sin(4x))" 29 ["(1/4)ln|2 + sin(4x)| + C","(1/4)ln|2 - sin(4x)| + C","(1/4)ln|2 - sin(8x)| + C","(1/4)ln|2 + sin(2x)| + C"] 1              
              , questionCons "Find the Area of F(x) =|x² - 1| from 0 to 2" 30 ["3/2","2","4","5/2"] 2
              , questionCons "The derivative f(x) at x tells us:" 31 ["what value the function takes given x","where the graph intersects the y-axis","the instantaneous rate of change","the average rate of change"] 3
              , questionCons "The derivative of a function at a point is:" 32 ["an equation","a number","a function","none of the above"] 2
              , questionCons "The derivative of a function is" 33 ["an equation","a number","a function","none of the above"] 3
              , questionCons "Which of the following functions are NOT differentiable?" 34 ["f(x) = 30934","f(x) = (x + 4x) x","f(x) = | x |","f(x) = mx + b"] 3              
              , questionCons "A function is differentiable if the graph:" 35 ["has no jumps","part of it is parabolic","is continuous","none of the above"] 4                     
              , questionCons "Find volume of region bounded by y = √x and x = 3 about the y-axis" 36 ["(243π)/5","(167π)/5","(124π)/5","(177π)/5"] 1
              , questionCons "Find volume of region bounded by y = 7 - x², x = 2 and x = -2 about the x-axis" 37 ["(2012π)/15","(2013π)/15","(400π)/3","(401π)/3"] 1
              , questionCons "Find volume of region bounded by y = 2x² and y = 2x² about the y-axis" 38 ["(1097π)/15","(1088π)/15","(1081π)/15","(218π)/3"] 2
              , questionCons "Find volume of region bounded by x = y² - 4 and x = 6 - 3y about the x-axis = 24" 39 ["(31256π)/15","(30956π)/15","(31556π)/15","(31553π)"] 3
              , questionCons "Find volume of region bounded by y = 2x + 1, x = 4 and y = 3 about the x-axis = -4" 40 ["131π","120π","125π","126π"] 4
              , questionCons "Find volume of region bounded by y = ³√x, y = x/4, x and y>0 about the x-axis" 41 ["(512π)/21","(511π)/17","24π","26π"] 1
              , questionCons "Find volume of region bounded by y = 7 - x² and y = x about the y-axis = 4" 42 ["30π","(153π)/5","(154π)/5","31π"] 2
              , questionCons "Find volume of region bounded by y = √(x - 1) and y = (x - 1)² about the y-axis" 43 ["(8π)/10","(9π)/10","(29π)/30","π"] 3
              , questionCons "Find volume of region bounded by y = (x - 1)(x - 3)² and y = 0 about the y-axis" 44 ["6π","(11π)/2","5π","(24π)/5"] 4
              , questionCons "Find volume of region bounded by y = √x, y = 4 and x = 0 about the y-axis" 45 ["(1024π)/5","205π","206π","(1037π)/5"] 1              
              , questionCons "Find volume of region bounded by y = x² + 2 and y = x + 4 about the x-axis" 46 ["32π","(162π)/5","(163π)/5","(167π)/5"] 2
              , questionCons "Find volume of region bounded by y = x² and x‐axis on [−2,3] about the x‐axis" 47 ["45π","(243π)/5","55π","57π"] 3
              , questionCons "Find volume of region bounded by y = x² - x and y = x about the y-axis = 3" 48 ["(26π)/5","(27π)/5","6π","(32π)/5"] 4
              , questionCons "Find volume of region bounded by y = x² and y = x about the x-axis" 49 ["2π/15","π/3","2π/5","π/2"] 1
              , questionCons "Find volume of region bounded by y = x² − 4x + 5, x = 1, x = 4 about the x-axis" 50 ["(76π)/5","(78π)/5","16π","18π"] 2                                        
              ]              
choosenquestionBank x int = List.take x (questionBank int)  ---- takes first x from question bank --> x is the number of questions the user inputs 

---------------------------------------------------------------------------------------
-----------------------------DISPLAY EXAM/REVIEW---------------------------------------------  

--h -> highlightBank (hb) needs to be updated every time the user clicks on an option
displayExam : Int -> Int -> Int -> List Int -> Int -> Int -> Bool -> Int -> (Shape Msg)
displayExam x id h hb int onQues bool page = [ 
                 text (getQuestionStr x id int) |>centered |>filled white |> scale (if (stringSize (getQuestionStr x id int)) > 65 then 0.65 else 0.8) |> move(0,12)                
                ,qa x id h hb int onQues
                ,qb x id h hb int onQues             
                ,qc x id h hb int onQues           
                ,qd x id h hb int onQues
                ,if (onQues < x-1) then (forwardbutton onQues) else (rect 0 0 |> filled white)
                ,if (onQues > 0) then (backbutton onQues) else (rect 0 0 |> filled white)
                ,text ("Question " ++(Debug.toString (onQues+1))++ " of " ++ (Debug.toString x)) |> centered |> filled black  |> scale 0.75 |> move (100,-79) 
                ,if bool == True then formulaButtonBack else formulaButton
                ,if bool == True then (if page == 1 then formulas else formulas2) else rect 0 0 |>filled white
                ]|>group              
              
reviewExam x id h hb int onQues model = [ 
                 text (getQuestionStr x id int) |>centered |>filled white |> scale (if (stringSize (getQuestionStr x id int)) > 65 then 0.65 else 0.8) |> move(0,12)               
                ,roundedRect 85 12 0|> filled (rgb 41 47 54)|> move(0, 45)
                ,qaRev x id h hb int onQues
                ,qbRev x id h hb int onQues             
                ,qcRev x id h hb int onQues           
                ,qdRev x id h hb int onQues
                ,if (getAtIndex onQues hb ==0) then (text "No ANS" |> filled red |> scale 0.75 |> move (-120, -30.5)) else rect 0 0 |> filled black
                ,if (getAtIndex onQues hb ==0) then (text "Provided" |> filled red |> scale 0.75 |> move (-121, -38.5)) else rect 0 0 |> filled black
                ,if (getAtIndex onQues hb ==0) then (text "0/1" |>centered |> filled red |> scale 0.75 |> move (0,42)) else rect 0 0 |> filled black
                ,if (onQues < x-1) then (forwardbutton onQues) else (rect 0 0 |> filled white)
                ,if (onQues > 0) then (backbutton onQues) else (rect 0 0 |> filled white)
                ,text ("Question " ++(Debug.toString (onQues+1))++ " of " ++ (Debug.toString x)) |> centered |> filled black  |> scale 0.75 |> move (100,-79) 
                ,text ("Total Score:  " ++ (Debug.toString (compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)))++ (" / " ++ Debug.toString(x))) |> centered |> filled black |> scale 0.75 |>move (-100,-79)               
                ]|>group                                       
              
---------------------------------------------------------------------------------------  
-----------------------------------ANSWER BUTTONS-----------------------------------------

qa x id h hb int onQues= [roundedRect 150 12 2 |> filled (if h==1 then (rgb 255 174 66) else (rgb 196 202 208))|> move (0,-10)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 1) |>centered |>filled black|> move (0,-17.3)|>scale 0.72
  ]|>group  |> notifyTap (A (choosenquestionBank x int) onQues hb)
qb x id h hb int onQues= [roundedRect 150 12 2 |> filled (if h==2 then (rgb 255 174 66) else (rgb 196 202 208))|> move (0,-24)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 2) |>centered |>filled black|> move (0,-36.5)|>scale 0.72
  ]|>group  |> notifyTap (B (choosenquestionBank x int) onQues hb)

qc x id h hb int onQues= [roundedRect 150 12 2 |> filled (if h==3 then (rgb 255 174 66) else (rgb 196 202 208))|> move (0,-38)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 3) |>centered |>filled black|> move (0,-56.15)|>scale 0.72  
  ]|>group |> notifyTap (C (choosenquestionBank x int) onQues hb)
qd x id h hb int onQues= [roundedRect 150 12 2 |> filled (if h==4 then (rgb 255 174 66) else (rgb 196 202 208))|> move (0,-52)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 4) |>centered |>filled black|> move (0,-76)|>scale 0.72
  ]|>group |> notifyTap (D (choosenquestionBank x int) onQues hb)

---------------------------------------------------------------------------------------
-----------------------------OTHER BUTTONS--------------------------------------------- 

forwardbutton id = [   
        roundedRect 25 13 2|> filled (rgb 41 47 54)|> move(122, 45)  
        ,text "→" |> centered |> filled white |>move (122, 41) 
        ]|>group |> notifyTap (NextQ (id + 1))

backbutton id = [
        roundedRect 25 13 2|> filled (rgb 41 47 54)|> move(-122, 45)  
        ,text "←" |> centered |> filled white |>move (-122, 41) 
        ]|>group|> notifyTap (PrevQ (id - 1))
        
mainstartExambutton model=[roundedRect 95 15 3|> filled (rgb 41 47 54)
                 ,text "Start Practice Exam" |> centered |> bold |> size 8 |> filled white
                 |> move(0, -2.5) |>scale 1.2
                 ]|>group |> notifyTap (MainToInput (round(abs(model.time*8614))))
  
startExambutton =[roundedRect 95 15 3 |> filled (rgb 196 202 208) |> move (0,-83)
                 ,text "Start Exam!" |> bold |> centered |> filled black  |>scale 1 |>move (0, -87)
                 ]|>group |> move (0, 35) |> notifyTap StartExam

increment1 x = [circle 10 |> filled (rgb 196 202 208) |> move (40,-20),text "+1" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (34,-23.5)  ] |>group |> notifyTap (Increment1 (x+1))
increment5 x = [circle 10 |> filled (rgb 196 202 208) |> move (65,-20),text "+5" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (58.5,-23.5) ] |>group |> notifyTap (Increment5 (x+5))

decrement1 x = [circle 10 |> filled (rgb 196 202 208) |> move (-40,-20),text "-1" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (-47,-23.5) ] |>group |> notifyTap (Decrement5 (x-1))
decrement5 x = [circle 10 |> filled (rgb 196 202 208) |> move (-65,-20),text "-5" |> bold |> fixedwidth |> filled black |> scale 0.9 |> move (-72,-23.5) ] |>group |> notifyTap (Decrement5 (x-5))
                 
submitButton = [roundedRect 70 15 2|> filled (rgb 41 47 54)|> move (0, -75)  
        ,text "Submit Exam" |> centered |> bold |> filled (rgb 255 174 66)|>move (0, -119.5) |>scale 0.65 
        ]|>group|> notifyTap ConfirmSubmission

submitButtonConf model x int examsTaken averageScore highest= [roundedRect 70 15 2|> filled (rgb 196 202 208) |> move (44.5, -48)  
        ,text "Submit Exam" |> centered |> bold |> filled black  |>scale 0.75 |>move (45.5, -50.7)  
        ]|>group|> notifyTap (Submit (toFloat(round(((toFloat(compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)) / toFloat x)*100)*100))/ toFloat 100)
        (toFloat(round(((toFloat(round(((toFloat(compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)) / toFloat x)*100)*100))/ toFloat 100)+(averageScore*(toFloat examsTaken)))/(toFloat examsTaken+1))))
        (examsTaken+1) (toFloat(round((averageScore*(toFloat examsTaken))/(toFloat examsTaken)))) highest)
backtoExamConf = [roundedRect 70 15 2|> filled (rgb 196 202 208) |> move (-44.5, -48)  
        ,text "Back to Exam" |> centered |> bold |> filled black  |>scale 0.75 |>move (-44.5, -50.7) 
        ]|>group|> notifyTap ConfirmSubmissionCancel
submitButton2 model x int examsTaken averageScore highest= [roundedRect 70 15 2|> filled (rgb 196 202 208) |> move (0, -45) 
        ,text "Time's Up!"|>centered |> filled white|>move (0,0)  |> scale 1.2      
        ,text "Submit Exam" |> centered |> bold |> filled black  |>scale 0.75 |>move (0, -47.5)  
          ]|>group|> notifyTap (Submit (toFloat(round(((toFloat(compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)) / toFloat x)*100)*100))/ toFloat 100)
          (toFloat(round(((toFloat(round(((toFloat(compareLists (List.take (x+1) (answerBank int)) (List.take (x+1) model.highlightBank)) / toFloat x)*100)*100))/ toFloat 100)+(averageScore*(toFloat examsTaken)))/(toFloat examsTaken+1))))
          (examsTaken+1) (toFloat(round((averageScore*(toFloat examsTaken))/(toFloat examsTaken)))) highest) 

formulaButton = [roundedRect 70 12 2|> filled (rgb 41 47 54)|> move (-100, -75)  
        ,text "Formulas and Rules" |> centered |> filled white |>scale 0.6 |>move (-100, -77.25)
        ]|>group|> notifyTap FaR   

formulaButtonBack = [roundedRect 70 12 2|> filled (rgb 41 47 54)|> move (-100, -75)  
        ,text "Back to Exam" |> centered |> filled white |>scale 0.6 |>move (-100, -77.25)
        ]|>group|> notifyTap FaRExit  

formulaToPage2 = [roundedRect 25 10 2|> filled (rgb 41 47 54)|> move(118, -58)  
        ,text "→" |> centered |> filled white |> scale 0.75 |>move (118, -60.75) 
        ]|>group|> notifyTap Fnext          
formulaToPage1 = [roundedRect 25 10 2|> filled (rgb 41 47 54)|> move(118, -58)  
        ,text "←" |> centered |> filled white |> scale 0.75 |>move (118, -60.75)
        ]|>group|> notifyTap Fback          
          
tomainButton = [roundedRect 60 15 2|> filled (rgb 41 47 54)|> move (0, -75)  
        ,text "Main Menu" |> centered |> bold |> filled (white)|>move (0, -119.5) |>scale 0.65 
        ]|>group|> notifyTap ToMain                                   

reviewAns=[roundedRect 110 15 2 |> filled (rgb 196 202 208) |> move (0,-68)
        ,text "Review Your Answers!" |> centered  |> bold |> filled black |>scale 0.8 |>move (1, -71) 
        ]|>group |> move (0, 35)|> notifyTap ToReviewExam
        
progressTrackButton =[roundedRect 95 15 3|> filled (rgb 41 47 54)
        ,text "Progress Tracker" |> centered |> bold |> size 8 |> filled white |> move(0, -2.5) |>scale 1.2 
        ]|>group |> notifyTap ToProgress       
---------------------------------------------------------------------------------------        

---------------------------------------------------------------------------------------  
-----------------------------------REVIEW THE ANSWERS----------------------------------

qaRev x id h hb int onQues= [roundedRect 150 12 2 |> filled (if (getAtIndex onQues hb) == 1 then (if (getAtIndex onQues (answerBank int)) == 1 then green else red ) else (if (getAtIndex onQues (answerBank int)) == 1 then green else (rgb 196 202 208)))|> move (0,-10)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 1) |>centered |>filled black|> move (0,-17.3)|>scale 0.72
      , if ((getAtIndex onQues (answerBank int)) == 1) then (text "<- ANS" |> filled green |> scale 0.75 |> move (80,-12.5)) else (rect 0 0 |> filled black)
      , if ((getAtIndex onQues hb) == 1) then (text "Your ANS ->" |> filled (if ((getAtIndex onQues (answerBank int)) == 1) then green else red) |> scale 0.75 |> move (-128,-12.5)) else (rect 0 0 |> filled black)
      , if ((getAtIndex onQues hb) == 1) then (if (((getAtIndex onQues hb) == 1) && (getAtIndex onQues (answerBank int)) == 1) then (text "1/1" |>centered |> filled green |> scale 0.75  |> move (0,42)) else (text "0/1" |>centered |> filled red |> scale 0.75  |> move (0,42))) else (rect 0 0 |> filled black)
      ]|>group  
qbRev x id h hb int onQues= [roundedRect 150 12 2 |> filled (if (getAtIndex onQues hb) == 2 then (if (getAtIndex onQues (answerBank int)) == 2 then green else red ) else (if (getAtIndex onQues (answerBank int)) == 2 then green else (rgb 196 202 208)))|> move (0,-24)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 2) |>centered |>filled black|> move (0,-36.5)|>scale 0.72
      , if ((getAtIndex onQues (answerBank int)) == 2) then (text "<- ANS" |> filled green |> scale 0.75 |> move (80,-26.5)) else (rect 0 0 |> filled black)
      , if ((getAtIndex onQues hb) == 2) then (text "Your ANS ->" |> filled (if ((getAtIndex onQues (answerBank int)) == 2) then green else red) |> scale 0.75 |> move (-128,-26.5)) else (rect 0 0 |> filled black)
      , if ((getAtIndex onQues hb) == 2) then (if (((getAtIndex onQues hb) == 2) && (getAtIndex onQues (answerBank int)) == 2) then (text "1/1" |>centered |> filled green |> scale 0.75  |> move (0,42)) else (text "0/1" |>centered |> filled red |> scale 0.75  |> move (0,42))) else (rect 0 0 |> filled black)
      ]|>group  

qcRev x id h hb int onQues= [roundedRect 150 12 2 |> filled (if (getAtIndex onQues hb) == 3 then (if (getAtIndex onQues (answerBank int)) == 3 then green else red ) else (if (getAtIndex onQues (answerBank int)) == 3 then green else (rgb 196 202 208)))|> move (0,-38)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 3) |>centered |>filled black|> move (0,-56.15)|>scale 0.72
      , if ((getAtIndex onQues (answerBank int)) == 3) then (text "<- ANS" |> filled green |> scale 0.75 |> move (80,-40.5)) else (rect 0 0 |> filled black)      
      , if ((getAtIndex onQues hb) == 3) then (text "Your ANS ->" |> filled (if ((getAtIndex onQues (answerBank int)) == 3) then green else red) |> scale 0.75 |> move (-128,-40.5)) else (rect 0 0 |> filled black)           
      , if ((getAtIndex onQues hb) == 3) then (if (((getAtIndex onQues hb) == 3) && (getAtIndex onQues (answerBank int)) == 3) then (text "1/1" |>centered |> filled green|> scale 0.75  |> move (0,42)) else (text "0/1" |>centered |> filled red |> scale 0.75  |> move (0,42))) else (rect 0 0 |> filled black)
      ]|>group
qdRev x id h hb int onQues= [roundedRect 150 12 2 |> filled (if (getAtIndex onQues hb) == 4 then (if (getAtIndex onQues (answerBank int)) == 4 then green else red ) else (if (getAtIndex onQues (answerBank int)) == 4 then green else (rgb 196 202 208)))|> move (0,-52)
      ,text (getOption (getQuestionByIndex (choosenquestionBank x int) onQues) 4) |>centered |>filled black|> move (0,-76)|>scale 0.72     
      , if ((getAtIndex onQues (answerBank int)) == 4) then (text "<- ANS" |> filled green |> scale 0.75 |> move (80,-54.5)) else (rect 0 0 |> filled black)
      , if ((getAtIndex onQues hb) == 4) then (text "Your ANS ->" |> filled (if ((getAtIndex onQues (answerBank int)) == 4) then green else red) |> scale 0.75 |> move (-128,-54.5)) else (rect 0 0 |> filled black)    
      , if ((getAtIndex onQues hb) == 4) then (if (((getAtIndex onQues hb) == 4) && (getAtIndex onQues (answerBank int)) == 4) then (text "1/1" |>centered |> filled green |> scale 0.75  |> move (0,42)) else (text "0/1" |>centered |> filled red |> scale 0.75  |> move (0,42))) else (rect 0 0 |> filled black)
      ]|>group 

---------------------------------------------------------------------------------------

type State
    = MainPage
    | InputNumber
    | Exam
    | TimesUpPage
    | ResultsPage
    | ReviewExam
    | ProgressTrack

type Msg 
    = Tick Float GetKeyState
    | MainToInput Int
    | StartExam
    | A (List Question) Int (List Int)
    | B (List Question) Int (List Int)
    | C (List Question) Int (List Int)
    | D (List Question) Int (List Int)
    | NextQ Int
    | PrevQ Int
    | Submit Float Float Int Float Float
    | ToMain
    | ToReviewExam
    | Increment1 Int
    | Increment5 Int
    | Decrement1 Int
    | Decrement5 Int  
    | FaR
    | FaRExit
    | Fnext
    | Fback
    | ConfirmSubmission
    | ConfirmSubmissionCancel 
    | ToProgress

type alias Model =
    {inputNumber : Int
    , random : Int
    , time : Float 
    , absTime : Float
    , state : State
    , main : List (Shape Msg)
    , startexam : List (Shape Msg)
    , confirmSubPage : Bool
    , results : List (Shape Msg)
    , reviewexam : List (Shape Msg)
    , qId : Int                     ------Which question we are currently on!
    , highlightBank : List Int      -- highlight answer when the user clicks it (0-4), 0 for no highlight state
    , onQues : Int
    , faR : Bool
    , fPage : Int
    , recentScore : Float
    , averageScore : Float
    , averagewithout : Float
    , examsTaken : Int
    , highestScore : Float
    }

initialModel : Model
initialModel =
    {inputNumber = 10
    , random = 1
    , time = 0
    , absTime = 0
    , state = MainPage
    , main = [topBar]
    , startexam = [topBar,quesBox,startExambutton]
    , confirmSubPage = False
    , results = [topBar,quesBox,reviewAns,tomainButton]
    , reviewexam = [topBar,quesBox,tomainButton]
    , qId = 1
    , highlightBank = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    , onQues = 0
    , faR = False
    , fPage = 1
    , recentScore = 0
    , averageScore = 0 
    , averagewithout = 0
    , examsTaken = 0
    , highestScore = 0
    }      

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick t _ ->
          case model.state of
            Exam ->         
              case ((model.inputNumber*120) - round (model.time) > 0) of          
                True ->
                  ({ model | time = t - model.absTime}, Cmd.none) 
                False ->
                  ({ model | absTime = t, time = t, state = TimesUpPage}, Cmd.none)             
            _ ->
              ({model | absTime = t, time = t}, Cmd.none) 
        MainToInput rand ->
           ({ model | random = rand, state = InputNumber }, Cmd.none)             
        StartExam ->
           ({ model | state = Exam, time = 0 }, Cmd.none)                         
        A d onQues hb->
           ({ model | highlightBank = (replaceAtIndex onQues 1 hb) }, Cmd.none) 
        B d onQues hb->
           ({ model | highlightBank = (replaceAtIndex onQues 2 hb) }, Cmd.none)     
        C d onQues hb->
           ({ model | highlightBank = (replaceAtIndex onQues 3 hb) }, Cmd.none) 
        D d onQues hb->
           ({ model | highlightBank = (replaceAtIndex onQues 4 hb) }, Cmd.none)  
        NextQ newId ->
           ({ model | onQues = newId }, Cmd.none)            
        PrevQ newId ->
           ({ model | onQues = newId }, Cmd.none)
        Submit score avgscore examsTaken1 avgwithout highest->
           ({ model | state = ResultsPage, recentScore = score, examsTaken=examsTaken1 ,averageScore = avgscore, averagewithout = avgwithout, highestScore = (if score > highest then score else highest)}, Cmd.none)
        ToReviewExam ->
           ({ model | state = ReviewExam, onQues = 0}, Cmd.none)        
        ToMain ->
           ({ model | state = MainPage, highlightBank = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], onQues = 0, inputNumber = 10, time = 0, faR= False, fPage = 1, confirmSubPage = False}, Cmd.none) 
        Increment1 newVal->
           ({ model | inputNumber = newVal }, Cmd.none) 
        Increment5 newVal->
           ({ model | inputNumber = newVal }, Cmd.none)    
        Decrement1 newVal->
           ({ model | inputNumber = newVal }, Cmd.none) 
        Decrement5 newVal->
           ({ model | inputNumber = newVal }, Cmd.none)      
        FaR ->
           ({ model | faR = True }, Cmd.none) 
        FaRExit ->
           ({ model | faR = False }, Cmd.none)      
        Fnext ->
           ({ model | fPage = 2 }, Cmd.none) 
        Fback ->
           ({ model | fPage = 1 }, Cmd.none) 
        ConfirmSubmission ->
           ({ model | confirmSubPage = True }, Cmd.none) 
        ConfirmSubmissionCancel ->
           ({ model | confirmSubPage = False }, Cmd.none) 
        ToProgress ->
           ({ model | state = ProgressTrack }, Cmd.none)
                  
view : Model -> { title: String, body : Collage Msg }
view model =
        case model.state of
            MainPage ->
                mainPage model
            InputNumber ->
                inputNumber model                
            Exam ->
                exam model
            TimesUpPage ->
                timesUpPage model                
            ResultsPage ->
                resultsPage model
            ReviewExam ->
                reviewExamView model
            ProgressTrack ->   
                progressTrackView model

mainPage : Model -> { title: String, body : Collage Msg }
mainPage model =
    { title = "mainPage"
    , body = collage 300 170 (model.main ++ [mainpageother ({time = model.time}) ])        
    } 
    
inputNumber : Model -> { title: String, body : Collage Msg }
inputNumber model =
    { title = "input a number"
    , body = collage 300 170 (model.startexam ++ [questionInput (model.inputNumber) (model.random)
                              ,timealloted  model.inputNumber ])       
    }         

exam : Model -> { title: String, body : Collage Msg }
exam model =
    { title = "exam"
    , body = collage 300 170 ([topBar,submitButton,quesBox,
                             if model.confirmSubPage == False then (displayExam (model.inputNumber) (getId (getQuestionByIndex (questionBank model.random) model.onQues)) (getAtIndex model.onQues model.highlightBank) (model.highlightBank) (model.random) (model.onQues) 
                             (model.faR) (model.fPage)) else (confirmSubmission {highlightBank = model.highlightBank} (model.inputNumber) (model.random) (model.examsTaken) (model.averageScore) (model.highestScore))
                             ,timer ({time = model.time}) ({inputNumber = model.inputNumber}) (getAtIndex 0 (timeFormat {time = ((model.inputNumber*120)-round(model.time))}) ) (getAtIndex 1 (timeFormat {time = ((model.inputNumber*120)-round(model.time))})) ])
    }   

timesUpPage : Model -> { title: String, body : Collage Msg }
timesUpPage model =
    { title = "TimesUp"
    , body = collage 300 170 ([(submitButton2 {highlightBank = model.highlightBank} (model.inputNumber) (model.random) (model.examsTaken) (model.averageScore) (model.highestScore)),topBar,quesBox])       
    } 

resultsPage : Model -> { title: String, body : Collage Msg }
resultsPage model =
    { title = "results"
    , body = collage 300 170 (model.results ++ [scoreDisplay {highlightBank = model.highlightBank} (model.inputNumber) (model.random) (model.recentScore)])
    }  

reviewExamView : Model -> { title: String, body : Collage Msg }
reviewExamView model =
    { title = "review"
    , body = collage 300 170 (model.reviewexam ++ [reviewExam (model.inputNumber) (getId (getQuestionByIndex (questionBank model.random) model.onQues)) (getAtIndex model.qId model.highlightBank) (model.highlightBank) (model.random) (model.onQues) {highlightBank = model.highlightBank}])
    }  
   
progressTrackView : Model -> { title: String, body : Collage Msg }    
progressTrackView model = 
    { title = "progress"
    , body = collage 300 170 ([progress (model.averageScore) (model.examsTaken) (model.recentScore) (model.highestScore) (model.averagewithout)])
    }

subscriptions : Model -> Sub Msg
subscriptions model = Sub.none

main : EllieAppWithTick () Model Msg
main = 
  ellieAppWithTick Tick 
    { init = \flags -> (initialModel, Cmd.none)
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

