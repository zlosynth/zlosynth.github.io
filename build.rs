//! Test all the examples with Skeptic.
//!
//! This build script will collect all the markdown files and code examples they
//! contain. Then it would test those examples. Unlike `mdbook test`, this
//! allows us to also test examples depending on external crates.
extern crate skeptic;

fn main() {
    let mdbook_files = skeptic::markdown_files_of_directory("src/");
    skeptic::generate_doc_tests(&mdbook_files);
}
