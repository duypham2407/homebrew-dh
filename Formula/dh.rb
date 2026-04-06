class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.8"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.8/dh-darwin-arm64"
    sha256 "97ca75914a42dededda0e7b790e8fb87309e2d27462ff70513b2a83071a5e80e"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.8/dh-darwin-amd64"
    sha256 "ae8fde3232487928590a7267f426020b0031bf3d3431baa9bb370ffd719b7bba"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
