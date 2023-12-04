
-- #eval String.append "it is "

#eval String.append "A" (String.append "B" "C")
#eval String.append (String.append "A" "B") "C"
#eval 1 - 2
#eval (1 - 2 : Int)

def lean : String := "Lean"

-- #eval String.append hello (String.append " " lean)

def add1 (n : Nat) : Nat := n + 1
#eval add1 7

def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

#eval maximum 10 70

#check (maximum)
#check maximum

-- creates a new string by placing its first argument between its second and third arguments.
-- String -> String -> String -> String
def joinStringsWith a b c :=
  String.append b (String.append a c)

#check joinStringsWith
#check (joinStringsWith)

-- write test in Lean ?
#eval joinStringsWith " ... " "Hello" "Lean"

#check (joinStringsWith ": ")

-- Nat -> Nat -> Nat --> Nat
-- rectangular prism with the given height, width, and depth.
def volume (height width depth : Nat) :=
  height * width * depth

#eval volume 10 20 30

#check 1.2

structure Point where
  x : Float
  y : Float
deriving Repr

def origin : Point := { x := 1.0, y := 2.0 }

#eval origin

def distance (p1 : Point) (p2 : Point) : Float :=
  Float.sqrt (((p2.x - p1.x) ^ 2.0) + ((p2.y - p1.y) ^ 2.0))

#eval distance origin origin

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def origin3D : Point3D := { x := 0.0, y := 0.0, z := 0.0 }


#eval "one string".append " and another"

def Point.modifyBoth (f : Float → Float) (p : Point) : Point :=
  { x := f p.x, y := f p.y }

def fourAndThree : Point := { x := 4.4, y := 3.0 }

#eval fourAndThree.modifyBoth Float.floor

structure RectangularPrism where
  height : Nat
  width : Nat
  depth : Nat

def RectangularPrism.volume (rp : RectangularPrism) :=
  rp.height * rp.width * rp.depth

def rp1 : RectangularPrism := { height := 10, width := 20, depth := 30 }

#eval rp1.volume


def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k


#eval pred 1

def depth (p : Point3D) : Float :=
  match p with
  | { x:= h, y := w, z := d } => d


structure PPoint (α : Type) where
  x : α
  y: α
deriving Repr

def prismsPoint : PPoint RectangularPrism := { x := rp1, y := rp1 }

def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX }

#check (replaceX)

def primesUnder10 : List Nat := [2, 3, 5, 7]

#eval primesUnder10

#check primesUnder10

-- def length (α : Type) (xs : List α) : Nat :=
--   match xs with
--   | List.nil => Nat.zero
--   | List.cons y ys => Nat.succ (length α ys)

def length (α : Type) (xs : List α) : Nat :=
  match xs with
  | [] => 0
  | y :: ys => Nat.succ (length α ys)


-- def List.head? {α : Type} (xs : List α) : Option α :=
--   match xs with
--   | [] => none
--   | y :: _ => some y

#eval primesUnder10.head?

-- #eval [].head?

#eval [].head? (α := Int)

-- def fives : String × Int := { fst := "five", snd := 5 }

def fives : String × Int := ("five", 5)


-- inductive Sum (α : Type) (β : Type) : Type where
--   | inl : α → Sum α β
--   | inr : β → Sum α β
