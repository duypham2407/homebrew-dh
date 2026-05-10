class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.4.0-rc.1"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.4.0-rc.1/dh-darwin-arm64"
    sha256 "635731ab012cbf0a9f057d239803d074cb28c6461b05337f820dfda292afa91b"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.4.0-rc.1/dh-darwin-amd64"
    sha256 "554695713943df06bc86670c9a1276ed7a59b71d3334fad71495c402a7e3274c"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
