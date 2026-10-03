class Hfaudit < Formula
  desc "Catch hallucinated or typosquatted Hugging Face model/dataset IDs"
  homepage "https://github.com/experimental-gains/hfaudit"
  url "https://github.com/experimental-gains/hfaudit/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "cba25f5db0dbcb1a21ca928409fb8f07f04165e64c824d5d9c1339dfa82ed38b"
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
