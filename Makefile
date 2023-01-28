include installers.mk

.PHONY: usage
usage:
	@echo 'no default action'

.PHONY: all
all: pip npm brew cargo go

.PHONY: pip
pip:
	$(PIP) install black

.PHONY: npm
npm:
	$(NPM) install $(NPM_FLAGS) eslint_d \
		bash-language-server \
		prettier

.PHONY: brew
brew:
	$(BREW) install lua-language-server \
		shellcheck \
		gopls

.PHONY: cargo
cargo:
	$(CARGO) install stylua

.PHONY: go
go:
	$(GO) install mvdan.cc/sh/v3/cmd/shfmt@v3.6.0

