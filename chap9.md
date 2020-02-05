Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chapInd.html) 

[\[MathJax on\]](chap9_mj.html)

[9 Changes from Earlier Versions](chap.md#X7F5DE9997CF43125)

 [9.1 Earlier Changes](chap.md#X8205C966783E6F37) 

### 9 Changes from Earlier Versions

#### 9.1 Earlier Changes

The most important changes between **GAP** 4.2 and **GAP** 4.3 were:

  - The performance of several routines has been substantially improved.

  - The functionality in the areas of finitely presented groups, Schur
    covers and the calculation of representations has been extended.

  - The data libraries of transitive groups, finite integral matrix
    groups, character tables and tables of marks have been extended.

  - The Windows installation has been simplified for the case where you
    are installing **GAP** in its standard location.

  - Many bugs have been fixed.

The most important changes between **GAP** 4.1 and **GAP** 4.2 were:

  - A much extended and improved library of small groups as well as
    associated `IdGroup` ([smallgrp:
    IdGroup](../../pkg/SmallGrp-1.3/doc/chap.md#X83044B9D7E3BDF35))
    routines.

  - The primitive groups library has been made more independent of the
    rest of **GAP**, some errors were corrected.

  - New (and often much faster) infrastructure for orbit computation,
    based on a general "dictionary" abstraction.

  - New functionality for dealing with representations of algebras, and
    in particular for semisimple Lie algebras.

  - New functionality for binary relations on arbitrary sets, magmas and
    semigroups.

  - Bidirectional streams, allowing an external process to be started
    and then controlled "interactively" by **GAP**

  - A prototype implementation of algorithms using general subgroup
    chains.

  - Changes in the behavior of vectors over small finite fields.

  - A fifth book "New features for Developers" has been added to the
    **GAP** manual.

  - Numerous bug fixes and performance improvements

The changes between the final release of **GAP** 3 (version 3.4.4) and
**GAP** 4 are wide-ranging. The general philosophy of the changes is
two-fold. Firstly, many assumptions in the design of **GAP** 3 revealed
its authors' primary interest in group theory, and indeed in finite
group theory. Although much of the **GAP** 4 library is concerned with
groups, the basic design now allows extension to other algebraic
structures, as witnessed by the inclusion of substantial bodies of
algorithms for computation with semigroups and Lie algebras. Secondly,
as the scale of the system, and the number of people using and
contributing to it has grown, some aspects of the underlying system have
proved to be restricting, and these have been improved as part of
comprehensive re-engineering of the system. This has included the new
method selection system, which underpins the library, and a new, much
more flexible, **GAP** package interface.

Details of these changes can be found in the document "Migrating to GAP
4" available at the **GAP** website, see
<https://www.gap-system.org/Gap3/migratedoc.pdf>.

It is perhaps worth mentioning a few points here.

Firstly, much remains unchanged, from the perspective of the
mathematical user:

  - The syntax of that part of the **GAP** language that most users need
    for investigating mathematical problems.

  - The great majority of function names.

  - Data libraries and the access to them.

A number of visible aspects have changed:

  - Some function names that need finer specifications now that there
    are more structures available in **GAP**.

  - The access to information already obtained about a mathematical
    structure. In **GAP** 3 such information about a group could be
    looked up by directly inspecting the group record, whereas in
    **GAP** 4 functions must be used to access such information.

Behind the scenes, much has changed:

  - A new kernel, with improvements in memory management and in the
    language interpreter, as well as new features such as saving of
    workspaces and the possibility of compilation of **GAP** code into
    C.

  - A new structure to the library, based upon a new type and method
    selection system, which is able to support a broader range of
    algebraic computation and to make the structure of the library
    simpler and more modular.

  - New and faster algorithms in many mathematical areas.

  - Data structures and algorithms for new mathematical objects, such as
    algebras and semigroups.

  - A new and more flexible structure for the **GAP** installation and
    documentation, which means, for example, that a **GAP** package and
    its documentation can be installed and be fully usable without any
    changes to the **GAP** system.

Very few features of **GAP** 3 are not yet available in **GAP** 4.

  - Not all of the **GAP** 3 packages have yet been converted for use
    with **GAP** 4.

  - The library of crystallographic groups which was present in
    **GAP** 3 is now part of a **GAP** 4 package
    [**CrystCat**](https://www.gap-system.org/Packages/crystcat.html) by
    V. Felsch and F. Gähler.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chapInd.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
