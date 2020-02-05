Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap7.html) 

[\[MathJax on\]](chap6_mj.html)

[6 Changes between **GAP** 4.5 and **GAP**
4.6](chap.md#X809ACE9A7DB63A3B)

 [6.1 **GAP** 4.6.2 (February 2013)](chap.md#X7AE9D2F086E11238) 

  
  [6.1-1 Changes in the core **GAP** system introduced in **GAP**
4.6](chap.md#X7EE8AAA27E920B1E)    
  [6.1-2 New and updated packages since **GAP**
4.5.4](chap.md#X8262CB4279E9D374) 

 [6.2 **GAP** 4.6.3 (March 2013)](chap.md#X819FA4607D642A92) 

 [6.3 **GAP** 4.6.4 (April 2013)](chap.md#X7F304046877CF484) 

 [6.4 **GAP** 4.6.5 (July 2013)](chap.md#X811FB2407ED4AB5D) 

### 6 Changes between **GAP** 4.5 and **GAP** 4.6

This chapter lists most important changes between **GAP** 4.5.7 and
**GAP** 4.6.2 (i.e. between the last release of **GAP** 4.5 and the
first public release of **GAP** 4.6). It also contains information about
subsequent update releases for **GAP** 4.6.

#### 6.1 **GAP** 4.6.2 (February 2013)

##### 6.1-1 Changes in the core **GAP** system introduced in **GAP** 4.6

Improved and extended functionality:

  - It is now possible to declare a name as an operation with two or
    more arguments (possibly several times) and *THEN* declare it as an
    attribute. Previously this was only possible in the other order.
    This should make the system more independent of the order in which
    packages are loaded.

  - Words in fp groups are now printed in factorised form if possible
    and not too time-consuming, i.e. `a*b*a*b*a*b` will be printed as
    `(a*b)^3`.

  - Added methods to calculate Hall subgroups in nonsolvable groups.

  - Added a generic method for `IsPSolvable` (Reference: IsPSolvable)
    and a better generic method for `IsPNilpotent` (Reference:
    IsPNilpotent) for groups.

  - Improvements to action homomorphisms: image of an element can use
    existing stabiliser chain of the image group (to reduce the number
    of images to compute), preimages under linear/projective action
    homomorphisms use linear algebra to avoid factorisation.

  - To improve efficiency, additional code was added to make sure that
    the `HomePcgs` of a permutation group is in `IsPcgsPermGroupRep`
    representation in more cases.

  - Added an operation `SortBy` (Reference: SortBy) with arguments being
    a function f of one argument and a list l to be sorted in such a way
    that `l(f[i]) <= l(f[i+1])`.

  - Added a kernel function `MEET_BLIST` which returns `true` if the two
    boolean lists have `true` in any common position and `false`
    otherwise. This is useful for representing subsets of a fixed set by
    boolean lists.

  - When assigning to a position in a compressed FFE vector **GAP** now
    checks to see if the value being assigned can be converted into an
    internal FFE element if it isn't one already. This uses new
    attribute `AsInternalFFE` (Reference: AsInternalFFE), for which
    methods are installed for internal FFEs, Conway FFEs and ZmodpZ
    objects.

  - Replaced `ViewObj` (Reference: ViewObj) method for fields by
    `ViewString` (Reference: ViewString) method to improve the way how
    polynomial rings over algebraic extenstions of fields are displayed.

  - Made the info string (optional 2nd argument to
    `InstallImmediateMethod` (Reference: InstallImmediateMethod)) behave
    similarly to the info string in `InstallMethod` (Reference:
    InstallMethod). In particular, `TraceImmediateMethods` (Reference:
    TraceImmediateMethods) now always prints the name of the operation.

  - Syntax errors such as `Unbind(x,1)` had the unhelpful property that
    `x` got unbound before the syntax error was reported. A specific
    check was added to catch this and similar cases a little earlier.

  - Allow a `GAPARGS` parameter to the top-level **GAP** `Makefile` to
    pass extra arguments to the **GAP** used for manual building.

  - Added an attribute `UnderlyingRingElement` (Reference:
    UnderlyingRingElement) for Lie objects.

  - The function `PrimeDivisors` (Reference: PrimeDivisors) now became
    an attribute. \[suggested by Mohamed Barakat\]

  - Added an operation `DistancePerms` (Reference: DistancePerms) with a
    kernel method for internal permutations and a generic method.

  - Added a method for `Subfields` (Reference: Subfields) to support
    large finite fields. \[reported by Inneke van Gelder\]

Fixed bugs which could lead to crashes:

  - The extremely old `DEBUG_DEADSONS_BAGS` compile-time option has not
    worked correctly for many years and indeed crashes **GAP**. The type
    of bug it is there to detect has not arisen in many years and we
    have certainly not used this option, so it has been removed.
    \[Reported by Volker Braun\]

Other fixed bugs:

  - Scanning of floating point literals collided with iterated use of
    integers as record field elements in expressions like `r.1.2`.

  - Fixed two potential problems in `NorSerPermPcgs`, one corrupting
    some internal data and one possibly mixing up different pcgs.

  - Fixed a performance problem with `NiceMonomorphism` (Reference:
    NiceMonomorphism). \[reported by John Bamberg\]

  - Fixed a bug in `ReadCSV` (Reference: ReadCSV) that caused some
    `.csv` files being parsed incorrectly.

No longer supported:

  - The file `lib/consistency.g`, which contained three undocumented
    auxiliary functions, has been removed from the library. In addition,
    the global record `Revision` is now deprecated, so there is no need
    to bind its components in **GAP** packages.

##### 6.1-2 New and updated packages since **GAP** 4.5.4

At the time of the release of **GAP** 4.5 there were 99 packages
redistributed with **GAP**. The first public release of **GAP** 4.6
contains 106 packages.

The new packages that have been added to the redistribution since the
release of **GAP** 4.5.4 are:

  - **AutoDoc** package by S. Gutsche, providing tools for automated
    generation of **GAPDoc** manuals.

  - **Congruence** package by A. Konovalov, which provides functions to
    construct various canonical congruence subgroups in SL\_2(ℤ), and
    also intersections of a finite number of such subgroups, implements
    the algorithm for generating Farey symbols for congruence subgroups
    and uses it to produce a system of independent generators for these
    subgroups.

  - **Convex** package by S. Gutsche, which provides structures and
    algorithms for convex geometry.

  - **Float** package by L. Bartholdi, which extends **GAP**
    floating-point capabilities by providing new floating-point handlers
    for high-precision real, interval and complex arithmetic using MPFR,
    MPFI, MPC or CXSC external libraries. It also contains a very
    high-performance implementation of the LLL (Lenstra-Lenstra-Lovász)
    lattice reduction algorithm via the external library FPLLL.

  - **PolymakeInterface** package by T. Baechler and S. Gutsche,
    providing a link to the callable library of the **polymake** system
    (<http://www.polymake.org>).

  - **ToolsForHomalg** package by M. Barakat, S. Gutsche and M.
    Lange-Hegermann, which provides some auxiliary functionality for the
    **homalg** project (<http://homalg.math.rwth-aachen.de/>).

  - **ToricVarieties** package by S. Gutsche, which provides data
    structures to handle toric varieties by their commutative algebra
    structure and by their combinatorics.

Furthermore, some packages have been upgraded substantially since the
**GAP** 4.5.4 release:

  - Starting from 2.x.x, the functionality for iterated monodromy groups
    has been moved from the **FR** package by L. Bartholdi to a separate
    package IMG (currently undeposited, available from
    <https://github.com/laurentbartholdi/img>). This completely removes
    the dependency of **FR** on external library modules, and should
    make its installation much easier.

#### 6.2 **GAP** 4.6.3 (March 2013)

Improved functionality:

  - Several changes were made to `IdentityMat` (Reference: IdentityMat)
    and `NullMat` (Reference: NullMat). First off, the documentation was
    changed to properly state that these functions support arbitrary
    rings, and not just fields. Also, more usage examples were added to
    the manual.
    
    For `NullMat`, it is now also always possible to specify a ring
    element instead of a ring, and this is documented. This matches
    existing `IdentityMat` behavior, and partially worked before
    (undocumented), but in some cases could run into error or infinite
    recursion.
    
    In the other direction, if a finite field element, `IdentityMat` now
    really creates a matrix over the smallest field containing that
    element. Previously, a matrix over the prime field was created
    instead, contrary to the documentation.
    
    Furthermore, `IdentityMat` over small finite fields is now
    substantially faster when creating matrices of large dimension (say
    a thousand or so).
    
    Finally, `MutableIdentityMat` (Reference: MutableIdentityMat) and
    `MutableNullMat` (Reference: MutableNullMat) were explicitly
    declared obsolete (and may be removed in **GAP** 4.7). They actually
    were deprecated since **GAP** 4.1, and their use discouraged by the
    manual. Code using them should switch to `IdentityMat` (Reference:
    IdentityMat) respectively `NullMat` (Reference: NullMat).

  - Two new `PerfectResiduum` (Reference: PerfectResiduum) methods were
    added for solvable and perfect groups, handling these cases
    optimally. Moreover, the existing generic method was improved by
    changing it to use `DerivedSeriesOfGroup` (Reference:
    DerivedSeriesOfGroup). Previously, it would always compute the
    derived series from scratch and then throw away the result.

  - A new `MinimalGeneratingSet` (Reference: MinimalGeneratingSet)
    method for groups handled by a nice monomorphisms was added, similar
    to the existing `SmallGeneratingSet` (Reference: SmallGeneratingSet)
    method. This is useful if the nice monomorphism is already mapping
    into a pc or pcp group.

  - Added a special method for `DerivedSubgroup` (Reference:
    DerivedSubgroup) if the group is known to be abelian.

Fixed bugs:

  - Fixed a bug in `PowerModInt` (Reference: PowerModInt) computing r^e
    mod m in a special case when e=0 and m=0. \[Reported by Ignat
    Soroko\]

  - `CoefficientsQadic` (Reference: CoefficientsQadic) now better checks
    its arguments to avoid an infinite loop when being asked for a
    q-adic representation for q=1. \[Reported by Ignat Soroko\]

  - Methods for `SylowSubgroupOp` (see `SylowSubgroup` (Reference:
    SylowSubgroup)) for symmetric and alternating group did not always
    set `IsPGroup` (Reference: IsPGroup) and `PrimePGroup` (Reference:
    PrimePGroup) for the returned Sylow subgroup.

  - Display of matrices consisting of Conway field elements (which are
    displayed as polynomials) did not print constant 1 terms.

  - Added an extra check and a better error message in the method to
    access *natural* generators of domains using the `.` operator (see
    `GeneratorsOfDomain` (Reference: GeneratorsOfDomain)).

  - Trying to solve the word problem in an fp group where one or more
    generators has a name of more than one alphabetic character led to a
    break loop.

  - Provided the default method for `AbsoluteIrreducibleModules`
    (Reference: AbsoluteIrreducibleModules) as a temporary workaround
    for the problem which may cause returning wrong results or producing
    an error when being called for a non-prime field.

  - A bug in the **GAP** kernel caused `RNamObj` to error out when
    called with a string that had the `IsSSortedList` (Reference:
    IsSSortedList) property set (regardless of whether it was set to
    `true` or `false`). This in turn would lead to strange (and
    inappropriate) errors when using such a string to access entries of
    a record.

  - **GAP** can store vectors over small finite fields (size at most
    256) in a special internal data representation where each entry of
    the vector uses exactly one byte. Due to an off-by-one bug, the case
    of a field with exactly 256 elements was not handled properly. As a
    result, **GAP** failed to convert a vector to the special data
    representation, which in some situations could lead to a crash. The
    off-by-one error was fixed and now vectors over GF(256) work as
    expected.

  - A bug in the code for accessing sublist via the `list{poss}` syntax
    could lead to **GAP** crashing. Specifically, if the list was a
    compressed vector over a finite field, and the sublist syntax was
    nested, as in `vec{poss1}{poss2}`. This now correctly triggers an
    error instead of crashing.

New packages added for the redistribution with **GAP**:

  - **SpinSym** package by L. Maas, which contains Brauer tables of
    Schur covers of symmetric and alternating groups and provides some
    related functionalities.

#### 6.3 **GAP** 4.6.4 (April 2013)

New functionality:

  - New command line option `-O` was introduced to disable loading
    obsolete variables. This option may be used, for example, to check
    that they are not used in a **GAP** package or one's own **GAP**
    code. For further details see Reference: options and Reference:
    Replaced and Removed Command Names.

Fixed bugs which could lead to incorrect results:

  - Fixed the bug in `NewmanInfinityCriterion` (Reference:
    NewmanInfinityCriterion) which may cause returning `true` instead of
    `false`. \[Reported by Lev Glebsky\]

Fixed bugs which could lead to crashes:

  - Fixed the kernel method for `Remove` (Reference: Remove) which did
    not raise an error in case of empty lists, but corrupted the object.
    The error message in a library method is also improved. \[Reported
    by Roberto Ràdina\]

Fixed bugs that could lead to break loops:

  - Fixed requirements in a method to multiply a list and an algebraic
    element. \[Reported by Sebastian Gutsche\]

  - Fixed a bug in `NaturalCharacter` (Reference: NaturalCharacter for a
    group) entering a break loop when being called on a homomorphism
    whose image is not a permutation group. \[Reported by Sebastian
    Gutsche\]

  - Fixed a bug in `ExponentsConjugateLayer` (Reference:
    ExponentsConjugateLayer) which occured, for example, in some calls
    of `SubgroupsSolvableGroup` (Reference: SubgroupsSolvableGroup)
    \[Reported by Ramon Esteban-Romero\]

  - Fixed a problem with displaying function fields, e.g.
    `Field(Indeterminate(Rationals,"x"))`. \[Reported by Jan Willem
    Knopper\]

  - Fixed two bugs in the code for `NaturalHomomorphismByIdeal`
    (Reference: NaturalHomomorphismByIdeal) for polynomial rings.
    \[Reported by Martin Leuner\]

  - Added missing method for `String` (Reference: String) for
    `-infinity`.

  - Fixed the bug with `ONanScottType` (Reference: ONanScottType) not
    recognising product action properly in some cases.

  - The method for `SlotUsagePattern` (Reference: SlotUsagePattern) for
    straight line programs had a bug which triggered an error, if the
    straight line program contained unnecessary steps.

#### 6.4 **GAP** 4.6.5 (July 2013)

Improved functionality:

  - `TraceMethods` (Reference: TraceMethods for operations) and
    `UntraceMethods` (Reference: UntraceMethods for operations) now
    better check their arguments and provide a sensible error message if
    being called without arguments. Also, both variants of calling them
    are now documented.

  - Library methods for `Sortex` (Reference: Sortex) are now replaced by
    faster ones using the kernel `SortParallel` (Reference:
    SortParallel) functionality instead of making expensive zipped
    lists.

Fixed bugs which could lead to incorrect results:

  - `IntHexString` (Reference: IntHexString) wrongly produced a large
    integer when there were too many leading zeros. \[Reported by Joe
    Bohanon\]

Fixed bugs that could lead to break loops:

  - A bug that may occur in some cases while calling
    `TransitiveIdentification` ([transgrp:
    TransitiveIdentification](../../pkg/transgrp/htm/CHAP001.htm#SECT001)).
    \[Reported by Izumi Miyamoto\]

  - The new code for semidirect products of permutation groups,
    introduced in **GAP** 4.6, had a bug which was causing problems for
    `Projection` (Reference: Projection). \[Reported by Graham Ellis\]

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap7.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
