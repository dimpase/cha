Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap5.html) 

[\[MathJax on\]](chap4_mj.html)

[4 Changes between **GAP** 4.7 and **GAP**
4.8](chap.md#X78E4871E83067AB2)

 [4.1 **GAP** 4.8.2 (February 2016)](chap.md#X79FD32317A501139) 

  
  [4.1-1 Changes in the core **GAP** system introduced in **GAP**
4.8](chap.md#X809328727BE7E536)    
  [4.1-2 New and updated packages since **GAP**
4.7.8](chap.md#X82C1E2C67F40F08E) 

 [4.2 **GAP** 4.8.3 (March 2016)](chap.md#X7A20BE707ADF7026) 

  
  [4.2-1 Changes in the core **GAP** system introduced in **GAP**
4.8.3](chap.md#X879A200E81946C6F) 

 [4.3 **GAP** 4.8.4 (June 2016)](chap.md#X7B972D037B89F4F7) 

  
  [4.3-1 Changes in the core **GAP** system introduced in **GAP**
4.8.4](chap.md#X7E7C695481D3E9AF) 

 [4.4 **GAP** 4.8.5 (September 2016)](chap.md#X7878A4097FDB663D) 

  
  [4.4-1 Changes in the core **GAP** system introduced in **GAP**
4.8.5](chap.md#X790C1A5D81C9B334) 

 [4.5 **GAP** 4.8.6 (November 2016)](chap.md#X82FEFE5A7B7EF603) 

  
  [4.5-1 Changes in the core **GAP** system introduced in **GAP**
4.8.6](chap.md#X809C8F4681E75C99) 

 [4.6 **GAP** 4.8.7 (March 2017)](chap.md#X7D60AECE7957C682) 

  
  [4.6-1 Changes in the core **GAP** system introduced in **GAP**
4.8.7](chap.md#X87ECFC4F81FD0602)    
  [4.6-2 New and updated packages since **GAP**
4.8.6](chap.md#X7C0FA46587A3CEFB) 

 [4.7 **GAP** 4.8.8 (August 2017)](chap.md#X822D0A3E85F800B3) 

  
  [4.7-1 Changes in the core **GAP** system introduced in **GAP**
4.8.8](chap.md#X7EE70D9681685719)    
  [4.7-2 New and updated packages since **GAP**
4.8.7](chap.md#X7B7FD76C7D5787DF) 

### 4 Changes between **GAP** 4.7 and **GAP** 4.8

This chapter contains an overview of the most important changes
introduced in **GAP** 4.8.2 release (the 1st public release of **GAP**
4.8). Later it will also contain information about subsequent update
releases for **GAP** 4.8. First of all, the **GAP** development
repository is now hosted on GitHub at
<https://github.com/gap-system/gap>, and **GAP** 4.8 is the first major
**GAP** release made from this repository. The public issue tracker for
the core **GAP** system is located at
<https://github.com/gap-system/gap/issues>, and you may use appropriate
milestones from <https://github.com/gap-system/gap/milestones> to see
all changes that were introduced in corresponding **GAP** releases. An
overview of the most significant ones is provided below.

#### 4.1 **GAP** 4.8.2 (February 2016)

##### 4.1-1 Changes in the core **GAP** system introduced in **GAP** 4.8

New features:

  - Added support for profiling which tracks how much time in spent on
    each line of **GAP** code. This can be used to show where code is
    spending a long time and also check which lines of code are even
    executed. See the documentation for `ProfileLineByLine` (Reference:
    ProfileLineByLine) and `CoverageLineByLine` (Reference:
    CoverageLineByLine) for details on generating profiles, and the
    **Profiling** package for transforming these profiles into a
    human-readable form.

  - Added ability to install (in the library or packages) methods for
    accessing lists using multiple indices and indexing into lists using
    indices other than positive small integers. Such methods could
    allow, for example, to support expressions like
    
        m[1,2];
        m[1,2,3] := x;
        IsBound(m["a","b",Z(7)]);
        Unbind(m[1][2,3])

  - Added support for partially variadic functions to allow function
    expressions like
    
        function( a, b, c, x... ) ... end;
    
    which would require at least three arguments and assign the first
    three to a, b and c and then a list containing any remaining ones to
    x.
    
    The former special meaning of the argument arg is still supported
    and is now equivalent to `function( arg... )`, so no changes in the
    existing code are required.

  - Introduced `CallWithTimeout` and `CallWithTimeoutList` to call a
    function with a limit on the CPU time it can consume. This
    functionality may not be available on all systems and you should
    check `GAPInfo.TimeoutsSupported` before using this functionality.
    (These functions were withdrawn in **GAP** 4.9.)

  - **GAP** now displays the filename and line numbers of statements in
    backtraces when entering the break loop.

  - Introduced `TestDirectory` (Reference: TestDirectory) function to
    find (recursively) all `.tst` files from a given directory or a list
    of directories and run them using `Test` (Reference: Test).

Improved and extended functionality:

  - Method tracing shows the filename and line of function during
    tracing.

  - `TraceAllMethods` (Reference: TraceAllMethods) and
    `UntraceAllMethods` (Reference: UntraceAllMethods) to turn on and
    off tracing all methods in **GAP**. Also, for the uniform approach
    `UntraceImmediateMethods` (Reference: UntraceImmediateMethods) has
    been added as an equivalent of `TraceImmediateMethods(false)`.

  - The most common cases of `AddDictionary` (Reference: AddDictionary)
    on three arguments now bypass method selection, avoiding the cost of
    determining homogeneity for plain lists of mutable objects.

  - Improved methods for symmetric and alternating groups in the
    "natural" representations and removed some duplicated code.

  - Package authors may optionally specify the source code repository,
    issue tracker and support email address for their package using new
    components in the `PackageInfo.g` file, which will be used to create
    hyperlinks from the package overview page (see `PackageInfo.g` from
    the Example package which you may use as a template).

Changed functionality:

  - As a preparation for the future developments to support
    multithreading, some language extensions from the **HPC-GAP**
    project were backported to the **GAP** library to help to unify the
    codebase of both **GAP** 4 and **HPC-GAP**. The only change which is
    not backwards compatible is that `atomic`, `readonly` and
    `readwrite` are now keywords, and thus are no longer valid
    identifiers. So if you have any variables or functions using that
    name, you will have to change it in **GAP** 4.8.

  - There was inconsistent use of the following properties of
    semigroups: `IsGroupAsSemigroup`, `IsMonoidAsSemigroup`, and
    `IsSemilatticeAsSemigroup`. `IsGroupAsSemigroup` was true for
    semigroups that mathematically defined a group, and for semigroups
    in the category `IsGroup` (Reference: IsGroup);
    `IsMonoidAsSemigroup` was only true for semigroups that
    mathematically defined monoids, but did not belong to the category
    `IsMonoid` (Reference: IsMonoid); and `IsSemilatticeAsSemigroup` was
    simply a property of semigroups, as there is no category
    `IsSemilattice`.
    
    From version 4.8 onwards, `IsSemilatticeAsSemigroup` is renamed to
    `IsSemilattice`, and `IsMonoidAsSemigroup` returns true for
    semigroups in the category `IsMonoid` (Reference: IsMonoid).
    
    This way all of the properties of the type `IsXAsSemigroup` are
    consistent. It should be noted that the only methods installed for
    `IsMonoidAsSemigroup` belong to the **Semigroups** and **Smallsemi**
    packages.

  - `ReadTest` became obsolete and for backwards compatibility is
    replaced by `Test` (Reference: Test) with the option to compare the
    output up to whitespaces.

  - The function \`ErrorMayQuit\`, which differs from `Error`
    (Reference: Error) by not allowing execution to continue, has been
    renamed to `ErrorNoReturn` (Reference: ErrorNoReturn).

Fixed bugs:

  - A combination of two bugs could lead to a segfault. First off,
    `NullMat` (Reference: NullMat) (and various other **GAP**
    functions), when asked to produce matrix over a small field, called
    `ConvertToMatrixRep` (Reference: ConvertToMatrixRep for a list (and
    a field)). After this, if the user tried to change one of the
    entries to a value from a larger extension field, this resulted in
    an error. (This is now fixed).
    
    Unfortunately, the C code catching this error had a bug and allowed
    users to type "return" to continue while ignoring the conversion
    error. This was a bad idea, as the C code would be in an
    inconsistent state at this point, subsequently leading to a crash.
    
    This, too, has been fixed, by not allowing the user to ignore the
    error by entering "return".

  - The Fitting-free code and code inheriting PCGS is now using
    `IndicesEANormalSteps` (Reference: IndicesEANormalSteps) instead of
    `IndicesNormalSteps` (Reference: IndicesNormalSteps), as these
    indices are neither guaranteed, nor required to be maximally refined
    when restricting to subgroups.

  - A bug that caused a break loop in the computation of the Hall
    subgroup for groups having a trivial Fitting subgroup.

  - Including a `break` or `continue` statement in a function body but
    not in a loop now gives a syntax error instead of failing at run
    time.

  - `GroupGeneralMappingByImages` (Reference:
    GroupGeneralMappingByImages) now verifies that that image of a
    mapping is contained in its range.

  - Fixed a bug in caching the degree of transformation that could lead
    to a non-identity transformation accidentally changing its value to
    the identity transformation.

  - Fixed the problem with using Windows default browser as a help
    viewer using `SetHelpViewer("browser");`.

##### 4.1-2 New and updated packages since **GAP** 4.7.8

At the time of the release of **GAP** 4.7.8 there were 119 packages
redistributed with **GAP**. New packages that have been added to the
redistribution since the release of **GAP** 4.7.8 are:

  - **CAP** (Categories, Algorithms, Programming) package by Sebastian
    Gutsche, Sebastian Posur and Øystein Skartsæterhagen, together with
    three associated packages **GeneralizedMorphismsForCAP**,
    **LinearAlgebraForCAP** and **ModulePresentationsForCAP** (all three
    - by Sebastian Gutsche and Sebastian Posur).

  - **Digraphs** package by Jan De Beule, Julius Jonušas, James
    Mitchell, Michael Torpey and Wilf Wilson, which provides
    functionality to work with graphs, digraphs, and multidigraphs.

  - **FinInG** package by John Bamberg, Anton Betten, Philippe Cara, Jan
    De Beule, Michel Lavrauw and Max Neunhöffer for computation in
    Finite Incidence Geometry.

  - **HeLP** package by Andreas Bächle and Leo Margolis, which computes
    constraints on partial augmentations of torsion units in integral
    group rings using a method developed by Luthar, Passi and Hertweck.
    The package can be employed to verify the Zassenhaus Conjecture and
    the Prime Graph Question for finite groups, once their characters
    are known. It uses an interface to the software package **4ti2** to
    solve integral linear inequalities.

  - **matgrp** package by Alexander Hulpke, which provides an interface
    to the solvable radical functionality for matrix groups, building on
    constructive recognition.

  - **NormalizInterface** package by Sebastian Gutsche, Max Horn and
    Christof Söger, which provides a GAP interface to **Normaliz**,
    enabling direct access to the complete functionality of
    **Normaliz**, such as computations in affine monoids, vector
    configurations, lattice polytopes, and rational cones.

  - **profiling** package by Christopher Jefferson for transforming
    profiles produced by `ProfileLineByLine` (Reference:
    ProfileLineByLine) and `CoverageLineByLine` (Reference:
    CoverageLineByLine) into a human-readable form.

  - **Utils** package by Sebastian Gutsche, Stefan Kohl and Christopher
    Wensley, which provides a collection of utility functions gleaned
    from many packages.

  - **XModAlg** package by Zekeriya Arvasi and Alper Odabas, which
    provides a collection of functions for computing with crossed
    modules and Cat1-algebras and morphisms of these
structures.

#### 4.2 **GAP** 4.8.3 (March 2016)

##### 4.2-1 Changes in the core **GAP** system introduced in **GAP** 4.8.3

New features:

  - New function `TestPackage` (Reference: TestPackage) to run standard
    tests (if available) for a single package in the current **GAP**
    session (also callable via `make testpackage PKGNAME=pkgname` to run
    package tests in the same settings that are used for testing **GAP**
    releases).

Improved and extended functionality:

  - `TestDirectory` (Reference: TestDirectory) now prints a special
    status message to indicate the outcome of the test (this is
    convenient for automated testing). If necessary, this message may be
    suppressed by using the option `suppressStatusMessage`

  - Improved output of tracing methods (which may be invoked, for
    example, with `TraceAllMethods` (Reference: TraceAllMethods)) by
    displaying filename and line number in some more cases.

Changed functionality:

  - Fixed some inconsistencies in the usage of `IsGeneratorsOfSemigroup`
    (Reference: IsGeneratorsOfSemigroup).

Fixed bugs that could lead to incorrect results:

  - Fallback methods for conjugacy classes, that were never intended for
    infinite groups, now use `IsFinite` (Reference: IsFinite) filter to
    prevent them being called for infinite groups. \[Reported by Gabor
    Horvath\]

Fixed bugs that could lead to break loops:

  - Calculating stabiliser for the alternating group caused a break loop
    in the case when it defers to the corresponding symmetric group.

  - It was not possible to use `DotFileLatticeSubgroups` (Reference:
    DotFileLatticeSubgroups) for a trivial group. \[Reported by Sergio
    Siccha\]

  - A break loop while computing `AutomorphismGroup` (Reference:
    AutomorphismGroup) for `TransitiveGroup(12,269)`. \[Reported by
    Ignat Soroko\]

  - A break loop while computing conjugacy classes of `PSL(6,4)`.
    \[Reported by Martin Macaj\]

Other fixed bugs:

  - Fix for using Firefox as a default help viewer with `SetHelpViewer`
    (Reference: SetHelpViewer). \[Reported by Tom
McDonough\]

#### 4.3 **GAP** 4.8.4 (June 2016)

##### 4.3-1 Changes in the core **GAP** system introduced in **GAP** 4.8.4

New features:

  - The **GAP** distribution now includes `bin/BuildPackages.sh`, a
    script which can be started from the `pkg` directory via
    `../bin/BuildPackages.sh` and will attempt to build as many packages
    as possible. It replaces the `InstPackages.sh` script which was not
    a part of the **GAP** distribution and had to be downloaded
    separately from the **GAP** website. The new script is more robust
    and simplifies adding new packages with binaries, as it requires no
    adjustments if the new package supports the standard `./configure;
    make` build procedure.

Improved and extended functionality:

  - `SimpleGroup` (Reference: SimpleGroup) now produces more informative
    error message in the case when `AtlasGroup` ([AtlasRep:
    AtlasGroup](../../pkg/atlasrep/doc/chap.md#X80AABEE783363B70))
    could not load the requested group.

  - An info message with the suggestion to use `InfoPackageLoading`
    (Reference: InfoPackageLoading) will now be displayed when
    `LoadPackage` (Reference: LoadPackage) returns `fail` (unless
    **GAP** is started with `-b` option).

  - The build system will now enable C++ support in GMP only if a
    working C++ compiler is detected.

  - More checks were added when embedding coefficient rings or rational
    numbers into polynomial rings in order to forbid adding polynomials
    in different characteristic.

Fixed bugs that could lead to crashes:

  - Fixed the crash in `--cover` mode when reading files with more than
    65,536 lines.

Fixed bugs that could lead to incorrect results:

  - Fixed an error in the code for partial permutations that occurred on
    big-endian systems. \[Reported by Bill Allombert\]

  - Fixed the kernel method for `Remove` (Reference: Remove) with one
    argument, which failed to reduce the length of a list to the
    position of the last bound entry. \[Reported by Peter Schauenburg\]

Fixed bugs that could lead to break loops:

  - Fixed the break loop while using `Factorization` (Reference:
    factorization) on permutation groups by removing some old code that
    relied on further caching in `Factorization`. \[Reported by Grahame
    Erskine\]

  - Fixed a problem with computation of maximal subgroups in an almost
    simple group. \[Reported by Ramon Esteban Romero\]

  - Added missing methods for `Intersection2` (Reference: Intersection2)
    when one of the arguments is an empty list. \[Reported by Wilf
    Wilson\]

Other fixed bugs:

  - Fixed several bugs in `RandomPrimitivePolynomial` (Reference:
    RandomPrimitivePolynomial). \[Reported by Nusa Zidaric\]

  - Fixed several problems with `Random` (Reference: Random) on long
    lists in 64-bit GAP
installations.

#### 4.4 **GAP** 4.8.5 (September 2016)

##### 4.4-1 Changes in the core **GAP** system introduced in **GAP** 4.8.5

Improved and extended functionality:

  - The error messages produced when an unexpected `fail` is returned
    were made more clear by explicitly telling that the result should
    not be boolean or `fail` (before it only said "not a boolean").

  - For consistency, both `NrTransitiveGroups` ([transgrp:
    NrTransitiveGroups](../../pkg/transgrp/htm/CHAP001.htm#SECT001)) and
    `TransitiveGroup` ([transgrp:
    TransitiveGroup](../../pkg/transgrp/htm/CHAP001.htm#SECT001)) now
    disallow the transitive group of degree 1.

Fixed bugs that could lead to incorrect results:

  - A bug in the code for algebraic field extensions over non-prime
    fields that may cause, for example, a list of all elements of the
    extension not being a duplicate-free. \[Reported by Huta Gana\]

  - So far, `FileString` ([GAPDoc:
    FileString](../../pkg/GAPDoc-1.6.2/doc/chap.md#X7E14D32181FBC3C3))
    only wrote files of sizes less than 2G and did not indicate an error
    in case of larger strings. Now strings of any length can be written,
    and in the case of a failure the corresponding system error is
    shown.

Fixed bugs that could lead to break loops:

  - `NaturalHomomorphismByIdeal` (Reference: NaturalHomomorphismByIdeal)
    was not reducing monomials before forming a quotient ring, causing a
    break loop on some inputs. \[Reported by Dmytro Savchuk\]

  - A bug in `DefaultInfoHandler` (Reference: DefaultInfoHandler) caused
    a break loop on startup with the setting `SetUserPreference(
    "InfoPackageLoadingLevel", 4 )`\`. \[Reported by Mathieu Dutour\]

  - The `Iterator` (Reference: Iterator) for permutation groups was
    broken when the `StabChainMutable` (Reference: StabChainMutable for
    a group) of the group was not reduced, which can reasonably happen
    as the result of various
algorithms.

#### 4.5 **GAP** 4.8.6 (November 2016)

##### 4.5-1 Changes in the core **GAP** system introduced in **GAP** 4.8.6

Fixed bugs that could lead to break loops:

  - Fixed regression in the **GAP** kernel code introduced in **GAP**
    4.8.5 and breaking `StringFile` ([GAPDoc:
    StringFile](../../pkg/GAPDoc-1.6.2/doc/chap.md#X7E14D32181FBC3C3))
    ability to work with compressed files. \[Reported by Bill
    Allombert\]

#### 4.6 **GAP** 4.8.7 (March 2017)

##### 4.6-1 Changes in the core **GAP** system introduced in **GAP** 4.8.7

Fixed bugs that could lead to incorrect results:

  - Fixed a regression from **GAP** 4.7.6 when reading compressed files
    after a workspace is loaded. Before the fix, if **GAP** is started
    with the `-L` option (load workspace), using `ReadLine` (Reference:
    ReadLine) on the input stream for a compressed file returned by
    `InputTextFile` (Reference: InputTextFile) only returned the first
    character. \[Reported by Bill Allombert\]

Other fixed bugs:

  - Fixed compiler warning occurring when **GAP** is compiled with gcc
    6.2.0. \[Reported by Bill Allombert\]

##### 4.6-2 New and updated packages since **GAP** 4.8.6

This release contains updated versions of 19 packages from **GAP** 4.8.6
distribution. Additionally, the following package has been added for the
redistribution with **GAP**:

  - **lpres** package (author: René Hartung, maintainer: Laurent
    Bartholdi) to work with L-presented groups, namely groups given by a
    finite generating set and a possibly infinite set of relations given
    as iterates of finitely many seed relations by a finite set of
    endomorphisms. The package implements nilpotent quotient,
    Todd-Coxeter and Reidemeister-Schreier algorithms for such
groups.

#### 4.7 **GAP** 4.8.8 (August 2017)

##### 4.7-1 Changes in the core **GAP** system introduced in **GAP** 4.8.8

Fixed bugs that could lead to incorrect results:

  - Fixed a bug in `RepresentativeAction` (Reference:
    RepresentativeAction) producing incorrect answers for both symmetric
    and alternating groups, with both `OnTuples` (Reference: OnTuples)
    and `OnSets` (Reference: OnSets), by producing elements outside the
    group. \[Reported by Mun See Chang\]

Fixed bugs that could lead to break loops:

  - Fixed a bug in `RepresentativeAction` (Reference:
    RepresentativeAction) for S\_n and A\_n acting on non-standard
    domains.

Other fixed bugs:

  - Fixed a problem with checking the path to a file when using the
    default browser as a help viewer on Windows. \[Reported by Jack
    Saunders\]

##### 4.7-2 New and updated packages since **GAP** 4.8.7

This release contains updated versions of 29 packages from **GAP** 4.8.7
distribution. Additionally, the **Gpd** package (author: Chris Wensley)
has been renamed to **Groupoids**.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap5.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
