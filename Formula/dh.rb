class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.9"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.9/dh-darwin-arm64"
    sha256 "1c300af451abe0226501611eeeeae26de359d6a2e15e8a35f204b11e6b54187f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.9/dh-darwin-amd64"
    sha256 "2830ac00b84a9e7c00596bd041bdaf6e3c6c44e3964b593ed6192102b53af5e1"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
