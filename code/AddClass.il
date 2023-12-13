.class public abstract sealed auto ansi
  TupleMethod
    extends [System.Runtime]System.Object
{
  .custom instance void [FSharp.Core]Microsoft.FSharp.Core.CompilationMappingAttribute::.ctor(valuetype [FSharp.Core]Microsoft.FSharp.Core.SourceConstructFlags)
    = (01 00 07 00 00 00 00 00 ) // ........
    // int32(7) // 0x00000007

  .class nested public auto ansi serializable
    AddClass
      extends [System.Runtime]System.Object
  {
    .custom instance void [FSharp.Core]Microsoft.FSharp.Core.CompilationMappingAttribute::.ctor(valuetype [FSharp.Core]Microsoft.FSharp.Core.SourceConstructFlags)
      = (01 00 03 00 00 00 00 00 ) // ........
      // int32(3) // 0x00000003

    .method public static int32
      'add'(
        int32 a,
        int32 b
      ) cil managed
    {
      .maxstack 8

      // [3 9 - 3 14]
      IL_0000: ldarg.0      // a
      IL_0001: ldarg.1      // b
      IL_0002: add
      IL_0003: ret

    } // end of method AddClass::'add'

    .method public static int32
      'add'(
        class [System.Runtime]System.Tuple`2<int32, int32> _arg1
      ) cil managed
    {
      .maxstack 4
      .locals init (
        [0] class [System.Runtime]System.Tuple`2<int32, int32> V_0,
        [1] int32 b,
        [2] int32 a
      )

      IL_0000: ldarg.0      // _arg1
      IL_0001: stloc.0      // V_0
      IL_0002: ldloc.0      // V_0
      IL_0003: call         instance !1/*int32*/ class [System.Runtime]System.Tuple`2<int32, int32>::get_Item2()
      IL_0008: stloc.1      // b
      IL_0009: ldloc.0      // V_0
      IL_000a: call         instance !0/*int32*/ class [System.Runtime]System.Tuple`2<int32, int32>::get_Item1()
      IL_000f: stloc.2      // a

      // [6 9 - 6 14]
      IL_0010: ldloc.2      // a
      IL_0011: ldloc.1      // b
      IL_0012: add
      IL_0013: ret

    } // end of method AddClass::'add'
  } // end of class AddClass
} // end of class AddClass