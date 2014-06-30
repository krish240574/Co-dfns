⎕IO ⎕ML←0 1

TargetTriple←'x86_64-redhat-linux-gnu'
Target←'X86'
LLVMX86Info←'libLLVM-3.4.so'
LLVMX86Desc←'libLLVM-3.4.so'
LLVMX86CodeGen←'libLLVM-3.4.so'
LLVMExecutionEngine←'libLLVM-3.4.so'
LLVMCore←'libLLVM-3.4.so'
CodfnsRuntime←'./libcodfns.so'
MtNTE←0 2⍴⊂''
MtAST←0 4⍴0
MtA←0 2⍴⊂''
APLRunts←'codfns_add' 'codfns_subtract' 'codfns_divide' 'codfns_multiply'
APLRunts,←'codfns_residue' 'codfns_power' 'codfns_log' 'codfns_max'
APLRunts,←'codfns_min' 'codfns_less' 'codfns_less_or_equal' 'codfns_equal'
APLRunts,←'codfns_not_equal' 'codfns_greater_or_equal' 'codfns_greater'
APLRunts,←'codfns_squad' 'codfns_reshape' 'codfns_catenate' 'codfns_indexgen'
APLRunts,←'codfns_ptred' 'codfns_index'
APLRtOps←,⊂'codfns_each'
APLPrims←,¨'+-÷×|*⍟⌈⌊<≤=≠≥>⌷⍴,⍳'
APLPrims,←'⎕ptred' '⎕index' (,'¨')

