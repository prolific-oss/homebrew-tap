class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.5/prolific-darwin-arm64"
      sha256 "11998416bbceef5bc8872801a9ba7c95e5dc2000b4e7390fe35d5fdd2eb915f0"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.5/prolific-darwin-amd64"
      sha256 "7ccd8dc029216a80f8773154f43e6e4b4fd11d78d832ac4100cec79be129b4ef"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.5/prolific-linux-arm64"
      sha256 "784a92d867431b1d5599ea7d3cef627dd3c25f0445f5ed8efcb492a712b6c626"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.5/prolific-linux-amd64"
      sha256 "d0aece4906d879c5bc2eef8676f84243d7a1a2416ff53c42de1271d046ec106d"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
