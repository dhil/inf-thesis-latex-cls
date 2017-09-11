# LaTeX class for Informatics theses
This LaTeX class provides a document class for typesetting Informatics dissertations. 

It is a fork of `infthesis.cls` as found on Informatics DICE machines, however I have patched the class in various ways to make it more flexible. 
For the original class file and a basic usage example, look [here](http://www.inf.ed.ac.uk/systems/tex/informatics/infthesis).

## Dependencies
The document class requires the following packages:
 * ifthen
 * graphics
 * xspace
 * eushield
 
where *eushield* is the only nonstandard LaTeX package. The package provides various versions of the university's crest. The [eushield][eushield.sty] package is not distributed along with this class. 

You can obtain a copy of it via [Informatics DReaM](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield.sty). You must also obtain the following necessary copies of the university crest:
* eushield.[[eps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield.eps)]
* eushield-normal.[[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-normal.pdf)][[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-normal.ps)]
* eushield-noback.[[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-noback.pdf)][[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-noback.ps)]
* eushield-reversed.[[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-reversed.pdf)][[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-reversed.ps)]
* eushield-twocolour.[[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-twocolour.pdf)][[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-twocolour.ps)]
* eushield-fullcolour.[[pdf](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-fullcolour.pdf)][[ps](http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield-fullcolour.ps)]

**Note** all usage of the university's crest or logos is subject to the [brand guidelines](http://www.ed.ac.uk/communications-marketing/resources/university-brand). Make sure you follow the brand guidelines!

## Other useful logos

Other commonly useful logos:

* [UoE Informatics logos](http://web.inf.ed.ac.uk/infweb/admin/school-brand)
* [UoE CDT PPar logos](http://web.inf.ed.ac.uk/infweb/student-services/cdt/ppar/resources-guidelines/ppar-logos)
* [EPSRC logos](https://www.epsrc.ac.uk/about/logos)

Make sure to follow the brand guidelines as stated on each site!

## Local installation

## LaTeX class and main crest

### Using `make`

To install the thesis class file (in the `src` dir):

`make install`

To install the crest and logos (in the `src` dir):

`make install-eushield`

Both above commands will place all the relevant files under a `.texmf` directory in the current user's `HOME` directory
and will also invoke `texhash` in order to update the search paths.

For the extra logos, 3 targets are declared and can be used as follows:

- `make install-logo-inf`
- `make install-logo-cdtppar`
- `make install-logo-epsrc`

Each target creates a corresponding subdirectory under `logos/` with all the relevant logos (in vector format). The
installation directory can be influence using the `DESTDIR` variable as stated [here](https://www.gnu.org/prep/standards/html_node/DESTDIR.html).

### Using `cmake`

- `mkdir build && cd build`
- `cmake [path to this source dir] -DCMAKE_INSTALL_PREFIX=[path to install dir]`
- `make && make install`
- `texhash [path to install dir]`

To match the `make` based installation, `texhash` must be invoked manually, but it allows for greater flexibility on the
selection of the target directory.

Moreover, the `cmake` file `uoe-infthesis-latex-cls.cmake` allows the integration of this repository as a submodule, 
allowing the creation of targets with the relevant files as shown in this project's `CMakeLists.txt` file. Using this
method requires that the handling of the paths for LaTeX will have to be performed separately. For an example have a
look [here](https://github.com/compor/uoe-inf-thesis-skeleton).

The commands defined are:

- `add_uoe_eushield`
- `add_uoe_infthesis`

For the extra logos, the submodule `uoe-logos-extra.cmake` has to be included in your project. The commands defined are:

- `add_uoe_inf_logos`
- `add_uoe_cdtppar_logos`
- `add_uoe_epsrc_logos`


[eushield.sty]: http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos/eushield.sty

