class Modslop < Formula
  desc "Catch slopsquatted and hallucinated Go module names in go.mod"
  homepage "https://github.com/experimental-gains/modslop"
  url "https://github.com/experimental-gains/modslop/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "9397b4c6d310f41b76b0f9414aede10b5af44adbfea3917e9a7ac20e5409fbb1"
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
