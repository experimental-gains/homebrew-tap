class Goproxycheck < Formula
  desc "Diagnose why a Go module version isn't fetchable via the proxy"
  homepage "https://github.com/experimental-gains/goproxycheck"
  url "https://github.com/experimental-gains/goproxycheck/archive/refs/tags/v0.1.99.tar.gz"
  sha256 "e4183c8bc5e1bb823a0f2156032726f65eb4869f27ea24037634c4d1b2290056"
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
