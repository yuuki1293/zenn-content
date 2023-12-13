namespace Fs

module Add =
    let add_1 (a: int) (b: int): int = a + b
    let add_2 (a: int, b: int): int = a + b
    let add_3 ((a, b): int * int): int = a + b
    let add_4 ((a, b): struct (int * int)) = a + b
