class Goprivaudit < Formula
  desc "Audit GOPRIVATE/GONOSUMDB config against go.mod and git rewrites"
  homepage "https://github.com/experimental-gains/goprivaudit"
  url "https://github.com/experimental-gains/goprivaudit/archive/refs/tags/v0.1.56.tar.gz"
  sha256 "88fa5db3cd508b8b5c283c05508915f742be821604d4ef2031b8b5b67b1fdec2"
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
