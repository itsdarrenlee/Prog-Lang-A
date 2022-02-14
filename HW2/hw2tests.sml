(* Homework2 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)
use "hw2provided.sml";

(* Q1a *)

val test1 = all_except_option ("string", ["string"]) = SOME []

val test1a = all_except_option ("string", []) = NONE

val test1b = all_except_option ("string", ["string", "banana", "orange"]) = SOME ["banana", "orange"]

val test1c = all_except_option ("banana", ["string", "banana", "orange"]) = SOME ["string", "orange"]

val test1d = all_except_option ("orange", ["string", "banana", "orange"]) = SOME ["string", "banana"]

val test1e = all_except_option ("", ["string", "banana", "orange"]) = SOME ["string", "banana", "orange"]
(* Q1b *)

val test2 = get_substitutions1 ([["foo"],["there"]], "foo") = []

val test2a = get_substitutions1 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                                "Fred") = ["Fredrick", "Freddie", "F"]

val test2b = get_substitutions1 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
                                 "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test2c = get_substitutions1 ([["Banana"],["Banana"]],
                                 "Banana") = []

val test2d = get_substitutions1 ([["Apple","Carrot"],["Carrot"]],"Carrot") = ["Apple"]


val test3 = get_substitutions2 ([["foo"],["there"]], "foo") = []

val test3a = get_substitutions2 ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                                 "Fred") = ["Fredrick", "Freddie", "F"]

val test3b = get_substitutions2 ([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
                                 "Jeff") = ["Jeffrey","Geoff","Jeffrey"]

val test3c = get_substitutions2 ([["Banana"],["Banana"]],
                                 "Banana") = []

val test3d = get_substitutions2 ([["Apple","Carrot"],["Carrot"]],"Carrot") = ["Apple"]

val test4 = similar_names ([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],
                           {first="Fred", middle="W", last="Smith"}) =
            [
              {first="Fred", last="Smith", middle="W"},
              {first="Fredrick", last="Smith", middle="W"},
              {first="Freddie", last="Smith", middle="W"},
              {first="F", last="Smith", middle="W"}
            ]

val test4a = similar_names ([["Foo"],["There"]],
                           {first="Fred", middle="W", last="Smith"}) =
            [
              {first="Fred", last="Smith", middle="W"}
            ]

val test4b = similar_names ([["Apple","Carrot"],["Carrot"]],
                           {first="Carrot", middle="W", last="Smith"}) =
            [
              {first="Carrot", last="Smith", middle="W"},
              {first="Apple", last="Smith", middle="W"}
            ]

val test5 = card_color (Clubs, Num 2) = Black

val test5a = card_color (Diamonds, Num 2) = Red

val test5b = card_color (Hearts, King) = Red

val test6 = card_value (Clubs, Num 2) = 2

val test6a = card_value (Clubs, Ace) = 11

val test6b = card_value (Clubs, Jack) = 10

val test6c = card_value (Clubs, Num 9) = 9

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test7a = (remove_card([(Clubs,Ace), (Spades,King), (Hearts, Num 2)], (Hearts, Ace), IllegalMove);false) handle IllegalMove => true

val test7b = remove_card ([(Hearts, Ace),(Spades, Jack),(Diamonds, Num 4)], (Hearts, Ace), IllegalMove) =
             [(Spades, Jack),(Diamonds, Num 4)]

val test7c = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true

val test8a = all_same_color [] = true

val test8b = all_same_color [(Hearts, King), (Diamonds, Ace)] = true

val test8c = all_same_color [(Diamonds, Num 9), (Hearts, Num 4)] = true

val test8d = all_same_color [(Hearts, Ace)] = true

val test8e = all_same_color [(Hearts, Ace), (Spades, Ace)] = false

val test8f = all_same_color [(Clubs,Ace),(Spades,Ace),(Diamonds,Ace)] = false

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test9a = sum_cards [(Clubs, King),(Clubs, Jack)] = 20

val test9b = sum_cards [(Clubs, Ace),(Spades, Ace)] = 22

val test9c = sum_cards [(Clubs, Num 2)] = 2

val test9d = sum_cards [] = 0

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test10a = score ([(Hearts, King),(Clubs, Num 4)],20) = 6

val test10b = score ([(Hearts, Ace),(Spades, Num 4)],10) = 15

val test10c = score ([(Hearts, Ace),(Diamonds, Ace)],10) = 18

val test10d = score ([(Spades, Num 2),(Clubs, Num 9)],10) = 1

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false)
              handle IllegalMove => true)

val test13b = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[], 15) = 7

val test13c = officiate ([],[Draw], 15) = 7

val testabc = score ([], 15) = 7
