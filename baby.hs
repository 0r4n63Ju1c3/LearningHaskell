doubleMe x = x + x
doubleUs x = (if x > 10 then x else x*2)
conan = "hi its conan"
lostNumbers = [1,2,3,4]

----- basic list elements
losthead = head lostNumbers --head takes the first
losttail = tail lostNumbers -- tail returns everything but the first
lostlast = last lostNumbers -- last returns the last element
lostcat = lostNumbers ++ [1,2,3] -- ++ means concatenation
lostindex x = lostNumbers !! x -- use !! to get an index (x)
lostlength = length lostNumbers -- length returns the length of a list
lostnull = null lostNumbers -- null checks if the list is null
lostreverse = reverse lostNumbers -- reverse reverses the list in question
losttake x = take x lostNumbers -- take creates the first x items and creates new list
lostdrop x = drop x lostNumbers -- drops the number of elements x from beginning of list
lostmaximum = maximum lostNumbers -- finds the maximum value and returns
lostminimum = minimum lostNumbers -- finds the minimum value and returns
lostsum = sum lostNumbers -- finds and returns sum
lostproduct = product lostNumbers -- finds product
lostelem x = x `elem` lostNumbers -- checks if x is an element

----- functions for infinity
lostcycle = take 10 (cycle lostNumbers) -- cycle infinity repeats the list
lostrepeat = take 10 (repeat lostNumbers) -- lost repeat will repeat the element
lostreplicate x = replicate x lostNumbers -- replicated 2nd arg 1st arg times

-- TAKING A LOOK AT LIST COMPREHENSIONS

-- [x*2 | x <- [1..10], x*2 >= 12]
-- S is 2x where x is all numbers 1-10 and x*2 is greater than 10
-- [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- S is x where x is all numbers 10-20 and where x is not 13, 15 or 19

length' xs = sum [1 | _ <- xs] -- this  our version of the length function
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  --
removeNonLowercase st = [c | c <- st, c `elem` ['a'..'z']]

-- this also works for lists that have lists inside of them
-- xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
-- [[ x | x <- xs, even x ] | xs <- xxs]

--Lists in haskell can only hold one type
-- This IS NOT THE CASE FOR A TUPLE
-- fst 'tuple' will take the first element of a TUPLE
-- 'snd' will take the second element of a tuple

-- zip will pair up elements and create a new list
-- zip [1 .. 5] ["one", "two", "three", "four", "five"] returns [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]
-- it is important to remember that zip will always terminate at end of shorter list

-- problem with triangles
-- triangles = [(a,b,c) | a <- (1..10), b <- (1..10), c <- (1..10)]
-- rightTriangles = [(a,b,c) | a <- (1..10), b <- (1..10), c <- (1..10), a^2 + b^2 == c^2]
-- rightTrianglesPerimeteris24 = [(a,b,c) | a <- (1..10), b <- (1..10), c <- (1..10), a^2 + b^2 == c^2, a+b+c==24]


-- TYPE CASTING - haskell is statically typed
-- having a :t command will give you the type in ghci

--functions also have types
--takes in argument of [Char] and returns [Char]
removeNonUppercase :: [Char] -> [Char]
removeNonLowercase :: String -> String
--removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]  --

-- one for each parameter and then a return type
-- Integer can be used as well not bounded to 32 bits
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

addye :: (Fractional a, Num a ) => a -> a -> a
addye x y = x + y

-- Float, Double, Bool, Char, basically standard data types as C
-- Different types of type clases
-- Show a => a -> String
-- Read a => String -> a
-- Numeric
-- Eq, all standard Haskell types except for IO are part of EQ clas
-- Ord, types that have an ordering, must be apart of Eq class first
-- Enum, types that have a specific order

-- : is the cons operator
-- you can do pattern matching in Haskell (x:xs) binding x to xs

heady :: [a] -> a
heady [] = error "empty list"
heady (x:_) = x

--using pattern matching to find the length
lengthy :: (Eq b) => [b] -> Integer
lengthy [] = 0
lengthy (_:x) = 1 + lengthy(x)

--using an @ sign will keep reference to entire String
findFirst :: (Show a) => [a] -> String
findFirst [] = error "empty"
findFirst all@(x:xs) = "hello " ++ show all ++ show all

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

--note that we cannot use num here because it is "not enough"
bmiTell :: (Fractional a, Ord a) => a -> a -> String
bmiTell weight height
  | weight / height ^ 2 <= 18.5 = "You're are underweight man!"
  | weight / height ^ 2 <= 25.0 = "You are normal!"
  | weight / height ^ 2 <= 30   = "You are fat!"
  | otherwise                   = "Yikes man!"

fakeMax :: (Ord a) => a -> a -> Ordering
fakeMax a b
  | a > b = GT
  | a < b = LT
  | otherwise = EQ


initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
  where bmi weight height = weight / height ^ 2
