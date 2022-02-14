(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string (s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)

(* Start of hw2.sml *)

(* 1a *)
fun all_except_option ("", lst) = SOME lst
  | all_except_option (_, []) = NONE
  | all_except_option (str, x::xs) =
    case same_string(str, x) of
         true => SOME xs
       | false => case all_except_option(str, xs) of
                       NONE => NONE
                     | SOME rest => SOME(x::rest)

(* 1b *)
fun get_substitutions1 ([], str) = []
  | get_substitutions1 (x::xs, str) =
    case all_except_option(str, x) of
       NONE => get_substitutions1(xs, str)
     | SOME rest => rest @ get_substitutions1(xs, str)

(* 1c *)
fun get_substitutions2 (lst, str) =
    let
        fun to_list (NONE) = []
          | to_list (SOME items) = items
        fun f ([], acc) = acc
          | f (x::xs, acc) =
            f (xs, acc @ to_list(all_except_option(str, x)))
    in
        f (lst, [])
    end

(* 1d *)
fun similar_names (lst, {first=f, middle=m, last=l}) =
    let
        val allPossibleFirstNames = get_substitutions2(lst, f)
        fun nameRecord (new) = {first=new, middle=m, last=l}
        fun helper ([], name) = name
          | helper (x::xs, name) = helper (xs, name @ [nameRecord(x)] )
    in
        helper (allPossibleFirstNames, [{first=f, middle=m, last=l}])
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

(* 2a *)
fun card_color (suit, rank) =
    case suit of
        Clubs =>  Black
      | Spades => Black
      | _  => Red

(* 2b *)
fun card_value (suit, rank) =
    case rank of
        Ace => 11
      |  Num i => i
      | _ => 10

(* 2c *)
fun remove_card ([], card, e) = raise e
  | remove_card (x::xs, card, e) =
    if x = card then xs else raise e

(* 2d *)
fun all_same_color [] = true
  | all_same_color (_::[]) = true
  | all_same_color (first::(second::rest)) =
    case (card_color(first), card_color(second)) of
        (Black, Black) => all_same_color(rest)
      | (Red, Red) => all_same_color(rest)
      | _  => false

(* 2e *)
fun sum_cards [] = 0
  | sum_cards cardList =
    let fun aux (lst, acc) =
            case lst of
                [] => acc
              | x::xs => aux (xs, card_value(x)+acc)
    in
        aux (cardList, 0)
    end

(* 2f *)
fun score (cardList, goal) =
    let
        val sum = sum_cards(cardList)
        fun prelimScore (s, g) =
            if s > g then 3*(s-g) else g-s
    in
        case all_same_color (cardList) of
            false => prelimScore (sum, goal)
          | true => (prelimScore (sum, goal)) div 2
    end

(* 2g *)
fun officiate (cardList, moveList, goal) =
    let
        fun main (cards, held, []) = score (held, goal)
          | main (cards, held, move::xs) =
            let
                fun discard (lst, card) =
                    remove_card (lst, card, IllegalMove)
                fun draw ([], held, moves) = score (held, goal)
                  | draw (x::xs, held, moves) =
                    let
                        val afterDraw = x::held
                        val is_greater = sum_cards (afterDraw) > goal
                    in
                        case is_greater of
                            true => score (afterDraw, goal)
                         |  false => main (xs, afterDraw, moves)
                    end
            in
                case move of
                    Draw  => draw (cards, held, xs)
                  | Discard c => main (cards, discard (held, c), xs)
            end
    in
        main (cardList, [], moveList)
    end
