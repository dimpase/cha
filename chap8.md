Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap9.html) 

[\[MathJax on\]](chap8_mj.html)

[8 Changes between **GAP** 4.3 and **GAP**
4.4](chap.md#X84747575872E4F81)

 [8.1 Changes in the core **GAP** system introduced in **GAP**
4.4](chap.md#X80084CB083AB949F) 

  
  [8.1-1 Potentially Incompatible Changes](chap.md#X7C5AC61F824086D6)
   
  [8.1-2 New Packages](chap.md#X7D9702E3815BE9FB)    
  [8.1-3 Performance Enhancements](chap.md#X7DA8709A850E772D)    
  [8.1-4 New Programming and User
Features](chap.md#X83E1A0D87D3D1EAF) 

 [8.2 **GAP** 4.4 Bugfix 2 (April 2004)](chap.md#X814A860E7B203FCF) 

 [8.3 **GAP** 4.4 Bugfix 3 (May 2004)](chap.md#X7C4492557E1EA74C) 

 [8.4 **GAP** 4.4 Bugfix 4 (December
2004)](chap.md#X78844C2C83310762) 

 [8.5 **GAP** 4.4 Update 5 (May 2005)](chap.md#X7E6E6B7A7F6616CC) 

 [8.6 **GAP** 4.4 Update 6 (September
2005)](chap.md#X784D15477A825A78) 

 [8.7 **GAP** 4.4 Update 7 (March 2006)](chap.md#X786A20E17B11DAFD) 

 [8.8 **GAP** 4.4 Update 8 (September
2006)](chap.md#X83D5AF3679B8F685) 

 [8.9 **GAP** 4.4 Update 9 (November
2006)](chap.md#X7E9F0AB1807D6B64) 

 [8.10 **GAP** 4.4 Update 10 (October
2007)](chap.md#X8499C5CA7CD76125) 

 [8.11 **GAP** 4.4 Update 11 (December
2008)](chap.md#X86F8AE877C7699E1) 

 [8.12 **GAP** 4.4 Update 12 (December
2008)](chap.md#X87EF7820794F3C59) 

### 8 Changes between **GAP** 4.3 and **GAP** 4.4

This chapter contains an overview of most important changes introduced
in **GAP** 4.4. It also contains information about subsequent update
releases of **GAP** 4.4.

#### 8.1 Changes in the core **GAP** system introduced in **GAP** 4.4

##### 8.1-1 Potentially Incompatible Changes

  - The mechanism for the loading of Packages has changed to allow
    easier updates independent of main **GAP** releases. Packages
    require a file `PackageInfo.g` now. The new `PackageInfo.g` files
    are available for all packages with the new version of GAP (see
    Reference: PackageInfo.g for a GAP package).

  - `IsSimpleGroup` (Reference: IsSimpleGroup) returns false now for the
    trivial group.

  - `PrimeBlocks` (Reference: PrimeBlocks): The output format has
    changed.

  - Division rings (see `IsDivisionRing` (Reference: IsDivisionRing))
    are now implemented as `IsRingWithOne` (Reference: IsRingWithOne).

  - `DirectSumOfAlgebras` (Reference: DirectSumOfAlgebras for two
    algebras): p-th power maps are compatible with the input now.

  - The print order for polynomials has been changed.

These changes are, in some respects, departures from our policy of
maintaining upward compatibility of documented functions between
releases. In the first case, we felt that the old behavior was
sufficiently inconsistent, illogical, and impossible to document that we
had no alternative but to change it. In the case of the package
interface, the change was necessary to introduce new functionality. The
planned and phased removal of a few unnecessary functions or synonyms is
needed to avoid becoming buried in "legacy" interfaces, but we remain
committed to our policy of maintaining upward compatibility whenever
sensibly possible.

  - Groebner Bases:
    
    Buchberger's algorithm to compute Groebner Bases has been
    implemented in GAP. (A. Hulpke)

  - For large scale Groebner Basis computations there also is an
    interface to the Singular system available in the
    [**Singular**](https://www.gap-system.org/Packages/singular.html)
    package. (M. Costantini and W. de Graaf)

  - New methods for factorizing polynomials over algebraic extensions of
    the rationals have been implemented in GAP. (A. Hulpke)

  - For more functionality to compute with algebraic number fields there
    is an interface to the Kant system available in the
    [**Alnuth**](https://www.gap-system.org/Packages/alnuth.html)
    package. (B. Assmann and B. Eick)

  - A new functionality to compute the minimal normal subgroups of a
    finite group, as well as its socle, has been installed. (B. Höfling)

  - A fast method for recognizing whether a permutation group is
    symmetric or alternating is available now (A. Seress)

  - A method for computing the Galois group of a rational polynomial is
    available again. (A. Hulpke)

  - The algorithm for `BrauerCharacterValue` (Reference:
    BrauerCharacterValue) has been extended to the case where the
    splitting field is not supported in **GAP**. (T. Breuer)

  - Brauer tables of direct products can now be constructed from the
    known Brauer tables of the direct factors. (T. Breuer)

  - Basic support for vector spaces of rational functions and of uea
    elements is available now in **GAP**. (T. Breuer and W. de Graaf)

  - Various new functions for computations with integer matrices are
    available, such as methods for computing normal forms of integer
    matrices as well as nullspaces or solutions systems of equations.
    (W. Nickel and F. Gähler)

##### 8.1-2 New Packages

The following new Packages have been accepted.

  - [**Alnuth**: Algebraic Number Theory and an interface to the Kant
    system.](https://www.gap-system.org/Packages/alnuth.html) By B.
    Assmann and B. Eick.

  - [**LAGUNA**: Computing with Lie Algebras and Units of Group
    Algebras.](https://www.gap-system.org/Packages/laguna.html) By V.
    Bovdi, A. Konovalov, R. Rossmanith, C. Schneider.

  - [**NQ**: The ANU Nilpotent Quotient
    Algorithm.](https://www.gap-system.org/Packages/nq.html) By W.
    Nickel.

  - [**KBMAG**: Knuth-Bendix for Monoids and
    Groups.](https://www.gap-system.org/Packages/kbmag.html) By D. Holt.

  - [**Polycyclic**: Computation with polycyclic
    groups.](https://www.gap-system.org/Packages/polycyclic.html) By B.
    Eick and W. Nickel.

  - [**QuaGroup**: Computing with Quantized Enveloping
    Algebras.](https://www.gap-system.org/Packages/quagroup.html) By W.
    de Graaf.

##### 8.1-3 Performance Enhancements

  - The computation of irreducible representations and irreducible
    characters using the Baum-Clausen algorithm and the implementation
    of the Dixon-Schneider algorithm have been speeded up.

  - The algorithm for `PossibleClassFusions` (Reference:
    PossibleClassFusions) has been changed: the efficiency is improved
    and a new criterion is used. The algorithm for
    `PossibleFusionsCharTableTom` (Reference:
    PossibleFusionsCharTableTom) has been speeded up. The method for
    `PrimeBlocks` (Reference: PrimeBlocks) has been improved following a
    suggestion of H. Pahlings.

  - New improved methods for normalizer and subgroup conjugation in S\_n
    have been installed and new improved methods for
    `IsNaturalSymmetricGroup` (Reference: IsNaturalSymmetricGroup) and
    `IsNaturalAlternatingGroup` (Reference: IsNaturalAlternatingGroup)
    have been implemented. These improve the available methods when
    groups of large degrees are given.

  - The partition split method used in the permutation backtrack is now
    in the kernel. Transversal computations in large permutation groups
    are improved. Homomorphisms from free groups into permutation groups
    now give substantially shorter words for preimages.

  - The membership test in `SP` (Reference: Sp for dimension and field
    size) and `SU` (Reference: SU) groups has been improved using the
    invariant forms underlying these groups.

  - An improvement for the cyclic extension method for the computation
    of subgroup lattices has been implemented.

  - A better method for `MinimalPolynomial` (Reference:
    MinimalPolynomial) for finite field matrices has been implemented.

  - The display has changed and the arithmetic of multivariate
    polynomials has been improved.

  - The `LogMod` (Reference: LogMod) function now uses Pollard's rho
    method combined with the Pohlig/Hellmann approach.

  - Various functions for sets and lists have been improved following
    suggestions of L. Teirlinck. These include: `Sort` (Reference:
    Sort), `Sortex` (Reference: Sortex), `SortParallel` (Reference:
    SortParallel), `SortingPerm` (Reference: SortingPerm),
    `NrArrangements` (Reference: NrArrangements).

  - The methods for `StructureConstantsTable` (Reference:
    StructureConstantsTable) and `GapInputSCTable` (Reference:
    GapInputSCTable) have been improved in the case of a known (anti-)
    symmetry following a suggestion of M. Costantini.

The improvements listed in this Section have been implemented by T.
Breuer and A. Hulpke.

##### 8.1-4 New Programming and User Features

  - The 2GB limit for workspace size has been removed and version
    numbers for saved workspaces have been introduced. (S. Linton and B.
    Höfling)

  - The limit on the total number of types created in a session has been
    removed. (S. Linton)

  - There is a new mechanism for loading packages available. Packages
    need a file `PackageInfo.g` now. (T. Breuer and F. Lübeck; see
    Reference: PackageInfo.g for a GAP package).

Finally, as always, a number of bugs have been fixed. This release thus
incorporates the contents of all the bug fixes which were released for
**GAP** 4.3. It also fixes a number of bugs discovered since the last
bug fix.

Below we list changes in the main system (excluding packages) that have
been corrected or added in bugfixes and updates for **GAP** 4.4.

#### 8.2 **GAP** 4.4 Bugfix 2 (April 2004)

Fixed bugs which could lead to crashes:

  - A crash when incorrect types of arguments are passed to
    `FileString`.

Other fixed bugs:

  - A bug in `DerivedSubgroupTom` and `DerivedSubgroupsTom`.

  - An error in the inversion of certain `ZmodnZObj` elements.

  - A wrong display string of the numerator in rational functions
    returned by `MolienSeriesWithGivenDenominator` (in the case that the
    constant term of this numerator is zero).

#### 8.3 **GAP** 4.4 Bugfix 3 (May 2004)

Fixed bugs which could produce wrong results:

  - Incorrect setting of system variables (e.g., home directory and
    command line options) after loading a workspace.

  - Wrong handling of integer literals within functions or loops on
    64-bit architectures (only integers in the range from 2^28 to 2^60).

Fixed bugs which could lead to crashes:

  - A problem in the installation of the multiplication routine for
    matrices that claimed to be applicable for more general list
    multiplications.

  - A problem when computing weight distributions of codes with weights
    \> 2^28.

Other fixed bugs:

  - Problems with the online help with some manual sections.

  - Problems of the online help on Windows systems.

  - A problem in `GQuotients` when mapping from a finitely presented
    group which has a free direct factor.

  - A bug in the function `DisplayRevision`.

  - The trivial finitely presented group on no generators was not
    recognized as finitely presented.

  - A problem with `Process`.

  - A problem when intersecting subgroups of finitely presented groups
    that are represented in "quotient representation" with the quotient
    not apermutation group.

  - A bug in the generic `Intersection2` method for vector spaces, in
    the case that both spaces are trivial.

  - Enable ReeGroup(q) for q = 3.

#### 8.4 **GAP** 4.4 Bugfix 4 (December 2004)

Fixed bugs which could produce wrong results:

  - An error in the `Order` method for matrices over cyclotomic fields
    which caused this method to return `infinity` for matrices of finite
    order in certain cases.

  - Representations computed by `IrreducibleRepresentations` in
    characteristic 0 erraneously claimed to be faithful.

  - A primitive representation of degree 574 for PSL(2,41) has been
    missing in the classification on which the **GAP** library was
    built.

  - A bug in `Append` for compressed vectors over GF(2): if the length
    of the result is 1 mod 32 (or 64) the last entry was forgotten to
    copy.

  - A problem with the Ree group Ree(3) of size 1512 claiming to be
    simple.

  - An error in the membership test for groups GU(n,q) and SU(n,q) for
    non-prime q.

  - An error in the kernel code for ranges which caused e.g. `-1 in
    [1..2]` to return `true`.

  - An error recording boolean lists in saved workspaces.

  - A problem in the selection function for primitive and transitive
    groups if no degree is given.

  - `ReducedConfluentRewritingSystem` returning a cached result that
    might not conform to the ordering specified.

Other fixed bugs:

  - A problem with the function `SuggestUpdates` to check for the most
    recent version of packages available.

  - A problem that caused `MatrixOfAction` to produce an error when the
    algebra module was constructed as a direct sum.

  - Problems with computing n-th power maps of character tables, where n
    is negative and the table does not yet store its irreducible
    characters.

  - Element conjugacy in large-base permutation groups sometimes was
    unnecessarily inefficient.

  - A missing method for getting the letter representation of an
    associate word in straight line program representation.

  - A problem with the construction of vector space bases where the
    given list of basis vectors is itself an object that was returned by
    `Basis`.

  - A problem of `AbelianInvariantsMultiplier` insisting that a result
    of `IsomorphismFpGroup` is known to be surjective.

  - An error in the routine for `Resultant` if one of the polynomials
    has degree zero.

#### 8.5 **GAP** 4.4 Update 5 (May 2005)

Fixed bugs which could produce wrong results:

  - `GroupWithGenerators` (Reference: GroupWithGenerators) returned a
    meaningless group object instead of signaling an error when it was
    called with an empty list of generators.

  - When computing preimages under an embedding into a direct product of
    permutation groups, if the element was not in the image of the
    embedding then a permutation had been returned instead of `fail`.

  - Two problems with `PowerMod` (Reference: PowerMod) for polynomials.
    \[Reported by Jack Schmidt\]

  - Some methods for computing the sum of ideals returned the first
    summand instead of the sum. \[Reported by Alexander Konovalov\]

  - Wrong result in `Intersection` (Reference: Intersection) for pc
    groups.

  - The function `CompareVersionNumbers` (Reference:
    CompareVersionNumbers) erroneously ignored leading non-digit
    characters.
    
    A new feature in the corrected version is an optional third argument
    `"equal"`, which causes the function to return `true` only if the
    first two arguments describe equal version numbers; documentation is
    available in the ext-manual. This new feature is used in
    `LoadPackage` (Reference: LoadPackage), now one can require a
    specific version of a package.
    
    The library code still contained parts of the handling of completion
    files for packages, which does not work and therefore had already
    been removed from the documentation. This code has now been removed.
    
    Now a new component `PreloadFile` is supported in `The PackageInfo.g
    File` (Reference: The PackageInfo.g File) files; if it is bound then
    the file in question is read immediately before the package or its
    documentation is loaded.

  - The result of `String` (Reference: String) for strings not in
    `IsStringRep` (Reference: IsStringRep) that occur as list entries or
    record components was erroneously missing the double quotes around
    the strings.

  - A bug which caused `InducedPcgs` (Reference: InducedPcgs) to return
    a pcgs which is not induced wrt. the parent pcgs of `pcgs`. This may
    cause unpredictable behaviour, e. g. when `SiftedPcElement` is used
    subsequently. \[Reported by Alexander Konovalov\]

  - Fixed a bug in `SmallGroupsInformation(512)`.

  - `PowerModCoeffs` (Reference: PowerModCoeffs) with exponent 1 for
    compressed vectors did not reduce (a copy of) the input vector
    before returning it. \[Reported by Frank Lübeck\]

  - Sorting a mutable non-plain list (e.g., a compressed matrix over
    fields of order \< 257) could potentially destroy that object.
    \[Reported by Alexander Hulpke\]

  - Under rare circumstances computing the closure of a permutation
    group by a normalizing element could produce a corrupted stabilizer
    chain. (The underlying algorithm uses random elements, probability
    of failure was below 1 percent). \[Reported by Thomas Breuer\]

Fixed bugs which could lead to crashes:

  - Some code and comments in the **GAP** kernel assumed that there is
    no garbage collection during the core printing function `Pr`, which
    is not correct. This could cause **GAP** in rare cases to crash
    during printing permutations, cyclotomics or strings with zero
    bytes. \[Reported by Warwick Harvey\]

Other fixed bugs:

  - A rare problem with the choice of prime in the Dixon-Schneider
    algorithm for computing the character table of a group. \[Reported
    by Jack Schmidt\]

  - `DirectProduct` (Reference: DirectProduct) for trivial permutation
    groups returned a strange object.

  - A problem with `PolynomialReduction` (Reference:
    PolynomialReduction) running into an infinite loop.

  - Adding linear mappings with different image domains was not
    possible. \[Reported by Pasha Zusmanovich\]

  - Multiplying group ring elements with rationals was not possible.
    \[Reported by Laurent Bartholdi\]

  - `Random` (Reference: Random) now works for finite fields of size
    larger than 2^28. \[Reported by Jack Schmidt\]

  - Univariate polynomial creators did modify the coefficient list
    passed. \[Reported by Jürgen Müller\]

  - Fixed `IntHexString` (Reference: IntHexString) to accept arguments
    not in `IsStringRep`; the argument is now first converted if
    necessary. \[Reported by Kenn Heinrich\]

  - The library code for stabilizer chains contained quite some explicit
    references to the identity `()`. This is unfortunate if one works
    with permutation groups, the elements of which are not plain
    permutations but objects which carry additional information like a
    memory, how they were obtained from the group generators. For such
    cases it is much cleaner to use the `One(...)` operation instead of
    `()`, such that the library code can be used for a richer class of
    group objects. This fix contains only rather trivial changes `()` to
    `One(...)` which were carefully checked by me. The tests for
    permutation groups all run without a problem. However, it is
    relatively difficult to provide test code for this particular
    change, since the "improvement" only shows up when one generates new
    group objects. This is for example done in the package **recog**
    which is in preparation. \[Reported by Akos Seress and Max
    Neunhöffer\]

  - Using `{}` to select elements of a known inhomogenous dense list
    produced a list that might falsely claim to be known inhomogenous,
    which could lead to a segfault if the list typing code tried to mark
    it homogenous, since the code intended to catch such errors also had
    a bug. \[Reported by Steve Linton\]

  - The record for the generic iterator construction of subspaces
    domains of non-row spaces was not complete.

  - When a workspace has been created without packages(`-A` option) and
    is loaded into a **GAP** session without packages (same option) then
    an error message is printed.

  - So far the functions `IsPrimeInt` (Reference: IsPrimeInt) and
    `IsProbablyPrimeInt` (Reference: IsProbablyPrimeInt) are essentially
    the same except that `IsPrimeInt` issues an additional warning when
    (non-proven) probable primes are considered as primes.
    
    These warnings now print the probable primes in question as well; if
    a probable prime is used several times then the warning is also
    printed several times; there is no longer a warning for some known
    large primes; the warnings can be switched off. See `IsPrimeInt`
    (Reference: IsPrimeInt) for more details.
    
    If we get a reasonable primality test in **GAP** we will change the
    definition of `IsPrimeInt` to do a proper test.

  - Corrected some names of primitive groups in degree 26. \[Reported by
    Robert F. Bailey\]

New or improved functionality:

  - Several changes for `ConwayPolynomial` (Reference:
    ConwayPolynomial):
    
      - many new pre-computed polynomials
    
      - put data in several separate files (only read when needed)
    
      - added info on origins of pre-computed polynomials
    
      - improved performance of `ConwayPolynomial` (Reference:
        ConwayPolynomial) and `IsPrimitivePolynomial` (Reference:
        IsPrimitivePolynomial) for p \< 256
    
      - improved documentation of `ConwayPolynomial`
    
      - added and documented new functions `IsCheapConwayPolynomial`
        (Reference: IsCheapConwayPolynomial) and
        `RandomPrimitivePolynomial` (Reference:
        RandomPrimitivePolynomial)

  - Added method for `NormalBase` (Reference: NormalBase) for extensions
    of finite fields.

  - Added more help viewers for the HTML version of the documentation
    (firefox, mozilla, konqueror, w3m, safari).

  - New function `ColorPrompt` (Reference: ColorPrompt). (Users of
    former versions of a `colorprompt.g` file: Now you just need a
    `ColorPrompt(true);` in your `.gaprc` file.)

  - Specialised kernel functions to support **GUAVA** 2.0. **GAP** will
    only load **GUAVA** in version at least 2.002 after this update.

  - Now there is a kernel function `CYC_LIST` for converting a list of
    rationals into a cyclotomic, without arithmetics overhead.

  - New functions `ContinuedFractionExpansionOfRoot` (Reference:
    ContinuedFractionExpansionOfRoot) and
    `ContinuedFractionApproximationOfRoot` (Reference:
    ContinuedFractionApproximationOfRoot) for computing continued
    fraction expansions and continued fraction approximations of real
    roots of polynomials with integer coefficients.

  - A method for computing structure descriptions for finite groups,
    available via `StructureDescription` (Reference:
    StructureDescription).

  - This change contains the new, extended version of the
    **SmallGroups** package. For example, the groups of orders p^4, p^5,
    p^6 for arbitrary primes p, the groups of square-free order and the
    groups of cube-free order at most 50000 are included now. For more
    detailed information see the announcement of the extended package.

  - The function `ShowPackageVariables` gives an overview of the global
    variables in a package. It is thought as a utility for package
    authors and referees. (It uses the new function
    `IsDocumentedVariable`.)

  - The mechanisms for testing **GAP** has been improved:
    
      - The information whether a test file belongs to the list in
        `tst/testall.g` is now stored in the test file itself.
    
      - Some targets for testing have been added to the `Makefile` in
        the **GAP** root directory, the output of the tests goes to the
        new directory `dev/log`.
    
      - Utility functions for testing are in the new file
        `tst/testutil.g`. Now the loops over (some or all) files
        `tst/*.tst` can be performed with a function call, and the file
        `tst/testall.g` can be created automatically; the file
        `tst/testfull.g` is now obsolete. The remormalization of the
        scaling factors can now be done using a **GAP** function, so the
        file `tst/renorm.g` is obsolete.
    
      - Now the functions `START_TEST` and `STOP_TEST` use components in
        `GAPInfo` instead of own globals, and the random number
        generator is always reset in `START_TEST`.
    
      - `GAPInfo.SystemInformation` now takes two arguments, now one can
        use it easier in the tests.

  - `MultiplicationTable` (Reference: MultiplicationTable) is now an
    attribute, and the construction of a magma, monoid, etc. from
    multiplication tables has been unified.

#### 8.6 **GAP** 4.4 Update 6 (September 2005)

Attribution of bugfixes and improved functionalities to those who
reported or provided these, respectively, is still fairly incomplete and
inconsistent with this update. We apologise for this fact and will
discuss until the next update how to improve this feature.

Fixed bugs which could produce wrong results:

  - The perfect group library does not contain any information on the
    trivial group, so the trivial group must be handled specially.
    `PerfectGroup` (Reference: PerfectGroup) and
    `NrPerfectLibraryGroups` were changed to indicate that the trivial
    group is not part of the library.

  - The descriptions of `PerfectGroup(734832,3)` and
    `PerfectGroup(864000,3)` were corrected in the `Finite Perfect
    Groups` (Reference: Finite Perfect Groups) library of perfect
    groups.

  - The functions `EpimorphismSchurCover` (Reference:
    EpimorphismSchurCover) and `AbelianInvariantsMultiplier` (Reference:
    AbelianInvariantsMultiplier) may have produced wrong results without
    warning \[Reported by Colin Ingalls\]. These problems are fixed.
    However, the methods currently used can be expected to be slower
    than the ones used before; we hope to fix this in the next version
    of **GAP**.

  - `DerivedSubgroup` (Reference: DerivedSubgroup) and
    `CommutatorSubgroup` (Reference: CommutatorSubgroup) for permutation
    groups sometimes returned groups with an incorrect stabilizer chain
    due to a missing verification step after a random Schreier Sims.

  - `NaturalHomomorphismByNormalSubgroup` (Reference:
    NaturalHomomorphismByNormalSubgroup) for FpGroups did unnecessary
    rewrites.

  - The alternating group A\_3 incorrectly claimed to be not simple.

  - `ExponentSyllable` (Reference: ExponentSyllable) for straight line
    program elements gave a wrong result.

  - `PrimePGroup` (Reference: PrimePGroup) is defined to return `fail`
    for trivial groups, but if the group was constructed as a factor or
    subgroup of a known p-group, the value of p was retained.

  - The functions `TestPackageAvailability` (Reference:
    TestPackageAvailability) and `LoadPackage` (Reference: LoadPackage)
    did not work correctly when one asked for a particular version of
    the package, via a version number starting with the character `=`,
    in the sense that a version with a larger version number was loaded
    if it was available. \[Reported by Burkhard Höfling\]

  - The generator names constructed by `AlgebraByStructureConstants`
    (Reference: AlgebraByStructureConstants) were nonsense.

  - The undocumented function (but recently advertised on gap-dev)
    `COPY_LIST_ENTRIES` did not handle overlapping source and
    destination areas correctly in some cases.

  - The elements in a free magma ring have the filter
    `IsAssociativeElement` (Reference: IsAssociativeElement) set
    whenever the elements in the underlying magma and in the
    coefficients ring have this filter set. \[Reported by Randy Cone\]

  - The function `InstallValue` (Reference: InstallValue) must not be
    used for objects in the filter `IsFamily` because these objects are
    compared via `IsIdenticalObj` (Reference: IsIdenticalObj).
    \[Reported by Max Neunhöffer\]

Fixed bugs which could lead to crashes:

  - Problem in composition series for permutation groups for
    non-Frobenius groups with regular point stabilizer.

  - After lots of computations with compressed GF(2) vectors **GAP**
    occasionally crashed. The reason were three missing `CHANGED_BAG`s
    in `SemiEchelonPListGF2Vecs`. They were missing, because a garbage
    collection could be triggered during the computation such that newly
    created bags could become "old". It is not possible to provide test
    code because the error condition cannot easily be reproduced.
    \[Reported by Klaus Lux\]

  - Minor bug that crashed **GAP**: The type of `IMPLICATIONS` could not
    be determined in a fresh session. \[Reported by Marco Costantini\]

  - `Assert` (Reference: Assert) caused an infinite loop if called as
    the first line of a function called from another function.

Other fixed bugs:

  - Wrong choice of prime in Dixon-Schneider if prime is bigger than
    group order (if group has large exponent).

  - Groebner basis code ran into problems when comparing monomial
    orderings.

  - When testing for conjugacy of a primitive group to an imprimitive
    group,**GAP** runs into an error in EARNS calculation. \[Reported by
    John Jones\]

  - The centre of a magma is commonly defined to be the set of elements
    that commute and associate with all elements. The previous
    definition left out "associate" and caused problems with extending
    the functionality to nonassociative loops. \[Reported by Petr
    Vojtechovsky\]

  - New kernel methods for taking the intersection and difference
    between sets of substantially different sizes give a big performance
    increase.

  - The commands `IsNaturalSymmetricGroup` (Reference:
    IsNaturalSymmetricGroup) and `IsNaturalAlternatingGroup` (Reference:
    IsNaturalAlternatingGroup) are faster and should run much less often
    into inefficient tests.

  - The perfect group library, see `Finite Perfect Groups` (Reference:
    Finite Perfect Groups), is split into several files which are loaded
    and unloaded to keep memory usage down. The global variable
    `PERFSELECT` is a blist which indicates which orders are currently
    loaded. An off-by-one error wrongly added the last order of the
    previous file into the list of valid orders when a new file was
    loaded. A subsequent access to this order raises an error.

  - Up to now, the method installed for testing the membership of
    rationals in the field of rationals via `IsRat` (Reference: IsRat)
    was not called; instead a more general method was used that called
    `Conductor` (Reference: Conductor for a cyclotomic) and thus was
    much slower. Now the special method has been ranked up by changing
    the requirements in the method installation.

  - Fixed a bug in `APPEND_VEC8BIT`, which was triggered in the
    following situation: Let `e` be the number of field elements stored
    in one byte. If a compressed 8bit-vector `v` had length not
    divisible by `e` and another compressed 8-bit vector `w` was
    appended, such that the sum of the lengths became divisible by `e`,
    then one 0 byte too much was written, which destroyed the `TNUM` of
    the next **GAP** object in memory. \[Reported by Klaus Lux\]

  - `PermutationCycle` (Reference: PermutationCycle) returned `fail` if
    the cycle was not a contiguous subset of the specified domain.
    \[Reported by Luc Teirlinck\]

  - Now `Inverse` (Reference: Inverse) correctly returns `fail` for
    zeros in finite fields (and does no longer enter a break loop).

  - Up to now, `CharacterDegrees` (Reference: CharacterDegrees) ignored
    the attribute `Irr` (Reference: Irr) if the argument was a group
    that knew that it was solvable.

  - The function `Debug` now prints a meaningful message if the user
    tries to debug an operation. Also, the help file for `vi` is now
    available in the case of several **GAP** root directories.

  - It is no longer possible to create corrupt objects via ranges of
    length \>2^28, resp. \>2^60 (depending on the architecture). The
    limitation concerning the arguments of ranges is documented.
    \[Reported by Stefan Kohl\]

  - Now `IsElementaryAbelian` (Reference: IsElementaryAbelian) and
    `ClassPositionsOfMinimalNormalSubgroups` (Reference:
    ClassPositionsOfMinimalNormalSubgroups) are available for ordinary
    character tables. Now the operation `CharacterTableIsoclinic`
    (Reference: CharacterTableIsoclinic) is an attribute, and there is
    another new attribute `SourceOfIsoclinicTable` (Reference:
    SourceOfIsoclinicTable) that points back to the original table; this
    is used for computing the Brauer tables of those tables in the
    character table library that are computed using
    `CharacterTableIsoclinic`. Now `ClassPositionsOfDerivedSubgroup`
    (Reference: ClassPositionsOfDerivedSubgroup) avoids calling `Irr`
    (Reference: Irr), since `LinearCharacters` (Reference:
    LinearCharacters) is sufficient. Now
    `ClassPositionsOfElementaryAbelianSeries` (Reference:
    ClassPositionsOfElementaryAbelianSeries) works also for the table of
    the trivial group. Restrictions of character objects know that they
    are characters.
    
    A few formulations in the documentation concerning character tables
    have been improved slightly.

  - Up to now, `IsPGroup` (Reference: IsPGroup) has rarely been set. Now
    many basic operations such as `SylowSubgroup` (Reference:
    SylowSubgroup) set this attribute on the returned result.

  - Computing an enumerator for a semigroup required too much time
    because it used all elements instead of the given generators.
    \[Reported by Manuel Delgado\]

  - Avoid potential error message when working with automorphism groups.

  - Fixed wrong page references in manual indices.

  - Make `MutableCopyMat` an operation and install the former function
    which does call `List` (Reference: list element operation) with
    `ShallowCopy` (Reference: ShallowCopy) the default method for lists.
    Also use this in a few appropriate places.

  - An old DEC compiler doesn't like C preprocessor directives that are
    preceded by whitespace. Removed such whitespace. \[Reported by Chris
    Wensley\]

New or improved functionality:

  - The primitive groups library has been extended to degree 2499.

  - New operation `Remove` (Reference: Remove) and extended
    functionality of `Add` (Reference: Add) with an optional argument
    giving the position of the insertion. They are based on an efficient
    kernel function `COPY_LIST_ENTRIES`.

  - Added fast kernel implementation of Tarjan's algorithm for strongly
    connected components of a directed graph.

  - Now `IsProbablyPrimeInt` (Reference: IsProbablyPrimeInt) can be used
    with larger numbers. (Made internal function `TraceModQF`
    non-recursive.)

  - A new operation `PadicValuation` (Reference: PadicValuation) and a
    corresponding method for rationals.

  - A new operation `PartialFactorization` (Reference:
    PartialFactorization) has been added, and a corresponding method for
    integers has been installed. This method allows one to specify the
    amount of work to be spent on looking for factors.

  - The generators of full s. c. algebras can now be accessed with the
    dot operator. \[Reported by Marcus Bishop\]

  - New Conway polynomials computed by Kate Minola, John Bray, Richard
    Parker.

  - A new attribute `EpimorphismFromFreeGroup` (Reference:
    EpimorphismFromFreeGroup). The code has been written by Alexander
    Hulpke.

  - The functions `Lambda` (Reference: Lambda), `Phi` (Reference: Phi),
    `Sigma` (Reference: Sigma), and `Tau` (Reference: Tau) have been
    turned into operations, to admit the installation of methods for
    arguments other than integers.

  - Up to now, one could assign only lists with `InstallFlushableValue`
    (Reference: InstallFlushableValue). Now also records are admitted.

  - `InstallMethod` (Reference: InstallMethod) now admits entering a
    list of strings instead of a list of required filters. Each such
    string must evaluate to a filter when used as the argument of
    `EvalString` (Reference: EvalString). The advantage of this variant
    is that these strings are used to compose an info string (which is
    shown by `ApplicableMethod`) that reflects exactly the required
    filters.

  - In test files that are read with `ReadTest`, the assertion level is
    set to 2 between `START_TEST` and `STOP_TEST`. This may result in
    runtimes for the tests that are substantially longer than the usual
    runtimes with default assertion level 0. In particular this is the
    reason why some of the standard test files require more time in
    **GAP** 4.4.6 than in **GAP** 4.4.5.

  - Some very basic functionality for floats.

#### 8.7 **GAP** 4.4 Update 7 (March 2006)

New or improved functionality:

  - The `Display` (Reference: Display) functionality for character
    tables has been extended by addition of an option to show power maps
    and centralizer orders in a format similar to that used in the
    ATLAS. Furthermore the options handling is now hierarchical, in
    order to admit more flexible overloading.

  - For the function `LowIndexSubgroupsFpGroup` (Reference:
    LowIndexSubgroupsFpGroup), there is now an iterator variant
    `LowIndexSubgroupsFpGroupIterator`. \[Suggested (and based on code
    contributed) by Michael Hartley\]

  - Semigroup functionality in **GAP** has been improved and extended.
    Green's relations are now stored differently, making the system more
    amenable to new methods for computing these relations in special
    cases. It is now possible to calculate Green's classes etc. without
    computing the entire semigroup or necessarily loading the package
    **MONOID**. Furthermore, the Froidure-Pin algorithm has now been
    implemented in **GAP**.

  - Functionality for creating free products of any list of groups for
    which a finite presentation can be determined had been added. This
    function returns a finitely presented group. This functionality
    includes the `Embedding` operation. As an application of this new
    code a specialized direct product operation has been added for
    finitely presented groups which returns a finitely presented group.
    This application includes `Embedding` and `Projection`
    functionality.

  - Some new Straight Line Program (SLP) functionality has been added.
    The new functions take given SLPs and create new ones by restricting
    to a subset of the results, or to an intermediate result or by
    calculating the product of the results of two SLPs.

  - New code has been added to allow group elements with memory; that
    is, they store automatically how they were derived from some given
    set of generators. Note that there is not yet documentation for this
    functionality, but some packages already use it.

  - New code has been added to handle matrices and vectors in such a way
    that they do not change their representation in a generic manner.

  - The `Irr` (Reference: Irr) method for p-solvable p-modular Brauer
    tables now keeps the order of the irreducibles in the ordinary
    table.

  - **GAP** can now handle any finite field for which the Conway
    polynomial is known or can be computed.

  - New Conway polynomials provided by John Bray and Kate Minola have
    been added.

  - The `ReadTest` methods for strings (filenames) and streams now
    automatically set the screen width (see `SizeScreen` (Reference:
    SizeScreen)) to 80 before the tests, and reset it afterwards.

  - Now a few more checks are done during the `configure` phase of
    compiling for future use of some I/O functions of the C-library in a
    package. Also the path to the **GAP** binaries for the **GAP**
    compiler is now handled via autoconf. Finally, now `autoconf`
    version 2.59 is used.

Fixed bugs which could produce wrong results:

  - Some technical errors in the functions for compressed vectors and
    matrices which could lead to corruption of internal data structures
    and so to crashes or conceivably to wrong results. \[Reported by
    Roman Schmied\]

  - A potential problem in the generic method for the undocumented
    operation `DirectFactorsOfGroup`: It was silently assumed that
    `NormalSubgroups` (Reference: NormalSubgroups) delivers the trivial
    subgroup as first and the whole group as last entry of the resulting
    list.

  - The code for sublists of compressed vectors created by `vec{range}`
    may write one byte beyond the space allocated for the new vector,
    overwriting part of the next object in the workspace. Thanks to Jack
    Schmidt for narrowing down the problem.

  - Given a class function object of value zero, an `Arithmetic
    Operations for Class Functions` (Reference: Arithmetic Operations
    for Class Functions) method for a class function erroneously did not
    return `fail`. \[Reported by Jack Schmidt\]

  - The `Arithmetic Operations for Class Functions` (Reference:
    Arithmetic Operations for Class Functions) method for a class
    function erroneously returned a finite number if one of the values
    was nonreal, not a cyclotomic integer, and had norm 1.

  - Two missing perfect groups were added, and the permutation degree
    lowered on the perfect groups with the largest degrees. \[Reported
    by Jack Schmidt\]

  - When a character table was displayed with `Printing Character
    Tables` (Reference: Printing Character Tables), the centralizer
    order displayed for the first class shown was not correct if it did
    not involve all prime divisors of the group. \[Reported by Jack
    Schmidt\]

  - The first argument of the function `VectorSpace` (Reference:
    VectorSpace) must be a field. This is checked from now on.
    \[Reported by Laurent Bartholdi\]

  - Up to now, it was possible to create a group object from a semigroup
    of cyclotomics using `AsGroup` (Reference: AsGroup), although groups
    of cyclotomics are not admissible. \[Reported by Alexander
    Konovalov\]

  - The documentation of `CharacteristicPolynomial(F,mat)` was ambiguous
    if `FieldOfMatrix(mat) <= F < DefaultFieldOfMatrix(mat)`. In
    particular, the result was representation dependent. This was fixed
    by introducing a second field which specifies the vector space which
    mat acts upon. \[Reported by Jack Schmidt\]

  - `AssociatedReesMatrixSemigroupOfDClass` produced an incorrect
    sandwich matrix for the semigroup created. This matrix is an
    attribute set when creating the Rees matrix semigroup but is not
    used for creating the semigroup. The incorrect result was returned
    when `SandwichMatrix` was called. \[Reported by Nelson Silva and
    Joao Araujo\]

  - The literal `"compiled"` was given an incorrect length. The kernel
    was then unable to find compiled library code as the search path was
    incorrect. Also the documentation example had an error in the path
    used to invoke the `gac` compiler.

  - The twisting group in a generic wreath product might have had
    intransitive action. \[Reported by Laurent Bartholdi\]

  - There was an arithmetic bug in the polynomial reduction code.

Fixed bugs which could lead to crashes:

  - Bug 1 in the list of fixed bugs which could lead to wrong results
    could also potentially lead to crashes.

Other fixed bugs:

  - The matrices of invariant forms stored as values of the attributes
    `InvariantBilinearForm` (Reference: InvariantBilinearForm),
    `InvariantQuadraticForm` (Reference: InvariantQuadraticForm), and
    `InvariantSesquilinearForm` (Reference: InvariantSesquilinearForm),
    for matrix groups over finite fields, are now in the (compressed)
    format returned by `ImmutableMatrix` (Reference: ImmutableMatrix).

  - `String` now returns an immutable string, by making a copy before
    changing the argument.

  - `permutation^0` and `permutation^1` were not handled with special
    code in the kernel, hence were very slow for big permutations.
    \[Reported by Max Neunhöffer\]

  - Added code to cache the induced pcgs for an arbitrary parent pcgs.
    (This code was formerly part of the **CRISP** package.)

  - This fix consists of numerous changes to improve support for direct
    products, including: - new methods for
    `PcgsElementaryAbelianSeries`, `PcgsChiefSeries`,
    `ExponentsOfPcElement`, `DepthOfPcElement` for direct products -
    fixed `EnumeratorOfPcgs` to test for membership first - new methods
    for membership test in groups which have an induced pcgs - added
    `GroupOfPcgs` attribute to pcgs in various methods - fixed
    declarations of `PcgsElementaryAbelianSeries`, `PcgsChiefSeries`
    (the declared argument was a pcgs, not a group) \[Reported by Roman
    Schmied\]

  - Corrected a term ordering problem encountered by the basis
    construction code for finite dimensional vector spaces of
    multivariate rational functions. \[Reported by Jan Draisma\]

  - When the factor of a finite dimensional group ring by an ideal was
    formed, a method intended for free algebras modulo relations was
    used, and the returned factor algebra could be used for (almost)
    nothing. \[Reported by Heiko Dietrich\]

  - Up to now, `PowerMap` (Reference: PowerMap) ran into an error when
    one asked for the n-th power map where n was not a small integer.
    This happened in some **GAP** library functions if the exponent of
    the character table in question was not a small integer.

  - Up to now, the test whether a finite field element was contained in
    a group of finite field elements ran into an error if the element
    was not in the field generated by the group elements. \[Reported by
    Heiko Dietrich\]

  - Conjugacy classes of natural (special) linear groups are now always
    returned with trivial class first.

  - Up to now, it could happen that `CheckFixedPoints` (Reference:
    CheckFixedPoints) reduced an entry in its second argument to a list
    containing only one integer but did not replace the list by that
    integer; according to the conventions, this replacement should be
    done.

  - The functions `PrintTo` and `AppendTo` did not work correctly for
    streams. \[Reported by Marco Costantini\]

  - The function `Basis` did not return a value when it was called with
    the argument `Rationals`. \[Reported by Klaus Lux\]

  - For certain matrix groups, the function `StructureDescription`
    raised an error message. The reason for this was that a trivial
    method for `IsGeneralLinearGroup` for matrix groups in
    `lib/grpmat.gi` which is ranked higher than the nontrivial method
    for generic groups in `lib/grpnames.gi` called the operation
    `IsNaturalGL`, for which there was no nontrivial method available.
    \[Reported by Nilo de Roock\]

  - Action on sets of length 1 was not correctly handled. \[Reported by
    Mathieu Dutour\]

  - Now `WriteByte` admits writing zero characters to all streams.
    \[Reported by Marco Costantini\]

  - The conjugacy test for subgroups tests for elementary abelian
    regular normal subgroup (EARNS) conjugacy. The fix will catch this
    in the case that the second group has no EARNS. \[Reported by Andrew
    Johnson\]

  - So far, the UNIX installation didn't result in a correct gap.sh if
    the installation path contained space characters. Now it should
    handle this case correctly, as well as other unusual characters in
    path names (except for double quotes).

#### 8.8 **GAP** 4.4 Update 8 (September 2006)

New or improved functionality:

  - A function `Positions` (Reference: Positions) with underlying
    operation `PositionsOp`, which returns the list of all positions at
    which a given object appears in a given list.

  - `LogFFE` (Reference: LogFFE) now returns `fail` when the element is
    not a power of the base.

  - It is now allowed to continue long integers, strings or identifiers
    by ending a line with a backslash or with a backslash and carriage
    return character. So, files with **GAP** code and DOS/Windows-style
    line breaks are now valid input on all architectures.

  - The command line for starting the session and the system environment
    are now available in `GAPInfo.SystemCommandLine` and
    `GAPInfo.SystemEnvironment`.

  - Names of all bound global variables and all component names are
    available on **GAP** level.

  - Added a few new Conway polynomials computed by Kate Minola and John
    Bray.

  - There is a new concept of *random sources*, see `IsRandomSource`
    (Reference: IsRandomSource), which provides random number generators
    which are independent of each other. There is kernel code for the
    Mersenne twister random number generator (based on the code by
    Makoto Matsumoto distributed at
    <http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html>). It
    provides fast 32-bit pseudorandom integers with a period of length
    2^19937-1 and a 623-dimensional equidistribution. The library
    methods for random elements of lists and for random (long) integers
    are using the Mersenne twister now.

  - In line editing mode (usual input mode without -n option) in lines
    starting with `gap> `, `> ` or `brk> ` this beginning part is
    immediately removed. This is a convenient feature that allows one to
    cut and paste input lines from other sessions or from manual
    examples into the current session.

Fixed bugs which could produce wrong results:

  - The function `Decomposition` (Reference: Decomposition) returned
    coefficient vectors also in certain situations where in fact no
    decomposition exists. This happened only if the matrix entered as
    the first argument contained irrational values and a row in the
    matrix entered as the second argument did not respect the algebraic
    conjugacy relations between the columns of the first argument. So
    there was no problem for the usual cases that the two matrices are
    integral or that they are lists of Brauer characters. \[Reported by
    Jürgen Müller\]

  - PC group homomorphisms can claim a wrong kernel after composition.
    \[Reported by Serge Bouc\]

  - The return value of `OctaveAlgebra` (Reference: OctaveAlgebra) had
    an inconsistent defining structure constants table for the case of
    coefficients fields not containing the integer zero. \[Reported by
    Gábor Nagy\]

  - The manual guarantees that a conjugator automorphism has a
    conjugating element in the group if possible. This was not
    guaranteed.

  - `StabChain` (Reference: StabChain for a group (and a record)) for
    symmetric groups gave a wrong result if fixed points were prescribed
    for base.

  - Contrary to what is documented the function `POW_OBJ_INT` returned
    an immutable result for `POW_OBJ_INT(m,1)` for a mutable object `m`.
    This is triggered by the code `m^1`.

  - `PseudoRandom` (Reference: PseudoRandom) for a group had a problem
    if the group had lots of equal generators. The produced elements
    were extremely poorly distributed in that case. This is now fixed
    for the case that elements of the group can easily be sorted.

  - Fixed the bug that the type of a boolean list (see `More about
    Boolean Lists` (Reference: More about Boolean Lists)) was computed
    wrongly: The type previously had `IS_PLIST_REP` instead of
    `IS_BLIST_REP` in its filter list.

  - `Orbits` (Reference: Orbits) did not respect a special
    `PositionCanonical` (Reference: PositionCanonical) method for right
    transversals. \[Reported by Steve Costenoble\]

  - Wrong results for `GcdInt` (Reference: GcdInt) for some arguments on
    64 bit systems only. \[Reported by Robert Morse\]

  - When prescribing a subgroup to be included, the low index algorithm
    for fp groups sometimes returned subgroups which are in fact
    conjugate. (No subgroups are missing.) \[Reported by Ignaz Soroko\]

Fixed bugs which could lead to crashes:

  - The command line option `-x` allowed arguments \> 256 which can then
    result in internal buffers overflowing. Now bigger numbers in the
    argument are equivalent to `-x 256`. \[Reported by Michael Hartley\]

Other fixed bugs:

  - Two special methods for the operation `CompositionMapping2`
    (Reference: CompositionMapping2) were not correct, such that
    composing (and multiplying) certain group homomorphisms did not
    work. \[Reported by Peter Mayr\]

  - In the definition of `FrobeniusCharacterValue` (Reference:
    FrobeniusCharacterValue), it had been stated erroneously that the
    value must lie in the field of p^n-th roots of unity; the correct
    condition is that the value must lie in the field of (p^n-1)-th
    roots of unity. \[Reported by Jack Schmidt\]

  - The function `DirectProduct` (Reference: DirectProduct) failed when
    one of the factors was known to be infinite.

  - For a linear action homomorphism `PreImageElm` was very slow because
    there was no good method to check for injectivity, which is needed
    for nearly all good methods for `PreImageElm`. This change adds such
    a new method for `IsInjective`. \[Reported by Akos Seress\]

  - Rare errors in the complement routine for permutation groups.

  - Blocks code now uses jellyfish-style random elements to avoid bad
    Schreier trees.

  - A method for `IsPolycyclicGroup` (Reference: IsPolycyclicGroup) has
    been added. Such a method was missing so far.

  - Corrected `EpimorphismSchurCover` (Reference: EpimorphismSchurCover)
    to handle the trivial group correctly. Added new methods that follow
    immediately from computing the Schur Cover of a group. The attribute
    `Epicentre` (Reference: Epicentre), the operations
    `NonabelianExteriorSquare` (Reference: NonabelianExteriorSquare) and
    `EpimorphismNonabelianExteriorSquare` (Reference:
    EpimorphismNonabelianExteriorSquare), and the property
    `IsCentralFactor` (Reference: IsCentralFactor) are added to the
    library with documentation and references.

  - Display the correct expression in a call stack trace if an operation
    was called somewhere up due to the evaluation of a unary or binary
    operation.

  - Made `StripMemory` an operation rather than a global function. Added
    `ForgetMemory` operation.

  - Adjust things slightly to make later conversion to new
    vectors/matrices easier. Nothing of this should be visible.

  - Corrected some details in the documentation of the **GAP** language.
    \[Reported by Alexander Konovalov\]

  - Now `PositionSorted` (Reference: PositionSorted) is much faster on
    long mutable plain lists. (The former operation is substituted by a
    function and a new operation `PositionSortedOp`.) \[Reported by
    Silviu Radu\]

  - Now it is possible to switch repeated warnings off when working with
    iterative polynomial rings.

#### 8.9 **GAP** 4.4 Update 9 (November 2006)

Fixed bugs which could produce wrong results:

  - The methods of `ReadByte` (Reference: ReadByte) for reading from
    files or terminals returned wrong results for characters in the
    range `[128..255]`. \[Reported by Yevgen Muntyan\]

Other fixed bugs:

  - A method for the operation `PseudoRandom` (Reference: PseudoRandom)
    did not succeed.

  - A fix for `Orbits` with a set of points as a seed.

  - Added a generic method such that `Positions` (Reference: Positions)
    works with all types of lists.

  - Fixed a problem in choosing the prime in the Dixon-Schneider
    algorithm. \[Reported by Toshio Sumi\]

New or improved functionality:

  - `ReducedOrdinary` was used in the manual, but was not documented,
    being a synonym for the documented `ReducedCharacters`. Changed
    manual examples to use the latter form. \[Reported by Vahid
    Dabbaghian\]

#### 8.10 **GAP** 4.4 Update 10 (October 2007)

New or improved functionality:

  - Files in the `cnf` directory of the **GAP** distribution are now
    archived as binary files. Now **GAP** can be installed with UNIX or
    with WINDOWS style line breaks on any system and should work without
    problems.

  - Since large finite fields are available, some restrictions in the
    code for computing irreducible modules over finite fields are no
    longer necessary. (They had been introduced in order to give better
    error messages.)

  - Made PositionSublist faster in case the search string does not
    contain repetitive patterns.

  - The function `MakeImmutable` now returns its argument.

  - Dynamically loaded modules now work on Mac OS X. As a consequence,
    this allows to work with the Browse, EDIM and IO packages on Mac OS
    X.

  - Introduced `ViewObj` and `PrintObj` methods for algebraic number
    fields. Made them applicable to `AlgebraicExtension` by adding the
    property `IsNumberField` in the infinite field case.

  - The function `CharacterTableRegular` (Reference:
    CharacterTableRegular) is documented now.

  - The function `ScalarProduct` (Reference: ScalarProduct for
    characters) now accepts also Brauer characters as arguments.

  - The function `QuaternionAlgebra` (Reference: QuaternionAlgebra) now
    accepts also a list of field elements instead of a field. Also, now
    the comparison of return values (w.r.t. equality, containment)
    yields `true` if the parameters coincide and the ground fields fit.

  - The function `RemoveCharacters` (Reference: RemoveCharacters) is now
    documented.

  - Lists in **GAP** sometimes occupy memory for possible additional
    entries. Now plain lists and strings read by **GAP** and the lists
    returned by `List` (Reference: list element operation) only occupy
    the memory they really need. For more details see the documentation
    of the new function `EmptyPlist` (Reference: EmptyPlist).

  - There are some new Conway polynomials in characteristic 2 and 3
    provided by Kate Minola.

  - A new operation `MemoryUsage` determines the memory usage in bytes
    of an object and all its subobjects. It does not consider families
    and types but handles arbitrary self-referential structures of
    objects.

Fixed bugs which could produce wrong results:

  - When forming the semidirect product of a matrix group with a vector
    space over a non-prime field the embedding of the vector space gave
    a wrong result. \[Reported by anvita21\]

  - DefaultRing failed for constant polynomials over nonprime fields.
    \[Reported by Stefan Kohl\]

  - The method in ffeconway.gi that gets coefficients WRT to the
    canonical basis of the field from the representation is only correct
    if the basis is over the prime field. Added a TryNextMethod if this
    is not the case. \[Reported by Alla Detinko\]

  - Creating a large (\>2^16) field over a non-prime subfield went
    completely wrong. \[Reported by Jack Schmidt, from Alla Detinko\]

  - A method for Coefficients for Conway polynomial FFEs didn't check
    that the basis provided was the canonical basis of the RIGHT field.
    \[Reported by Bettina Eick\]

  - An elementary abelian series was calculated wrongly. \[Reported by
    N. Sieben\]

  - Orbits on sets of transformations failed.

  - Wrong methods for `GeneratorsOfRing` (Reference: GeneratorsOfRing)
    and `GeneratorsOfRingWithOne` (Reference: GeneratorsOfRingWithOne)
    have been removed. These methods were based on the assumption that
    one can obtain a set of ring generators by taking the union of a
    known set of field generators, the set of the inverses of these
    field generators and {1}.

  - The name of a group of order 117600 and degree 50 was incorrect in
    the `Primitive Permutation Groups` ([primgrp: Primitive Permutation
    Groups](../../pkg/primgrp-3.3.2/doc/chap.md#X7AE00EA7791F2574))
    Primitive Permutation Groups library. In particular, a group was
    wrongly labelled as PGL(2, 49).

  - There was a possible error in `SubgroupsSolvableGroup` when
    computing subgroups within a subgroup.

  - An error in 2-Cohomology computation for pc groups was fixed.

  - `IsConjugate` used normality in a wrong supergroup

Fixed bugs which could lead to crashes:

  - **GAP** crashed when the `PATH` environment variable was not set.
    \[Reported by Robert F. Morse\]

  - **GAP** could crash when started with option `-x 1`. Now the number
    of columns is initialized with at least 2. \[Reported by Robert F.
    Morse\]

  - After loading a saved workspace **GAP** crashed when one tried to
    slice a compressed vector over a field with 2 \< q \<= 256 elements,
    which had already existed in the saved workspace. \[Reported by
    Laurent Bartholdi\]

  - `FFECONWAY.WriteOverSmallestCommonField` tripped up when the common
    field is smaller than the field over which some of the vector
    elements are written, because it did a test based on the degree of
    the element, not the field it is written over. \[Reported by Thomas
    Breuer\]

  - Fixed the following error: When an FFE in the Conway polynomial
    representation actually lied in a field that is handled in the
    internal representation (eg GF(3)) and you tried to write it over a
    bigger field that is ALSO handled internally (eg GF(9)) you got an
    element written over the larger field, but in the Conway polynomial
    representation, which is forbidden. \[Reported by Jack Schmidt\]

  - Attempting to compress a vector containing elements of a small
    finite field represented as elements of a bigger (external) field
    caused a segfault. \[Reported by Edmund Robertson\]

  - **GAP** crashed when `BlistList` was called with a range and a list
    containing large integers or non-integers. \[Reported by Laurent
    Bartholdi\]

  - **GAP** no longer crashes when `OnTuples` is called with a list that
    contains holes. \[Reported by Thomas Breuer\]

Other fixed bugs:

  - `Socle` for the trivial group could produce an error message.

  - `DirectoryContents` (Reference: DirectoryContents) ran into an error
    for immutable strings without trailing slash as argument. \[Reported
    by Thomas Breuer\]

  - The functions `IsInjective` (Reference: IsInjective) and
    `IsSingleValued` (Reference: IsSingleValued) did not work for
    general linear mappings with trivial (pre)image. \[Reported by Alper
    Odabas\]

  - Creating an enumerator for a prime field with more than 65536
    elements ran into an infinite recursion. \[Reported by Akos Seress\]

  - The performance of `List`, `Filtered`, `Number`, `ForAll` and
    `ForAny` if applied to non-internally represented lists was
    improved. Also the performance of iterators for lists was slightly
    improved.

  - Finite field elements now know that they can be sorted easily which
    improves performance in certain lookups.

  - A method for `IsSubset` (Reference: IsSubset) was missing for the
    case that exactly one argument is an inhomogeneous list. \[Reported
    by Laurent Bartholdi\]

  - Long integers in expressions are now printed (was not yet
    implemented). \[Reported by Thomas Breuer\]

  - Fixed kernel function for printing records.

  - New C library interfaces (e.g., to ncurses in the **Browse**
    package) need some more memory to be allocated with `malloc`. The
    default value of **GAP** `-a` option is now `2m>`.

  - Avoid warnings about pointer types by newer gcc compilers.

  - `IsBound(l[pos])` was failing for a large integer pos only when
    coded (e.g. in a loop or function body).

  - `ZmodpZObj` is now a synonym for `ZmodnZObj` such that from now on
    such objects print in a way that can be read back into **GAP**.

  - The outdated note that binary streams are not yet implemented has
    been removed.

#### 8.11 **GAP** 4.4 Update 11 (December 2008)

Fixed bugs which could produce wrong results:

  - `MemoryUsage` (Reference: MemoryUsage) on objects with no subobjects
    left them in the cache and thus reported 0 in subsequent calls to
    MemoryUsage for the same object. \[Reported by Stefan Kohl\]

  - `Irr` (Reference: Irr) might be missing characters. \[Reported by
    Angel del Rio\]

  - Up to now, it was allowed to call the function
    `FullMatrixAlgebraCentralizer` (Reference:
    FullMatrixAlgebraCentralizer) with a field and a list of matrices
    such that the entries of the matrices were not contained in the
    field; in this situation, the result did not fit to the
    documentation. Now the entries of the matrices are required to lie
    in the field, if not then an error is signaled.

  - For those finite fields that are regarded as field extensions over
    non-prime fields (one can construct such fields with `AsField`
    (Reference: AsField)), the function `DefiningPolynomial` (Reference:
    DefiningPolynomial) erroneously returned a polynomial w.r.t. the
    extension of the prime field. \[Reported by Stefan Kohl\]

  - Since the release of **GAP** 4.4.10, the return values of the
    function `QuaternionAlgebra` (Reference: QuaternionAlgebra) were not
    consistent w.r.t. the attribute `GeneratorsOfAlgebra` (Reference:
    GeneratorsOfAlgebra); the returned list could have length four or
    five. Now always the list of elements of the canonical basis is
    returned.

  - `MonomialGrevlexOrdering` (Reference: MonomialGrevlexOrdering)
    calculated a wrong ordering in certain cases. \[Reported by Paul
    Smith\]

  - The (**GAP** kernel) method for the operation `IntersectSet`
    (Reference: IntersectSet) for ranges had two bugs, which could yield
    a result range with either too few or too many elements. As a
    consequence, for example the `Intersection` (Reference:
    Intersection) results for ranges could be wrong. \[Reported by
    Matthew Fayers\]

  - Fixed a bug in the short-form display of elements of larger finite
    fields, a bug in some cross-field conversions and some
    inefficiencies and a missing method in the `LogFFE` (Reference:
    LogFFE) code. \[Reported by Jia Huang\]

  - In rare cases `SmithNormalFormIntegerMatTransforms` (Reference:
    SmithNormalFormIntegerMatTransforms) returned a wrong normal form
    (the version without transforming matrices did not have this
    problem). This is fixed. \[Reported by Alexander Hulpke\]

  - The variant of the function `StraightLineProgram` (Reference:
    StraightLineProgram for a list of lines (and the number of
    generators)) that takes a string as its first argument returned
    wrong results if the last character of this string was a closing
    bracket.

  - The code for central series in a permutation group used too tight a
    bound and thus falsely return a nilpotent permutation group as
    non-nilpotent.

Fixed bugs which could lead to crashes:

  - Under certain circumstances the kernel code for position in blists
    would access a memory location just after the end of the blist. If
    this location was not accessible, a crash could result. This was
    corrected and the code was cleaned up. \[Reported by Alexander
    Hulpke\]

Other fixed bugs:

  - The function `IsomorphismTypeInfoFiniteSimpleGroup` (Reference:
    IsomorphismTypeInfoFiniteSimpleGroup) can be called with a positive
    integer instead of a group, and then returns information about the
    simple group(s) of this order. (This feature is currently
    undocumented.) For the argument 1, however, it ran into an infinite
    loop.

  - A lookup in an empty dictionary entered a break loop. Now returns
    `fail`. \[Reported by Laurent Bartholdi\]

  - The c++ keyword `and` can no longer be used as a macro parameter in
    the kernel. \[Reported by Paul Smith\]

  - The operation `KernelOfMultiplicativeGeneralMapping` (Reference:
    KernelOfMultiplicativeGeneralMapping) has methods designed to handle
    maps between permutation groups in a two-step approach, but did not
    reliably trigger the second step. This has now been fixed,
    preventing a slow infinite loop repeating the first step. This was
    normally only seen as part of a larger calculation.

  - There were two methods for the operation `Intersection2` (Reference:
    Intersection2) which have implicitly assumed that finiteness of a
    collection can always be decided. Now, these methods check for
    `IsFinite` (Reference: IsFinite) and `CanComputeSize` (Reference:
    CanComputeSize) prior to calling `IsFinite` (Reference: IsFinite).

  - Made error message in case of corrupted help book information
    (manual.six file) shorter and more informative. \[Reported by
    Alexander Hulpke\]

  - **GAP** cannot call methods with more than six arguments. Now the
    functions `NewOperation` (Reference: NewOperation),
    `DeclareOperation` (Reference: DeclareOperation), and
    `InstallMethod` (Reference: InstallMethod) signal an error if one
    attempts to declare an operation or to install a method with more
    than six arguments.

  - Up to now, `IsOne` (Reference: IsOne) had a special method for
    general mappings, which was much worse than the generic method; this
    special method has now been removed.

  - When printing elements of an algebraic extension parentheses around
    coefficients were missing. \[Reported by Maxim Hendriks\]

New or improved functionality:

  - Make dynamic loading of modules possible on CYGWIN using a DLL based
    approach. Also move to using autoconf version 2.61.

  - One can now call `Basis` (Reference: Basis), `Iterator` (Reference:
    Iterator) etc. with the return value of the function
    `AlgebraicExtension` (Reference: AlgebraicExtension).

  - The function `FrobeniusCharacterValue` (Reference:
    FrobeniusCharacterValue) returned `fail` for results that require a
    finite field with more than 65536 elements. Meanwhile **GAP** can
    handle larger finite fields, so this restriction was removed. (It is
    still possible that `FrobeniusCharacterValue` (Reference:
    FrobeniusCharacterValue) returns `fail`.)

  - Methods for testing membership in general linear groups and special
    linear groups over the integers have been added.

  - Methods for `String` (Reference: String) and `ViewString` for full
    row modules have been added. Further, a default method for
    `IsRowModule` (Reference: IsRowModule) has been added, which returns
    `false` for objects which are not free left modules.

  - A `ViewString` method for objects with name has been added.

  - The method for `View` (Reference: View) for polynomial rings has
    been improved, and methods for `String` (Reference: String) and
    `ViewString` for polynomial rings have been added.

  - `Binomial` (Reference: Binomial) now works with huge `n`.

  - The function `InducedClassFunctionsByFusionMap` (Reference:
    InducedClassFunctionsByFusionMap) is now documented.

  - The return values of the function `QuaternionAlgebra` (Reference:
    QuaternionAlgebra) now store that they are division rings (if
    optional parameters are given then of course ths depends on these
    parameters).

#### 8.12 **GAP** 4.4 Update 12 (December 2008)

Fixed bugs which could lead to crashes:

  - A bug whereby leaving an incomplete statement on a line (for
    instance typing while and then return) when prompt colouring was in
    use could lead to **GAP** crashing.

Other fixed bugs:

  - A bug which made the command-line editor unusable in a 64-bit
    version of **GAP** on Mac OS X.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap9.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
