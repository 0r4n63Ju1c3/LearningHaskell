data BookInfo = Book Int String [String]
  deriving (Show)

data MagazineInfo = Magazine Int String [String]
  deriving (Show)

--Making a new data type
--data means make a new data type
--BookInfo is being made, must start with capital letter
myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

--can use a type to act as a synonym
data BookReview = BookReview BookInfo CustomerID String
type CustomerID = Int

type BookRecord = (BookInfo,BookReview)

type CardHolder = String
type CardNumber = String
type Address = [String]

--Red essentially acts as a constructor
--IE if they want to pay by credit card they must supply CardNumber
    -- CardHolder and Address
--They can pay by CashOnDelivery or Invoice where CustomerID must be supplied
data BillingInfo = CreditCard CardNumber CardHolder Address
  | CashOnDelivery
  | Invoice CustomerID
  deriving (Show)

newInfo = CashOnDelivery
