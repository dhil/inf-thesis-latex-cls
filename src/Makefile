TEXMF=$(HOME)/.texmf/tex/latex
TEXINFTHESIS=$(TEXMF)/informatics/infthesis
TEXEUSHIELD=$(TEXMF)/informatics/eushield
EUSHIELDURL=http://dream.inf.ed.ac.uk/projects/polyml/application/cover-letter/tex/logos
EUSHIELD= \
	eushield.sty \
	eushield-normal.pdf eushield-normal.ps \
	eushield-noback.pdf eushield-noback.ps \
	eushield-reversed.pdf eushield-reversed.ps \
	eushield-twocolour.pdf eushield-twocolour.ps \
	eushield-fullcolour.pdf eushield-fullcolour.ps

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
