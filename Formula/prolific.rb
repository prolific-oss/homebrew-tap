class Prolific < Formula
  desc "Command-line interface for Prolific"
  homepage "https://github.com/prolific-oss/cli"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.3/prolific-darwin-arm64"
      sha256 "4ccf433187b02814af8dd54f281e9940219e948f8a5a146e986f3fed19ea926e"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.3/prolific-darwin-amd64"
      sha256 "b6cb5dcb34b7d5e0fde7a1e36767176c290e2618ba18a92d182486f8f4954e8a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.3/prolific-linux-arm64"
      sha256 "4ffbb407a05bb4b8143c716d39ac389ceb010348569ec2adc5d3bb8ad92e9625"
    end
    on_intel do
      url "https://github.com/prolific-oss/cli/releases/download/v1.3.3/prolific-linux-amd64"
      sha256 "8553f7f05fa818ad60f8c68d9d5f6e77ddc282ff7594eb4f8ff0ef89383c1780"
    end
  end

  def install
    bin.install Dir["prolific-*"].first => "prolific"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prolific --version")
  end
end
