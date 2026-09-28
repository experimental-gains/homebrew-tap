class Goprivaudit < Formula
  desc "Audit GOPRIVATE/GONOSUMDB config against go.mod and git rewrites"
  homepage "https://github.com/experimental-gains/goprivaudit"
  url "https://github.com/experimental-gains/goprivaudit/archive/refs/tags/v0.1.63.tar.gz"
  sha256 "c7b1494e6068ae0df6bed3d2e945b654e4431f1de2cf43f1eee147b26700f475"
  license "MIT"
  head "https://github.com/experimental-gains/goprivaudit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/goprivaudit 2>&1", 2)
    assert_match "goprivaudit: open go.mod", output
  end
end
