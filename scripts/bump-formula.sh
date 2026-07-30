#!/usr/bin/env bash
# Update Formula/prolific.rb to a release of prolific-oss/cli.
# Usage: scripts/bump-formula.sh [version]   (defaults to latest release)
set -euo pipefail

REPO="prolific-oss/cli"
FORMULA="Formula/prolific.rb"
VERSION="${1:-}"

if [ -z "$VERSION" ]; then
  VERSION=$(gh release view --repo "$REPO" --json tagName --jq '.tagName' | sed 's/^v//')
fi
TAG="v${VERSION}"

echo "Bumping $FORMULA to $TAG"

sha() {
  gh release view "$TAG" --repo "$REPO" --json assets \
    --jq ".assets[] | select(.name==\"prolific-$1\") | .digest | sub(\"sha256:\"; \"\")"
}

sed -i.bak -E "s#download/v[0-9][^/]*/#download/${TAG}/#g" "$FORMULA"

for asset in darwin-arm64 darwin-amd64 linux-arm64 linux-amd64; do
  digest=$(sha "$asset")
  if [ -z "$digest" ]; then
    echo "error: no asset prolific-$asset found in release $TAG" >&2
    exit 1
  fi
  sed -i.bak -E "/prolific-${asset}\"$/{n;s/sha256 \"[^\"]+\"/sha256 \"${digest}\"/;}" "$FORMULA"
done

rm -f "${FORMULA}.bak"
echo "Done. Review the diff, then run 'make test' before committing."
