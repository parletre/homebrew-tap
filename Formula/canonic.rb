class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.6/canonic-macos-arm64"
      sha256 "9ddcc38b1dc470d76e2d99cc4b5760999c9180179cf1e95473ac4ffc3fb3f6cb"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.6/canonic-macos-x64"
      sha256 "ae7439cecf17f1ecb3b401673601287b12d623ae473b78181e65988872438311"
    end
  end

  def install
    binary = Dir["canonic*"].first
    chmod 0755, binary
    bin.install binary => "canonic"
  end

  test do
    assert_match "canonic", shell_output("#{bin}/canonic --help")
  end
end
