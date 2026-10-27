class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.2/prolific-darwin-arm64"
      sha256 "4d57f50bbbc33e7753b6537a0f19e4e7f8e67bedb3bb4891b0f5381c3b1b473a"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.2/prolific-darwin-amd64"
      sha256 "228eeeb25a40096214336c5795066d7557667d846b3d0389e286914e9bf0e6a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.2/prolific-linux-arm64"
      sha256 "949d23a0e958775230ae313f3309cb8c6a6288dfbc80d6981d3bd495c09fcf8a"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.2/prolific-linux-amd64"
      sha256 "935f5186332772b178d582a62124f6fa0fa714997d4588bc02ca462330dd8d72"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
