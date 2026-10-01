class Goprivaudit < Formula
  desc "Audit GOPRIVATE/GONOSUMDB config against go.mod and git rewrites"
  homepage "https://github.com/experimental-gains/goprivaudit"
  url "https://github.com/experimental-gains/goprivaudit/archive/refs/tags/v0.1.86.tar.gz"
  sha256 "d16f119c18f7d158a1fb2ef066b1f2f370adfe92309dd5726c71e98041f3519e"
  license "MIT"
  head "https://github.com/experimental-gains/goprivaudit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("#{bin}/goprivaudit 2>&1", 2)
    assert_match "goprivaudit: open go.mod", output
  end
end
