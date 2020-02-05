Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap6.html) 

[\[MathJax on\]](chap5_mj.html)

[5 Changes between **GAP** 4.6 and **GAP**
4.7](chap.md#X7C361B5F862188D4)

 [5.1 **GAP** 4.7.2 (December 2013)](chap.md#X81CB2A15826D4AFB) 

  
  [5.1-1 Changes in the core **GAP** system introduced in **GAP**
4.7](chap.md#X7998D9AB780EC4DE)    
  [5.1-2 New and updated packages since **GAP**
4.6.5](chap.md#X8536D3AE87C31A56) 

 [5.2 **GAP** 4.7.3 (February 2014)](chap.md#X80EA4AA07A9A4A4D) 

 [5.3 **GAP** 4.7.4 (February 2014)](chap.md#X795A5A517CDC5C91) 

 [5.4 **GAP** 4.7.5 (May 2014)](chap.md#X80E231E67E972DB5) 

 [5.5 **GAP** 4.7.6 (November 2014)](chap.md#X80763B757AC31C33) 

 [5.6 **GAP** 4.7.7 (February 2015)](chap.md#X7F3DFFFF86F3B1F0) 

 [5.7 **GAP** 4.7.8 (June 2015)](chap.md#X80D11C6780BB54A2) 

### 5 Changes between **GAP** 4.6 and **GAP** 4.7

This chapter contains an overview of most important changes introduced
in **GAP** 4.7.2 release (the first public release of **GAP** 4.7). It
also contains information about subsequent update releases for **GAP**
4.7.

#### 5.1 **GAP** 4.7.2 (December 2013)

##### 5.1-1 Changes in the core **GAP** system introduced in **GAP** 4.7

Improved and extended functionality:

  - The methods for computing conjugacy classes of permutation groups
    have been rewritten from scratch to enable potential use for groups
    in different representations. As a byproduct the resulting code is
    (sometimes notably) faster. It also now is possible to calculate
    canonical conjugacy class representatives in permutation groups,
    which can be beneficial when calculating character tables.

  - The methods for determining (conjugacy classes of) subgroups in
    non-solvable groups have been substantially improved in speed and
    scope for groups with multiple nonabelian composition factors.

  - There is a new method for calculating the maximal subgroups of a
    permutation group (with chief factors of width less or equal 5)
    without calculating the whole subgroup lattice.

  - If available, information from the table of marks library is used to
    speed up subgroup calculations in almost simple factor groups.

  - The broader availability of maximal subgroups is used to improve the
    calculation of double cosets.

  - To illustrate the improvements listed above, one could try, for
    example
    
        g:=WreathProduct(MathieuGroup(11),Group((1,2)));
        Length(ConjugacyClassesSubgroups(g));
    
    and
    
        g:=SemidirectProduct(GL(3,5),GF(5)^3);
        g:=Image(IsomorphismPermGroup(g));
        MaximalSubgroupClassReps(g);

  - Computing the exponent of a finite group G could be extremely slow.
    This was due to a slow default method being used, which computed all
    conjugacy classes of elements in order to compute the exponent. We
    now instead compute Sylow subgroups P\_1, ..., P\_k of G and use the
    easily verified equality exp(G) = exp(P\_1) x ... x exp(P\_k). This
    is usually at least as fast and in many cases orders of magnitude
    faster.
    
        gap> G:=SmallGroup(2^7*9,33);;
        gap> H:=DirectProduct(G, ElementaryAbelianGroup(2^10));;
        gap> Exponent(H); # should take at most a few milliseconds
        72
        gap> K := PerfectGroup(2688,3);;
        gap> Exponent(K); # should take at most a few seconds
        168

  - The functionality in **GAP** for transformations and transformation
    semigroups has been rewritten and extended. Partial permutations and
    inverse semigroups have been newly implemented. The documentation
    for transformations and transformation semigroups has been improved.
    Transformations and partial permutations are implemented in the
    **GAP** kernel. Methods for calculating attributes of
    transformations and partial permutations, and taking products, and
    so are also implemented in the kernel. The new implementations are
    largely backwards compatible; some exceptions are given below.
    
    The degree of a transformation `f` is usually defined as the largest
    positive integer where `f` is defined. In previous versions of
    **GAP**, transformations were only defined on positive integers less
    than their degree, it was only possible to multiply transformations
    of equal degree, and a transformation did not act on any point
    exceeding its degree. Starting with **GAP** 4.7, transformations
    behave more like permutations, in that they fix unspecified points
    and it is possible to multiply arbitrary transformations.
    
      - in the display of a transformation, the trailing fixed points
        are no longer printed. More precisely, in the display of a
        transformation `f` if `n` is the largest value such that
        `n^f<>n` or `i^f=n` for some `i<>n`, then the values exceeding
        `n` are not printed.
    
      - the display for semigroups of transformations now includes more
        information, for example `<transformation semigroup on 10 pts
        with 10 generators>` and `<inverse partial perm semigroup on 10
        pts with 10 generators>`.
    
      - transformations which define a permutation can be inverted, and
        groups of transformations can be created.
    
    Further information regarding transformations and partial
    permutations, can be found in the relevant chapters of the reference
    manual.
    
    The code for Rees matrix semigroups has been completely rewritten to
    fix the numerous bugs in the previous versions. The display of a
    Rees matrix semigroup has also been improved to include the numbers
    of rows and columns, and the underlying semigroup. Again the new
    implementations should be backwards compatible with the exception
    that the display is different.
    
    The code for magmas with a zero adjoined has been improved so that
    it is possible to access more information about the original magma.
    The display has also been changed to indicate that the created magma
    is a magma with zero adjoined (incorporating the display of the
    underlying magma). Elements of a magma with zero are also printed so
    that it is clear that they belong to a magma with zero.
    
    If a semigroup is created by generators in the category
    IsMultiplicativeElementWithOneCollection and
    CanEasilyCompareElements, then it is now checked if the One of the
    generators is given as a generator. In this case, the semigroup is
    created as a monoid.

  - Added a new operation `GrowthFunctionOfGroup` (Reference:
    GrowthFunctionOfGroup) that gives sizes of distance spheres in the
    Cayley graph of a group.

  - A new group constructor `FreeAbelianGroup` (Reference:
    FreeAbelianGroup) for free abelian groups has been added. By
    default, it creates suitable fp groups. Though free abelian groups
    groups do not offer much functionality right now, in the future
    other implementations may be provided, e.g. by the **Polycyclic**
    package.

  - The message about halving the pool size at startup is only shown
    when `-D` command line option is used (see Reference: Command Line
    Options). \[Suggested by Volker Braun\]

  - An info class called `InfoObsolete` (Reference: InfoObsolete) with
    the default level 0 is introduced. Setting it to 1 will trigger
    warnings at runtime if an obsolete variable declared with
    `DeclareObsoleteSynonym` is used. This is recommended for testing
    **GAP** distribution and packages.

  - The **GAP** help system now recognises some common different
    spelling patterns (for example, -ise/-ize, -isation/-ization,
    solvable/soluble) and searches for all possible spelling options
    even when the synonyms are not declared.

  - Added new function `Cite` (Reference: Cite) which produces citation
    samples for **GAP** and packages.

  - It is now possible to compile **GAP** with user-supplied `CFLAGS`
    which now will not be overwritten by **GAP** default settings.
    \[Suggested by Jeroen Demeyer\]

Fixed bugs:

  - `Union` (Reference: Union) had O(n^3) behaviour when given many
    ranges (e.g. it could take 10 seconds to find a union of 1000
    1-element sets). The new implementation reduces that to O(n log n)
    (and 4ms for the 10 second example), at the cost of not merging
    ranges as well as before in some rare cases.

  - `IsLatticeOrderBinaryRelation` only checked the existence of upper
    bounds but not the uniqueness of the least upper bound (and dually
    for lower bounds), so in some cases it could return the wrong
    answer. \[Reported by Attila Egri-Nagy\]

  - `LowIndexSubgroupsFpGroup` (Reference: LowIndexSubgroupsFpGroup)
    triggered a break loop if the list of generators of the 2nd argument
    contained the identity element of the group. \[Reported by Ignat
    Soroko\]

  - Fixed regression in heuristics used by
    `NaturalHomomorphismByNormalSubgroup` (Reference:
    NaturalHomomorphismByNormalSubgroup) that could produce a
    permutation representation of an unreasonably large degree.
    \[Reported by Izumi Miyamoto\]

  - Fixed inconsistent behaviour of `QuotientMod( Integers, r, s, m )`
    in the case where s and m are not coprime. This fix also corrects
    the division behaviour of `ZmodnZ` objects, see `QuotientMod`
    (Reference: QuotientMod) and `ZmodnZ` (Reference: ZmodnZ).
    \[Reported by Mark Dickinson\]

  - Fixed an oversight in the loading process causing `OnQuit`
    (Reference: OnQuit) not resetting the options stack after exiting
    the break loop.

  - Empty strings were treated slightly differently than other strings
    in the **GAP** kernel, for historical reasons. This resulted in
    various inconsistencies. For example, `IsStringRep("")` returned
    true, but a method installed for arguments of type `IsStringRep`
    would NOT be invoked when called with an empty string.
    
    We remove this special case in the **GAP** kernel (which dates back
    the very early days of **GAP** 4 in 1996). This uncovered one issue
    in the kernel function `POSITION_SUBSTRING` (when calling it with an
    empty string as second argument), which was also fixed.

  - The parser for floating point numbers contained a bug that could
    cause **GAP** to crash or to get into a state where the only action
    left to the user was to exit **GAP** via Ctrl-D. For example,
    entering four dots with spaces between them on the **GAP** prompt
    and then pressing the return key caused **GAP** to exit.
    
    The reason was (ironically) an error check in the innards of the
    float parser code which invoked the **GAP** `Error()` function at a
    point where it should not have.

  - Removing the last character in a string was supposed to overwrite
    the old removed character in memory with a zero byte, but failed to
    do so due to an off-by-one error. For most **GAP** operations, this
    has no visible effect, except for those which directly operate on
    the underlying memory representation of strings. For example, when
    trying to use such a string to reference a record entry, a (strange)
    error could be triggered.

  - `ViewString` (Reference: ViewString) and `DisplayString` (Reference:
    DisplayString) are now handling strings, characters and immediate
    FFEs in a consistent manner.

  - Multiple fixes to the build process for less common Debian platforms
    (arm, ia64, mips, sparc, GNU/Hurd). \[Suggested by Bill Allombert\]

  - Fixes for several regressions in the `gac` script. \[Suggested by
    Bill Allombert\]

Changed functionality:

  - It is not possible now to call `WreathProduct` (Reference:
    WreathProduct) with 2nd argument H not being a permutation group,
    without using the 3rd argument specifying the permutation
    representation. This is an incompatible change but it will produce
    an error instead of a wrong result. The former behaviour of
    `WreathProduct` (Reference: WreathProduct) may now be achieved by
    using `StandardWreathProduct` (Reference: StandardWreathProduct)
    which returns the wreath product for the (right regular) permutation
    action of H on its elements.

  - The function `ViewLength` to specify the maximal number of lines
    that are printed in `ViewObj` (Reference: ViewObj) became obsolete,
    since there was already a user preference `ViewLength` to specify
    this. The value of this preference is also accessible in
    `GAPInfo.ViewLength`.

##### 5.1-2 New and updated packages since **GAP** 4.6.5

At the time of the release of **GAP** 4.6.5 there were 107 packages
redistributed with **GAP**. The first public release of **GAP** 4.7
contains 114 packages.

One of essential changes is that the **Citrus** package by J.Mitchell
has been renamed to **Semigroups**. The package has been completely
overhauled, the performance has been improved, and the code has been
generalized so that in the future the same code can be used to compute
with other types of semigroups.

Furthermore, new packages that have been added to the redistribution
since the release of **GAP** 4.6.5 are:

  - **4ti2interface** package by Sebastian Gutsche, providing an
    interface to **4ti2**, a software package for algebraic, geometric
    and combinatorial problems on linear spaces (<http://www.4ti2.de>).

  - **CoReLG** by Heiko Dietrich, Paolo Faccin and Willem de Graaf for
    calculations in real semisimple Lie algebras.

  - **IntPic** package by Manuel Delgado, aimed at providing a simple
    way of getting a pictorial view of sets of integers. The main goal
    of the package is producing **Tikz** code for arrays of integers.
    The code produced is to be included in a LaTeX file, which can then
    be processed. Some of the integers are emphasized by using different
    colors for the cells containing them.

  - **LieRing** by Serena Cicalo and Willem de Graaf for constructing
    finitely-presented Lie rings and calculating the Lazard
    correspondence. The package also provides a database of small
    n-Engel Lie rings.

  - **LiePRing** package by Michael Vaughan-Lee and Bettina Eick,
    introducing a new datastructure for nilpotent Lie rings of
    prime-power order. This allows to define such Lie rings for specific
    primes as well as for symbolic primes and other symbolic parameters.
    The package also includes a database of nilpotent Lie rings of order
    at most p^7 for all primes p \> 3.

  - **ModIsom** by Bettina Eick, which contains various methods for
    computing with nilpotent associative algebras. In particular, it
    contains a method to determine the automorphism group and to test
    isomorphisms of such algebras over finite fields and of modular
    group algebras of finite p-groups. Further, it contains a nilpotent
    quotient algorithm for finitely presented associative algebras and a
    method to determine Kurosh algebras.

  - **SLA** by Willem de Graaf for computations with simple Lie
    algebras. The main topics of the package are nilpotent orbits,
    theta-groups and semisimple subalgebras.

Furthermore, some packages have been upgraded substantially since the
**GAP** 4.6.5 release:

  - **ANUPQ** package by Greg Gamble, Werner Nickel and Eamonn O'Brien
    has been updated after Max Horn joined it as a maintainer. As a
    result, it is now much easier to install and use it with the current
    **GAP** release.

  - **Wedderga** package by Osnel Broche Cristo, Allen Herman, Alexander
    Konovalov, Aurora Olivieri, Gabriela Olteanu, Ángel del Río and
    Inneke Van Gelder has been extended to include functions for
    calculating local and global Schur indices of ordinary irreducible
    characters of finite groups, cyclotomic algebras over abelian number
    fields, and rational quaternion algebras (contribution by Allen
    Herman).

#### 5.2 **GAP** 4.7.3 (February 2014)

Fixed bugs which could lead to incorrect results:

  - Incorrect result returned by `AutomorphismGroup(PSp(4,2^n))`.
    \[Reported by Anvita\]

  - The `Order` (Reference: Order) method for group homomorphisms newly
    introduced in **GAP** 4.7 had a bug that caused it to sometimes
    return incorrect results. \[Reported by Benjamin Sambale\]

Fixed bugs that could lead to break loops:

  - Several bugs were fixed and missing methods were introduced in the
    new code for transformations, partial permutations and semigroups
    that was first included in **GAP** 4.7. Some minor corrections were
    made in the documentation for transformations.

  - Break loop in `IsomorphismFpMonoid` when prefixes in generators
    names were longer than one letter. \[Reported by Dmytro Savchuk and
    Yevgen Muntyan\]

  - Break loop while displaying the result of
    `MagmaWithInversesByMultiplicationTable` (Reference:
    MagmaWithInversesByMultiplicationTable). \[Reported by Grahame
    Erskine\]

Improved functionality:

  - Better detection of UTF-8 terminal encoding on some systems.
    \[Suggested by Andries Brouwer\]

#### 5.3 **GAP** 4.7.4 (February 2014)

This release was prepared immediately after **GAP** 4.7.3 to revert the
fix of the error handling for the single quote at the end of an input
line, contained in **GAP** 4.7.3. It happened that (only on Windows) the
fix caused error messages in one of the packages.

#### 5.4 **GAP** 4.7.5 (May 2014)

Fixed bugs which could lead to incorrect results:

  - `InstallValue` (Reference: InstallValue) cannot handle immediate
    values, characters or booleans for technical reasons. A check for
    such values was introduced to trigger an error message and prevent
    incorrect results caused by this. \[Reported by Sebastian Gutsche\]

  - `KnowsDictionary` (Reference: KnowsDictionary) and
    `LookupDictionary` (Reference: LookupDictionary) methods for
    `IsListLookupDictionary` were using `PositionFirstComponent`
    (Reference: PositionFirstComponent); the latter is only valid on
    sorted lists, but in `IsListLookupDictionary` the underlying list is
    NOT sorted in general, leading to bogus results.

Other fixed bugs:

  - A bug in `DirectProductElementsFamily` which used
    `CanEasilyCompareElements` (Reference: CanEasilyCompareElements)
    instead of `CanEasilySortElements` (Reference:
    CanEasilySortElements).

  - Fixed wrong `Infolevel` message that caused a break loop for some
    automorphism group computations.

  - Fixed an error that sometimes caused a break loop in `HallSubgroup`
    (Reference: HallSubgroup). \[Reported by Benjamin Sambale\]

  - Fixed a rare error in computation of conjugacy classes of a finite
    group by homomorphic images, providing fallback to a default
    algorithm.

  - Fixed an error in the calculation of Frattini subgroup in the case
    of the trivial radical.

  - Several minor bugs were fixed in the documentation, kernel, and
    library code for transformations.

  - Fixed errors in `NumberPerfectGroups` (Reference:
    NumberPerfectGroups) and `NumberPerfectLibraryGroups` (Reference:
    NumberPerfectLibraryGroups) not being aware that there are no
    perfect groups of odd order.

  - Restored the ability to build **GAP** on OS X 10.4 and 10.5 which
    was accidentally broken in the previous **GAP** release by using the
    build option not supported by these versions.

  - Fixed some problems for ia64 and sparc architectures. \[Reported by
    Bill Allombert and Volker Braun\]

New package added for the redistribution with **GAP**:

  - **permut** package by A.Ballester-Bolinches, E.Cosme-Llópez, and
    R.Esteban-Romero to deal with permutability in finite groups.

#### 5.5 **GAP** 4.7.6 (November 2014)

Fixed bugs which could lead to incorrect results:

  - A bug that may cause `ShortestVectors` (Reference: ShortestVectors)
    to return an incomplete list. \[Reported by Florian Beye\]

  - A bug that may lead to incorrect results and infinite loops when
    **GAP** is compiled without GMP support using gcc 4.9.

  - A bug that may cause `OrthogonalEmbeddings` (Reference:
    OrthogonalEmbeddings) to return an incomplete result. \[Reported by
    Benjamin Sambale\]

Fixed bugs that could lead to break loops:

  - `ClosureGroup` (Reference: ClosureGroup) should be used instead of
    `ClosureSubgroup` (Reference: ClosureSubgroup) in case there is no
    parent group, otherwise some calculations such as e.g.
    `NormalSubgroups` (Reference: NormalSubgroups) may fail. \[Reported
    by Dmitrii Pasechnik\]

  - Fixed a line in the code that used a hard-coded identity
    permutation, not a generic identity element of a group. \[Reported
    by Toshio Sumi\]

  - Fixed a problem in the new code for calculating maximal subgroups
    that caused a break loop for some groups from the transitive groups
    library. \[Reported by Petr Savicky\]

  - Fixed a problem in `ClosureSubgroup` (Reference: ClosureSubgroup)
    not accepting some groups without `Parent` (Reference: Parent).
    \[Reported by Inneke van Gelder\]

Other fixed bugs:

  - Eliminated a number of compiler warnings detected with some newer
    versions of **C** compilers.

  - Some minor bugs in the transformation and partial permutation code
    and documentation were resolved.

#### 5.6 **GAP** 4.7.7 (February 2015)

New features:

  - Introduced some arithmetic operations for infinity and negative
    infinity, see Reference: infinity.

  - Introduced new property `IsGeneratorsOfSemigroup` (Reference:
    IsGeneratorsOfSemigroup) which reflects wheter the list or
    collection generates a semigroup.

Fixed bugs which could lead to incorrect results:

  - Fixed a bug in `Union` (Reference: Union) (actually, in the internal
    library function `JoinRanges`) caused by downward running ranges.
    \[Reported by Matt Fayers\]

  - Fixed a bug where recursive records might be printed with the wrong
    component name, coming from component names being ordered
    differently in two different pieces of code. \[Reported by Thomas
    Breuer\]

  - The usage of `abs` in `src/gmpints.c` was replaced by `AbsInt`. The
    former is defined to operate on 32-bit integers even if **GAP** is
    compiled in 64-bit mode. That lead to truncating **GAP** integers
    and caused a crash in `RemInt` (Reference: RemInt), reported by
    Willem De Graaf and Heiko Dietrich. Using `AbsInt` fixes the crash,
    and ensures the correct behaviour on 32-bit and 64-bit builds.

Fixed bugs that could lead to break loops:

  - A problem with `ProbabilityShapes` (Reference: ProbabilityShapes)
    not setting frequencies list for small degrees. \[Reported by Daniel
    Błażewicz and independently by Mathieu Gagne\]

  - An error when generating a free monoid of rank infinity. \[Reported
    by Nick Loughlin\]

  - Several bugs with the code for Rees matrix semigroups not handling
    trivial cases properly.

  - A bug in `IsomorphismTypeInfoFiniteSimpleGroup` (Reference:
    IsomorphismTypeInfoFiniteSimpleGroup) affecting one particular group
    due to a misformatting in a routine that translates between the
    Chevalley type and the name used in the table (in this case, `"T"`
    was used instead of `["T"]`). \[Reported by Petr Savicky\]

Other fixed bugs:

  - The `Basis` (Reference: Basis) method for full homomorphism spaces
    of linear mappings did not set basis vectors which could be obtained
    by `GeneratorsOfLeftModule` (Reference: GeneratorsOfLeftModule).

  - A problem with `GaloisType` (Reference: GaloisType) entering an
    infinite loop in the routine for approximating a root. \[Reported by
    Daniel Błażewicz\]

  - Fixed the crash when **GAP** is called when the environment
    variables `HOME` or `PATH` are unset. \[Reported by Bill Allombert\]

Furthermore, new packages that have been added to the redistribution
since the release of **GAP** 4.7.6 are:

  - **json** package by Christopher Jefferson, providing a mapping
    between the **JSON** markup language and **GAP**

  - **SglPPow** package by Bettina Eick and Michael Vaughan-Lee,
    providing the database of p-groups of order p^7 for p \> 11, and of
    order 3^8.

#### 5.7 **GAP** 4.7.8 (June 2015)

Fixed bugs which could lead to incorrect results:

  - Added two groups of degree 1575 which were missing in the library of
    first primitive groups. \[Reported by Gordon Royle\]

  - Fixed the error in the code for algebra module elements in packed
    representation caused by the use of `Objectify` (Reference:
    Objectify) with the type of the given object instead of
    `ObjByExtRep` (Reference: ObjByExtRep) as recommended in Reference:
    Further Improvements in Implementing Residue Class Rings. The
    problem was that after calculating `u+v` where one of the summands
    was known to be zero, this knowledge was wrongly passed to the sum
    via the type. \[Reported by Istvan Szollosi\]

  - Fixed a bug in `PowerMod` (Reference: PowerMod) causing wrong
    results for univariate Laurent polynomials when the two polynomial
    arguments are stored with the same non-zero shift. \[Reported by Max
    Horn\]

Furthermore, new packages that have been added to the redistribution
since the release of **GAP** 4.7.7 are:

  - **PatternClass** by Michael Albert, Ruth Hoffmann and Steve Linton,
    allowing to explore the permutation pattern classes build by token
    passing networks. Amongst other things, it can compute the basis of
    a permutation pattern class, create automata from token passing
    networks and check if the deterministic automaton is a possible
    representative of a token passing network.

  - **QPA** by Edward Green and Øyvind Solberg, providing data
    structures and algorithms for computations with finite dimensional
    quotients of path algebras, and with finitely generated modules over
    such algebras. It implements data structures for quivers, quotients
    of path algebras, and modules, homomorphisms and complexes of
    modules over quotients of path algebras.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap6.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
