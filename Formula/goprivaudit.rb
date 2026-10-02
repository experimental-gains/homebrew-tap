class Goprivaudit < Formula
  desc "Audit GOPRIVATE/GONOSUMDB config against go.mod and git rewrites"
  homepage "https://github.com/experimental-gains/goprivaudit"
  url "https://github.com/experimental-gains/goprivaudit/archive/refs/tags/v0.1.94.tar.gz"
  sha256 "404523a431dd93c3158226e67a5b162cb2218d4024abd87d4f389593e0c4856c"
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
