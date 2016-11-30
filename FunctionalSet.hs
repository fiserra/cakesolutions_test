type Set = Int -> Bool

contains :: Set -> Int -> Bool
let contains s elem = s(elem)

contains (\x-> x > 0) 2
contains (\x-> x `mod` 2 == 0) 2


let bound = 1000

forall :: (Int -> Bool) -> Set -> Bool
let forall p s = iter(-bound)
        where
           iter x = if (x > bound) then True
                    else if (contains(s) x) && not(p(x)) then False
                    else iter(x + 1)

forall (\x-> x `mod` 2 == 0) (\x-> x `mod` 4 == 0)