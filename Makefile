.PHONY: install uninstall doctor lint version

install:
	@bash scripts/aip.sh install

uninstall:
	@bash scripts/aip.sh uninstall

doctor:
	@bash scripts/aip.sh doctor

lint:
	@bash scripts/lint.sh

version:
	@bash scripts/aip.sh version
