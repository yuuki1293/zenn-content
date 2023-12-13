namespace Fs

module Add =
    let add_1 (a: int) (b: int): int = a + b
    let add_2 (a: int, b: int): int = a + b
    let add_3 ((a, b): int * int): int = a + b
    let add_4 ((a, b): struct (int * int)) = a + b
    
    add_1 1 2    |> printfn "%d"
    add_2 (1, 2) |> printfn "%d"
    add_3 (1, 2) |> printfn "%d"
    add_4 (1, 2) |> printfn "%d"