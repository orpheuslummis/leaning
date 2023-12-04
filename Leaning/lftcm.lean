import Mathlib

example : 2 + 2 = 4 := rfl

example (a b : ℕ ): a + a * b = ( b + 1 ) * a := by ring
