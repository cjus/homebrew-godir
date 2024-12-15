class Godir < Formula
  desc "A fuzzy directory navigation tool for command line Ninjas"
  homepage "https://github.com/cjus/godir"
  url "https://github.com/cjus/godir/archive/refs/tags/v0.1.9.tar.gz"  # Updated version
  sha256 "8a2160353bc92a90ab6bba4812f1027ac0db9b48ebe72e41b8978e40a901ab3e"  # Will need new SHA256
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      Post-installation instructions:

      > For Unix-based Systems (macOS/Linux)
      To ensure `godir` can change the current shell directory, add this shell function to your shell's configuration file (~/.bashrc, ~/.zshrc, etc.):

      godir() {
          local output
          output="$(command #{bin}/godir "$@")"
          if [ $? -eq 0 ]; then
              if [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--version" ]] || [[ "$1" == "-V" ]] || [[ "$1" == "--list" ]] || [[ "$1" == "-l" ]]; then
                  echo "$output"
              elif [ -n "$output" ]; then
                  cd "$output"
              fi
          fi
      }

      > For Windows
      For Windows PowerShell, add this function to your PowerShell profile (usually at `$PROFILE`):

      function godir {
          $output = & godir.exe $args
          if ($LASTEXITCODE -eq 0) {
              if ($args -contains "--help" -or $args -contains "-h" -or $args -contains "--version" -or $args -contains "-V" -or $args -contains "--list" -or $args -contains "-l") {
                  Write-Output $output
              }
              elseif ($output) {
                  Set-Location $output
              }
          }
      }

      Then reload your shell configuration:
      - Unix: `source ~/.bashrc` (or ~/.zshrc)
      - Windows: `. $PROFILE`

    EOS
  end

  test do
    assert_match "godir #{version}", shell_output("#{bin}/godir --version")
  end
end
