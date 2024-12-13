class Godir < Formula
  desc "A fuzzy directory navigation tool for command line Ninjas"
  homepage "https://github.com/cjus/godir"
  url "https://github.com/cjus/godir/archive/refs/tags/v0.1.6.tar.gz"  # Updated version
  sha256 "cd63207d06cfaae165935132277b7288052fe6a04959bea2447ddfcdd9289289"  # Will need new SHA256
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "godir #{version}", shell_output("#{bin}/godir --version")
  end
end
