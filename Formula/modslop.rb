class Modslop < Formula
  desc "Catch slopsquatted and hallucinated Go module names in go.mod"
  homepage "https://github.com/experimental-gains/modslop"
  url "https://github.com/experimental-gains/modslop/archive/refs/tags/v0.2.58.tar.gz"
  sha256 "a43f073b43dbb3de7068559cf56e8e3b84248196ce6ecf5df1ab0408ac675d29"
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
