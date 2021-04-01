module Main where

import Prelude

import Data.Array (filter)
import Data.Maybe (Maybe (..))
import Data.Either (Either (..), isRight)
import Effect (Effect)
import Effect.Console (log)
import Data.Traversable (traverse_)

-- record
type Person =
  { name :: String
  , age  :: Int
  , pet  :: String -- Should be Animal, not String
  }

-- sum type or "enum"
data Animal = Cat | Dog | Elephant

-- sum type
data MaybeA a
  = NothingA
  | JustA a

c :: Person -> Int
c person =
  case person.pet of
    "cat" -> 1
    "dog" -> 2
    "elephant" -> 3
    _ -> 4

d :: Array Animal
d =
  let animals = [Cat, Dog, Dog, Elephant, Cat]
  in filter (\animal -> isRight (isCat animal)) animals


saysWhat :: Animal -> String
saysWhat animal =
  case animal of
    Cat -> "meow"
    Dog -> "bark"
    Elephant -> "yep"

isCat :: Animal -> Either String Animal
isCat animal =
  case animal of
    Cat -> Right Cat
    _   -> Left "NOT CAT"

toString :: Animal -> String
toString animal =
  case animal of
    Cat -> "cat"
    _ -> "some other animal"

toString' :: Animal -> String
toString' Cat = "cat"
toString' Dog = "dog"
toString' Elephant = "e"

a :: Maybe Int
a = if true
    then Just 5
    else Nothing

getName :: Person -> String
getName person =
  person.name

logAnimal :: Animal -> Effect Unit
logAnimal = toString' >>> log

main :: Effect Unit
main = do
  traverse_ (\animal -> log $ toString' animal) d

  log $ toString' $ Dog

  Dog
    # toString'
    # log

  logAnimal Elephant
