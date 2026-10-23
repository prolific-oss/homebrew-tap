class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.1/prolific-darwin-arm64"
      sha256 "45cc3451049d6a18bfdbbcdb6a1a8a1c4087c6eec47347f2eba6b01864db522b"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.1/prolific-darwin-amd64"
      sha256 "1fb9a20553f8d9c12b5340314b21fb322e2a7ae00f875a07f356acd3571d3b94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.1/prolific-linux-arm64"
      sha256 "0f7b20f726fd0fc2b0ffa4db499e4cd7044a7a9a5ea71ffd1dcb1e98b931e97a"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.1/prolific-linux-amd64"
      sha256 "7ceb906d0c31e7cccdb4250f3401429bb1e9c00fa1bf639aa75633b21b12d8a2"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
