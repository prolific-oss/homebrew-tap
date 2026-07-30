# homebrew-tap

Homebrew tap for Prolific tools.

Currently taps:

- [`prolific`](https://github.com/prolific-oss/cli) — the Prolific CLI

## Install

```
brew install prolific-oss/tap/prolific
```

## Update

```
brew upgrade prolific
```

## Development

```
make lint      # brew style + brew audit --strict
make install   # brew install from this checkout
make test      # install + run the formula's test block
make uninstall
make untap     # remove the local tap symlink
```

To pick up a new `prolific-oss/cli` release, run `make bump` (or `make bump VERSION=x.y.z`
to pin a specific one), review the diff, `make test`, then commit.
