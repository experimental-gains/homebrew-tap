class Goproxycheck < Formula
  desc "Diagnose why a Go module version isn't fetchable via the proxy"
  homepage "https://github.com/experimental-gains/goproxycheck"
  url "https://github.com/experimental-gains/goproxycheck/archive/refs/tags/v0.1.16.tar.gz"
  sha256 "9b7830a6623d951026cf30268cf31f0cc45d837c16041752fea8e979c98d8b27"
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
