class Hfaudit < Formula
  desc "Catch hallucinated or typosquatted Hugging Face model/dataset IDs"
  homepage "https://github.com/experimental-gains/hfaudit"
  url "https://github.com/experimental-gains/hfaudit/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "e803f102cee2470357d28b6fdbeee1b52dcb477a6a185c7c3ed776f7dd2d437c"
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
