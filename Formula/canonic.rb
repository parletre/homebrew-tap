class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.0/canonic-macos-arm64"
      sha256 "7112b81551d2cbc267e47a0ecbdc9117a1eea8da790516b6d2d9eef4836d7b68"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.0/canonic-macos-x64"
      sha256 "34852497d765741564d7d069c06147a5ba30252c12815ee97d876ae1f7a5a7f8"
    end
  end

  on_linux do
    url "https://github.com/parletre/canonic/releases/download/v0.1.0/canonic-linux-x64"
    sha256 "34753bc43a73c0964de6fdfc6f9e3c4f39ab765bf26ede21901bb20dcb47abf1"
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
