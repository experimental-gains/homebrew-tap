class Modslop < Formula
  desc "Catch slopsquatted and hallucinated Go module names in go.mod"
  homepage "https://github.com/experimental-gains/modslop"
  url "https://github.com/experimental-gains/modslop/archive/refs/tags/v0.2.29.tar.gz"
  sha256 "5b49b517be3b5635dd98a2005b5d76cddcfbab0662721f0b5d51eb38edfc88a8"
  license "MIT"
  head "https://github.com/experimental-gains/modslop.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/modslop 2>&1", 2)
    assert_match "modslop: reading go.mod", output
  end
end
