doubleSmallNumber x = if x > 100
                        then x
                        else x*2

--same as drop function
--uses recursion to keep dropping from list
myDrop n xs = if (n <= 0 || null xs)
    then xs
    else myDrop (n-1) (tail xs)
