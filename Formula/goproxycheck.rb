class Goproxycheck < Formula
  desc "Diagnose why a Go module version isn't fetchable via the proxy"
  homepage "https://github.com/experimental-gains/goproxycheck"
  url "https://github.com/experimental-gains/goproxycheck/archive/refs/tags/v0.1.46.tar.gz"
  sha256 "68f77273d9bc15c828efbcba0a5c10840d41c2f512c4e62070c3ba2ccffa7179"
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
