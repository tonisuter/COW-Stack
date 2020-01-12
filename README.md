# COW-Stack

This SPM package contains a very basic implementation of a generic `Stack<Element>` type that has value semantics and uses [copy-on-write (COW)](https://en.wikipedia.org/wiki/Copy-on-write) to improve its performance.
Therefore, it works similarly to the collection types from Swift's standard library (e.g., `Array<Element>`, `Set<Element>`, `String`).

There is an accompanying blog post for this repository: **TODO**

### Caution:  
**This repository was only created to demonstrate Swift's copy-on-write mechanism with an example.
It has various limitations and is not supposed to be used in production. If you ever want
or need to create a Stack type you should probably just wrap a regular Swift array (or use the array directly).**
