class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.7"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.7/dh-darwin-arm64"
    sha256 "87311821c8c7c84ed8f96b80887432f656ae475096b13b74e9335a6be9c04104"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.7/dh-darwin-amd64"
    sha256 "b2aaf7c80939c70e7741cbd4899028293efe2c9a3f6c3c89b390f47affb8c346"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
