class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.3.1-rc.6"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.3.1-rc.6/dh-darwin-arm64"
    sha256 "36547037f67332f21a127c23d4fa1545784cbf1d50018acf0bec2d2ee34d814e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.3.1-rc.6/dh-darwin-amd64"
    sha256 "efa635e5f060af6c0c918e3afbabd932b4aa65d716fbb56a35d84ab1ecf2d5f1"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
