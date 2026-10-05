class Hfaudit < Formula
  desc "Catch hallucinated or typosquatted Hugging Face model/dataset IDs"
  homepage "https://github.com/experimental-gains/hfaudit"
  url "https://github.com/experimental-gains/hfaudit/archive/refs/tags/v0.1.14.tar.gz"
  sha256 "dd5a4d597d7f8f4303220e9181d9ea352903892f11949bcc2443d95eb0d0b0c8"
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
