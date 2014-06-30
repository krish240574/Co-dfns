∇Z←FI;C;E;I;G;D;R;P
 Z←⍬ ⋄ C←LLVMCore ⋄ E←LLVMExecutionEngine ⋄ I←LLVMX86Info ⋄ G←LLVMX86CodeGen
 D←LLVMX86Desc ⋄ R←CodfnsRuntime ⋄ P←'LLVM'
 'TypeOf'⎕NA'P ',C,'|',P,'TypeOf P'
 'Int8Type'⎕NA'P ',C,'|',P,'Int8Type'
 'Int16Type'⎕NA'P ',C,'|',P,'Int16Type'
 'Int32Type'⎕NA'P ',C,'|',P,'Int32Type'
 'Int64Type'⎕NA'P ',C,'|',P,'Int64Type'
 'DoubleType'⎕NA'P ',C,'|',P,'DoubleType'
 'VoidType'⎕NA'P ',C,'|',P,'VoidType'
 'FunctionType'⎕NA'P ',C,'|',P,'FunctionType P <P[] U I'
 'StructType'⎕NA'P ',C,'|',P,'StructType <P[] U I'
 'StructSetBody'⎕NA C,'|',P,'StructSetBody P <P[] U I'
 'PointerType'⎕NA'P ',C,'|',P,'PointerType P U'
 'ArrayType'⎕NA'P ',C,'|',P,'ArrayType P U'
 'StructCreateNamed'⎕NA'P ',C,'|',P,'StructCreateNamed P <0C[]'
 'ConstReal'⎕NA'P ',C,'|',P,'ConstReal P F'
 'ConstInt'⎕NA'P ',C,'|',P,'ConstInt P I8 I'
 'ConstIntOfString'⎕NA'P ',C,'|',P,'ConstIntOfString P <0C[] U8'
 'ConstArray'⎕NA'P ',C,'|',P,'ConstArray P <P[] U'
 'ConstPointerNull'⎕NA'P ',C,'|',P,'ConstPointerNull P'
 'AddGlobal'⎕NA'P ',C,'|',P,'AddGlobal P P <0C[]'
 'SetInitializer'⎕NA'',C,'|',P,'SetInitializer P P'
 'AddFunction'⎕NA'P ',C,'|',P,'AddFunction P <0C[] P'
 'GetNamedGlobal'⎕NA'P ',C,'|',P,'GetNamedGlobal P <0C[]'
 'GetNamedFunction'⎕NA'P ',C,'|',P,'GetNamedFunction P <0C[]'
 'AppendBasicBlock'⎕NA'P ',C,'|',P,'AppendBasicBlock P <0C[]'
 'CreateBuilder'⎕NA'P ',C,'|',P,'CreateBuilder'
 'PositionBuilderAtEnd'⎕NA'P ',C,'|',P,'PositionBuilderAtEnd P P'
 'BuildRet'⎕NA'P ',C,'|',P,'BuildRet P P'
 'BuildRetVoid'⎕NA'P ',C,'|',P,'BuildRetVoid P'
 'BuildCondBr'⎕NA'P ',C,'|',P,'BuildCondBr P P P P'
 'BuildCall'⎕NA'P ',C,'|',P,'BuildCall P P <P[] U <0C'
 'DisposeBuilder'⎕NA'P ',C,'|',P,'DisposeBuilder P'
 'ConstStruct'⎕NA'P ',C,'|',P,'ConstStruct <P[] U I'
 'BuildAlloca'⎕NA'P ',C,'|',P,'BuildAlloca P P <0C'
 'BuildLoad'⎕NA'P ',C,'|',P,'BuildLoad P P <0C'
 'BuildStore'⎕NA'P ',C,'|',P,'BuildStore P P P'
 'GetInsertBlock'⎕NA'P ',C,'|',P,'GetInsertBlock P'
 'GetLastInstruction'⎕NA'P ',C,'|',P,'GetLastInstruction P'
 'GetPreviousBasicBlock'⎕NA'P ',C,'|',P,'GetPreviousBasicBlock P'
 'BuildStructGEP'⎕NA'P ',C,'|',P,'BuildStructGEP P P U <0C'
 'BuildGEP'⎕NA'P ',C,'|',P,'BuildGEP P P <P[] U <0C'
 'BuildBitCast'⎕NA'P ',C,'|',P,'BuildBitCast P P P <0C'
 'BuildICmp'⎕NA'P ',C,'|',P,'BuildICmp P U P P <0C'
 'BuildArrayAlloca'⎕NA'P ',C,'|',P,'BuildArrayAlloca P P P <0C'
 'GetParam'⎕NA'P ',C,'|',P,'GetParam P U'
 'CountParams'⎕NA'U ',C,'|',P,'CountParams P'
 'PrintModuleToFile'⎕NA'I4 ',C,'|',P,'PrintModuleToFile P <0C >P'
 'DisposeMessage'⎕NA C,'|',P,'DisposeMessage P'
 'GetGlobalContext'⎕NA'P ',C,'|',P,'GetGlobalContext'
 'ModuleCreateWithName'⎕NA'P ',C,'|',P,'ModuleCreateWithName <0C'
 'AddAlias'⎕NA'P ',C,'|',P,'AddAlias P P P <0C'
 'GenericValueToPointer'⎕NA'P ',E,'|',P,'GenericValueToPointer P'
 'GenericValueToInt'⎕NA'I ',E,'|',P,'GenericValueToInt P I'
 'DisposeGenericValue'⎕NA E,'|',P,'DisposeGenericValue P'
 'FindFunction'⎕NA'I ',E,'|',P,'FindFunction P <0C >P'
 'SetTarget'⎕NA C,'|',P,'SetTarget P <0C'
 ('Initialize',Target,'TargetInfo')⎕NA I,'|',P,'Initialize',Target,'TargetInfo'
 ('Initialize',Target,'Target')⎕NA G,'|',P,'Initialize',Target,'Target'
 ('Initialize',Target,'TargetMC')⎕NA D,'|',P,'Initialize',Target,'TargetMC'
 'DumpModule'⎕NA C,'|',P,'DumpModule P'
 'DumpType'⎕NA C,'|',P,'DumpType P'
 'ffi_get_type'⎕NA'U1 ',R,'|ffi_get_type P'
 'ffi_get_data_int'⎕NA R,'|ffi_get_data_int >I8[] P'
 'ffi_get_data_float'⎕NA R,'|ffi_get_data_float >F8[] P'
 'ffi_get_shape'⎕NA R,'|ffi_get_shape >U4[] P'
 'ffi_get_size'⎕NA'U8 ',R,'|ffi_get_size P'
 'ffi_get_rank'⎕NA'U2 ',R,'|ffi_get_rank P'
 'ffi_make_array_int'⎕NA'I ',R,'|ffi_make_array_int >P U2 U8 <U4[] <I8[]'
 'ffi_make_array_double'⎕NA'I ',R,'|ffi_make_array_double >P U2 U8 <U4[] <F8[]'
 'array_free'⎕NA R,'|array_free P'
 'cstring'⎕NA'libc.so.6|memcpy >C[] P P'
 'strlen'⎕NA'P libc.so.6|strlen P'
 'free'⎕NA'libc.so.6|free P'
 ArrayTypeV←GenArrayType ⍬
∇
