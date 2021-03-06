module Material.Snackbar exposing
    ( add
    , alignEnd
    , alignStart
    , Contents
    , Property
    , snack
    , toast
    , view
    )

{-|
The Snackbar component is a spec-aligned snackbar/toast component adhering to
the Material Design snackbars & toasts requirements.


# Resources

- [Material Design guidelines: Snackbars & toasts](https://material.io/guidelines/components/snackbars-toasts.html)
- [Demo](https://aforemny.github.io/elm-mdc/#snackbar)


# Example

```elm
import Material.Snackbar as Snackbar

Snackbar.view Mdc [0] model.mdc [] []
```


# Usage

@docs Property
@docs view
@docs alignStart, alignEnd


## Contents

@docs Contents
@docs add
@docs toast
@docs snack
-}

import Html exposing (Html)
import Material
import Internal.Component exposing (Index)
import Internal.Snackbar.Implementation as Snackbar
import Time exposing (Time)


{-| Snackbar property.
-}
type alias Property m =
    Snackbar.Property m


{-| Snackbar view.
-}
view :
    (Material.Msg m -> m)
    -> Index
    -> Material.Model m
    -> List (Property m)
    -> List (Html m)
    -> Html m
view =
    Snackbar.view


{-| Snackbar Contents.
-}
type alias Contents m =
    { message : String
    , action : Maybe String
    , timeout : Time
    , fade : Time
    , multiline : Bool
    , actionOnBottom : Bool
    , dismissOnAction : Bool
    , onDismiss : Maybe m
    }


{-| Generate toast with given message. Timeout is 2750ms, fade 250ms.
-}
toast : Maybe m -> String -> Contents m
toast =
    Snackbar.toast


{-| Generate snack with given message and label.
Timeout is 2750ms, fade 250ms.
-}
snack : Maybe m -> String -> String -> Contents m
snack =
    Snackbar.snack


{-| Add a message to the snackbar. If another message is currently displayed,
the provided message will be queued.
-}
add : (Material.Msg m -> m)
    -> Index
    -> Contents m
    -> Material.Model m
    -> ( Material.Model m, Cmd m )
add =
    Snackbar.add


{-| Start-align the Snackbar.

By default Snackbars are center aligned. This is only configurable on tablet
and desktops creens.
-}
alignStart : Property m
alignStart =
    Snackbar.alignStart


{-| End-align the Snackbar.

By default Snackbars are center aligned. This is only configurable on tablet
and desktops creens.
-}
alignEnd : Property m
alignEnd =
    Snackbar.alignEnd
