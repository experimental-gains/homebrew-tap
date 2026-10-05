class Modslop < Formula
  desc "Catch slopsquatted and hallucinated Go module names in go.mod"
  homepage "https://github.com/experimental-gains/modslop"
  url "https://github.com/experimental-gains/modslop/archive/refs/tags/v0.2.91.tar.gz"
  sha256 "5b6bdcd9f3fb50bc36b76e2032b043f739b3b8938ce56e8e741619f7058df670"
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
