class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.1/prolific-darwin-arm64"
      sha256 "31db3e6fe159b2cafb006df6b9b76aebd87e73220fd66629955de447340cc5fc"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.1/prolific-darwin-amd64"
      sha256 "4a652762af2f95479279b0bc9363332e08c050e86710824bea7ababdd62e86b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.1/prolific-linux-arm64"
      sha256 "64760ad84562d9fc050d413714b1940ea7894255a8039adf7a63dab15c28fad0"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.1/prolific-linux-amd64"
      sha256 "3509dc066dcdb99e5f47f973f5bc803c921dd41d477d61ddbb53ee0e54d4a373"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
