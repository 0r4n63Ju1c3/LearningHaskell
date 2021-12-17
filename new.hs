getLast :: String -> String
getLast [] = "no string"
getLast [x] = [x]
getLast (_:_:x:_) =  [x]
