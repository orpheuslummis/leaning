import Lake
open Lake DSL

package «leaning» where
  -- add package configuration options here

lean_lib «Leaning» where
  -- add library configuration options here

@[default_target]
lean_exe «leaning» where
  root := `Main
  -- Enables the use of the Lean interpreter by the executable (e.g.,
  -- `runFrontend`) at the expense of increased binary size on Linux.
  -- Remove this line if you do not need such functionality.
  supportInterpreter := true
