#

DESTDIR?=.

TEXMF=$(HOME)/.texmf/tex/latex
TEXINFTHESIS=$(TEXMF)/uoe/informatics/infthesis

TEXEUSHIELD=$(TEXMF)/uoe/informatics/eushield
EUSHIELDURL=http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos
EUSHIELD= \
	eushield.sty eushield.eps \
	eushield-normal.pdf eushield-normal.ps \
	eushield-noback.pdf eushield-noback.ps \
	eushield-reversed.pdf eushield-reversed.ps \
	eushield-twocolour.pdf eushield-twocolour.ps \
	eushield-fullcolour.pdf eushield-fullcolour.ps

INFLOGODIR=$(DESTDIR)/logos/informatics
INFURL=http://media.inf.ed.ac.uk/infweb/logos
INFLOGO=InformaticsUni_spot.eps InformaticsUni_CMYK.eps

CDTPPARLOGODIR=$(DESTDIR)/logos/cdtppar
CDTPPARURL=http://media.inf.ed.ac.uk/infweb/ppar-logos
CDTPPARLOGO=cmyk.eps black.eps white.eps

EPSRCLOGODIR=$(DESTDIR)/logos/epsrc
EPSRCURL=https://www.epsrc.ac.uk/files/aboutus/logos-and-indentity
EPSRCLOGO=white-out-sponsorship-logo:sponsor-wofullres.eps \
					black-and-white-sponsorship-logo-full-resolution:sponsor-bwfullres.eps \
					colour-sponsorship-logo-full-resolution:sponsorfullres.eps


install: infthesis.cls
	@mkdir -v -p $(TEXINFTHESIS) && \
	cp -v infthesis.cls $(TEXINFTHESIS)/ && \
	texhash $(TEXMF) && \
	echo "Installation complete." || echo "Installation failed."

install-eushield: infthesis.cls
	@mkdir -v -p $(TEXEUSHIELD)
	$(foreach dep, $(EUSHIELD), \
		echo "Installing $(dep)..." && \
		curl -o $(TEXEUSHIELD)/$(dep) -O $(EUSHIELDURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)
	texhash $(TEXMF)

install-logo-inf:
	@mkdir -v -p $(INFLOGODIR)
	$(foreach dep, $(INFLOGO), \
		echo "Installing $(dep)..." && \
		curl -o $(INFLOGODIR)/$(dep) -O $(INFURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)

install-logo-cdtppar:
	@mkdir -v -p $(CDTPPARLOGODIR)
	$(foreach dep, $(CDTPPARLOGO), \
		echo "Installing $(dep)..." && \
		curl -o $(CDTPPARLOGODIR)/$(dep) -O $(CDTPPARURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)

install-logo-epsrc:
	@mkdir -v -p $(EPSRCLOGODIR)
	$(foreach dep, $(EPSRCLOGO), \
		$(eval dep1 = $(word 1,$(subst :, ,$(dep)))) \
		$(eval dep2 = $(word 2,$(subst :, ,$(dep)))) \
		echo "Installing $(dep2)..." && \
		curl -o $(EPSRCLOGODIR)/$(dep2) -O $(EPSRCURL)/$(dep1) && \
		echo "Installation of $(dep2) complete." || echo "Installation of $(dep2) failed." ; \
	)

