Goto Chapter: [Top](chap.md) [1](chap.md) [2](chap.md)
[3](chap.md) [4](chap.md) [5](chap.md) [6](chap.md)
[7](chap.md) [8](chap.md) [9](chap.md) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap.md#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap.md) 

[\[MathJax on\]](chap3_mj.html)

[3 Changes between **GAP** 4.8 and **GAP**
4.9](chap.md#X7DE3F944789F9676)

 [3.1 **GAP** 4.9.1 (May 2018)](chap.md#X7E74F2127F858880) 

  
  [3.1-1 Changes in the core **GAP** system introduced in **GAP**
4.9](chap.md#X87E35B7B7D7B2AF6)    
  [3.1-2 **HPC-GAP**](chap.md#X7F52B77B7DBACC17)    
  [3.1-3 New and updated packages since **GAP**
4.8.10](chap.md#X875343D47A7B5E62) 

 [3.2 **GAP** 4.9.2 (July 2018)](chap.md#X788623D37D59433D) 

  
  [3.2-1 Changes in the core **GAP** system introduced in **GAP**
4.9.2](chap.md#X80F675A48712F934)    
  [3.2-2 New and updated packages since **GAP**
4.9.1](chap.md#X85F5CB9C80D89E10) 

 [3.3 **GAP** 4.9.3 (September 2018)](chap.md#X7DCF1B2984AEB7F0) 

  
  [3.3-1 Changes in the core **GAP** system introduced in **GAP**
4.9.3](chap.md#X878606AD8708A3AF)    
  [3.3-2 New and updated packages since **GAP**
4.9.2](chap.md#X7C655E8782735518) 

### 3 Changes between **GAP** 4.8 and **GAP** 4.9

This chapter contains an overview of the most important changes
introduced in **GAP** 4.9.1 release (the 1st public release of **GAP**
4.9). Later it will also contain information about subsequent update
releases for **GAP** 4.9.

These changes are also listed on the Wiki page
<https://github.com/gap-system/GAP/wiki/gap-4.9-release-notes>.

#### 3.1 **GAP** 4.9.1 (May 2018)

##### 3.1-1 Changes in the core **GAP** system introduced in **GAP** 4.9

Major changes:

  - Merged **HPC-GAP** into **GAP**. For details, please refer to
    Subsection [3.1-2](chap.md#X7F52B77B7DBACC17) at the end of these
    release notes.

  - **GAP** has a new build system, which resolves many quirks and
    issues with the old system, and will be easier to maintain. For
    regular users, the usual `./configure && make` should work fine as
    before. If you are interested in technical details on the new build
    system, take a look at `README.buildsys.md`.

  - The guidelines for developing **GAP** packages were revised and
    moved from the Example package to Reference: Using and Developing
    GAP Packages ([\#484](https://github.com/gap-system/gap/pull/484)).

  - In addition to supporting single argument lambda functions like `a
    -> a+1`, **GAP** now supports lambdas with fewer or more than one
    argument, or even a variable number. E.g. `{a,b} -> a+b` is a
    shorthand for `function(a,b) return a+b; end`. For details on how to
    use this, see Reference: Function. For technical details, e.g. why
    we did not choose the syntax `(a,b) -> a+b`, see
    [\#490](https://github.com/gap-system/gap/pull/490).

  - Function calls, list accesses and records accesses now can be
    nested. For example, you can now write `y := f().x;` (essentially
    equivalent to `y := f();; y := y.x;`), which previously would have
    resulted in an error; see
    [\#457](https://github.com/gap-system/gap/issues/457) and
    [\#462](https://github.com/gap-system/gap/pull/462)).

  - The libraries of small, primitive and transitive groups which
    previously were an integral part of **GAP** were split into three
    separate packages
    [PrimgGrp](http://gap-packages.github.io/primgrp/),
    [SmallGrp](https://gap-packages.github.io/smallgrp/) and
    [TransGrp](http://www.math.colostate.edu/~hulpke/transgrp/). For
    backwards compatibility, these are required packages in **GAP** 4.9
    (i.e., **GAP** will not start without them). We plan to change this
    for **GAP** 4.10 (see
    [\#2434](https://github.com/gap-system/gap/pull/2434)), once all
    packages which currently implicitly rely on these new packages had
    time to add explicit dependencies on them
    ([\#1650](https://github.com/gap-system/gap/pull/1650),
    [\#1714](https://github.com/gap-system/gap/pull/1714)).

  - The performance of **GAP**'s sorting functions (such as `Sort`
    (Reference: Sort), `SortParallel` (Reference: SortParallel), etc.)
    has been substantially improved, in some examples by more than a
    factor of four: as a trivial example, compare the timing for
    `Sort([1..100000000] * 0)`. As a side effect, the result of sorting
    lists with equal entries may produce different answers compared to
    previous **GAP** versions. If you would like to make your code
    independant of the exact employed sorting algorithm, you can use the
    newly added `StableSort` (Reference: StableSort), `StableSortBy`
    (Reference: StableSortBy) and `StableSortParallel` (Reference:
    StableSortParallel). (For some technical details, see
    [\#609](https://github.com/gap-system/gap/pull/609)).

  - We removed our old home-grown big integer code, and instead always
    use the GMP based big integer code. This means that the GMP library
    now is a required dependency, not just an optional one. Note that
    GAP has been using GMP big integer arithmetic for a long time by
    default, and we also have been bundling GMP with GAP. So this change
    mostly removed code that was never in use for most users.

  - A number of improvements have been made to `Random` (Reference:
    Random). These may lead to different sequences of numbers being
    created. On the up side, many more methods for `Random` (Reference:
    Random) (and other `RandomXYZ` operations) now optionally take an
    explicit `RandomSource` (Reference: RandomSource) as first argument
    (but not yet all: help with issue
    [\#1098](https://github.com/gap-system/gap/pull/1098) is welcome).
    Some relevant pull requests:
    
      - Allow creating random permutations using a random source
        ([\#1165](https://github.com/gap-system/gap/pull/1165))
    
      - Let more `Random` (Reference: Random) methods use an alternative
        source ([\#1168](https://github.com/gap-system/gap/pull/1168))
    
      - Help `Random` (Reference: Random) methods to use `RandomSource`
        (Reference: RandomSource)
        ([\#810](https://github.com/gap-system/gap/pull/810))
    
      - Remove uses of old random generator
        ([\#808](https://github.com/gap-system/gap/pull/808))
    
      - Fix `Random` (Reference: Random) on long (\>2^28) lists
        ([\#781](https://github.com/gap-system/gap/pull/781))
    
      - Fix `RandomUnimodularMat` (Reference: RandomUnimodularMat)
        ([\#1511](https://github.com/gap-system/gap/pull/1511))
    
      - Use `RandomSource` (Reference: RandomSource) in a few more
        places ([\#1599](https://github.com/gap-system/gap/pull/1599))

  - The output and behaviour of the profiling system has been
    substantially improved:
    
      - Make profiling correctly handle the same file being opened
        multiple times
        ([\#1069](https://github.com/gap-system/gap/pull/1069))
    
      - Do not profile the `return` statements (Reference: return)
        inserted into the end of functions
        ([\#1073](https://github.com/gap-system/gap/pull/1073))
    
      - Ensure we reset `OutputtedFilenameList` in profiling when a
        workspace is restored
        ([\#1164](https://github.com/gap-system/gap/pull/1164))
    
      - Better tracking of amounts of memory allocated and time spent in
        the garbage collector
        ([\#1806](https://github.com/gap-system/gap/pull/1806))
    
      - Allow profiling of memory usage
        ([\#1808](https://github.com/gap-system/gap/pull/1808))
    
      - Remove profiling limit on files with \<= 2^16 lines
        ([\#1913](https://github.com/gap-system/gap/pull/1913))

  - In many cases **GAP** now outputs the filename and location of
    functions in helpful places, e.g. in error messages or when
    displaying compiled functions. We also try to always use the format
    `FILENAME:LINE`, which various utilities already know how to parse
    (e.g. in **iTerm2**, cmd-clicking on such a string can be configured
    to open an editor for the file at the indicated line). For some
    technical details, see
    [\#469](https://github.com/gap-system/gap/pull/469),
    [\#755](https://github.com/gap-system/gap/pull/755\)),
    [\#1058](https://github.com/gap-system/gap/pull/1058).

  - **GAP** now supports constant variables, whose value cannot change
    anymore during runtime; code using such constants can then be
    slightly optimized by **GAP**. E.g. if `foo` is turned into a
    constant variable bound to the value `false`, then **GAP** can
    optimize `if foo then ... fi;` blocks completely away. For details,
    see `MakeConstantGlobal` (Reference: MakeConstantGlobal) in
    Reference: More About Global Variables.
    ([\#1682](https://github.com/gap-system/gap/pull/1682),
    [\#1770](https://github.com/gap-system/gap/pull/1770))

Other changes:

  - Enhance `StructureDescription` (Reference: StructureDescription)
    with a major rewrite, enhancing `DirectFactorsOfGroup"` and adding
    `SemidirectDecompositions`; the core algorithm now also works for
    infinite abelian groups. Further, it became faster by quickly
    finding abelian direct factors and recognizing several cases where
    the group is direct indecomposable.
    ([\#379](https://github.com/gap-system/gap/pull/379),
    [\#763](https://github.com/gap-system/gap/pull/763),
    [\#985](https://github.com/gap-system/gap/pull/985))

  - Mark `FittingSubgroup` (Reference: FittingSubgroup) and
    `FrattiniSubgroup` (Reference: FrattiniSubgroup) as nilpotent
    ([\#400](https://github.com/gap-system/gap/pull/400))

  - Add method for `Socle` (Reference: Socle) for finite nilpotent
    groups ([\#402](https://github.com/gap-system/gap/pull/402))

  - Change `ViewString` (Reference: ViewString) and `String` (Reference:
    String) methods for various inverse semigroups and monoids
    ([\#438](https://github.com/gap-system/gap/pull/438),
    [\#880](https://github.com/gap-system/gap/pull/880),
    [\#882](https://github.com/gap-system/gap/pull/882))

  - Enhance some nilpotent and p-group attributes
    ([\#442](https://github.com/gap-system/gap/pull/442))

  - Improve `Union` (Reference: Union) for a list with many ranges
    ([\#444](https://github.com/gap-system/gap/pull/444))

  - Add `UserHomeExpand` (Reference: UserHomeExpand), a function to
    expand `~` in filenames.
    ([\#447](https://github.com/gap-system/gap/pull/447))

  - Extra hint in "No Method Found" error message if one of the
    arguments is `fail`
    ([\#460](https://github.com/gap-system/gap/pull/460))

  - Tell Sylow subgroups of natural A\_n or S\_n their size when we make
    them ([\#529](https://github.com/gap-system/gap/pull/529))

  - Some small enhancements on Sylow and Hall subgroup computations,
    mostly for nilpotent groups.
    ([\#535](https://github.com/gap-system/gap/pull/535))

  - Remove `.zoo` archive related tools
    ([\#540](https://github.com/gap-system/gap/pull/540))

  - Add new `FrattiniSubgroup` (Reference: FrattiniSubgroup),
    `MaximalNormalSubgroups` (Reference: MaximalNormalSubgroups),
    `MinimalNormalSubgroups` (Reference: MinimalNormalSubgroups) and
    `Socle` (Reference: Socle) methods for abelian and/or solvable
    groups, even infinite ones. The new methods are only triggered if
    the group already knows that it is abelian and/or solvable.
    ([\#552](https://github.com/gap-system/gap/pull/552),
    [\#583](https://github.com/gap-system/gap/pull/583),
    [\#606](https://github.com/gap-system/gap/pull/606))

  - New attribute `NormalHallSubgroups`, returning a list of all normal
    Hall subgroups of a group.
    ([\#561](https://github.com/gap-system/gap/pull/561))

  - Add `ComplementClassesRepresentatives` (Reference:
    ComplementClassesRepresentatives) fallback method for arbitrary
    groups ([\#563](https://github.com/gap-system/gap/pull/563))

  - ([\#612](https://github.com/gap-system/gap/pull/612)) Add parsing of
    hex literals in strings, e.g. `"\0x61"` is turned into `"a"`
    ([\#612](https://github.com/gap-system/gap/pull/612))

  - Collection of enhancements
    ([\#683](https://github.com/gap-system/gap/pull/683))

  - Various speed improvements to polynomial factorisation and the
    **GAP** MeatAxe
    ([\#720](https://github.com/gap-system/gap/pull/720),
    [\#1027](https://github.com/gap-system/gap/pull/1027))

  - The code and documentation for transformations is improved and
    corrected in many instances
    ([\#727](https://github.com/gap-system/gap/pull/727),
    [\#732](https://github.com/gap-system/gap/pull/732))

  - Change `RootFFE` to optionally takes a field or field size as first
    argument, from which the roots will be taken
    ([\#761](https://github.com/gap-system/gap/pull/761))

  - Change `Permanent` (Reference: Permanent) from a global function to
    an attribute ([\#777](https://github.com/gap-system/gap/pull/777))

  - Add `CallFuncListWrap` (Reference: CallFuncListWrap) to wrap return
    value to allow distinguishing between functions which return and
    functions which don't
    ([\#824](https://github.com/gap-system/gap/pull/824))

  - Allow repeated use of same `DeclareSynonym` (Reference:
    DeclareSynonym) call
    ([\#835](https://github.com/gap-system/gap/pull/835))

  - New implementation of modified Todd-Coxeter (the old one had bugs,
    see [\#302](https://github.com/gap-system/gap/issues/302)),
    [\#843](https://github.com/gap-system/gap/pull/843))

  - New functionality: Cannon/Holt automorphisms and others
    ([\#878](https://github.com/gap-system/gap/pull/878))

  - Add `IsPowerfulPGroup` (Reference: IsPowerfulPGroup) property, and a
    `FrattiniSubgroup` (Reference: FrattiniSubgroup) method for powerful
    p-groups ([\#894](https://github.com/gap-system/gap/pull/894))

  - Improve performance for group isomorphism/automorphisms
    ([\#896](https://github.com/gap-system/gap/pull/896),
    [\#968](https://github.com/gap-system/gap/pull/968))

  - Make `ListX` (Reference: ListX), `SetX` (Reference: SetX), `SumX`
    (Reference: SumX) and `ProductX` (Reference: ProductX) support lists
    which are not collections
    ([\#903](https://github.com/gap-system/gap/pull/903))

  - Some improvements for `LatticeByCyclicExtension` (Reference:
    LatticeByCyclicExtension)
    ([\#905](https://github.com/gap-system/gap/pull/905))

  - Add helpers to retrieve information about operations and filters:
    `CategoryByName` (Reference: CategoryByName), `TypeOfOperation`
    (Reference: TypeOfOperation), `FilterByName` (Reference:
    FilterByName), `FiltersObj` (Reference: FiltersObj), `FiltersType`
    (Reference: FiltersType), `IdOfFilter`, `IdOfFilterByName`,
    `IsAttribute` (Reference: IsAttribute), `IsCategory` (Reference:
    IsCategory), `IsProperty` (Reference: IsProperty),
    `IsRepresentation` (Reference: IsRepresentation)
    ([\#925](https://github.com/gap-system/gap/pull/925),
    [\#1593](https://github.com/gap-system/gap/pull/1593))

  - Add case-insensitive autocomplete
    ([\#928](https://github.com/gap-system/gap/pull/928))

  - Give better error message if a help file is missing
    ([\#939](https://github.com/gap-system/gap/pull/939))

  - Add `LowercaseChar` (Reference: LowercaseChar) and `UppercaseChar`
    (Reference: UppercaseChar)
    ([\#952](https://github.com/gap-system/gap/pull/952))

  - Add `PositionMaximum` (Reference: PositionMaximum) and
    `PositionMinimum` (Reference: PositionMinimum)
    ([\#956](https://github.com/gap-system/gap/pull/956))

  - Switching default command history length from infinity to 1000
    ([\#960](https://github.com/gap-system/gap/pull/960))

  - Allow conversion of `-infinity` to float via `NewFloat` (Reference:
    NewFloat) and `MakeFloat` (Reference: MakeFloat)
    ([\#961](https://github.com/gap-system/gap/pull/961))

  - Add option `NoPrecomputedData` to avoid use of data libraries in
    certain computations (useful if one wants to verify the content of
    these data libraries)
    ([\#986](https://github.com/gap-system/gap/pull/986))

  - Remove one-argument version of `AsPartialPerm` (Reference:
    AsPartialPerm for a permutation and a set of positive integers) for
    a transformation
    ([\#1036](https://github.com/gap-system/gap/pull/1036))

  - Partial perms now have a `MultiplicativeZero` (Reference:
    MultiplicativeZero) rather than a `Zero` (Reference: Zero), since
    they are multiplicative rather than additive elements
    ([\#1040](https://github.com/gap-system/gap/pull/1040))

  - Various enhancements:
    ([\#1046](https://github.com/gap-system/gap/pull/1046))
    
      - A bugfix in `NaturalHomomorphismByIdeal` (Reference:
        NaturalHomomorphismByIdeal) for polynomial rings
    
      - Improvements in handling solvable permutation groups
    
      - The trivial group now is a member of the perfect groups library
    
      - Improvements in using tabulated data for maximal subgroups

  - New tests for group constructors and some fixes (e.g. `GO(1,4,5)`
    used to trigger an error)
    ([\#1053](https://github.com/gap-system/gap/pull/1053))

  - Make `HasSolvableFactorGroup` slightly more efficient
    ([\#1062](https://github.com/gap-system/gap/pull/1062))

  - Enhance `HasXXFactorGroup`
    ([\#1066](https://github.com/gap-system/gap/pull/1066))

  - Remove GAP4stones from tests
    ([\#1072](https://github.com/gap-system/gap/pull/1072))

  - `AsMonoid` (Reference: AsMonoid) and `AsSemigroup` (Reference:
    AsSemigroup) are now operations, and various bugs were resolved
    related to isomorphisms of semigroups and monoids
    ([\#1112](https://github.com/gap-system/gap/pull/1112))

  - Mark isomorphisms between trivial groups as bijective
    ([\#1116](https://github.com/gap-system/gap/pull/1116))

  - Speed up `RootMod` (Reference: RootMod) and `RootsMod` (Reference:
    RootsMod) for moduli with large prime factors; also add
    `IS_PROBAB_PRIME_INT` kernel function
    ([\#1141](https://github.com/gap-system/gap/pull/1141))

  - The search for the documentation of system setters and testers now
    returns corresponding attributes and properties
    ([\#1144](https://github.com/gap-system/gap/pull/1144))

  - Remove command line options `-c`, `-U`, `-i` and `-X`, add
    `--quitonbreak`
    ([\#1192](https://github.com/gap-system/gap/pull/1192),
    [\#1265](https://github.com/gap-system/gap/pull/1265),
    [\#1421](https://github.com/gap-system/gap/pull/1421),
    [\#1448](https://github.com/gap-system/gap/pull/1448))

  - Remove Itanium support
    ([\#1163](https://github.com/gap-system/gap/pull/1163))

  - Adding two strings now shows a more helpful error message
    ([\#1314](https://github.com/gap-system/gap/pull/1314))

  - Suppress `Unbound global variable` warning in `IsBound` (Reference:
    IsBound for a global variable)
    ([\#1334](https://github.com/gap-system/gap/pull/1334))

  - Increase warning level for Conway polynomial
    ([\#1363](https://github.com/gap-system/gap/pull/1363))

  - Performance improvements to maximal and intermediate subgroups, fix
    of `RepresentativeAction` (Reference: RepresentativeAction)
    ([\#1390](https://github.com/gap-system/gap/pull/1390))

  - Revise Chapter 52 of the reference manual (fp semigroups and
    monoids) ([\#1441](https://github.com/gap-system/gap/pull/1441))

  - Improve the performance of the `Info` (Reference: Info) statement
    ([\#1464](https://github.com/gap-system/gap/pull/1464),
    [\#1770](https://github.com/gap-system/gap/pull/1770))

  - When printing function bodies, avoid some redundant spaces
    ([\#1498](https://github.com/gap-system/gap/pull/1498))

  - Add kernel functions for directly accessing entries of GF2/8bit
    compressed matrices
    ([\#1585](https://github.com/gap-system/gap/pull/1585))

  - Add `String` (Reference: String) method for functions
    ([\#1591](https://github.com/gap-system/gap/pull/1591))

  - Check modules were compiled with the same version of **GAP** when
    loading them ([\#1600](https://github.com/gap-system/gap/pull/1600))

  - When printing function, reproduce `TryNextMethod()` correctly
    ([\#1613](https://github.com/gap-system/gap/pull/1613))

  - New "Bitfields" feature (Reference: Bitfields) providing efficient
    support for packing multiple data items into a single word for cache
    and memory efficiency
    ([\#1616](https://github.com/gap-system/gap/pull/1616))

  - Improved `bin/BuildPackages.sh`, in particular added option to abort
    upon failure ([\#2022](https://github.com/gap-system/gap/pull/2022))

  - Rewrote integer code (GMP) for better performance of certain large
    integer operations, and added kernel implementations of various
    functions, including these:
    
      - Add kernel implementations of `AbsInt` (Reference: AbsInt),
        `SignInt` (Reference: SignInt); add new kernel functions
        `ABS_RAT`, `SIGN_RAT`; and speed up Reference: mod, `RemInt`
        (Reference: RemInt), `QuoInt` (Reference: QuoInt) for divisors
        which are small powers of 2
        ([\#1045](https://github.com/gap-system/gap/pull/1045))
    
      - Add kernel implementations of `Jacobi` (Reference: Jacobi),
        `PowerModInt` (Reference: PowerModInt), `Valuation` (Reference:
        Valuation) (for integers), `PValuation` (Reference: PValuation)
        (for integers)
        ([\#1075](https://github.com/gap-system/gap/pull/1045))
    
      - Add kernel implementation of `Factorial` (Reference: Factorial)
        ([\#1969](https://github.com/gap-system/gap/pull/1969))
    
      - Add kernel implementation of `Binomial` (Reference: Binomial)
        ([\#1921](https://github.com/gap-system/gap/pull/1921))
    
      - Add kernel implementation of `LcmInt` (Reference: LcmInt)
        ([\#2019](https://github.com/gap-system/gap/pull/2019))

  - Check version of kernel for package versions
    ([\#1600](https://github.com/gap-system/gap/pull/1600))

  - Add new `AlgebraicExtensionNC` (Reference: AlgebraicExtensionNC)
    operation ([\#1665](https://github.com/gap-system/gap/pull/1665))

  - Add `NumberColumns` and `NumberRows` to `MatrixObj` interface
    ([\#1657](https://github.com/gap-system/gap/pull/1657))

  - `MinimalGeneratingSet` (Reference: MinimalGeneratingSet) returns an
    answer for non-cyclic groups that already have a generating set of
    size 2 (which hence is minimal)
    ([\#1755](https://github.com/gap-system/gap/pull/1755))

  - Add `GetWithDefault` (Reference: GetWithDefault) which returns the
    n-th element of the list if it is bound, and the default value
    otherwise ([\#1762](https://github.com/gap-system/gap/pull/1762))

  - Fast method for `ElmsBlist` when positions are a range with
    increment 1 ([\#1773](https://github.com/gap-system/gap/pull/1773))

  - Make permutations remember their inverses
    ([\#1831](https://github.com/gap-system/gap/pull/1831))

  - Add invariant forms for `GU(1,q)` and `SU(1,q)`
    ([\#1874](https://github.com/gap-system/gap/pull/1874))

  - Implement `StandardAssociate` (Reference: StandardAssociate) and
    `StandardAssociateUnit` (Reference: StandardAssociateUnit) for
    `ZmodnZ` (Reference: ZmodnZ), clarify documentation for
    `IsEuclideanRing` (Reference: IsEuclideanRing)
    ([\#1990](https://github.com/gap-system/gap/pull/1990))

  - Improve documentation and interface for floats
    ([\#2016](https://github.com/gap-system/gap/pull/2016))

  - Add `PositionsProperty` (Reference: PositionsProperty) method for
    non-dense lists
    ([\#2021](https://github.com/gap-system/gap/pull/2021))

  - Add `TrivialGroup(IsFpGroup)`
    ([\#2037](https://github.com/gap-system/gap/pull/2037))

  - Change `ObjectifyWithAttributes` (Reference:
    ObjectifyWithAttributes) to return the new objects
    ([\#2098](https://github.com/gap-system/gap/pull/2098))

  - Removed a never released undocumented **HPC-GAP** syntax extension
    which allowed to use a backtick/backquote as alias for
    `MakeImmutable` (Reference: MakeImmutable).
    ([\#2202](https://github.com/gap-system/gap/pull/2202)).

  - Various changes
    ([\#2253](https://github.com/gap-system/gap/pull/2253)):
    
      - Improve performance and memory usage of
        `ImageKernelBlocksHomomorphism"`
    
      - Document `LowIndexSubgroups` (Reference: LowIndexSubgroups)
    
      - Correct `ClassesSolvableGroup` (Reference: ClassesSolvableGroup)
        documentation to clarify that it requires, but does not test
        membership
    
      - fix `IsNaturalGL` (Reference: IsNaturalGL) for trivial matrix
        groups with empty generating set

  - Make it possible to interrupt `repeat continue; until false;` and
    similar tight loops with "Ctrl-C"
    ([\#2259](https://github.com/gap-system/gap/pull/2259)).

  - Improved **GAP** testing infrastructure, extended **GAP** test
    suite, and increased code coverage

  - Countless other tweaks, improvements, fixes were applied to the
    **GAP** library, kernel and manual

Fixed bugs:

  - Fix bugs in `NormalSubgroups` (Reference: NormalSubgroups) and
    `PrintCSV` (Reference: PrintCSV)
    ([\#433](https://github.com/gap-system/gap/pull/433))

  - Fix nice monomorphism dispatch for `HallSubgroup` (Reference:
    HallSubgroup) (e.g. fixes `HallSubgroup(GL(3,4), [2,3])`)
    ([\#559](https://github.com/gap-system/gap/pull/559))

  - Check for permutations whose degree would exceed the internal limit,
    and document that limit
    ([\#581](https://github.com/gap-system/gap/pull/581))

  - Fix segfault after quitting from the break loop in certain cases
    ([\#709](https://github.com/gap-system/gap/pull/709) which fixes
    [\#397](https://github.com/gap-system/gap/issues/397))

  - Fix rankings for `Socle` (Reference: Socle) and
    `MinimalNormalSubgroups` (Reference: MinimalNormalSubgroups)
    ([\#711](https://github.com/gap-system/gap/pull/711))

  - Make key and attribute values immutable
    ([\#714](https://github.com/gap-system/gap/pull/714))

  - Make `OnTuples([-1], (1,2))` return an error
    ([\#718](https://github.com/gap-system/gap/pull/718))

  - Fix bug in `NewmanInfinityCriterion` (Reference:
    NewmanInfinityCriterion) which could corrupt the `PCentralSeries`
    (Reference: PCentralSeries) attribute
    ([\#719](https://github.com/gap-system/gap/pull/719))

  - The length of the list returned by `OnSetsPerm` is now properly set
    ([\#731](https://github.com/gap-system/gap/pull/731))

  - Fix `Remove` (Reference: Remove) misbehaving when last member of
    list with gaps in it is removed
    ([\#766](https://github.com/gap-system/gap/pull/766))

  - Fix bugs in various methods for Rees (0-)matrix semigroups:
    `IsFinite` (Reference: IsFinite), `IsOne` (Reference: IsOne),
    `Enumerator` (Reference: Enumerator), `IsReesMatrixSemigroup`
    (Reference: IsReesMatrixSemigroup) and `IsReesZeroMatrixSemigroup`
    (Reference: IsReesZeroMatrixSemigroup)
    ([\#768](https://github.com/gap-system/gap/pull/768),
    [\#1676](https://github.com/gap-system/gap/pull/1676))

  - Fix `IsFullTransformationSemigroup` (Reference:
    IsFullTransformationSemigroup) to work correctly for the full
    transformation semigroup of degree 0
    ([\#769](https://github.com/gap-system/gap/pull/769))

  - Fix printing very large (\> 2^28 points) permutations
    ([\#782](https://github.com/gap-system/gap/pull/782))

  - Fix `Intersection([])`
    ([\#854](https://github.com/gap-system/gap/pull/854))

  - Fix crash in `IsKernelFunction` for some inputs
    ([\#876](https://github.com/gap-system/gap/pull/876))

  - Fix bug in `ShortestVectors` (Reference: ShortestVectors) which
    could cause `OrthogonalEmbeddings` (Reference: OrthogonalEmbeddings)
    to enter a break loop
    ([\#941](https://github.com/gap-system/gap/pull/941))

  - Fix crash in some methods involving partial perms
    ([\#948](https://github.com/gap-system/gap/pull/948))

  - `FreeMonoid(0)` no longer satisfies `IsGroup` (Reference: IsGroup)
    ([\#950](https://github.com/gap-system/gap/pull/950))

  - Fix crash when invoking weak pointer functions on invalid arguments
    ([\#1009](https://github.com/gap-system/gap/pull/1009))

  - Fix a bug parsing character constants
    ([\#1015](https://github.com/gap-system/gap/pull/1015))

  - Fix several bugs and crashes in `Z(p,d)` for invalid arguments, e.g.
    `Z(4,5)`, `Z(6,3)`
    ([\#1029](https://github.com/gap-system/gap/pull/1029),
    [\#1059](https://github.com/gap-system/gap/pull/1059),
    [\#1383](https://github.com/gap-system/gap/pull/1383),
    [\#1573](https://github.com/gap-system/gap/pull/1573))

  - Fix starting **GAP** on systems with large inodes
    ([\#1033](https://github.com/gap-system/gap/pull/1033))

  - Fix `NrFixedPoints` (Reference: NrFixedPoints for a partial perm)
    and `FixedPointsOfPartialPerm` (Reference: FixedPointsOfPartialPerm
    for a partial perm) for a partial perm and a partial perm semigroup
    (they used to return the moved points rather than the fixed points)
    ([\#1034](https://github.com/gap-system/gap/pull/1034))

  - Fix `MeetOfPartialPerms` (Reference: MeetOfPartialPerms) when given
    a collection of 1 or 0 partial perms
    ([\#1035](https://github.com/gap-system/gap/pull/1035))

  - The behaviour of `AsPartialPerm` (Reference: AsPartialPerm for a
    transformation and a set of positive integer) for a transformation
    and a list is corrected
    ([\#1036](https://github.com/gap-system/gap/pull/1036))

  - `IsomorphismReesZeroMatrixSemigroup` (Reference:
    IsomorphismReesZeroMatrixSemigroup) for a 0-simple semigroup is now
    defined on the zero of the source and range semigroups
    ([\#1038](https://github.com/gap-system/gap/pull/1038))

  - Fix isomorphisms from finitely-presented monoids to
    finitely-presented semigroups, and allow isomorphisms from
    semigroups to fp-monoids
    ([\#1039](https://github.com/gap-system/gap/pull/1039))

  - Fix `One` (Reference: One) for a partial permutation semigroup
    without generators
    ([\#1040](https://github.com/gap-system/gap/pull/1040))

  - Fix `MemoryUsage` (Reference: MemoryUsage) for positional and
    component objects
    ([\#1044](https://github.com/gap-system/gap/pull/1044))

  - Fix `PlainString` causing immutable strings to become mutable
    ([\#1096](https://github.com/gap-system/gap/pull/1096))

  - Restore support for sparc64
    ([\#1124](https://github.com/gap-system/gap/pull/1124))

  - Fix a problem with \`\<\` for transformations, which could give
    incorrect results
    ([\#1130](https://github.com/gap-system/gap/pull/1130))

  - Fix crash when comparing recursive data structures such as `[~] =
    [~]` ([\#1151](https://github.com/gap-system/gap/pull/1151))

  - Ensure output of `TrivialGroup(IsPermGroup)` has zero generators
    ([\#1247](https://github.com/gap-system/gap/pull/1247))

  - Fix for applying the `InverseGeneralMapping` (Reference:
    InverseGeneralMapping) of an `IsomorphismFpSemigroup` (Reference:
    IsomorphismFpSemigroup)
    ([\#1259](https://github.com/gap-system/gap/pull/1259))

  - Collection of improvements and fixes:
    ([\#1294](https://github.com/gap-system/gap/pull/1294))
    
      - A fix for quotient rings of rings by structure constants
    
      - Generic routine for transformation matrix to rational canonical
        form
    
      - Speed improvements to block homomorphisms
    
      - New routines for conjugates or subgroups with desired
        containment
    
      - Performance improvement for conjugacy classes in groups with a
        huge number of classes, giving significant improvements to
        `IntermediateSubgroups` (Reference: IntermediateSubgroups) (e.g.
        7-Sylow subgroup in PSL(7,2)), ascending chain and thus in turn
        double coset calculations and further routines that rely on it

  - Fix `EqFloat` (Reference: EqFloat) to return correct results,
    instead of always returning `false`
    ([\#1370](https://github.com/gap-system/gap/pull/1370))

  - Various changes, including fixes for `CallFuncList` (Reference:
    CallFuncList)
    ([\#1417](https://github.com/gap-system/gap/pull/1417))

  - Better define the result of `MappingPermListList` (Reference:
    MappingPermListList)
    ([\#1432](https://github.com/gap-system/gap/pull/1432))

  - Check the arguments to `IsInjectiveListTrans` (Reference:
    IsInjectiveListTrans) to prevent crashes
    ([\#1435](https://github.com/gap-system/gap/pull/1435))

  - Change `BlownUpMat` (Reference: BlownUpMat) to return fail for
    certain invalid inputs
    ([\#1488](https://github.com/gap-system/gap/pull/1488))

  - Fixes for creating Green's classes of semigroups
    ([\#1492](https://github.com/gap-system/gap/pull/1492),
    [\#1771](https://github.com/gap-system/gap/pull/1771))

  - Fix `DoImmutableMatrix` for finite fields
    ([\#1504](https://github.com/gap-system/gap/pull/1504))

  - Make structural copy handle boolean lists properly
    ([\#1514](https://github.com/gap-system/gap/pull/1514))

  - Minimal fix for algebraic extensions over finite fields of order \>
    256 ([\#1569](https://github.com/gap-system/gap/pull/1569))

  - Fix for computing quotients of certain algebra modules
    ([\#1669](https://github.com/gap-system/gap/pull/1669))

  - Fix an error in the default method for `PositionNot` (Reference:
    PositionNot) ([\#1672](https://github.com/gap-system/gap/pull/1672))

  - Improvements to Rees matrix semigroups code and new tests
    ([\#1676](https://github.com/gap-system/gap/pull/1676))

  - Fix `CodePcGroup` (Reference: CodePcGroup) for the trivial
    polycyclic group
    ([\#1679](https://github.com/gap-system/gap/pull/1679))

  - Fix `FroidurePinExtendedAlg` for partial permutation monoids
    ([\#1697](https://github.com/gap-system/gap/pull/1697))

  - Fix computing the radical of a zero dimensional associative algebra
    ([\#1701](https://github.com/gap-system/gap/pull/1701))

  - Fix a bug in `RadicalOfAlgebra` (Reference: RadicalOfAlgebra) which
    could cause a break loop for some associative algebras
    ([\#1716](https://github.com/gap-system/gap/pull/1716))

  - Fix a recursion depth trap error when repeatedly calling `Test`
    (Reference: Test)
    ([\#1753](https://github.com/gap-system/gap/pull/1753))

  - Fix bugs in `PrimePGroup` (Reference: PrimePGroup) for direct
    products of p-groups
    ([\#1754](https://github.com/gap-system/gap/pull/1754))

  - Fix `UpEnv` (Reference: UpEnv) (available in break loops) when at
    the bottom of the backtrace
    ([\#1780](https://github.com/gap-system/gap/pull/1780))

  - Fix `IsomorphismPartialPermSemigroup` (Reference:
    IsomorphismPartialPermSemigroup) and `IsomorphismPartialPermMonoid`
    (Reference: IsomorphismPartialPermMonoid) for permutation groups
    with 0 generators
    ([\#1784](https://github.com/gap-system/gap/pull/1784))

  - Fix `DisplaySemigroup` (Reference: DisplaySemigroup) for
    transformation semigroups
    ([\#1785](https://github.com/gap-system/gap/pull/1785))

  - Fix "no method found" errors in `MagmaWithOne` (Reference:
    MagmaWithOne) and `MagmaWithInverses` (Reference: MagmaWithInverses)
    ([\#1798](https://github.com/gap-system/gap/pull/1798))

  - Fix an error computing kernel of group homomorphism from fp group
    into permutation group
    ([\#1809](https://github.com/gap-system/gap/pull/1809))

  - Fix an error in MTC losing components when copying a new augmented
    coset table ([\#1809](https://github.com/gap-system/gap/pull/1809))

  - Fix output of `Where` (Reference: Where) in a break loop, which
    pointed at the wrong code line in some cases
    ([\#1814](https://github.com/gap-system/gap/pull/1814))

  - Fix the interaction of signals in **GAP** and the **IO** package
    ([\#1851](https://github.com/gap-system/gap/pull/1851))

  - Make line editing resilient to `LineEditKeyHandler` failure (in
    particular, don't crash)
    ([\#1856](https://github.com/gap-system/gap/pull/1856))

  - Omit non-characters from `PermChars` (Reference: PermChars) results
    ([\#1867](https://github.com/gap-system/gap/pull/1867))

  - Fix `ExteriorPower` (Reference: ExteriorPowerOfAlgebraModule) when
    exterior power is 0-dimensional (used to return a 1-dimensional
    result) ([\#1872](https://github.com/gap-system/gap/pull/1872))

  - Fix recursion depth trap and other improvements for quotients of fp
    groups ([\#1884](https://github.com/gap-system/gap/pull/1884))

  - Fix a bug in the computation of a permutation group isomorphic to a
    group of automorphisms
    ([\#1907](https://github.com/gap-system/gap/pull/1907))

  - Fix bug in `InstallFlushableValueFromFunction` (Reference:
    InstallFlushableValueFromFunction)
    ([\#1920](https://github.com/gap-system/gap/pull/1920))

  - Fix `ONanScottType` (Reference: ONanScottType) and introduce
    `RestrictedInverseGeneralMapping` (Reference:
    RestrictedInverseGeneralMapping)
    ([\#1937](https://github.com/gap-system/gap/pull/1937))

  - Fix `QuotientMod` (Reference: QuotientMod) documentation, and the
    integer implementation. This partially reverts changes made in
    version 4.7.8 in 2013. The documentation is now correct (resp.
    consistent again), and several corner cases, e.g.
    `QuotientMod(0,0,m)` now work correctly
    ([\#1991](https://github.com/gap-system/gap/pull/1991))

  - Fix `PositionProperty` (Reference: PositionProperty) with from \< 1
    ([\#2056](https://github.com/gap-system/gap/pull/2056))

  - Fix inefficiency when dealing with certain algebra modules
    ([\#2058](https://github.com/gap-system/gap/pull/2058))

  - Restrict capacity of plain lists to 2^28 in 32-bit and 2^60 in
    64-bit builds
    ([\#2064](https://github.com/gap-system/gap/pull/2064))

  - Fix crashes with very large heaps (\> 2 GB) on 32 bit systems, and
    work around a bug in `memmove` in 32-bit glibc versions which could
    corrupt memory (affects most current Linux distributions)
    ([\#2166](https://github.com/gap-system/gap/pull/2166)).

  - Fix name of the `reversed` option in documentation of
    `LoadAllPackages` (Reference: LoadAllPackages)
    ([\#2167](https://github.com/gap-system/gap/pull/2167)).

  - Fix `TriangulizedMat([])` (see `TriangulizedMat` (Reference:
    TriangulizedMat) to return an empty list instead of producing an
    error ([\#2260](https://github.com/gap-system/gap/pull/2260)).

  - Fix several potential (albeit rare) crashes related to garbage
    collection ([\#2321](https://github.com/gap-system/gap/pull/2321),
    [\#2313](https://github.com/gap-system/gap/pull/2313),
    [\#2320](https://github.com/gap-system/gap/pull/2320)).

Removed or obsolete functionality:

  - Make `SetUserPreferences` obsolete (use `SetUserPreference`
    (Reference: SetUserPreference) instead)
    ([\#512](https://github.com/gap-system/gap/pull/512))

  - Remove undocumented `NameIsomorphismClass`
    ([\#597](https://github.com/gap-system/gap/pull/597))

  - Remove unused code for rational classes of permutation groups
    ([\#886](https://github.com/gap-system/gap/pull/886))

  - Remove unused and undocumented `Randomizer` and `CheapRandomizer`
    ([\#1113](https://github.com/gap-system/gap/pull/1113))

  - Remove `install-tools.sh` script and documentation mentioning it
    ([\#1305](https://github.com/gap-system/gap/pull/1305))

  - Withdraw `CallWithTimeout` and `CallWithTimeoutList`
    ([\#1324](https://github.com/gap-system/gap/pull/1324))

  - Make `RecFields` obsolete (use `RecNames` (Reference: RecNames)
    instead) ([\#1331](https://github.com/gap-system/gap/pull/1331))

  - Remove undocumented `SuPeRfail` and `READ_COMMAND`
    ([\#1374](https://github.com/gap-system/gap/pull/1374))

  - Remove unused `oldmatint.gi` (old methods for functions that compute
    Hermite and Smith normal forms of integer matrices)
    ([\#1765](https://github.com/gap-system/gap/pull/1765))

  - Make `TRANSDEGREES` obsolete
    ([\#1852](https://github.com/gap-system/gap/pull/1852))

##### 3.1-2 **HPC-GAP**

**GAP** includes experimental code to support multithreaded programming
in **GAP**, dubbed **HPC-GAP** (where HPC stands for "high performance
computing"). **GAP** and **HPC-GAP** codebases diverged during the
project, and we are currently working on unifying the codebases and
incorporating the **HPC-GAP** code back into the mainstream **GAP**
versions.

This is work in progress, and **HPC-GAP** as it is included with **GAP**
right now still suffers from various limitations and problems, which we
are actively working on to resolve. However, including it with **GAP**
(disabled by default) considerably simplifies development of
**HPC-GAP**. It also means that you can very easily get a (rough\!)
sneak peak of **HPC-GAP**. It comes together with the new manual book
called "**HPC-GAP** Reference Manual" and located in the \`doc/hpc\`
directory.

Users interested in experimenting with shared memory parallel
programming in **GAP** can build **HPC-GAP** by following the
instructions from
<https://github.com/gap-system/gap/wiki/Building-HPC-GAP>. While it is
possible to build **HPC-GAP** from a release version of **GAP** you
downloaded from the **GAP** website, due to the ongoing development of
**HPC-GAP**, we recommend that you instead build **HPC-GAP** from the
latest development version available in the **GAP** repository at
GitHub, i.e. <https://github.com/gap-system/gap>.

##### 3.1-3 New and updated packages since **GAP** 4.8.10

There were 132 packages redistributed together with **GAP** 4.8.10. The
**GAP** 4.9.1 distribution includes 134 packages, including numerous
updates of previously redistributed packages, and some major changes
outlined below.

The libraries of small, primitive and transitive groups which previously
were an integral part of **GAP** were split into three separate packages
[PrimgGrp](http://gap-packages.github.io/primgrp/),
[SmallGrp](https://gap-packages.github.io/smallgrp/) and
[TransGrp](http://www.math.colostate.edu/~hulpke/transgrp/):

  - The **PrimGrp** package by Alexander Hulpke, Colva M. Roney-Dougal
    and Christopher Russell provides the library of primitive
    permutation groups which includes, up to permutation isomorphism
    (i.e., up to conjugacy in the corresponding symmetric group), all
    primitive permutation groups of degree \< 4096.

  - The **SmallGrp** package by Bettina Eick, Hans Ulrich Besche and
    Eamonn O’Brien provides the library of groups of certain "small"
    orders. The groups are sorted by their orders and they are listed up
    to isomorphism; that is, for each of the available orders a complete
    and irredundant list of isomorphism type representatives of groups
    is given.

  - The **TransGrp** package by Alexander Hulpke provides the library of
    transitive groups, with an optional download of the library of
    transitive groups of degree 32.

For backwards compatibility, these are required packages in **GAP** 4.9
(i.e., **GAP** will not start without them). We plan to change this for
**GAP** 4.10 (see
[\#2434](https://github.com/gap-system/gap/pull/2434)), once all
packages which currently implicitly rely on these new packages had time
to add explicit dependencies on them
([\#1650](https://github.com/gap-system/gap/pull/1650),
[\#1714](https://github.com/gap-system/gap/pull/1714)).

The new **ZeroMQInterface** package by Markus Pfeiffer and Reimer
Behrends has been added for the redistribution. It provides both
low-level bindings as well as some higher level interfaces for the
[ZeroMQ](http://zeromq.org/) message passing library for **GAP** and
**HPC-GAP** enabling lightweight distributed computation.

The **HAPprime** package by Paul Smith is no longer redistributed with
**GAP**. Part of the code has been incorporated into the **HAP**
package. Its source code repository, containing the code of the last
distributed version, can still be found at
<https://github.com/gap-packages/happrime>.

Also, the **ParGAP** package by Gene Cooperman is no longer
redistributed with **GAP** because it no longer can be compiled with
**GAP** 4.9 (see [this
announcement](https://mail.gap-system.org/pipermail/gap/2018-March/001082.html)).
Its source code repository, containing the code of the last distributed
version, plus some first fixes needed for compatibility for GAP 4.9, can
still be found at <https://github.com/gap-packages/pargap>. If somebody
is interested in repairing this package and taking over its maintenance,
so that it can be distributed again, please contact the **GAP**
team.

#### 3.2 **GAP** 4.9.2 (July 2018)

##### 3.2-1 Changes in the core **GAP** system introduced in **GAP** 4.9.2

Fixed bugs that could lead to break loops:

  - Fixed a bug in iterating over an empty cartesian product
    ([\#2421](https://github.com/gap-system/gap/pull/2421)). \[Reported
    by @isadofschi\]

Fixed bugs that could lead to crashes:

  - Fixed a crash after entering `return;` in a "method not found" break
    loop ([\#2449](https://github.com/gap-system/gap/pull/2449)).

  - Fixed a crash when an error occurs and `OutputLogTo` (Reference:
    OutputLogTo for streams) points to a stream which internally uses
    another stream
    ([\#2596](https://github.com/gap-system/gap/pull/2596)).

Fixed bugs that could lead to incorrect results:

  - Fixed a bug in computing maximal subgroups, which broke some other
    calculations, in particular, computing intermediate subgroups.
    ([\#2488](https://github.com/gap-system/gap/pull/2488)). \[Reported
    by Seyed Hassan Alavi\]

Other fixed bugs and further improvements:

  - Profiling now correctly handles calls to `longjmp` and allows to
    generate profiles using version 2.0.1 of the **Profiling** package
    ([\#2444](https://github.com/gap-system/gap/pull/2444)).

  - The `bin/gap.sh` script now respects the `GAP_DIR` environment
    variable ([\#2465](https://github.com/gap-system/gap/pull/2465)).
    \[Contributed by RussWoodroofe\]

  - The `bin/BuildPackages.sh` script now properly builds binaries for
    the **simpcomp** package
    ([\#2475](https://github.com/gap-system/gap/pull/2475)).

  - Fixed a bug in restoring a workspace, which prevented **GAP** from
    saving the history if a workspace was loaded during startup
    ([\#2578](https://github.com/gap-system/gap/pull/2578)).

##### 3.2-2 New and updated packages since **GAP** 4.9.1

This release contains updated versions of 22 packages from **GAP** 4.9.1
distribution. Additionally, it has three new packages. The new
**JupyterKernel** package by Markus Pfeiffer provides a so-called
*kernel* for the Jupyter interactive document system
(<https://jupyter.org/>). This package requires Jupyter to be installed
on your system (see <https://jupyter.org/install> for instructions). It
also requires **GAP** packages **IO**, **ZeroMQInterface**, **json**,
and also two new packages by Markus Pfeiffer called **crypting** and
**uuid**, all included into **GAP** 4.9.2 distribution. The
**JupyterKernel** package is not yet usable on
Windows.

#### 3.3 **GAP** 4.9.3 (September 2018)

##### 3.3-1 Changes in the core **GAP** system introduced in **GAP** 4.9.3

Fixed bugs that could lead to break loops:

  - Fixed a regression in `HighestWeightModule` (Reference:
    HighestWeightModule) caused by changes in sort functions introduced
    in **GAP** 4.9 release
    ([\#2617](https://github.com/gap-system/gap/pull/2617)).

Other fixed bugs and further improvements:

  - Fixed a compile time assertion that caused compiler error on some
    systems ([\#2691](https://github.com/gap-system/gap/pull/2691)).

##### 3.3-2 New and updated packages since **GAP** 4.9.2

This release contains updated versions of 18 packages from **GAP** 4.9.2
distribution. Additionally, it has three new packages:

  - The **curlInterface** package by Christopher Jefferson and Michael
    Torpey, which provides a simple wrapper around **libcurl** library
    (<https://curl.haxx.se/>) to allow downloading files over http, ftp
    and https protocols.

  - The **datastructures** package by Markus Pfeiffer, Max Horn,
    Christopher Jefferson and Steve Linton, which aims at providing
    standard datastructures, consolidating existing code and improving
    on it, in particular in view of **HPC-GAP**.

  - The **DeepThought** package by Nina Wagner and Max Horn, which
    provides functionality for computations in finitely generated
    nilpotent groups given by a suitable presentation using Deep Thought
    polynomials.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap.md#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap.md) 

Goto Chapter: [Top](chap.md) [1](chap.md) [2](chap.md)
[3](chap.md) [4](chap.md) [5](chap.md) [6](chap.md)
[7](chap.md) [8](chap.md) [9](chap.md) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
