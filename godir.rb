class Godir < Formula
  desc "A fuzzy directory navigation tool for command line Ninjas"
  homepage "https://github.com/cjus/godir"
  url "https://github.com/cjus/godir/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "8e36af66203d6ac039c57e102ced5918172efd4a8047bb66d023d758db648a43i"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "godir #{version}", shell_output("#{bin}/godir --version")
  end
end 
