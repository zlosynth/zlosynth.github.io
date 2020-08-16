//! No-op binary silencing Cargo from complaining about a missing bin/lib.
//!
//! Cargo requires the project to require at least one binary or library. This
//! project is built only of markdown files and Rust is used only to test the
//! examples these files contain.
fn main() {}
