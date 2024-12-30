module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )

import String exposing (fromFloat)


type Complex
    = Complex ( Float, Float )

toString : Complex -> String
toString c =
    let
        (a, b) = case c of Complex x -> x
    in
        "(" ++ fromFloat a ++ ", " ++ fromFloat b ++ ")"

fromPair : ( Float, Float ) -> Complex
fromPair pair =
    Complex pair


fromReal : Float -> Complex
fromReal float =
    Debug.todo "Please implement fromReal."


real : Complex -> Float
real z =
    case z of
        Complex (x , _) -> x


imaginary : Complex -> Float
imaginary z =
    case z of
        Complex (_, y) -> y


conjugate : Complex -> Complex
conjugate z =
    Debug.todo "Please implement conjugate."


abs : Complex -> Float
abs z =
    Debug.todo "Please implement abs."


add : Complex -> Complex -> Complex
add z1 z2 =
    Debug.todo "Please implement add."

-- `(a + i * b) - (c + i * d) = (a - c) + (b - d) * i`
sub : Complex -> Complex -> Complex
sub z1 z2 =
    let
        (a, b) = case z1 of Complex x -> x
        (c, d) = case z2 of Complex z -> z
        pair = ((a - c), (b - d))
    in
    -- Debug.log <| toString <| fromPair pair
    Debug.log <| toString <| fromPair pair
    -- Debug.todo "Implement Sub"

mul : Complex -> Complex -> Complex
mul z1 z2 =
    let
        (a, b) = case z1 of Complex x -> x
        (c, d) = case z2 of Complex z -> z
    in 
        Complex (a, b)


div : Complex -> Complex -> Complex
div z1 z2 =
    Debug.todo "Please implement div."


exp : Complex -> Complex
exp z =
    Debug.todo "Please implement exp."
