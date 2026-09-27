class Goprivaudit < Formula
  desc "Audit GOPRIVATE/GONOSUMDB config against go.mod and git rewrites"
  homepage "https://github.com/experimental-gains/goprivaudit"
  url "https://github.com/experimental-gains/goprivaudit/archive/refs/tags/v0.1.46.tar.gz"
  sha256 "ff5abf0988d59ae04d731e26402a1eea941f52a239f570553bdf1292e8bb2f2e"
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
