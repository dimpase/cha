Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap8.html) 

[\[MathJax on\]](chap7_mj.html)

[7 Changes between **GAP** 4.4 and **GAP**
4.5](chap.md#X84D336197CBC3777)

 [7.1 Changes in the core **GAP** system introduced in **GAP**
4.5](chap.md#X87783FB985375B5F) 

  
  [7.1-1 Improved functionality](chap.md#X84FC44718386FA1A)    
  [7.1-2 Changes in distribution formats](chap.md#X7E24E9DE7CADD1B7) 
  
  [7.1-3 Improvements to the user
interface](chap.md#X80AB8641792E74C9)    
  [7.1-4 Better documentation](chap.md#X81318FC0873923C3) 

 [7.2 Packages in **GAP** 4.5](chap.md#X7CD19B647C39B3F7) 

  
  [7.2-1 Interface between the core system and
packages](chap.md#X7E8089C881AB6BA1)    
  [7.2-2 New and updated packages since **GAP**
4.4.12](chap.md#X7D1ECE3D8403AC6F) 

 [7.3 **GAP** 4.5.5 (July 2012)](chap.md#X7DB3678580B402F1) 

 [7.4 **GAP** 4.5.6 (September 2012)](chap.md#X85A84FF97CCEAA08) 

 [7.5 **GAP** 4.5.7 (December 2012)](chap.md#X78C0EBF8860AF110) 

### 7 Changes between **GAP** 4.4 and **GAP** 4.5

This chapter lists most important changes between **GAP** 4.4.12 and the
first public release of **GAP** 4.5. It also contains information about
subsequent update releases for **GAP** 4.5. It is not meant to serve as
a complete account on all improvements; instead, it should be viewed as
an introduction to **GAP** 4.5, accompanying its release announcement.

#### 7.1 Changes in the core **GAP** system introduced in **GAP** 4.5

In this section we list most important new features and bugfixes in the
core system introduced in **GAP** 4.5. For the list of changes in the
interface between the core system and packages as well as for an
overview of new and updated packages, see Section
[7.2](chap.md#X7CD19B647C39B3F7).

##### 7.1-1 Improved functionality

Performance improvements:

  - The **GAP** kernel now uses **GMP** (GNU multiple precision
    arithmetic library, <http://gmplib.org/>) for faster large integer
    arithmetic.

  - Improved performance for records with large number of components.

  - Speedup of hash tables implementation at the **GAP** library level.

  - `MemoryUsage` (Reference: MemoryUsage) is now much more efficient,
    in particular for large objects.

  - Speedups in the computation of low index subgroups, Tietze
    transformations, calculating high powers of matrices over finite
    fields, `Factorial` (Reference: Factorial), etc.

New and improved kernel functionality:

  - By default, the **GAP** kernel compiles with the **GMP** and
    **readline** libraries. The **GMP** library is supplied with **GAP**
    and we recommend that you use the version we supply. There are some
    problems with some other versions. It is also possible to compile
    the **GAP** kernel with the system **GMP** if your system has it.
    The **readline** library must be installed on your system in advance
    to be used with **GAP**.

  - Floating point literals are now supported in the **GAP** language,
    so that, floating point numbers can be entered in **GAP**
    expressions in a natural way. Support for floats is now properly
    documented, see Reference: Floats. **GAP** has an interface using
    which packages may add new floating point implementations and
    integrate them with the parser. In particular, we expect that there
    will soon be a package that implements arbitrary precision floating
    point arithmetic.

  - The Mersenne twister random number generator has been made
    independent of endianness, so that random seeds can now be
    transferred between architectures. See Reference:
    GlobalMersenneTwister for details.

  - Defaults for `-m` and `-o` options have been increased. Changes have
    been made to the way that **GAP** obtains memory from the Operating
    System, to make **GAP** more compatible with C libraries. A new `-s`
    option has been introduced to control or turn off the new behaviour,
    see Reference: Command Line Options.

  - The filename and lines from which a function was read can now be
    recovered using `FilenameFunc` (Reference: FilenameFunc),
    `StartlineFunc` (Reference: StartlineFunc) and `EndlineFunc`
    (Reference: EndlineFunc). This allows you, for example, to implement
    a function such as `PageSource` (Reference: PageSource) to show the
    file containing the source code of a function or a method in a
    pager, see `Pager` (Reference: Pager).

  - `CallFuncList` (Reference: CallFuncList) was made into an operation
    so that it can be used to define behaviour of a non-function when
    called as a function.

  - Improvements to the cyclotomic number arithmetic for fields with
    large conductors.

  - Better and more flexible viewing of some large objects.

  - Opportunity to interrupt some long kernel computations, e.g.
    multiplication of compressed matrices, intercepting `Ctrl-C` in
    designated places in the kernel code by means of a special kernel
    function for that purpose.

  - `ELM_LIST` now allows you to install methods where the second
    argument is NOT a positive integer.

  - Kernel function `DirectoryContents` (Reference: DirectoryContents)
    to get the list of names of files and subdirectories in a directory.

  - Kernel functions for Kronecker product of compressed matrices, see
    `KroneckerProduct` (Reference: KroneckerProduct).

New and improved library functionality:

  - Extensions of data libraries:
    
      - Functions and iterators are now available to create and
        enumerate simple groups by their order up to isomorphism:
        `SimpleGroup` (Reference: SimpleGroup), `SmallSimpleGroup`
        (Reference: SmallSimpleGroup), `SimpleGroupsIterator`
        (Reference: SimpleGroupsIterator) and
        `AllSmallNonabelianSimpleGroups` (Reference:
        AllSmallNonabelianSimpleGroups).
    
      - See also packages **CTblLib**, **IRREDSOL** and **Smallsemi**
        listed in Section [7.2-2](chap.md#X7D1ECE3D8403AC6F).

  - Many more methods are now available for the built-in floating point
    numbers, see Reference: Floats.

  - The bound for the proper primality test in `IsPrimeInt` (Reference:
    IsPrimeInt) increased up to 10^18.

  - Improved code for determining transversal and double coset
    representatives in large groups.

  - Improvements in `Normalizer` (Reference: Normalizer) for S\_n.

  - Smith normal form of a matrix may be computed over arbitrary
    euclidean rings, see `NormalFormIntMat` (Reference:
    NormalFormIntMat).

  - Improved algorithms to determine the subgroup lattice of a group, as
    well as the function `DotFileLatticeSubgroups` (Reference:
    DotFileLatticeSubgroups) to save the lattice structure in `.dot`
    file to view it e.g. with **GraphViz**.

  - Special teaching mode which simplifies some output and provides more
    basic functionality, see Reference: Teaching Mode.

  - Functionality specific for use in undergraduate abstract algebra
    courses, e.g. checksums (Reference: Check Digits); string/integer
    list conversion; rings of small orders; the function `SetNameObject`
    (Reference: SetNameObject) to set display names for objects for more
    informative examples, e.g. constructing groups from "named" objects,
    such as, for example, `R90` for a 90-degree rotation).

  - Functions `DirectoryDesktop` (Reference: DirectoryDesktop) and
    `DirectoryHome` (Reference: DirectoryHome) which provide uniform
    access to default directories under Windows, Mac OS X and Unix.

  - Improved methods for hashing when computing orbits.

  - Functionality to call external binaries under Windows.

  - Symplectic groups over residue class rings, see `SymplecticGroup`
    (Reference: SymplecticGroup).

  - Basic version of the simplex algorithm for matrices.

  - New functions, operations and attributes: `PrimeDivisors`
    (Reference: PrimeDivisors), `Shuffle` (Reference: Shuffle) for
    lists, `IteratorOfPartitions` (Reference: IteratorOfPartitions),
    `IteratorOfCombinations` (Reference: IteratorOfCombinations),
    `EnumeratorOfCombinations` (Reference: EnumeratorOfCombinations) and
    others.

  - The behaviour of `Info` (Reference: Info) statements can now be
    configured per info class, this applies to the way the arguments are
    printed and to the output stream, see Reference: Info Functions.

  - New function `Test` (Reference: Test) which is a more flexible and
    informative substitute of `ReadTest` operation.

  - `ConnectGroupAndCharacterTable` is replaced by more robust function
    `CharacterTableWithStoredGroup` (Reference:
    CharacterTableWithStoredGroup).

Many problems in **GAP** have have been fixed, among them the following:

  - Polynomial factorisation over rationals could miss factors of degree
    greater than deg(f)/2 if they have very small coefficients, while
    the cofactor has large coefficients.

  - `IntermediateSubgroups` (Reference: IntermediateSubgroups) called on
    a group and a normal subgroup did not properly calculate maximal
    inclusion relationships.

  - `CentreOfCharacter` (Reference: CentreOfCharacter) and
    `ClassPositionsOfCentre` (Reference: ClassPositionsOfCentre for a
    character) called for a group character could return a perhaps too
    large result.

  - `Trace` (Reference: Trace of a matrix) called for an element of a
    finite field that was created with `AlgebraicExtension` (Reference:
    AlgebraicExtension) ran into an error.

  - `IrreducibleRepresentationsDixon` (Reference:
    IrreducibleRepresentationsDixon) did not accept a list with one
    character as a second argument.

  - Composing a homomorphism from a permutation group to a finitely
    presented group with another homomorphism could give wrong results.

  - For certain arguments, the function `EU` (Reference: EU) returned
    wrong results.

  - In the table of marks of cyclic groups, `NormalizersTom` (Reference:
    NormalizersTom) value was wrong.

  - The function `PermChars` (Reference: PermChars) returned a perhaps
    wrong result when the second argument was a positive integer (not a
    record) and the trivial character of the character table given as
    the first argument was not the first in the list of irreducibles.

  - **GAP** crashed when the intersection of ranges became empty.

  - `IsPSL`, and in turn `StructureDescription` (Reference:
    StructureDescription), erroneously recognised non-PSL groups of the
    right order as PSL.

  - The semidirect product method for pcgs computable groups sometimes
    tried to use finite presentations which were not polycyclic. This
    usually happened when the groups were not pc groups, and there was a
    very low risk of getting a wrong result.

  - The membership test for a group of finite field elements ran into an
    error if the zero element of the field was given as the first
    argument.

  - Constant polynomials were not recognised as univariate in any
    variable.

  - The kernel recursion depth counter was not reset properly when
    running into many break loops.

  - **GAP** did not behave well when printing of a (large) object was
    interrupted with `Ctrl-C`. Now the object is no longer corrupted and
    the indentation level is reset.

Potentially incompatible changes:

  - The zero polynomial now has degree `-infinity`, see
    `DegreeOfLaurentPolynomial` (Reference: DegreeOfLaurentPolynomial).

  - Multiple unary `+` or `-` signs are no longer allowed (to avoid
    confusion with increment/decrement operators from other programming
    languages).

  - Due to changes to improve the performance of records with large
    number of components, the ordering of record components in `View`'ed
    records has changed.

  - Due to improvements for vectors over finite fields, certain objects
    have more limitations on changing their base field. For example, one
    can not create a compressed matrix over GF(2) and then assign an
    element of GF(4) to one of its entries.

No longer supported:

  - Completion files mechanism.

  - **GAP** 3 compatibility mode.

In addition, we no longer recommend using the **GAP** compiler `gac` to
compile **GAP** code to **C**, and may withdraw it in future releases.
Compiling **GAP** code only ever gave a substantial speedup for rather
specific types of calculation, and much more benefit can usually be
achieved quite easily by writing a small number of key functions in
**C** and loading them into the kernel as described in
`LoadDynamicModule` (Reference: LoadDynamicModule). The `gac` script
will remain available as a convenient way of compiling such kernel
modules from **C**.

Also, the following functions and operations were made obsolete:
`AffineOperation`, `AffineOperationLayer`, `FactorCosetOperation`,
`DisplayRevision`, `ProductPol`, `TeXObj`, `LaTeXObj`.

##### 7.1-2 Changes in distribution formats

The **GAP** 4.5 source distribution has the form of a single archive
containing the core system and the most recent "stable" versions of all
currently redistributed packages. There are no optional archives to
download: the **TomLib** package now contains all its tables of marks in
one archive; we do not provide separate versions of manuals for Internet
Explorer, and the former `tools` archive is now included as an archive
in the `etc` directory. To unpack and install the archive, user the
script `etc/install-tools.sh`.

We no longer distribute separate bugfix archives when the core **GAP**
system changes, or updated packages archives when a redistributed
package is updated. Instead, the single **GAP** source distribution
archive will be labelled by the version of the core **GAP** system and
also by a timestamp. This archive contains the core system and the
stable versions of the relevant packages on that date. To upgrade, you
simply replace the whole directory containing the **GAP** installation,
and rebuild binaries for the **GAP** kernel and packages. For new
versions of packages, we will also continue to redistribute individual
package archives so it will be possible to update a single package
without changing the rest of the **GAP** installation.

Furthermore, by default **GAP** will now automatically read a
user-specific **GAP** root directory (unless **GAP** is called with the
`-r` option). All user settings can be made in that directory, so there
will be no risk of them being lost during an update (see Section
[7.1-3](chap.md#X80AB8641792E74C9) below for more details). Private
packages can also be installed in this directory for the same reason.

There are some changes in archive formats used for the distribution: we
continue to provide `.tar.gz`, `.tar.bz2` and `-win.zip` archives. We
have added `.zip`, and stopped providing `.zoo` archives. We no longer
provide GAP binaries for Mac OS 9 (Classic) any more. For installations
from source on Mac OS X one may follow the instructions for UNIX.

With the release of **GAP** 4.5, we also encourage more users to take
advantage of the increasingly mature binary distributions which are now
available. These include:

  - The binary `rsync` distribution for **GAP** on Linux PCs with i686
    or x86\_64 compatible processors provided by Frank Lübeck, see
    <http://www.math.rwth-aachen.de/~Frank.Luebeck/gap/rsync>.

  - **BOB**, a tool for Linux and Mac OS X to download and build **GAP**
    and its packages from source provided by M. Neunhöffer:
    <http://www-groups.mcs.st-and.ac.uk/~neunhoef/Computer/Software/Gap/bob.html>.

  - The **GAP** installer for Windows provided by Alexander Konovalov:
    <https://www.gap-system.org/ukrgap/wininst/>.

In the near future, we also hope to have a binary distribution for Mac
OS X.

Internally, we now have infrastructure to support more robust and
frequent releases, and an improved system to fetch and test new versions
of the increasingly large number of packages. The **Example** package
documents technical requirements for packages, many of which are checked
automatically by our systems. This will allow us to check the
compatibility of packages with the system and with other packages more
thoroughly before publishing them on the **GAP** website.

##### 7.1-3 Improvements to the user interface

By default, **GAP** now uses the **readline** library for command line
editing. It provides such advantages as working with unicode terminals,
nicer handling of long input lines, improved TAB-completion and flexible
configuration. For further details, see Reference: Editing using the
readline library.

We have extended facilities for user interface customisation. By default
**GAP** automatically scans a user specific **GAP** root directory
(unless **GAP** is called with the `-r` option). The name of this user
specific directory depends on the operating system and is contained in
`GAPInfo.UserGapRoot`. This directory can be used to tell **GAP** about
personal preferences, to load some additional code, to install
additional packages, or to overwrite some **GAP** files, see Reference:
GAP Root Directories. Instead of a single `.gaprc` file we now use more
flexible setup based on two files: `gap.ini` which is read early in the
startup process, and `gaprc` which is read after the startup process,
but before the first input file given on the command line. These files
may be located in the user specific **GAP** root directory
`GAPInfo.UserGapRoot` which by default is the first **GAP** root
directory, see Reference: The gap.ini and gaprc files. For
compatibility, the `.gaprc` file is still read if the directory
`GAPInfo.UserGapRoot` does not exist. See Reference: The former .gaprc
file for the instructions how to migrate your old setup.

Furthermore, there are functions to deal with user preferences, for
example, to specify how **GAP**'s online help is shown or whether the
coloured prompt should be used. Calls to set user preferences may appear
in the user's `gap.ini` file, as explained in Reference: Configuring
User preferences.

In the Windows version, we include a new shell which uses the **mintty**
terminal in addition to the two previously used shells (Windows command
line and **RXVT**). The **mintty** shell is now recommended. It supports
Unicode encoding and has flexible configurations options. Also, **GAP**
under Windows now starts in the `%HOMEDRIVE%%HOMEPATH%` directory, which
is the user's home directory. Besides this, a larger workspace is now
permitted without a need to modify the Windows registry.

Other changes in the user interface include:

  - the command line history is now implemented at the **GAP** level, it
    can be stored on quitting a **GAP** session and reread when starting
    a new session, see Reference: The command line history.

  - `SetPrintFormattingStatus("stdout",false);` may be used to switch
    off the automatic line breaking in terminal output, see
    `SetPrintFormattingStatus` (Reference: PrintFormattingStatus).

  - **GAP** supports terminals with up to 4096 columns (extendable at
    compile time).

  - Directories in `-l` command-line option can now be specified
    starting with `~/`, see Reference: Command Line Options.

  - Large integers are now displayed by a short string showing the first
    and last few digits, and the threshold to trigger this behaviour is
    user configurable (call `UserPreference("MaxBitsIntView")` to see
    the default value).

  - The **GAP** banner has been made more compact and informative.

  - `SetHelpViewer` (Reference: SetHelpViewer) now supports the Google
    Chrome browser.

  - Multiple matches in the **GAP** online help are displayed via a
    function from the **Browse** package, which is loaded in the default
    configuration. This feature can be replaced by the known pager using
    the command
    
    ``` normal
    
    SetUserPreference( "browse", "SelectHelpMatches", false );
    ```

##### 7.1-4 Better documentation

The main **GAP** manuals have been converted to the **GAPDoc** format
provided by the **GAPDoc** package by Frank Lübeck and Max Neunhöffer
(<http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc>). This
documentation format is already used by many packages and is now
recommended for all **GAP** documentation.

Besides improvements to the documentation layout in all formats (text,
PDF and HTML), the new **GAP** manuals incorporate a large number of
corrections, clarifications, additions and updated examples.

We now provide two HTML versions of the manual, one of them with
**MathJax** (<http://www.mathjax.org>) support for better display of
mathematical symbols. Also, there are two PDF versions of the manual - a
coloured and a monochrome one.

Several separate manuals now became parts of the **GAP** Reference
manual. Thus, now there are three main **GAP** manual books:

  - ***GAP** Tutorial* (see [Tutorial:
    Preface](../../doc/tut/chap.md#X874E1D45845007FE))

  - ***GAP** Reference manual* (see Reference: Preface)

  - ***GAP** - Changes from Earlier Versions* (this manual)

Note that there is no index file combining these three manuals. Instead
of that, please use the **GAP** help system which will search all of
these and about 100 package manuals.

#### 7.2 Packages in **GAP** 4.5

Here we list most important changes affecting packages and present new
or essentially changed packages. For the changes in the core **GAP**
system, see Section [7.1](chap.md#X87783FB985375B5F).

##### 7.2-1 Interface between the core system and packages

The package loading mechanism has been improved. The most important new
feature is that all dependencies are evaluated in advance and then used
to determine the order in which package files are read. This allows
**GAP** to handle cyclic dependencies as well as situations where
package A requires package B to be loaded completely before any file of
package A is read. To avoid distortions of the order in which packages
will be loaded, package authors are strongly discouraged from calling
`LoadPackage` (Reference: LoadPackage) and `TestPackageAvailability`
(Reference: TestPackageAvailability) in a package code in order to
determine whether some other package will be loaded before or together
with the current package - instead, one should use
`IsPackageMarkedForLoading` (Reference: IsPackageMarkedForLoading). In
addition, there is now a better error management if package loading
fails for packages that use the new functionality to log package loading
messages (see `DisplayPackageLoadingLog` (Reference:
DisplayPackageLoadingLog) and the rest of the Chapter Reference: Using
and Developing GAP Packages which documents how to *use* **GAP**
packages), and package authors are very much encouraged to use these
logging facilities.

In **GAP** 4.4 certain packages were marked as *autoloaded* and would be
loaded, if present, when **GAP** started up. In **GAP** 4.5, this notion
is divided into three. Certain packages are recorded as *needed* by the
**GAP** system and others as *suggested*, in the same way that packages
may *need* or *suggest* other packages. If a needed package is not
loadable, **GAP** will not start. Currently only **GAPDoc** is needed.
If a suggested package is loadable, it will be loaded. Typically these
are packages which install better methods for Operations and Objects
already present in **GAP**. Finally, the user preferences mechanism can
be used to specify additional packages that should be loaded if
possible. By default this includes most packages that were autoloaded in
**GAP** 4.4.12, see `ShowUserPreferences` (Reference:
ShowUserPreferences).

**GAP** packages may now use local *namespaces* to avoid name clashes
for global variables introduced in other packages or in the **GAP**
library, see Reference: Namespaces for GAP packages.

All guidance on how to *develop* a **GAP** package has been consolidated
in the **Example** package which also contains a checklist for upgrading
a **GAP** package to **GAP** 4.5 (the guidance has been transferred to
Reference: Using and Developing GAP Packages in **GAP** 4.9).

##### 7.2-2 New and updated packages since **GAP** 4.4.12

At the time of the release of **GAP** 4.4.12 there were 75 packages
redistributed with **GAP** (including the **TomLib** which was
distributed in the core **GAP** archive). The first public release of
**GAP** 4.5 contains precisely 99 packages.

The new packages that have been added to the redistribution since the
release of **GAP** 4.4.12 are:

  - **Citrus** package by J.D. Mitchell for computations with
    transformation semigroups and monoids (this package is a replacement
    of the **Monoid** package).

  - **cvec** package by M. Neunhöffer, providing an implementation of
    compact vectors over finite fields.

  - **fwtree** package by B. Eick and T. Rossmann for computing trees
    related to some pro-p-groups of finite width.

  - **GBNP** package by A.M. Cohen and J.W. Knopper, providing
    algorithms for computing Grobner bases of noncommutative polynomials
    over fields with respect to the "total degree first then
    lexicographical" ordering.

  - **genss** package by M. Neunhöffer and F. Noeske, implementing the
    randomised Schreier-Sims algorithm to compute a stabiliser chain and
    a base and a strong generating set for arbitrary finite groups.

  - **HAPprime** package by P. Smith, extending the **HAP** package with
    an implementation of memory-efficient algorithms for the calculation
    of resolutions of small prime-power groups.

  - **hecke** package by D. Traytel, providing functions for calculating
    decomposition matrices of Hecke algebras of the symmetric groups and
    q-Schur algebras (this package is a port of the **GAP** 3 package
    **Specht 2.4** to **GAP** 4).

  - **Homalg** project by M. Barakat, S. Gutsche, M. Lange-Hegermann et
    al., containing the following packages for the homological algebra:
    **homalg**, **ExamplesForHomalg**, **Gauss**, **GaussForHomalg**,
    **GradedModules**, **GradedRingForHomalg**, **HomalgToCAS**,
    **IO\_ForHomalg**, **LocalizeRingForHomalg**, **MatricesForHomalg**,
    **Modules**, **RingsForHomalg** and **SCO** (see
    <http://homalg.math.rwth-aachen.de/>).

  - **MapClass** package by A. James, K. Magaard and S. Shpectorov to
    calculate the mapping class group orbits for a given finite group.

  - **recogbase** package by M. Neunhöffer and A. Seress, providing a
    framework to implement group recognition methods in a generic way
    (suitable, in particular, for permutation groups, matrix groups,
    projective groups and black box groups).

  - **recog** package by M. Neunhöffer, A. Seress, N. Ankaralioglu, P.
    Brooksbank, F. Celler, S. Howe, M. Law, S. Linton, G. Malle, A.
    Niemeyer, E. O'Brien and C.M. Roney-Dougal, extending the
    **recogbase** package and provides a collection of methods for the
    constructive recognition of groups (mostly intended for permutation
    groups, matrix groups and projective groups).

  - **SCSCP** package by A. Konovalov and S. Linton, implementing the
    Symbolic Computation Software Composability Protocol (**SCSCP**, see
    <http://www.symbolic-computation.org/scscp>) for **GAP**, which
    provides interfaces to link a **GAP** instance with another copy of
    **GAP** or other **SCSCP**-compliant system running locally or
    remotely.

  - **simpcomp** package by F. Effenberger and J. Spreer for working
    with simplicial complexes.

  - **Smallsemi** package by A. Distler and J.D. Mitchell, containing
    the data library of all semigroups with at most 8 elements as well
    as various information about them.

  - **SymbCompCC** package by D. Feichtenschlager for computations with
    parametrised presentations for finite p-groups of fixed coclass.

Furthermore, some packages have been upgraded substantially since the
**GAP** 4.4.12 release:

  - **Alnuth** package by B. Assmann, A. Distler and B. Eick uses an
    interface to PARI/GP system instead of the interface to KANT (thanks
    to B. Allombert for the GP code for the new interface and help with
    the transition) and now also works under Windows.

  - **CTblLib** package (the **GAP** Character Table Library) by T.
    Breuer has been extended by many new character tables, a few bugs
    have been fixed, and new features have been added, for example
    concerning the relation to **GAP**'s group libraries, better search
    facilities, and interactive overviews. For details, see the package
    manual.

  - **DESIGN** package by L.H. Soicher:
    
      - The functions `PointBlockIncidenceMatrix`, `ConcurrenceMatrix`,
        and `InformationMatrix` compute matrices associated with block
        designs.
    
      - The function `BlockDesignEfficiency` computes certain
        statistical efficiency measures of a 1-(v,k,r) design, using
        exact algebraic computation.

  - **Example** package by W. Nickel, G. Gamble and A. Konovalov has a
    more detailed and up-to-date guidance on developing a **GAP**
    package (transferred to Reference: Using and Developing GAP Packages
    in **GAP** 4.9).

  - **FR** package by L. Bartholdi now uses floating-point numbers to
    compute approximations of rational maps given by their
    group-theoretical description.

  - The **GAPDoc** package by F. Lübeck and M. Neunhöffer provides
    various improvements, for example:
    
      - The layout of the text version of the manuals can be configured
        quite freely, several standard "themes" are provided. The
        display is now adjusted to the current screen width.
    
      - Some details of the layout of the HTML version of the manuals
        can now be configured by the user. All manuals are available
        with and without MathJax support for display of mathematical
        formulae.
    
      - The text and HTML versions of manuals make more use of unicode
        characters (but the text version is also still reasonably good
        on terminals with latin1 or ASCII encoding).
    
      - The PDF version of the manuals uses better fonts.
    
      - Of course, there are various improvements for authors of manuals
        as well, for example new functions `ExtractExamples` ([GAPDoc:
        ExtractExamples](../../pkg/GAPDoc-1.6.2/doc/chap.md#X8337B2BC79253B3F))
        and `RunExamples` ([GAPDoc:
        RunExamples](../../pkg/GAPDoc-1.6.2/doc/chap.md#X781D56FC7B938DCB))
        for automatic testing and correcting of manual examples.

  - **Gpd** package by E.J. Moore and C.D. Wensley has been
    substantially rewritten. The main extensions provide functions for:
    
      - Subgroupoids of a direct product with complete graph groupoid,
        specified by a root group and choice of rays.
    
      - Automorphisms of finite groupoids - by object permutations; by
        root group automorphisms; and by ray images.
    
      - The automorphism group of a finite groupoid together with an
        isomorphism to a quotient of permutation groups.
    
      - Homogeneous groupoids (unions of isomorphic groupoids) and their
        morphisms, in particular homogeneous discrete groupoids: the
        latter are used in constructing crossed modules of groupoids in
        the **XMod** package.

  - **GRAPE** package by L.H. Soicher:
    
      - With much help from A. Hulpke, the interface between **GRAPE**
        and `dreadnaut` is now done entirely in **GAP** code.
    
      - A 32-bit `nauty/dreadnaut` binary for Windows (XP and later) is
        included with **GRAPE**, so now **GRAPE** provides full
        functionality under Windows, with no installation necessary.
    
      - Graphs with ordered partitions of their vertices into
        "colour-classes" are now handled by the graph automorphism group
        and isomorphism testing functions. An automorphism of a graph
        with colour-classes is an automorphism of the graph which
        additionally preserves the list of colour-classes (classwise),
        and an isomorphism from one graph with colour-classes to a
        second is a graph isomorphism from the first graph to the second
        which additionally maps the first list of colour-classes to the
        second (classwise).
    
      - The **GAP** code and old standalone programs for the
        undocumented functions `Enum` and `EnumColadj` have been removed
        as their functionality can now largely be handled by current
        documented **GAP** and **GRAPE** functions.

  - **IO** package by M. Neunhöffer:
    
      - New build system to allow for more flexibility regarding the use
        of compiler options and adjusting to **GAP** 4.5.
    
      - New functions to access time like `IO_gettimeofday`, `IO_gmtime`
        and `IO_localtime`.
    
      - Some parallel skeletons built on `fork` like: `ParListByFork`,
        `ParMapReduceByFork`, `ParTakeFirstResultByFork` and
        `ParWorkerFarmByFork`.
    
      - `IOHub` objects for automatic I/O multiplexing.
    
      - New functions `IO_gethostbyname` and `IO_getsockname`.

  - **IRREDSOL** package by B. Höfling now covers all irreducible
    soluble subgroups of GL(n,q) for q^n \< 1000000 and primitive
    soluble permutation groups of degree \< 1000000 (previously, the
    bound was 65536). It also has faster group recognition and adds a
    few omissions for GL(3,8) and GL(6,5).

  - **ParGAP** package by G. Cooperman is now compiled using a
    system-wide MPI implementation by default to facilitate running it
    on proper clusters. There is also an option to build it with the
    **MPINU** library which is still supplied with the package (thanks
    to P. Smith for upgrading **ParGAP** build process).

  - **OpenMath** package by M. Costantini, A. Konovalov, M. Nicosia and
    A. Solomon now supports much more OpenMath symbols to facilitate
    communication by the remote procedure call protocol implemented in
    the **SCSCP** package. Also, a third-party external library to
    support binary OpenMath encoding has been replaced by a proper
    implementation made entirely in **GAP**.

  - **Orb** package by J. Müller, M. Neunhöffer and F. Noeske:
    
    There have been numerous improvements to this package:
    
      - A new fast implementation of AVL trees (balanced binary trees)
        in C.
    
      - New interface to hash table functionality and implementation in
        C for speedup.
    
      - Some new hash functions for various object types like
        transformations.
    
      - New function `ORB_EstimateOrbitSize` using the birthday paradox.
    
      - Improved functionality for product replacer objects.
    
      - New "tree hash tables".
    
      - New functionality to compute weak and strong orbits for
        semigroups and monoids.
    
      - `OrbitGraph` for Orb orbits.
    
      - Fast C kernel methods for the following functions:
        
        `PermLeftQuoTransformationNC`, `MappingPermSetSet`,
        `MappingPermListList`, `ImageSetOfTransformation`, and
        `KernelOfTransformation`.
    
      - New build system to allow for more flexibility regarding the use
        of compiler options and to adjust to **GAP** 4.5.

  - **RCWA** package by S. Kohl among the new features and other
    improvements has the following:
    
      - A database of all 52394 groups generated by 3 class
        transpositions of ℤ which interchange residue classes with
        modulus less than or equal to 6. This database contains the
        orders and the moduli of all of these groups. Also it provides
        information on what is known about which of these groups are
        equal and how their finite and infinite orbits on ℤ look like.
    
      - More routines for investigating the action of an rcwa group on
        ℤ. Examples are a routine which attempts to find out whether a
        given rcwa group acts transitively on the set of nonnegative
        integers in its support and a routine which looks for finite
        orbits on the set of all residue classes of ℤ.
    
      - Ability to deal with rcwa permutations of ℤ^2.
    
      - Important methods have been made more efficient in terms of
        runtime and memory consumption.
    
      - The output has been improved. For example, rcwa permutations are
        now `Display`'ed in ASCII text resembling LaTeX output.

  - The **XGAP** package by F. Celler and M. Neunhöffer can now be used
    on 64-bit architectures (thanks to N. Eldredge and M. Horn for
    sending patches). Furthermore, there is now an export to XFig option
    (thanks to Russ Woodroofe for this patch). The help system in
    **XGAP** has been adjusted to **GAP** 4.5.

  - Additionally, some packages with kernel modules or external binaries
    are now available in Windows. The `-win.zip` archive and the **GAP**
    installer for Windows include working versions of the following
    packages: **Browse**, **cvec**, **EDIM**, **GRAPE**, **IO** and
    **orb**, which were previously unavailable for Windows users.

Finally, the following packages are withdrawn:

  - **IF** package by M. Costantini is unmaintained and no longer
    usable. More advanced functionality for interfaces to other computer
    algebra systems is now available in the **SCSCP** package by A.
    Konovalov and S. Linton.

  - **Monoid** package by J. Mitchell is superseded by the **Citrus**
    package by the same author.

  - **NQL** package by R. Hartung has been withdrawn by the author.

#### 7.3 **GAP** 4.5.5 (July 2012)

Fixed bugs which could lead to crashes:

  - For small primes (compact fields) `ZmodnZObj(r,p)` now returns the
    corresponding FFE to avoid crashes when compacting matrices.
    \[Reported by Ignat Soroko\]

Other fixed bugs:

  - Fixed a bug in `CommutatorSubgroup` (Reference: CommutatorSubgroup)
    for fp groups causing infinite recursion, which could, for example,
    be triggered by computing automorphism groups.

  - Previously, the list of factors of a polynomial was mutable, and
    hence could be accidentally corrupted by callers. Now the list of
    irreducible factors is stored immutable. To deal with implicit
    reliance on old code, always a shallow copy is returned. \[reported
    by Jakob Kroeker\]

  - Computing high powers of matrices ran into an error for matrices in
    the format of the **cvec** package. Now the library function also
    works with these matrices. \[reported by Klaus Lux\]

  - The pseudo tty code which is responsible for spawning subprocesses
    has been partially rewritten to allow more than 128 subprocesses on
    certain systems. This mechanism is for example used by **ANUPQ** and
    **nq** packages to compute group quotients via an external program.
    Previously, on Mac OS X this could be done precisely 128 times, and
    then an error would occur. That is, one could e.g. compute 128
    nilpotent quotients, and then had to restart **GAP** to compute
    more. This also affected other systems, such as OpenBSD, where it
    now also works correctly.

  - On Mac OS X, using **GAP** compiled against GNU readline 6.2,
    pasting text into the terminal session would result in this text
    appearing very slowly, with a 0.1 sec delay between each
    "keystroke". This is not the case with versions 6.1 and older, and
    has been reported to the GNU readline team. In the meantime, we work
    around this issue in most situations by setting `rl_event_hook` only
    if `OnCharReadHookActive` is set.

  - `ShowUserPreferences` (Reference: ShowUserPreferences) ran into a
    break loop in case of several undeclared user preferences.
    \[Reported by James Mitchell\]

  - **GAP** did not start correctly if the user preference
    `"InfoPackageLoadingLevel"` was set to a number \>= 3. The reason is
    that `PrintFormattedString` was called before it was installed. The
    current fix is a temporary solution.

  - The `"hints"` member of `TypOutputFile` used to contain 3\*100
    entries, yet `addLineBreakHint` would write entries with index up to
    and including 3\*99+3=300, leading to a buffer overflow. This would
    end up overwriting the `"stream"` member with -1. Fixed by
    incrementing the size of `"hints"` to 301. \[Reported by Jakob
    Kroeker\]

  - The function `IsDocumentedWord` tested the given word against
    strings obtained by splitting help matches at non-letter characters.
    This way, variable names containing underscores or digits were
    erroneously not regarded as documented, and certain substrings of
    these names were erroneously regarded as documented.

  - On Windows, an error occurred if one tried to use the default
    Windows browser as a help viewer (see `SetHelpViewer` (Reference:
    SetHelpViewer)). Now the browser opens the top of the correspoding
    manual chapter. The current fix is a temporary solution since the
    problem remains with the positioning at the required manual section.

Improved functionality:

  - `WriteGapIniFile` (Reference: WriteGapIniFile) on Windows now
    produces the `gap.ini` file with Windows style line breaks. Also, an
    info message is now printed if an existing `gap.ini` file was moved
    to a backup file `gap.ini.bak`.

  - The **CTblLib** and **TomLib** packages are removed from the list of
    suggested packages of the core part of **GAP**. Instead they are
    added to the default list of the user preference `"PackagesToLoad"`.
    This way it is possible to configure **GAP** to not load these
    packages via changing the default value of `"PackagesToLoad"`.

  - The conjugacy test in S\_n for intransitive subgroups was improved.
    This deals with inefficiency issue in the case reported by Stefan
    Kohl.

  - Added `InstallAndCallPostRestore` to `lib/system.g` and call it in
    `lib/init.g` instead of `CallAndInstallPostRestore` for the function
    that reads the files listed in **GAP** command line. This fixes the
    problem reported by Yevgen Muntyan when `SaveWorkspace` (Reference:
    SaveWorkspace) was used in a file listed in **GAP** command line
    (before, according to the documentation, `SaveWorkspace` (Reference:
    SaveWorkspace) was only allowed at the main **GAP** prompt).

  - There is now a new user preference `PackagesToIgnore`, see
    `SetUserPreference` (Reference: SetUserPreference). It contains a
    list of names of packages that shall be regarded as not available at
    all in the current session, both for autoloading and for later calls
    of `LoadPackage` (Reference: LoadPackage). This preference is useful
    for testing purposes if one wants to run some code without loading
    certain packages.

#### 7.4 **GAP** 4.5.6 (September 2012)

Improved functionality:

  - The argument of `SaveWorkspace` (Reference: SaveWorkspace) can now
    start with `~/` which is expanded to the users home directory.

  - Added the method for `Iterator` (Reference: Iterator) for
    `PositiveIntegers` (Reference: PositiveIntegers). \[Suggested by
    Attila Egri-Nagy\].

  - Changed kernel tables such that list access functionality for
    `T_SINGULAR` objects can be installed by methods at the **GAP**
    level.

  - In case of saved history, "UP" arrow after starting **GAP** yields
    last stored line. The user preference `HistoryMaxLines` is now used
    when storing and saving history (see `SetUserPreference` (Reference:
    SetUserPreference)).

Fixed bugs which could lead to crashes:

  - A crash occuring during garbage collection following a call to
    `AClosVec` for a `GF(2)` code. \[Reported by Volker Braun\]

  - A crash when parsing certain syntactically invalid code. \[Reported
    by multiple users\]

  - Fixed and improved command line editing without readline support.
    Fixed a segfault which could be triggered by a combination of "UP"
    and "DOWN" arrows. \[Reported by James Mitchell\]

  - Fixed a bug in the kernel code for floats that caused a crash on
    SPARC Solaris in 32-bit mode. \[Reported by Volker Braun\]

Other fixed bugs:

  - Very large (more than 1024 digit) integers were not being coded
    correctly in function bodies unless the integer limb size was 16
    bits. \[Reported by Stefan Kohl\]

  - An old variable was used in assertion, causing errors in a debugging
    compilation. \[Reported by Volker Braun\]

  - The environment variable `PAGER` is now correctly interpreted when
    it contains the full path to the pager program. Furthermore, if the
    external pager `less` is found from the environment it is made sure
    that the option `-r` is used (same for `more -f`). \[Reported by
    Benjamin Lorenz\]

  - Fixed a bug in `PermliftSeries`. \[Reported by Aiichi Yamasaki\]

  - Fixed discarder function in lattice computation to distinguish
    general and zuppo discarder. \[Reported by Leonard Soicher\]

  - The `GL` (Reference: GL for dimension and a ring) and `SL`
    (Reference: SL for dimension and a ring) constructors did not
    correctly handle `GL(filter,dim,ring)`.

  - The names of two primitive groups of degree 64 were incorrect.

  - The `\in` (Reference: \\in operation for testing membership) method
    for groups handled by a nice monomorphism sometimes could produce an
    error in situations where it should return false. This only happened
    when using `SeedFaithfulAction` to influence how `NiceMonomorphism`
    (Reference: NiceMonomorphism) builds the nice monomorphims for a
    matrix groups.

  - Wrong `PrintObj` (Reference: PrintObj) method was removed to fix
    delegations accordingly to Reference: View and Print.

  - Fixed a method for `Coefficients` (Reference: Coefficients) which,
    after Gaussian elimination, did not check that the coefficients
    actually lie in the left-acting-domain of the vector space. This
    could lead to a wrong answer in a vector space membership test.
    \[Reported by Kevin Watkins\]

Improved documentation:

  - Removed outdated statements from the documentation of
    `StructureDescription` (Reference: StructureDescription) which now
    non-ambiguosly states that `StructureDescription` is not an
    isomorphism invariant: non-isomorphic groups can have the same
    string value, and two isomorphic groups in different representations
    can produce different strings.

  - **GAP** now allows overloading of a loaded help book by another one.
    In this case, only a warning is printed and no error is raised. This
    makes sense if a book of a not loaded package is loaded in a
    workspace and then **GAP** is started with a root path that contains
    a newer version. \[Reported by Sebastian Gutsche\]

  - Provided a better description of user preferences mechanism
    (Reference: Configuring User preferences) and a hint to familiarise
    with them using `WriteGapIniFile` (Reference: WriteGapIniFile)
    function to create a file which contains descriptions of all known
    user preferences and also sets those user preferences which
    currently do not have their default value. One can then edit that
    file to customize (further) the user preferences for future **GAP**
    sessions.

New packages added for the redistribution with **GAP**:

  - **AutoDoc** package by S. Gutsche, providing tools for automated
    generation of **GAPDoc** manuals.

  - **Convex** package by S. Gutsche, which provides structures and
    algorithms for convex geometry.

  - **PolymakeInterface** package by T. Baechler and S. Gutsche,
    providing a link to the callable library of the **polymake** system
    (<http://www.polymake.org>).

  - **ToolsForHomalg** package by M. Barakat, S. Gutsche and M.
    Lange-Hegermann, which provides some auxiliary functionality for the
    **homalg** project (<http://homalg.math.rwth-aachen.de/>).

#### 7.5 **GAP** 4.5.7 (December 2012)

Fixed bugs which could lead to crashes:

  - Closing with `LogInputTo` (or `LogOutputTo`) a logfile opened with
    `LogTo` (Reference: LogTo) left the data structures corrupted,
    resulting in a crash.

  - On 32-bit systems we can have long integers `n` such that
    `Log2Int(n)` is not an immediate integer. In such cases `Log2Int`
    gave wrong or corrupted results which in turn could crash **GAP**,
    e.g., in `ViewObj(n)`.

  - Some patterns of use of `UpEnv` (Reference: UpEnv) and `DownEnv`
    (Reference: DownEnv) were leading to a segfault.

Other fixed bugs:

  - Viewing of long negative integers was broken, because it went into a
    break loop.

  - Division by zero in `ZmodnZ` (Reference: ZmodnZ) (n not prime)
    produced invalid objects. \[Reported by Mark Dickinson\]

  - Fixed a bug in determining multiplicative inverse for a zero
    polynomial.

  - Fixed a bug causing infinite recursion in
    `NaturalHomomorphismByNormalSubgroup` (Reference:
    NaturalHomomorphismByNormalSubgroup).

  - A workaround was added to deal with a package method creating pcgs
    for permutation groups for which the entry `permpcgsNormalSteps` is
    missing.

  - For a semigroup of associative words that is not the full semigroup
    of all associative words, the methods for `Size` (Reference: Size)
    and `IsTrivial` (Reference: IsTrivial) called one another causing
    infinite recursion.

  - The 64-bit version of the `gac` script produced wrong (\>= 2^31) CRC
    values because of an integer conversion problem.

  - It was not possible to compile **GAP** on some systems where
    `HAVE_SELECT` detects as false.

  - Numbers in memory options on the command line exceeding 2^32 could
    not be parsed correctly, even on 64-bit systems. \[Reported by
    Volker Braun\]

New packages added for the redistribution with **GAP**:

  - **Float** package by L. Bartholdi, which extends **GAP**
    floating-point capabilities by providing new floating-point handlers
    for high-precision real, interval and complex arithmetic using MPFR,
    MPFI, MPC or CXSC external libraries. It also contains a very
    high-performance implementation of the LLL (Lenstra-Lenstra-Lovász)
    lattice reduction algorithm via the external library FPLLL.

  - **ToricVarieties** package by S. Gutsche, which provides data
    structures to handle toric varieties by their commutative algebra
    structure and by their combinatorics.

 [\[Top of Book\]](chap.md)  [\[Contents\]](chap0.html#contents) 
 [\[Previous Chapter\]](chap.md)   [\[Next Chapter\]](chap8.html) 

Goto Chapter: [Top](chap.md) [1](chap1.html) [2](chap2.html)
[3](chap.md) [4](chap4.html) [5](chap5.html) [6](chap6.html)
[7](chap.md) [8](chap8.html) [9](chap9.html) [Ind](chapInd.html)

-----

generated by
[GAPDoc2HTML](http://www.math.rwth-aachen.de/~Frank.Luebeck/GAPDoc)
