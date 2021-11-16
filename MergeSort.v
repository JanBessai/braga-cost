From mathcomp Require Import all_ssreflect.
Set Bullet Behavior "Strict Subproofs".
Import EqNotations.

Inductive Phase: Set :=
| Partition : Phase
| Merge : Phase.

Definition Input (A: Type) (phase: Phase): Type :=
  match phase with
  | Partition => seq A
  | Merge => (seq A * seq A)%type
  end.

Inductive MergeSort (A: Type) (leq: A -> A -> bool): forall phase: Phase, Input pase -> seq A -> Prop :=
| Partition_Done0 : MergeSort A leq Partition [::] [::]
| Partition_Done1 : forall x, MergeSort A leq Partition [:: x] [:: x]
| Partition_Done2 : forall x y, leq x y -> MergeSort A leq Partition [:: x; y] [:: x; y]
| Partition_Swap2 : forall x y, ~leq x y -> MergeSort A leq Partition [:: x; y] [:: y; x]
| Partition_Merge : forall xs n r1 r2 r,
    n = length xs ->
    n >= 3 ->
    MergeSort A leq Partition (take (n / 2) xs) r1 ->
    MergeSort A leq Partition (drop (n / 2) xs) r2 ->
    MergeSort A leq Merge (r1, r2) r ->
    MergeSort A leq Partition xs r
| Merge_DoneL : forall ys, MergeSort A leq Merge ([::], ys) ys
| Merge_DoneR : forall xs, MergeSort A leq Merge (xs, [::]) xs
| Merge_TakeL : forall x xs y ys, leq x y -> MergeSort A leq Merge 

