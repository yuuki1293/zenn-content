.class public abstract sealed auto ansi
  Fs.Add
    extends [System.Runtime]System.Object
{
  .custom instance void [FSharp.Core]Microsoft.FSharp.Core.CompilationMappingAttribute::.ctor(valuetype [FSharp.Core]Microsoft.FSharp.Core.SourceConstructFlags)
    = (01 00 07 00 00 00 00 00 ) // ........
    // int32(7) // 0x00000007

  .method public static int32
    add_1(
      int32 a,
      int32 b
    ) cil managed
  {
    .custom instance void [FSharp.Core]Microsoft.FSharp.Core.CompilationArgumentCountsAttribute::.ctor(int32[])
      = (01 00 02 00 00 00 01 00 00 00 01 00 00 00 00 00 ) // ................
      // int32[2]
        /*( int32(1) // 0x00000001
        int32(1) // 0x00000001
         )*/
    .maxstack 8

    // [4 40 - 4 45]
    IL_0000: ldarg.0      // a
    IL_0001: ldarg.1      // b
    IL_0002: add
    IL_0003: ret

  } // end of method Add::add_1

  .method public static int32
    add_2(
      int32 a,
      int32 b
    ) cil managed
  {
    .maxstack 8

    // [5 39 - 5 44]
    IL_0000: ldarg.0      // a
    IL_0001: ldarg.1      // b
    IL_0002: add
    IL_0003: ret

  } // end of method Add::add_2

  .method public static int32
    add_3(
      int32 _arg1_0,
      int32 _arg1_1
    ) cil managed
  {
    .maxstack 4
    .locals init (
      [0] class [System.Runtime]System.Tuple`2<int32, int32> V_0,
      [1] class [System.Runtime]System.Tuple`2<int32, int32> V_1,
      [2] int32 b,
      [3] int32 a
    )

    IL_0000: ldarg.0      // _arg1_0
    IL_0001: ldarg.1      // _arg1_1
    IL_0002: newobj       instance void class [System.Runtime]System.Tuple`2<int32, int32>::.ctor(!0/*int32*/, !1/*int32*/)
    IL_0007: stloc.0      // V_0
    IL_0008: ldloc.0      // V_0
    IL_0009: stloc.1      // V_1
    IL_000a: ldloc.1      // V_1
    IL_000b: call         instance !1/*int32*/ class [System.Runtime]System.Tuple`2<int32, int32>::get_Item2()
    IL_0010: stloc.2      // b
    IL_0011: ldloc.1      // V_1
    IL_0012: call         instance !0/*int32*/ class [System.Runtime]System.Tuple`2<int32, int32>::get_Item1()
    IL_0017: stloc.3      // a

    // [6 42 - 6 47]
    IL_0018: ldloc.3      // a
    IL_0019: ldloc.2      // b
    IL_001a: add
    IL_001b: ret

  } // end of method Add::add_3

  .method public static int32
    add_4(
      valuetype [System.Runtime]System.ValueTuple`2<int32, int32> _arg1
    ) cil managed
  {
    .maxstack 4
    .locals init (
      [0] valuetype [System.Runtime]System.ValueTuple`2<int32, int32> V_0,
      [1] int32 b,
      [2] int32 a
    )

    IL_0000: ldarg.0      // _arg1
    IL_0001: stloc.0      // V_0
    IL_0002: ldloca.s     V_0
    IL_0004: ldfld        !1/*int32*/ valuetype [System.Runtime]System.ValueTuple`2<int32, int32>::Item2
    IL_0009: stloc.1      // b
    IL_000a: ldloca.s     V_0
    IL_000c: ldfld        !0/*int32*/ valuetype [System.Runtime]System.ValueTuple`2<int32, int32>::Item1
    IL_0011: stloc.2      // a

    // [7 46 - 7 51]
    IL_0012: ldloc.2      // a
    IL_0013: ldloc.1      // b
    IL_0014: add
    IL_0015: ret

  } // end of method Add::add_4
} // end of class Fs.Add
