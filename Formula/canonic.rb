class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.3/canonic-macos-arm64"
      sha256 "bb2bc14ed44859d91906cc77af68308670a34ad664c802d6ad1ab00b2646f272"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.3/canonic-macos-x64"
      sha256 "1c08e9f0963f1c99cd433ff492e931e05dc89c3f327550af31cbfe0ef2925e8d"
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
