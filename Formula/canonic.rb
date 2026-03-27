class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.5/canonic-macos-arm64"
      sha256 "eb787b4822195ed1a06735a64b8aecca085c1c595b7568d49b3f81bb73c786f8"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.5/canonic-macos-x64"
      sha256 "a4611c5a37cccfd26e0835524ff39566aae2879865e5032aec56f522962d88ad"
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
