# LaTeX class for Informatics theses
This LaTeX class provides a document class for typesetting Informatics
dissertations.

This is a fork of the `infthesis.cls` file as found on Informatics
DICE machines, however, this class file has been patched in various
ways to make it more flexible.  Checkout the [computing support
website](http://www.inf.ed.ac.uk/systems/tex/informatics/infthesis)
for instructions on how to obtain the original class file and a basic
usage example.

## Changes against upstream

This class file contains the following changes over the original class
file:

* Listing of multiple institutions, e.g. using
  `\documentclass[phd,lfcs,icsa]{infthesis}` lists both LFCS and ICSA
  as institutions on the titlepage.
* Document class options for listing affiliated CDT alongside
  institution on titlepage. The following three CDTs are available:
  Data Science (`cdtds`), Pervasive Paralleism (`cdtppar`), and
  Robotics and Autonomous Systems (`cdtras`).
* Lay summary environment. Use `\begin{laysummary}\end{laysummary}` to
  add a lay summary page.
* Automatic insertion of author names in custom declarations,
  e.g. `\begin{declaration}\end{declaration}` will insert the author
  name like `\standarddeclaration` (aside: `\standarddeclaration` is
  now implemented in terms of the `declaration` environment).

## Dependencies

The document class requires the following packages:

* ifthen
* graphics
* xspace
* eushield

The only nonstandard LaTeX package is *eushield*, which provides
various versions of the university's crest. The eushield package is
not distributed along with this class. You can obtain a copy of it via
[Informatics
DReaM](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield.sty). For
the package to work correctly you should also obtain the following
necessary copies of the university crest (see the next section for an
automated installation):

* eushield.[eps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield.eps)
* eushield-normal.{[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-normal.pdf),[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-normal.ps)}
* eushield-noback.{[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-noback.pdf),[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-noback.ps)}
* eushield-reversed.{[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-reversed.pdf),[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-reversed.ps)}
* eushield-twocolour.{[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-twocolour.pdf),[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-twocolour.ps)}
* eushield-fullcolour.{[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-fullcolour.pdf),[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-fullcolour.ps)}

**Note** usage of the university's crest or logos is subject to the
[brand
guidelines](http://www.ed.ac.uk/communications-marketing/resources/university-brand). Please
make sure you follow the brand guidelines.

### Other useful logos

You may want to use some of the common logos with `infthesis.cls`

* [UoE Informatics logos](http://web.inf.ed.ac.uk/infweb/admin/school-brand)
* [UoE CDT PPar logos](http://web.inf.ed.ac.uk/infweb/student-services/cdt/ppar/resources-guidelines/ppar-logos)
* [EPSRC logos](https://www.epsrc.ac.uk/about/logos)

Usage is subject to the brand guidelines as stated on each
site. Please make sure you follow them.

## Simple local installation

This class file is bundled with an `Makefile` installation script. To
install the class file

```shell
$ make install
```

To download and install the required `eushield` type

```shell
$ make install-eushield
```

Use the following command to acquire and install the common logos

```shell
$ make install-logo-{inf,cdtppar,epsrc}
```

### Specifying installation directory

By default the class file, eushield, and logos are installed under
`$HOME/.texmf`. You may change the installation directory by setting
the `INSTDIR` variable. For example, to install the class file under
the directory `foo` type

```shell
$ INSTDIR=foo make install
```

## Uninstallation

Each installation rule has a corresponding uninstallation rule. For
example you can use `uninstall` rule to uninstall the class file from
its default installation location, i.e.

```shell
$ make uninstall
```

**Note** if you used a custom installation location, then you should set
`INSTDIR` before uninstalling. For example, if you installed the class
file under the directory `foo` then you should `INSTDIR=foo`, i.e.

```shell
$ INSTDIR=foo make uninstall
```
