a = ("Porpoise", "grey")
b = ("Table", "oak")

c = fst a
d = snd b

data Cetacean = Cetacean String String
data Furniture = Furniture String String

e = Cetacean "Porpoise" "grey"
f = Furniture "Table" "oak"

--this is not possible since you are comparing a Cetacean with Furniture
-- g = e == f
