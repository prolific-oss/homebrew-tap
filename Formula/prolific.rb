class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.3/prolific-darwin-arm64"
      sha256 "0725996693a38d5904166b398fc8936b0d93057618976fc52bb7e854701b4730"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.3/prolific-darwin-amd64"
      sha256 "150fe630ba448f4072e2dcb03379601766bbe5ae6962f4fd6e028c3ebe839f2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.3/prolific-linux-arm64"
      sha256 "aef95a38648804594c77a33948d86fc1974c59c7a4d32aa578b821501674e5eb"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.2.3/prolific-linux-amd64"
      sha256 "33eb7818e0472d17515e0b4684db89cbb49c4c43da717035ee16efb9ecad5fd0"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
