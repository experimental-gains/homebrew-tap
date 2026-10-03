class Modslop < Formula
  desc "Catch slopsquatted and hallucinated Go module names in go.mod"
  homepage "https://github.com/experimental-gains/modslop"
  url "https://github.com/experimental-gains/modslop/archive/refs/tags/v0.2.79.tar.gz"
  sha256 "0ebba639148f5c04b43efd62e6b342936f97e53d9186149ac76fab590a0998ce"
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
