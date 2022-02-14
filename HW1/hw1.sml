fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =

    let
        val year1 = #1 date1;
        val month1 = #2 date1;
        val day1 = #3 date1;
        val year2 = #1 date2;
        val month2 = #2 date2;
        val day2 = #3 date2;
    in
        if year1 <> year2
        then year1 < year2
        else if month1 <> month2
        then month1 < month2
        else if day1 <> day2
        then day1 < day2
        else false
    end

fun number_in_month (date: (int * int * int) list, month: int) =
    if null date
    then 0
    else
        if #2 (hd date) = month
        then 1 + number_in_month(tl date, month)
        else number_in_month(tl date, month)

fun number_in_months (date: (int * int * int) list, months: int list) =
    if null months
    then 0
    else
        number_in_month(date, hd months) +  number_in_months(date, tl months)

fun dates_in_month (dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else
        if #2 (hd dates) = month
        then hd dates :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

fun dates_in_months (dates: (int * int *int) list, months: int list) =
    if null months
    then []
    else
        dates_in_month(dates, hd months) @  dates_in_months(dates, tl months)

fun get_nth (strings: string list, element: int) =
    if null strings
    then ""
    else
        if element = 1
        then hd strings
        else
            get_nth(tl strings, element-1)

fun date_to_string (date: (int * int *int)) =
    let
        val month_arr =[
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ];
        val day = Int.toString(#3 date)
        val year = Int.toString(#1 date)
    in
        get_nth(month_arr, #2 date) ^ " " ^ day ^ ", " ^ year
    end

fun number_before_reaching_sum (sum: int, numbers: int list) =
    let
        fun summer(sum: int, numbers: int list, count: int, total: int) =
            if null numbers orelse total >= sum
            then count-1
            else
                summer(sum, tl numbers, count+1, total+(hd numbers))
    in
        summer(sum, numbers, 0, 0)
    end

fun what_month (day: int) =
    let
        val months = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(day, months) + 1
    end

fun month_range (day1: int, day2: int) =
    if day1 > day2
    then []
    else
        what_month(day1) :: month_range(day1+1, day2)

fun oldest (dates: (int * int * int) list) =
    if null dates
    then NONE
    else let
            fun oldest_nonempty (xs: (int * int * int) list) =
                if null (tl xs)
                then hd xs
                else
                    let val tl_oldest = oldest_nonempty(tl xs)
                    in
                        if is_older(hd xs, tl_oldest)
                        then hd xs
                        else tl_oldest
                    end
        in
            SOME (oldest_nonempty dates)
        end
