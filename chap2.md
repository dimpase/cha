Goto Chapter: [Top](chap0.html) [1](chap1.html) [2](chap2.html)
[3](chap3.html) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap7.html) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap0.html)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap1.html)   [\[Next Chapter\]](chap3.html) 

[\[MathJax on\]](chap2_mj.html)

[2 Changes between **GAP** 4.9 and **GAP**
4.10](chap2.html#X795B238486D0ABCD)

 [2.1 **GAP** 4.10.0 (November 2018)](chap2.html#X7AC99045788C39ED) 

  
  [2.1-1 New features and major changes](chap2.html#X7D6E0C387D13B429) 
  
  [2.1-2 Improved and extended
functionality](chap2.html#X7D7FE19B7F8235E5)    
  [2.1-3 Changed documentation](chap2.html#X82A7352D8641A11E)    
  [2.1-4 Fixed bugs that could lead to
crashes](chap2.html#X842F3691816406D6)    
  [2.1-5 Fixed bugs that could lead to incorrect
results](chap2.html#X7D8629AE7B18F72B)    
  [2.1-6 Fixed bugs that could lead to break
loops](chap2.html#X86F4ECE78773DE72)    
  [2.1-7 Other fixed bugs](chap2.html#X8470A7907B252827)    
  [2.1-8 Removed or obsolete
functionality](chap2.html#X7E82CC3E7C54ACEC)    
  [2.1-9 Packages](chap2.html#X844ECC8387ADC6D7) 

 [2.2 **GAP** 4.10.1 (February 2019)](chap2.html#X858254CF7D9DE943) 

  
  [2.2-1 Changes in the core **GAP** system introduced in **GAP**
4.10.1](chap2.html#X785A404B8565D020)    
  [2.2-2 New and updated packages since **GAP**
4.10.0](chap2.html#X7D3DEF227BFDF572) 

 [2.3 **GAP** 4.10.2 (June 2019)](chap2.html#X788B3576809DC149) 

  
  [2.3-1 Changes in the core **GAP** system introduced in **GAP**
4.10.21](chap2.html#X7B1174477F4EB41B)    
  [2.3-2 New and updated packages since **GAP**
4.10.1](chap2.html#X7A4D9C2B857C8C78) 

### 2 Changes between **GAP** 4.9 and **GAP** 4.10

This chapter contains an overview of the most important changes
introduced in **GAP** 4.10.0 release (the first public release of
**GAP** 4.10). Later it will also contain information about subsequent
update releases for **GAP** 4.10.

These changes are also listed on the Wiki page
<https://github.com/gap-system/GAP/wiki/gap-4.10-release-notes>.

#### 2.1 **GAP** 4.10.0 (November 2018)

##### 2.1-1 New features and major changes

  - **Reduce impact of immediate methods**  
    **GAP** allows declaring so-called "immediate methods". The idea is
    that these are very simple and fast methods which are immediately
    called if information about an object becomes known, in order to
    perform some quick deduction. For example, if the order of a group
    is set, there might be immediate methods which update the filters
    `IsFinite` and `IsTrivial` of the group suitably.
    
    While this can be very elegant and useful in interactive **GAP**
    sessions, the overhead for running these immediate methods and
    applying their results can become a major factor in the runtime of
    complex computations that create thousands or millions of objects.
    
    To address this, various steps were taken:
    
      - some immediate methods were turned into regular methods;
    
      - a special handlers for `SetSize` was created that deduces
        properties which previously were taken care of by immediate
        methods;
    
      - some immediate methods were replaced by implications (set via
        `InstallTrueMethod`), a mechanism that essentially adds zero
        overhead, unlike immediate methods;
    
      - various group constructors were modified to precompute and
        preset properties of freshly created group objects, to avoid
        triggering immediate methods for these.
    
    As a result of these and other changes, consider the following
    example; with **GAP** 4.9, it takes about 130 seconds on one test
    system, while with **GAP** 4.10 it runs in about 22 seconds, i.e.,
    more than six times
        faster.
    
        G:=PcGroupCode( 741231213963541373679312045151639276850536621925972119311,11664);;
        IsomorphismGroups(G,PcGroupCode(CodePcGroup(G),Size(G)))<>fail;
    
    Relevant pull requests and issues:
    [\#2386](https://github.com/gap-system/gap/pull/2386),
    [\#2387](https://github.com/gap-system/gap/pull/2387),
    [\#2522](https://github.com/gap-system/gap/pull/2522).

  - **Change definition of `IsPGroup` to *not* require finiteness**  
    This is a small change in terms of amount of code changed, but we
    list it here as it has a potential (albeit rather unlikely) impact
    on the code written by **GAP** users: In the past, the **GAP**
    manual entry for `IsPGroup` defined p-groups as being finite groups,
    which differs from the most commonly used definition for p-groups.
    Note however that there was not actual implication installed from
    `IsPGroup` to `IsFinite`, so it always was possible to actually
    created infinite groups in the filter `IsPGroup`. In **GAP** 4.10,
    we adjusted (in
    [\#1545](https://github.com/gap-system/gap/pull/1545)) the
    documentation for `IsPGroup` to the commonly accepted definition for
    p-groups. In addition, code in the **GAP** library and in packages
    using `IsPGroup` was audited and (in a very few cases) adjusted to
    explicitly check `IsFinite` (see e.g.
    [\#2866](https://github.com/gap-system/gap/pull/2866)).

  - **Experimental support for using the **Julia** garbage collector**  
    It is now possible to use the garbage collector of the [Julia
    language](https://julialang.org) instead of **GAP**'s traditional
    **GASMAN** garbage collector. This is partly motivated by a desire
    to allow tight integration with **GAP** and **Julia** in the future.
    Warning: right now, this is *slower*, and also requires a patched
    version of **Julia**.
    
    Relevant pull requests:
    [\#2092](https://github.com/gap-system/gap/pull/2092),
    [\#2408](https://github.com/gap-system/gap/pull/2408),
    [\#2461](https://github.com/gap-system/gap/pull/2461),
    [\#2485](https://github.com/gap-system/gap/pull/2485),
    [\#2495](https://github.com/gap-system/gap/pull/2495),
    [\#2672](https://github.com/gap-system/gap/pull/2672),
    [\#2688](https://github.com/gap-system/gap/pull/2688),
    [\#2793](https://github.com/gap-system/gap/pull/2793),
    [\#2904](https://github.com/gap-system/gap/pull/2904),
    [\#2905](https://github.com/gap-system/gap/pull/2905),
    [\#2931](https://github.com/gap-system/gap/pull/2931).

  - ****libGAP** (work in progress)**  
    We now provide a experimental way to allow 3rd party code to link
    **GAP** as a library; this is based on the **libGAP** code by
    [SageMath](https://www.sagemath.org), but different: while we aim to
    provide the same functionality, we do not rename any symbols, and we
    do not provide the same API. We hope that a future version of
    **SageMath** can drop its custom modifications for **GAP** and use
    this interface instead. Work is underway to achieve this goal. If
    you are interested in this kind of interface, please get in touch
    with us to help us improve it. See also [this
    email](https://mail.gap-system.org/pipermail/gap/2018-August/001123.html).
    
    To get an idea how **libGAP** works, you can configure **GAP** as
    normal, and then execute `make testlibgap` which will build a small
    program that uses some of the existing API and links **GAP**.
    Relevant pull requests:
    
      - [\#1690](https://github.com/gap-system/gap/pull/1690) Add a
        callback to `FuncJUMP_TO_CATCH`
    
      - [\#2528](https://github.com/gap-system/gap/pull/2528) Add
        `IsLIBGAP` constant
    
      - [\#2702](https://github.com/gap-system/gap/pull/2702) Add
        **GAP** kernel API
    
      - [\#2723](https://github.com/gap-system/gap/pull/2723) Introduce
        command line options `--norepl` and `--nointeract`

##### 2.1-2 Improved and extended functionality

  - [\#2041](https://github.com/gap-system/gap/pull/2041) Teach
    `FrattiniSubgroup` methods to check for solvability

  - [\#2053](https://github.com/gap-system/gap/pull/2053) Faster
    computation of modular inverses of integers

  - [\#2057](https://github.com/gap-system/gap/pull/2057) Various
    changes, including:
    
      - Improve computation of automorphism groups for fp groups (we
        still recommend to instead first convert the group to a
        computationally nice representation, such as a perm or pc group)
    
      - Add `MinimalFaithfulPermutationDegree` (Reference:
        MinimalFaithfulPermutationDegree) attribute for finite groups
    
      - Improve performance of `GQuotients(F,G)` when `F` is an fp group
    
      - Some other performance and documentation tweaks

  - [\#2061](https://github.com/gap-system/gap/pull/2061),
    [\#2086](https://github.com/gap-system/gap/pull/2086),
    [\#2159](https://github.com/gap-system/gap/pull/2159),
    [\#2306](https://github.com/gap-system/gap/pull/2306) Speed up
    `GcdInt`, `LcmInt`, `PValuation`, `RootInt`, `SmallestRootInt`,
    `IsPrimePowerInt`

  - [\#2063](https://github.com/gap-system/gap/pull/2063) Teach **GAP**
    that BPSW pseudo primes less than 2^64 are all known to be prime
    (the previous limit was 10^13)

  - [\#2091](https://github.com/gap-system/gap/pull/2091) Refactor
    `DeclareAttribute` and `NewAttribute` (arguments are now verified
    stricter)

  - [\#2115](https://github.com/gap-system/gap/pull/2115),
    [\#2204](https://github.com/gap-system/gap/pull/2204),
    [\#2272](https://github.com/gap-system/gap/pull/2272) Allow
    (optionally) passing a random source to many more `Random` methods
    than before, and also to `RandomList`

  - [\#2136](https://github.com/gap-system/gap/pull/2136) Add
    `shortname` entry to record returned by
    `IsomorphismTypeInfoFiniteSimpleGroup`

  - [\#2181](https://github.com/gap-system/gap/pull/2181) Implement
    `Union(X,Y)`, where `X` and `Y` are in `PositiveIntegers`,
    `NonnegativeIntegers`, `Integers`, `GaussianIntegers`, `Rationals`,
    `GaussianRationals`, `Cyclotomics`, at least where a suitable output
    object exists (we already provided `Intersection(X,Y)` for a long
    time)

  - [\#2185](https://github.com/gap-system/gap/pull/2185) Implement
    `IsCentral(M,x)`, where `M` is a magma, monoid, group, ring,
    algebra, etc. and `x` an element of `M` (the documentation already
    claimed that these exist for a long time)

  - [\#2199](https://github.com/gap-system/gap/pull/2199) Optimize
    true/false conditions when coding if-statements

  - [\#2200](https://github.com/gap-system/gap/pull/2200) Add
    `StringFormatted` (Reference: StringFormatted), `PrintFormatted`
    (Reference: PrintFormatted), `PrintToFormatted` (Reference:
    PrintToFormatted)

  - [\#2222](https://github.com/gap-system/gap/pull/2222) Turn hidden
    implications into actual implications

  - [\#2223](https://github.com/gap-system/gap/pull/2223) Add operation
    `PositionsBound` (Reference: PositionsBound) which returns the set
    of all bound positions in a given list

  - [\#2224](https://github.com/gap-system/gap/pull/2224),
    [\#2243](https://github.com/gap-system/gap/pull/2243),
    [\#2340](https://github.com/gap-system/gap/pull/2340) Improve
    `ShowImpliedFilters` output

  - [\#2225](https://github.com/gap-system/gap/pull/2225) Improve
    `LocationFunc` for kernel function

  - [\#2232](https://github.com/gap-system/gap/pull/2232) Make
    `ValueGlobal` faster

  - [\#2242](https://github.com/gap-system/gap/pull/2242) Add global
    function `CycleFromList` (Reference: CycleFromList)

  - [\#2244](https://github.com/gap-system/gap/pull/2244) Make `rank`
    argument to `InstallImmediateMethod` optional, similar to
    `InstallMethod`

  - [\#2274](https://github.com/gap-system/gap/pull/2274) Ensure uniform
    printing of machine floats `nan`, `inf`, `-inf` across different
    operating systems

  - [\#2287](https://github.com/gap-system/gap/pull/2287) Turn
    `IsInfiniteAbelianizationGroup` into a property and add some
    implications involving it

  - [\#2293](https://github.com/gap-system/gap/pull/2293),
    [\#2602](https://github.com/gap-system/gap/pull/2602),
    [\#2718](https://github.com/gap-system/gap/pull/2718) Improved and
    documented various kernel and memory debugging facilities (requires
    recompiling **GAP** with `--enable-debug`, `--enable-valgrind` resp.
    `--enable-memory-checking`)

  - [\#2308](https://github.com/gap-system/gap/pull/2308) Method
    selection code was rewritten from **GAP** to C

  - [\#2326](https://github.com/gap-system/gap/pull/2326) Change
    `SimpleGroup` to perform better input validation and improve or
    correct error message for type 2E

  - [\#2375](https://github.com/gap-system/gap/pull/2375) Make `last2`
    and `last3` available in break loops

  - [\#2383](https://github.com/gap-system/gap/pull/2383) Speed
    improvements for automorphism groups

  - [\#2393](https://github.com/gap-system/gap/pull/2393) Track location
    of `InstallMethod` and `InstallImmediateMethod`

  - [\#2422](https://github.com/gap-system/gap/pull/2422) Improve
    tracking of `InstallMethod` and `DeclareOperation`

  - [\#2426](https://github.com/gap-system/gap/pull/2426) Speed up
    `InverseMatMod` with integer modulus

  - [\#2427](https://github.com/gap-system/gap/pull/2427) Fix and
    complete support for custom functions (i.e., objects which can be
    called like a function using `obj(arg)` syntax)

  - [\#2456](https://github.com/gap-system/gap/pull/2456) Add
    `PrintString` and `ViewString` methods for character tables

  - [\#2474](https://github.com/gap-system/gap/pull/2474) Change
    `IsConstantRationalFunction` and `IsUnivariateRationalFunction` to
    return `false` if input isn't a rational function (instead of an
    error)

  - [\#2474](https://github.com/gap-system/gap/pull/2474) Add methods
    for multiplying rational functions over arbitrary rings by rationals

  - [\#2496](https://github.com/gap-system/gap/pull/2496) Finite groups
    whose order is known and not divisible by 4 are immediately marked
    as solvable

  - [\#2509](https://github.com/gap-system/gap/pull/2509) Rewrite
    support for `.gz` compressed files to use **zlib**, now works on
    Windows

  - [\#2519](https://github.com/gap-system/gap/pull/2519),
    [\#2524](https://github.com/gap-system/gap/pull/2524),
    [\#2531](https://github.com/gap-system/gap/pull/2531) `Test` now
    rejects empty inputs and warns if the input contains no test

  - [\#2574](https://github.com/gap-system/gap/pull/2574) When reporting
    syntax errors, **GAP** now "underlines" the complete last token, not
    just the position where it stopped parsing

  - [\#2577](https://github.com/gap-system/gap/pull/2577),
    [\#2613](https://github.com/gap-system/gap/pull/2613) Add quadratic
    and bilinear add forms for `Omega(e,d,q)`

  - [\#2598](https://github.com/gap-system/gap/pull/2598) Add
    `BannerFunction` to `PackageInfo.g`

  - [\#2606](https://github.com/gap-system/gap/pull/2606) Improve
    `PageSource` to work on functions that were read from a file given
    by a relative path

  - [\#2616](https://github.com/gap-system/gap/pull/2616) Speed up
    computation of quotients of associative words by using existing (but
    previously unused) kernel functions for that

  - [\#2640](https://github.com/gap-system/gap/pull/2640) Work on
    `MatrixObj` and `VectorObj`

  - [\#2654](https://github.com/gap-system/gap/pull/2654) Make `Sortex`
    stable

  - [\#2666](https://github.com/gap-system/gap/pull/2666),
    [\#2686](https://github.com/gap-system/gap/pull/2686) Add
    `IsBiCoset` attribute for right cosets, which is true if the right
    coset is also a left coset

  - [\#2684](https://github.com/gap-system/gap/pull/2684) Add
    `NormalSubgroups` methods for symmetric and alternating permutation
    groups

  - [\#2726](https://github.com/gap-system/gap/pull/2726) Validate
    `PackageInfo.g` when loading packages

  - [\#2733](https://github.com/gap-system/gap/pull/2733) Minor
    performance improvements, code cleanup and very local fixes

  - [\#2750](https://github.com/gap-system/gap/pull/2750) Reject some
    invalid uses of `~`

  - [\#2812](https://github.com/gap-system/gap/pull/2812) Reduce memory
    usage and improve performance the MTC (modified Todd-Coxeter) code
    that was rewritten in **GAP** 4.9, but which was much slower than
    the old (but buggy) code it replaced; the difference is now small,
    but the old code still is faster in some case.

  - [\#2855](https://github.com/gap-system/gap/pull/2855),
    [\#2877](https://github.com/gap-system/gap/pull/2877) Add
    `IsPackageLoaded` (Reference: IsPackageLoaded)

  - [\#2878](https://github.com/gap-system/gap/pull/2878) Speed up
    conjugacy tests for permutation by using random permutation of
    points when selecting base in centraliser

  - [\#2899](https://github.com/gap-system/gap/pull/2899)
    `TestDirectory` reports number of failures and failed files

##### 2.1-3 Changed documentation

  - [\#2192](https://github.com/gap-system/gap/pull/2192) Add an example
    for `PRump` (Reference: PRump)

  - [\#2219](https://github.com/gap-system/gap/pull/2219) Add examples
    to the relations chapter (see Reference: Relations).

  - [\#2360](https://github.com/gap-system/gap/pull/2360) Document
    `IdealDecompositionsOfPolynomial` (Reference:
    IdealDecompositionsOfPolynomial) (also accessible via its synonym
    `DecomPoly`) and `NormalizerViaRadical` (Reference:
    NormalizerViaRadical)

  - [\#2366](https://github.com/gap-system/gap/pull/2366) Do not
    recommend avoiding `X` which is a synonym for `Indeterminate`
    (Reference: Indeterminate)

  - [\#2432](https://github.com/gap-system/gap/pull/2432) Correct a
    claim about the index of `Omega(e,p,q)` in `SO(e,p,q)` (see `SO`
    (Reference: SO))

  - [\#2549](https://github.com/gap-system/gap/pull/2549) Update
    documentation of the `-T` command line option (see Reference:
    Command Line Options)

  - [\#2551](https://github.com/gap-system/gap/pull/2551) Add new
    command line option `--alwaystrace` which ensures error backtraces
    are printed even if break loops are disabled (see Reference: Command
    Line Options)

  - [\#2681](https://github.com/gap-system/gap/pull/2681) Documented
    `ClassPositionsOfSolvableRadical` (Reference:
    ClassPositionsOfSolvableRadical) and
    `CharacterTableOfNormalSubgroup` (Reference:
    CharacterTableOfNormalSubgroup)

  - [\#2834](https://github.com/gap-system/gap/pull/2834) Improve manual
    section about `Info` classes (see Reference: Info Functions)

##### 2.1-4 Fixed bugs that could lead to crashes

  - [\#2154](https://github.com/gap-system/gap/pull/2154),
    [\#2242](https://github.com/gap-system/gap/pull/2242),
    [\#2294](https://github.com/gap-system/gap/pull/2294),
    [\#2344](https://github.com/gap-system/gap/pull/2344),
    [\#2353](https://github.com/gap-system/gap/pull/2353),
    [\#2736](https://github.com/gap-system/gap/pull/2736) Fix several
    potential (albeit rare) crashes related to garbage collection

  - [\#2196](https://github.com/gap-system/gap/pull/2196) Fix crash in
    `HasKeyBag` on SPARC Solaris 11

  - [\#2305](https://github.com/gap-system/gap/pull/2305) Fix crash in
    `PartialPerm([1,2,8],[3,4,1,2]);`

  - [\#2477](https://github.com/gap-system/gap/pull/2477) Fix crash if
    `~` is used to modify list

  - [\#2499](https://github.com/gap-system/gap/pull/2499) Fix crash in
    the kernel functions `{8,16,32}Bits_ExponentSums3`

  - [\#2601](https://github.com/gap-system/gap/pull/2601) Fix crash in
    `MakeImmutable(rec(x:=~));`

  - [\#2665](https://github.com/gap-system/gap/pull/2665) Fix crash when
    an empty filename is passed

  - [\#2711](https://github.com/gap-system/gap/pull/2711) Fix crash when
    tracing buggy attribute/property methods that fail to return a value

  - [\#2766](https://github.com/gap-system/gap/pull/2766) Fix obscure
    crashes by using `a!{l}` syntax inside a function (this syntax never
    was fully implemented and was unusable, and now has been removed)

##### 2.1-5 Fixed bugs that could lead to incorrect results

  - [\#2085](https://github.com/gap-system/gap/pull/2085) Fix bugs in
    `JenningsLieAlgebra` and `PCentralLieAlgebra` that could e.g. lead
    to incorrect `LieLowerCentralSeries` results

  - [\#2113](https://github.com/gap-system/gap/pull/2113) Fix
    `IsMonomial` for reducible characters and some related improvements

  - [\#2183](https://github.com/gap-system/gap/pull/2183) Fix bug in
    `ValueMolienSeries` that could lead to `ValueMolienSeries(m,0)` not
    being 1

  - [\#2198](https://github.com/gap-system/gap/pull/2198) Make
    multiplication of larger integers by tiny floats commutative (e.g.
    now 10.^-300 \* 10^400 and 10^400 \* 10.^-300 both give infinity,
    while before 10^400 \* 10.^-300 gave 1.e+100); also ensure various
    strange inputs, like `rec()^1;`, produce an error (instead of
    setting `a^1 = a` and `1*a = a` for almost any kind of object)

  - [\#2273](https://github.com/gap-system/gap/pull/2273) Fix
    `TypeOfOperation` for setters of and-filters

  - [\#2275](https://github.com/gap-system/gap/pull/2275),
    [\#2280](https://github.com/gap-system/gap/pull/2280) Fix
    `IsFinitelyGeneratedGroup` and `IsFinitelyGeneratedMonoid` to not
    (incorrectly) assume that a given infinite generating set implies
    that there is no finite generating set

  - [\#2311](https://github.com/gap-system/gap/pull/2311) Do not set
    `IsFinitelyGeneratedGroup` for finitely generated magmas which are
    not groups

  - [\#2452](https://github.com/gap-system/gap/pull/2452) Fix bug that
    allowed creating empty magmas in the filters `IsTrivial` and
    `IsMagmaWithInverses`

  - [\#2689](https://github.com/gap-system/gap/pull/2689) Fix `LogFFE`
    to not return negative results on 32 bit systems

  - [\#2766](https://github.com/gap-system/gap/pull/2766) Fix a bug that
    allowed creating corrupt permutations

##### 2.1-6 Fixed bugs that could lead to break loops

  - [\#2040](https://github.com/gap-system/gap/pull/2040) Raise error if
    eager float literal conversion fails (fixes
    [\#1105](https://github.com/gap-system/gap/pull/1105))

  - [\#2582](https://github.com/gap-system/gap/pull/2582) Fix
    `ExtendedVectors` for trivial vector spaces

  - [\#2617](https://github.com/gap-system/gap/pull/2617) Fix
    `HighestWeightModule` for Lie algebras in certain cases

  - [\#2829](https://github.com/gap-system/gap/pull/2829) Fix
    `ShallowCopy` for `IteratorOfCartesianProduct`

##### 2.1-7 Other fixed bugs

  - [\#2220](https://github.com/gap-system/gap/pull/2220) Do not set
    `IsSubsetLocallyFiniteGroup` filter for finite fields

  - [\#2268](https://github.com/gap-system/gap/pull/2268) Handle spaces
    in filenames of gzipped filenames

  - [\#2269](https://github.com/gap-system/gap/pull/2269),
    [\#2660](https://github.com/gap-system/gap/pull/2660) Fix some
    issues with the interface between **GAP** and **XGAP** (or other
    similar frontends for **GAP**)

  - [\#2315](https://github.com/gap-system/gap/pull/2315) Prevent
    creation of groups of floats, just like we prevent creation of
    groups of cyclotomics

  - [\#2350](https://github.com/gap-system/gap/pull/2350) Fix prompt
    after line continuation

  - [\#2365](https://github.com/gap-system/gap/pull/2365) Fix tracing of
    mutable variants of `One`/`Zero`/`Inv`/`AInv`

  - [\#2398](https://github.com/gap-system/gap/pull/2398) Fix
    `PositionStream` to report correct position

  - [\#2467](https://github.com/gap-system/gap/pull/2467) Fix support
    for identifiers of length 1023 and more

  - [\#2470](https://github.com/gap-system/gap/pull/2470) Do not display
    garbage after certain syntax error messages

  - [\#2533](https://github.com/gap-system/gap/pull/2533) Fix composing
    a map with an identity map to not produce a range that is too big

  - [\#2638](https://github.com/gap-system/gap/pull/2638) Fix result of
    `Random` on 64 bit big endian system to match those on little
    endian, and on 32 bit big endian

  - [\#2672](https://github.com/gap-system/gap/pull/2672) Fix
    `MakeImmutable` for weak pointer objects, which previously failed to
    make subobjects immutable

  - [\#2674](https://github.com/gap-system/gap/pull/2674) Fix
    `SaveWorkspace` to return `false` in case of an error, and `true`
    only if successful

  - [\#2681](https://github.com/gap-system/gap/pull/2681) Fix `Display`
    for the character table of a trivial group

  - [\#2716](https://github.com/gap-system/gap/pull/2716) When seeding a
    Mersenne twister from a string, the last few characters would not be
    used if the string length was not a multiple of 4. Fixing this may
    lead to different series of random numbers being generated.

  - [\#2720](https://github.com/gap-system/gap/pull/2720) Reject
    workspaces made in a **GAP** with readline support in a **GAP**
    without, and vice versa, instead of crashing

  - [\#2657](https://github.com/gap-system/gap/pull/2657) The subobjects
    of the mutable values of the attributes `ComputedClassFusions`,
    `ComputedIndicators`, `ComputedPowerMaps`, `ComputedPrimeBlockss`
    are now immutable. This makes sure that the values are not
    accidentally changed. This change may have side-effects in users'
    code, for example the object returned by `0 * ComputedPowerMaps(
    CharacterTable( "A5" ) )[2]` had been a mutable list before the
    change, and is an immutable list from now on.

##### 2.1-8 Removed or obsolete functionality

  - Remove multiple undocumented internal functions. Nobody should have
    been using them, but if you were, you may extract it from a previous
    **GAP** release that still contained it.
    ([\#2670](https://github.com/gap-system/gap/pull/2670),
    [\#2781](https://github.com/gap-system/gap/pull/2781) and more)

  - [\#2335](https://github.com/gap-system/gap/pull/2335) Remove several
    functions and variables that were deprecated for a long time:
    `DiagonalizeIntMatNormDriven`, `DeclarePackageDocumentation`,
    `KERNEL_VERSION`, `GAP_ROOT_PATHS`, `LOADED_PACKAGES`,
    `PACKAGES_VERSIONS`, `IsTuple`, `StateRandom`, `RestoreStateRandom`,
    `StatusRandom`, `FactorCosetOperation`, `ShrinkCoeffs`,
    `ExcludeFromAutoload`, `CharacterTableDisplayPrintLegendDefault`,
    `ConnectGroupAndCharacterTable`, `IsSemilatticeAsSemigroup`,
    `CreateCompletionFiles`, `PositionFirstComponent`, `ViewLength`

  - [\#2502](https://github.com/gap-system/gap/pull/2502) Various kernel
    functions now validate their inputs more carefully (making it harder
    to produce bad effects by accidentally passing bad data to them)

  - [\#2700](https://github.com/gap-system/gap/pull/2700) Forbid
    constructors with 0 arguments (they were never meaningful)

##### 2.1-9 Packages

**GAP** 4.10.0 distribution includes 140 packages.

Added to the distribution:

  - The **francy** package by Manuel Martins, which provides an
    interface to draw graphics using objects. This interface allows
    creation of directed and undirected graphs, trees, line charts, bar
    charts and scatter charts. These graphical objects are drawn inside
    a canvas that includes a space for menus and to display informative
    messages. Within the canvas it is possible to interact with the
    graphical objects by clicking, selecting, dragging and zooming.

  - The **JupyterVis** package by Nathan Carter, which is intended for
    use in Jupyter Notebooks running **GAP** kernels and adds
    visualization tools for use in such notebooks, such as charts and
    graphs.

No longer redistributed with **GAP**:

  - The **linboxing** package has been unusable (it does not compile)
    for several years now, and is unmaintained. It was therefore dropped
    from the **GAP** package distribution. If anybody is willing to take
    over and fix the package, the latest sources are available at
    <https://github.com/gap-packages/linboxing>.

  - The **recogbase** package has been merged into the `recog` package,
    and therefore is no longer distributed with
**GAP**.

#### 2.2 **GAP** 4.10.1 (February 2019)

##### 2.2-1 Changes in the core **GAP** system introduced in **GAP** 4.10.1

Fixes in the experimental way to allow 3rd party code to link **GAP** as
a library:

  - Do not start a session when loading workspace if `--nointeract`
    command line option is used
    ([\#2840](https://github.com/gap-system/gap/pull/2840)).

  - Add prototype for `GAP_Enter` and `GAP_Leave` macros
    ([\#3096](https://github.com/gap-system/gap/pull/3096)).

  - Prevent infinite recursions in `echoandcheck` and `SyWriteandcheck`
    ([\#3102](https://github.com/gap-system/gap/pull/3102)).

  - Remove `environ` arguments and `sysenviron`
    ([\#3111](https://github.com/gap-system/gap/pull/3111)).

Fixes in the experimental support for using the Julia garbage collector:

  - Fix task scanning for the Julia GC
    ([\#2969](https://github.com/gap-system/gap/pull/2969)).

  - Fix stack marking for the Julia GC
    ([\#3199](https://github.com/gap-system/gap/pull/3199)).

  - Specify the Julia binary instead of the Julia prefix
    ([\#3243](https://github.com/gap-system/gap/pull/3243)).

  - Export Julia `CFLAGS`, `LDFLAGS`, and `LIBS` to `sysinfo.gap`
    ([\#3248](https://github.com/gap-system/gap/pull/3248)).

  - Change `MPtr` Julia type of **GAP** objects to be a subtype of the
    abstract Julia `GapObj` type provided by the Julia package
    `GAPTypes.jl`
    ([\#3497](https://github.com/gap-system/gap/pull/3497)).

Improved and extended functionality:

  - Always generate `sysinfo.gap` (previously, it was only generated if
    the "compatibility mode" of the build system was enabled)
    ([\#3042](https://github.com/gap-system/gap/pull/3042)).

  - Add support for writing to `ERROR_OUTPUT` from kernel code
    ([\#3043](https://github.com/gap-system/gap/pull/3043)).

  - Add `make check`
    ([\#3285](https://github.com/gap-system/gap/pull/3285)).

Changed documentation:

  - Fix documentation of `NumberFFVector` (Reference: NumberFFVector)
    and add an example
    ([\#3079](https://github.com/gap-system/gap/pull/3079)).

Fixed bugs that could lead to crashes:

  - Fix readline crash when using autocomplete with
    `colored-completion-prefix` turned on in Bash
    ([\#2991](https://github.com/gap-system/gap/pull/2991)).

  - Fix overlapping `memcpy` in `APPEND_LIST`
    ([\#3216](https://github.com/gap-system/gap/pull/3216)).

Fixed bugs that could lead to incorrect results:

  - Fix bugs in the code for partial permutations
    ([\#3220](https://github.com/gap-system/gap/pull/3220)).

  - Fix a bug in `Gcd` for polynomials not returning standard
    associates, introduced in **GAP** 4.10.0
    ([\#3227](https://github.com/gap-system/gap/pull/3227)).

Fixed bugs that could lead to break loops:

  - Change `GroupWithGenerators` (Reference: GroupWithGenerators) to
    accept collections again (to avoid regressions in code that relied
    on this undocumented behavior)
    ([\#3095](https://github.com/gap-system/gap/pull/3095)).

  - Fix `ShallowCopy` (Reference: ShallowCopy) for for a Knuth-Bendix
    rewriting system
    ([\#3128](https://github.com/gap-system/gap/pull/3128)). \[Reported
    by Ignat Soroko\]

  - Fix `IsMonomialMatrix` (Reference: IsMonomialMatrix) to work with
    compressed matrices
    ([\#3149](https://github.com/gap-system/gap/pull/3149)). \[Reported
    by Dominik Bernhardt\]

Removed or obsolete functionality:

  - Disable `make install` (previously it displayed a warning which
    often got ignored)
    ([\#3005](https://github.com/gap-system/gap/pull/3005)).

Other fixed bugs:

  - Fix some errors which stopped triggering a break loop
    ([\#3013](https://github.com/gap-system/gap/pull/3013)).

  - Fix compiler error with GCC 4.4.7
    ([\#3026](https://github.com/gap-system/gap/pull/3026)).

  - Fix string copying logic
    ([\#3071](https://github.com/gap-system/gap/pull/3071)).

##### 2.2-2 New and updated packages since **GAP** 4.10.0

**GAP** 4.10.1 distribution contains 145 packages, including updated
versions of 35 packages from **GAP** 4.10.0 distribution, and also the
following five new packages:

  - **MajoranaAlgebras** by Markus Pfeiffer and Madeleine Whybrow, which
    constructs Majorana representations of finite groups.

  - **PackageManager** by Michael Torpey, providing a collection of
    functions for installing and removing **GAP** packages, with the
    eventual aim of becoming a full pip-style package manager for the
    **GAP** system.

  - **Thelma** by Victor Bovdi and Vasyl Laver, implementing algorithms
    to deal with threshold elements.

  - **walrus** by Markus Pfeiffer, providing methods for proving
    hyperbolicity of finitely presented groups in polynomial time.

  - **YangBaxter** by Leandro Vendramin and Alexander Konovalov, which
    provides functionality to construct classical and skew braces, and
    also includes a database of classical and skew braces of small
    orders.

#### 2.3 **GAP** 4.10.2 (June 2019)

##### 2.3-1 Changes in the core **GAP** system introduced in **GAP** 4.10.21

Improvements in the experimental way to allow 3rd party code to link
**GAP** as a library:

  - Add `GAP_AssignGlobalVariable` and
    `GAP_IsNameOfWritableGlobalVariable` to the **libGAP** API
    ([\#3438](https://github.com/gap-system/gap/pull/3438)).

Fixes in the experimental support for using the **Julia** garbage
collector:

  - Fix of a problem where the Julia GC during a partial sweep frees
    some, but not all objects of an unreachable data structure, and also
    may erroneously try to mark the deallocated objects
    ([\#3412](https://github.com/gap-system/gap/pull/3412)).

  - Fix stack scanning for the Julia GC when GAP is used as a library
    ([\#3432](https://github.com/gap-system/gap/pull/3432)).

Fixed bugs that could lead to crashes:

  - Fix a bug in `TransformationListList` (Reference:
    TransformationListList for a source and destination) which could
    cause a crash
    ([\#3463](https://github.com/gap-system/gap/pull/3463)).

Fixed bugs that could lead to incorrect results:

  - Fix a bug in `ClassPositionsOfLowerCentralSeries` (Reference:
    ClassPositionsOfLowerCentralSeries). \[Reported by Frieder Ladisch\]
    ([\#3321](https://github.com/gap-system/gap/pull/3321)).

  - Fix a dangerous bug in the comparison of large negative integers,
    introduced in GAP 4.10.1: if `x` and `y` were equal, but not
    identical, large negative numbers then `x < y` returned `true`
    instead of `false`.
    ([\#3478](https://github.com/gap-system/gap/pull/3478)).

Fixed bugs that could lead to break loops:

  - If the group has been obtained as subgroup from a Fitting
    free/solvable radical computation, the data is inherited and might
    not guarantee that the factor group really is Fitting free. Added a
    check and an assertion to catch this situation
    ([\#3154](https://github.com/gap-system/gap/pull/3154)).

  - Fix declaration of sparse action homomorphisms
    ([\#3281](https://github.com/gap-system/gap/pull/3281)).

  - `LatticeViaRadical` called `ClosureSubgroupNC` (Reference:
    ClosureSubgroupNC) assuming that the parent contained all
    generators. It now calls `ClosureSubgroup` (Reference:
    ClosureSubgroup) instead, since this can not be always guaranteed
    (this could happen, for example, in perfect subgroup computation).
    Also added an assertion to `ClosureSubgroupNC` (Reference:
    ClosureSubgroupNC) to catch this situation in other cases.
    \[Reported by Serge Bouc\]
    ([\#3397](https://github.com/gap-system/gap/pull/3397)).

  - Fix a "method not found" error in `SubdirectProduct` (Reference:
    SubdirectProduct)
    ([\#3485](https://github.com/gap-system/gap/pull/3485)).

Other fixed bugs:

  - Fix corner case in modified Todd-Coxeter algorithm when relator is
    trivial ([\#3311](https://github.com/gap-system/gap/pull/3311)).

##### 2.3-2 New and updated packages since **GAP** 4.10.1

**GAP** 4.10.1 distribution contains 145 packages, including updated
versions of 55 packages from **GAP** 4.10.1 distribution,

A new package **MonoidalCategories** by Mohamed Barakat, Sebastian
Gutsche and Sebastian Posur have been added to the distribution. It is
based on the **CAP** package and implements monoidal structures for
**CAP**.

Unfortunately we had to withdraw the **QaoS** package from distribution
of GAP, as the servers it crucially relies on for its functionality have
been permanently retired some time ago and are not coming back (see
<https://github.com/gap-packages/qaos/issues/13> for details).

 [\[Top of Book\]](chap0.html)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap1.html)   [\[Next Chapter\]](chap3.html) 

Goto Chapter: [Top](chap0.html) [1](chap1.html) [2](chap2.html)
[3](chap3.html) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap7.html) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
