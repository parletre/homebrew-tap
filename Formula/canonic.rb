class Canonic < Formula
  desc "AI behavioral rules, composed and distributed"
  homepage "https://github.com/parletre/canonic"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/parletre/canonic/releases/download/v0.1.3/canonic-macos-arm64"
      sha256 "00ccee6888832cd693e05a4e55a050f52777dd97b260698ff3f851ddf9b715d4"
    else
      url "https://github.com/parletre/canonic/releases/download/v0.1.3/canonic-macos-x64"
      sha256 "d005a4f77bed93a9772a4ba243a2c8a2396dd50bd9895a9dcffbc4f439857512"
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
