class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.2/canonic-macos-arm64"
      sha256 "524f79438ceb7c8334182729e3c252b8206acc1bdf04277caa9520499f6f1d91"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.2/canonic-macos-x64"
      sha256 "7741882e9f970bae6f730c21a536e27852619b6896133c2b5768735a6238af7e"
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
