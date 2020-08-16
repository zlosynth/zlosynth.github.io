# Heapnotize

A Rust library providing memory allocation on the stack.

Why bother? I plan to write the embedded application for Zlosynth without the
standard library (`#[no_std]`), which is quite typical for microcontroller
programming where allocation on the heap is not available. However, in order to
implement complex patching between sounds modules, complex data structures, e.g.
a graph will be needed. This library should help with the implementation of such
data structures.

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
