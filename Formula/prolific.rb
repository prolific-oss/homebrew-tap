class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.1.0/prolific-darwin-arm64"
      sha256 "24fa2897f50efaece6ab50ddbfc58993d038a6271cdcc82184ecdb1747b7654c"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.1.0/prolific-darwin-amd64"
      sha256 "d2e2b2f74dcef747108a21a00fd4b2a264ad1f02f1d8de9ce04415a923d69057"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.1.0/prolific-linux-arm64"
      sha256 "4a53a5ed8a6cdc77ad523c8f1cf0c3fcffd180aed7fedc24bafa534b4a9ebc84"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.1.0/prolific-linux-amd64"
      sha256 "2bd1044c29677f678cdff5bb51d2c528888f50ee936b4d7243b6a6227c07fda0"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
