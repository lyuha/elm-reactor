module DataUtils where

import Debug

{-| Would call this Utils except I don't want conflicts with the module
being debugged (this is a problem for all modules in the debugger) -}

getLast : List a -> Maybe a
getLast list =
  case list of
    [] ->
      Nothing

    [x] ->
      Just x

    (x::xs) ->
      getLast xs


getMaybe : String -> Maybe a -> a
getMaybe msg maybe =
  case maybe of
    Just x ->
      x

    Nothing ->
      Debug.crash msg


getResult : Result String r -> r
getResult res =
  case res of
    Ok val ->
      val

    Err msg ->
      Debug.crash msg

maybeToList : Maybe a -> List a
maybeToList maybe =
  case maybe of
    Just x ->
      [x]

    Nothing ->
      []


intersect : List a -> List a -> List a
intersect xs ys =
  xs |> List.filter (\x -> List.member x ys)
