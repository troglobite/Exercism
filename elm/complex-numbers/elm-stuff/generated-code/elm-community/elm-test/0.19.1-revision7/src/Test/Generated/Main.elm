module Test.Generated.Main exposing (main)

import Tests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    Test.Runner.Node.run
        { runs = 100
        , report = ConsoleReport UseColor
        , seed = 276174643800917
        , processes = 16
        , globs =
            []
        , paths =
            [ "/Users/brian.parry/Exercism/elm/complex-numbers/tests/Tests.elm"
            ]
        }
        [ ( "Tests"
          , [ Test.Runner.Node.check Tests.tests
            ]
          )
        ]