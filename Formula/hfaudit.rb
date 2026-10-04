class Hfaudit < Formula
  desc "Catch hallucinated or typosquatted Hugging Face model/dataset IDs"
  homepage "https://github.com/experimental-gains/hfaudit"
  url "https://github.com/experimental-gains/hfaudit/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "75db55aad4cf1f5e4a7dc072cf4f0421bbed6f014eaa7861cecd0d34ac8258fd"
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
