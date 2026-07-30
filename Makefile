TAP := prolific-oss/tap
FORMULA := prolific
REPO := prolific-oss/cli

tapdir := $$(brew --repository)/Library/Taps/$$(dirname $(TAP))/homebrew-$$(basename $(TAP))

.PHONY: lint
lint: tap
	brew style Formula/$(FORMULA).rb
	brew audit --strict $(TAP)/$(FORMULA)
	shellcheck scripts/*.sh

.PHONY: install
install: tap
	brew install --formula $(TAP)/$(FORMULA)

# Symlink the current head as $(TAP), so brew commands see local edits live.
.PHONY: tap
tap:
	@dir="$(tapdir)"; \
	if [ -L "$$dir" ]; then \
		: already tapped; \
	elif [ -e "$$dir" ]; then \
		echo "error: $$dir exists and isn't a symlink; run 'brew untap $(TAP)' first" >&2; exit 1; \
	else \
		mkdir -p "$$(dirname "$$dir")"; \
		ln -s "$(CURDIR)" "$$dir"; \
	fi

.PHONY: test
test: install 
	brew test $(FORMULA)

.PHONY: uninstall
uninstall:
	brew uninstall $(FORMULA) || true

.PHONY: untap
untap:
	brew untap $(TAP) || true

.PHONY: bump
bump: ## Update Formula/prolific.rb to the latest cli release (VERSION=x.y.z to pin)
	./scripts/bump-formula.sh $(VERSION)
