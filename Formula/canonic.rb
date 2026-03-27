class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v#{version}/canonic-macos-arm64"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/parletre/canonic/releases/download/v#{version}/canonic-macos-x64"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/parletre/canonic/releases/download/v#{version}/canonic-linux-x64"
    sha256 "PLACEHOLDER"
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
