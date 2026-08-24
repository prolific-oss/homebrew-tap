class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.2/prolific-darwin-arm64"
      sha256 "8c11e3491a2b529d4387cab1e5cb34c42cfe03259e28ca6a9a62794d4ae0e83d"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.2/prolific-darwin-amd64"
      sha256 "63e868f3feafd1335552a5dbb7a1ac54382bafd6719bc7ddffb378f11f33b68e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.2/prolific-linux-arm64"
      sha256 "924e36c4b40d3a303659a356fefcc7d10a3d15d3c5680669977060614f97dec0"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.2/prolific-linux-amd64"
      sha256 "f12656f03c6572d44a3cfe3c3cb5b92890f0137172d31d2c4f23c0bc7413bf4d"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
