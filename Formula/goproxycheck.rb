class Goproxycheck < Formula
  desc "Diagnose why a Go module version isn't fetchable via the proxy"
  homepage "https://github.com/experimental-gains/goproxycheck"
  url "https://github.com/experimental-gains/goproxycheck/archive/refs/tags/v0.1.9.tar.gz"
  sha256 "6a9ac6b02fc9e3149e4c29f78ba7b8aaa114cc7008512a3f19029eb0c53d0ed7"
  license "MIT"
  head "https://github.com/experimental-gains/goproxycheck.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/goproxycheck 2>&1", 2)
    assert_match "goproxycheck: no argument given", output
  end
end
