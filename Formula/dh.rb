class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.0/dh-darwin-arm64"
    sha256 "244cbef1a441a450fa87670e9a429082f5cbcee423b731bb896bfa4fd101688d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.0/dh-darwin-amd64"
    sha256 "fde80e128ba820ba66da4978bccdf97300efc032ab1e494d9f468d684a6c0be7"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
