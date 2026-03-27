class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.1/canonic-macos-arm64"
      sha256 "afa0736c8700e7364533a728cb5c7853b20eec525296d0e1e5669838eb165934"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.1/canonic-macos-x64"
      sha256 "179f8b7bed19d0db4d1093d32ebc10708fd38dcce8fda82398149faea8f00803"
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
