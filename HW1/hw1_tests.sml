use "hw1.sml";

(* Q1 *)
val test1 = is_older ((1,2,3),(2,3,4)) = true

val test1a = is_older ((1994, 03, 16), (1995, 03, 16)) = true

val test1b = is_older ((1994, 03, 16), (1994, 04, 16)) = true

val test1c = is_older ((1994, 03, 16), (1994, 03, 17)) = true

val test1d = is_older ((1993, 03, 16), (1994, 04, 18)) = true

val test1e = is_older ((1994, 03, 16), (1994, 08, 15)) = true

val test1f = is_older ((2011, 1, 31), (2012, 2, 28)) = true

val test1g = is_older ((2012, 2, 27), (2012, 2, 28)) = true

(* Q2 *)
val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1

val test2a = number_in_month ([(2012,3,28),(2013,12,1)],2) = 0

val test2b = number_in_month ([(2012,2,28),(2013,2,1)],2) = 2

val test2c = number_in_month ([],2) = 0

val test2d = number_in_month ([(2012,2,28),(2013,12,1)],12) = 1

val test2e = number_in_month ([(2012,2,28),(2013,12,1),(2014,12,1)],12) = 2

val test2f = number_in_month ([(2012,2,28),(2013,12,1),(2014,10,1),(2013,12,1)],12) = 2

(* Q3 *)
val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3

val test3a = number_in_months ([(2012,2,28),(2011,2,29),(2014,2,30)],[2]) = 3

val test3b = number_in_months ([(2011,7,30),(2011,6,31),(2011,5,28)],[2,3,4]) = 0

val test3c = number_in_months ([(2012,6,28),(2011,5,29),(2014,2,30)],[2,3,4]) = 1

val test3d = number_in_months ([(2012,2,28),(2011,2,29),(2014,2,30)],[2]) = 3

(* Q4 *)
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]

val test4a = dates_in_month ([(2012,2,28),(2012,2,28)],2) = [(2012,2,28),(2012,2,28)]

val test4b = dates_in_month ([(2012,2,28),(2013,12,1)],3) = []

val test4c = dates_in_month ([(2012,2,28),(2013,12,1)],12) = [(2013,12,1)]

val test4d = dates_in_month ([(2012,2,28),(2013,12,1),(2014,2,28),(2013,12,13)],2) = [(2012,2,28),(2014,2,28)]

val test4e = dates_in_month ([(2012,2,28),(2013,12,1),(2014,2,28),(2013,12,13)],12) = [(2013,12,1),(2013,12,13)]

(* Q5 *)
val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]

val test5a = dates_in_months ([(2012,2,28),(2011,2,29),(2014,2,30)],[2,3,4]) = [(2012,2,28),(2011,2,29),(2014,2,30)]

val test5b = dates_in_months ([(2011,7,30),(2011,6,31),(2011,5,28)],[2,3,4]) = []

val test5c = dates_in_months ([(2012,6,28),(2011,5,29),(2014,2,30)],[2,3,4]) = [(2014,2,30)]

val test5d = dates_in_months ([(2012,2,28),(2011,3,29),(2014,2,30)],[2,4,5]) = [(2012,2,28),(2014,2,30)]

val test5e = dates_in_months ([(2011,7,30),(2011,6,31),(2011,5,28)],[]) = []

(* Q6 *)
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

val test6a = get_nth (["hi", "there", "how", "are", "you"], 5) = "you"

val test6b = get_nth (["hi"], 2) = ""

val test6c = get_nth (["hi", "there", "how", "are", "you"], 6) = ""

val test6d = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"

(* Q7 *)
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"

val test7a = date_to_string (2099, 12, 31) = "December 31, 2099"

(* Q8 *)
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3

val test8a = number_before_reaching_sum (3, [4,9,10]) = 0

val test8b = number_before_reaching_sum (6, [3,4,9,10]) = 1

val test8c = number_before_reaching_sum (7, [1,3,4,9,10]) = 2

val test8d = number_before_reaching_sum (12, [5,1,3,4,9,10]) = 3

(* Q9 *)
val test9 = what_month 70 = 3

val test9a = what_month 365 = 12

val test9b = what_month 1 = 1

val test9c = what_month 31 = 1

val test9d = what_month 59 = 2

(* Q10 *)
val test10 = month_range (31, 34) = [1,2,2,2]

val test10a = month_range (363, 365) = [12, 12, 12]

val test10b = month_range (1, 1) = [1]

val test10c = month_range (2, 1) = []

val test10d = month_range (30, 15) = []

(* Q11 *)

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test11a = oldest([(2012,2,28),(2012,3,28),(2011,4,28)]) = SOME (2011,4,28)

val test11b = oldest([]) = NONE

val test11c = oldest([(2000,2,1), (2000,1,1), (2011,1,1)]) = SOME (2000,1,1)

val test11d = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)

val test11e = oldest([(2012,2,28),(2011,3,31),(2009,4,28)]) = SOME (2009,4,28)

val test11f = oldest([(2012,2,28),(2009,4,28)]) = SOME (2009,4,28)
