class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.4/canonic-macos-arm64"
      sha256 "7189694648d15bb47107411826e87396d73a7b0556cee183b2e28de248118d9f"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.4/canonic-macos-x64"
      sha256 "3a4a5185f6e7d19da86461730c946c7aa3d02804f419ce58f742720243460e87"
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
