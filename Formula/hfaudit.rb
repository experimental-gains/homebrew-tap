class Hfaudit < Formula
  desc "Catch hallucinated or typosquatted Hugging Face model/dataset IDs"
  homepage "https://github.com/experimental-gains/hfaudit"
  url "https://github.com/experimental-gains/hfaudit/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "06c2db0f51dac2a937b4e30108f1e10ae33c3d9384e2a51da63ce33cbbd383a6"
  license "MIT"
  head "https://github.com/experimental-gains/hfaudit.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    output = shell_output("echo '' | #{bin}/hfaudit 2>&1", 0)
    assert_match "no Hugging Face model/dataset references found", output
  end
end
