FX←#.Codfns.Fix ⋄ d←{'./tmp/',⍵} ⋄ #.UT.sac←1 ⋄ X←{1:#.UT.expect←⍵}
in←{(⊂':Namespace'),(,⍵),⊂':EndNamespace'}

b_TEST←{_←X 0 ⋄ n←(d'b')FX in⍬ ⋄ ≢n.⎕NL 1 2 3 4 9}
f_TEST←{_←X (d'f.')∘,¨'ll' 'so' ⋄ _←⎕sh 'rm -f ',d'f.{ll,so}'
  _←(d'f')FX in⍬ ⋄ ⎕sh'ls ',d'f.{ll,so}'}
c_TEST←{_←X 5 ⋄ ((d'c')FX in⊂'f←{5}').f⍬}
w_TEST←{_←X 6 ⋄ ((d'w')FX in⊂'g←{5+⍵}').g 1}

