# Makefile for installing the infthesis LaTeX class, eushield
# package, and associated logos.
#
# To install infthesis.cls type:
# $ make install
#
# To install the required eushield.sty type:
# $ make install-eushield
#
# To install logos type:
# $ make install-logo-inf
# $ make install-logo-cdtppar
# $ make install-logo-epsrc
#
# Each install command has an associated uninstall command, e.g. to
# uninstall the infthesis class and eushield.sty type:
# $ make uninstall
# $ make uninstall-eushield

TEXMF=$(HOME)/.texmf/tex/latex
INSTDIR?=$(TEXMF)
TEXINFTHESIS=$(INSTDIR)/uoe/informatics/infthesis

TEXEUSHIELD=$(INSTDIR)/uoe/informatics/eushield
EUSHIELDURL=http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos
EUSHIELD= \
	eushield.sty eushield.eps \
	eushield-normal.pdf eushield-normal.ps \
	eushield-noback.pdf eushield-noback.ps \
	eushield-reversed.pdf eushield-reversed.ps \
	eushield-twocolour.pdf eushield-twocolour.ps \
	eushield-fullcolour.pdf eushield-fullcolour.ps

INFLOGODIR=$(INSTDIR)/logos/informatics
INFURL=http://media.inf.ed.ac.uk/infweb/logos
INFLOGO=InformaticsUni_spot.eps InformaticsUni_CMYK.eps

CDTPPARLOGODIR=$(INSTDIR)/logos/cdtppar
CDTPPARURL=http://media.inf.ed.ac.uk/infweb/ppar-logos
CDTPPARLOGO=cmyk.eps black.eps white.eps

EPSRCLOGODIR=$(INSTDIR)/logos/epsrc
EPSRCURL=https://www.epsrc.ac.uk/files/aboutus/logos-and-indentity
EPSRCLOGO=white-out-sponsorship-logo:sponsor-wofullres.eps \
					black-and-white-sponsorship-logo-full-resolution:sponsor-bwfullres.eps \
					colour-sponsorship-logo-full-resolution:sponsorfullres.eps


install: infthesis.cls
	@mkdir -v -p $(TEXINFTHESIS) && \
	cp -v infthesis.cls $(TEXINFTHESIS)/infthesis.cls && \
	texhash --verbose $(INSTDIR) && \
	echo "Installation complete." || echo "Installation failed."

uninstall: $(TEXINFTHESIS)/infthesis.cls
	@rm -v $(TEXINFTHESIS)/infthesis.cls && \
	texhash --verbose $(INSTDIR) && \
	echo "Uninstallation complete." || echo "Uninstallation failed."
	@echo "Attempting to removing directory structure."
	@rmdir -v -p $(TEXINFTHESIS) && true || true

install-eushield:
	@mkdir -v -p $(TEXEUSHIELD)
	$(foreach dep, $(EUSHIELD), \
		echo "Installing $(dep)..." && \
		curl -o $(TEXEUSHIELD)/$(dep) -O $(EUSHIELDURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)
	texhash $(INSTDIR)

uninstall-eushield:
	$(foreach dep, $(EUSHIELD), \
		echo "Uninstalling $(dep)..." && \
		rm -v $(TEXEUSHIELD)/$(dep) && \
		echo "Uninstallation of $(dep) complete." || echo "Uninstallation of $(dep) failed." ; \
	)
	texhash $(INSTDIR) && \
	@rmdir -p -v $(TEXEUSHIELD) && true || true

install-logo-inf:
	@mkdir -v -p $(INFLOGODIR)
	$(foreach dep, $(INFLOGO), \
		echo "Installing $(dep)..." && \
		curl -o $(INFLOGODIR)/$(dep) -O $(INFURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)

uninstall-logo-inf:
	$(foreach dep, $(INFLOGO), \
		echo "Uninstalling $(dep)..." && \
		rm -v $(INFLOGODIR)/$(dep) && \
		echo "Uninstallation of $(dep) complete." || echo "Uninstallation of $(dep) failed." ; \
	)
	@rmdir -v -p $(INFLOGODIR) && true || true


install-logo-cdtppar:
	@mkdir -v -p $(CDTPPARLOGODIR)
	$(foreach dep, $(CDTPPARLOGO), \
		echo "Installing $(dep)..." && \
		curl -o $(CDTPPARLOGODIR)/$(dep) -O $(CDTPPARURL)/$(dep) && \
		echo "Installation of $(dep) complete." || echo "Installation of $(dep) failed." ; \
	)

uninstall-logo-cdtppar:
	$(foreach dep, $(CDTPPARLOGO), \
		echo "Uninstalling $(dep)..." && \
		curl -o $(CDTPPARLOGODIR)/$(dep) -O $(CDTPPARURL)/$(dep) && \
		echo "Uninstallation of $(dep) complete." || echo "Uninstallation of $(dep) failed." ; \
	)
	@rmdir -v -p $(CDTPPARLOGODIR) && true || true

install-logo-epsrc:
	@mkdir -v -p $(EPSRCLOGODIR)
	$(foreach dep, $(EPSRCLOGO), \
		$(eval dep1 = $(word 1,$(subst :, ,$(dep)))) \
		$(eval dep2 = $(word 2,$(subst :, ,$(dep)))) \
		echo "Installing $(dep2)..." && \
		curl -o $(EPSRCLOGODIR)/$(dep2) -O $(EPSRCURL)/$(dep1) && \
		echo "Installation of $(dep2) complete." || echo "Installation of $(dep2) failed." ; \
	)

uninstall-logo-epsrc:
	$(foreach dep, $(EPSRCLOGO), \
		$(eval dep1 = $(word 1,$(subst :, ,$(dep)))) \
		$(eval dep2 = $(word 2,$(subst :, ,$(dep)))) \
		echo "Uninstalling $(dep2)..." && \
		curl -o $(EPSRCLOGODIR)/$(dep2) -O $(EPSRCURL)/$(dep1) && \
		echo "Uninstallation of $(dep2) complete." || echo "Uninstallation of $(dep2) failed." ; \
	)
	@rmdir -v -p $(EPSRCLOGODIR) && true || true
