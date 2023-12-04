def last {α : Type} (xs : List α) : Option α :=
  match xs with
  | [] => none
  | [α] => some α
  | _ :: xs => last xs

theorem assert_last : last [1,2,3] = some 3 := rfl
theorem assert_last_char : last ['a','b', 'c'] = some 'c' := rfl

def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
match xs with
| [] => none
| x :: xs' => if predicate x then some x else List.findFirst? xs' predicate

theorem assert_findFirst_1 : [1,3,2].findFirst? (fun x => x == 3) = some 3 := rfl
theorem assert_findFirst_2 : [1,3,2,4].findFirst? (fun x => x == 2) = some 2 := rfl

def Prod.swap {α β : Type} (pair : α × β) : β × α :=
  (pair.snd, pair.fst)

theorem assert_swap : ('a','b').swap == ('b','a') := rfl


def PetName : Type := String ⊕ String
def CustomString := String
def PetNameCustom : Type := CustomString ⊕ CustomString

def animals : List PetName :=
  [Sum.inl "Spot", Sum.inr "Tiger", Sum.inl "Fifi", Sum.inl "Rex", Sum.inr "Floof"]

def animalsCustom : List PetNameCustom :=
  [Sum.inl "Spot", Sum.inr "Tiger", Sum.inl "Fifi", Sum.inl "Rex", Sum.inr "Floof"]

-- zip combines two lists into a list of pairs. resulting list should be as long as the shortest input list.
def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs, ys with
  | [], _ => []
  | _, [] => []
  -- If both lists have elements, pair the first elements and recursively zip the rest
  | x::xs', y::ys' => (x, y) :: zip xs' ys'

theorem assert_zip : (zip [1,2,3,4] ['a','b','c']) == [(1,'a'),(2,'b'), (3,'c')] := rfl

theorem assert_zippy : zip [1,2,3,4] ['a','b','c'] = [(1,'a'),(2,'b'), (3,'c')] := rfl

-- TBD function to return the length of the longest list, for 2 lists

def take {α : Type} (n : Nat) (xs : List α) : List α :=
  match n, xs with
  | _, [] => []
  | 0, _ => []
  | n, x :: xs' => x :: take (n-1) xs'

theorem assert_take_1 : take 3 ["bolete", "oyster"] = ["bolete", "oyster"] := rfl
theorem assert_take_2 : take 1 ["bolete", "oyster"] = ["bolete"] := rfl

-- Using the analogy between types and arithmetic,
-- write a function that distributes products over sums.
-- In other words, it should have type α × (β ⊕ γ) → (α × β) ⊕ (α × γ).
-- def distribute_products_over_sums {α β γ : Type} := sorry
