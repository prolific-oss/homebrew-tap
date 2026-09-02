class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.4/prolific-darwin-arm64"
      sha256 "43ba16a807f760fc273d78bf9a3599799b641b0dc34605b369658c2e56def7b1"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.4/prolific-darwin-amd64"
      sha256 "4c6023427c2586ebee428ecef0e0f59875c6a5a7445edb4f003e8cb1b3638972"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.4/prolific-linux-arm64"
      sha256 "831875c2f3031133094929e7ef6b487d9bf56e3fbc47fe77e8e11cc396a2c2e6"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.4/prolific-linux-amd64"
      sha256 "4c690a49dca34624357dd6fa12e632360bfa500146c99fbc616ba3e870018a23"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
