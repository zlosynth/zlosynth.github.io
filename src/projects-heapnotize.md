# Heapnotize

A Rust library providing memory allocation on the stack.

I'm not sure whether this one will become used and if it is useful at all. Made
this as part of the Rust learning process, thinking I will build Zlosynth
without `alloc`. That seems like a crazy idea though. Anyway, for what it's
worth, here it is!

Documentation:

* [API reference (docs.rs)](https://docs.rs/heapnotize)
* [Repository (github.com)](https://github.com/zlosynth/heapnotize)
* [Crate (crates.io)](https://crates.io/crates/heapnotize)

Heapnotize provides two main types to allow the stack allocation, `Rack` and
`Unit`. `Rack` is used to allocate a chuck of a memory on the stack for to keep
a given type. `Unit` serves as an owner of a value stored on the `Rack` and is
used to access or edit it.

Store a numeric value on the `Rack` and access it through the `Unit`:

``` rust
# extern crate heapnotize;
use heapnotize::*;

fn main() {
    let rack = Rack64::new();
    let unit = rack.must_add(10);
    assert_eq!(*unit, 10);
}
```

Use `Unit` to compose a recursive type:

``` rust
# extern crate heapnotize;
use heapnotize::*;

enum List<'a> {
    Cons(i32, Unit<'a, List<'a>>),
    Nil,
}

use List::{Cons, Nil};

fn main() {
    let rack = Rack64::new();
    # #[allow(unused_variables)]
    let list = Cons(1, rack.must_add(Cons(2, rack.must_add(Cons(3, rack.must_add(Nil))))));
}
```
