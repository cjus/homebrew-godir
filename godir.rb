class Godir < Formula
  desc "A fuzzy directory navigation tool for command line Ninjas"
  homepage "https://github.com/cjus/godir"
  url "https://github.com/cjus/godir/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"  # You'll need to calculate this
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "godir #{version}", shell_output("#{bin}/godir --version")
  end
end 
