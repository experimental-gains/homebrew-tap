class Goproxycheck < Formula
  desc "Diagnose why a Go module version isn't fetchable via the proxy"
  homepage "https://github.com/experimental-gains/goproxycheck"
  url "https://github.com/experimental-gains/goproxycheck/archive/refs/tags/v0.1.24.tar.gz"
  sha256 "d44e97700062130986a75323af81c216cd64f1f7f00052fbc1be446f5edb92fd"
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
