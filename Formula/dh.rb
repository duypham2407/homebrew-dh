class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.0/dh-darwin-arm64"
    sha256 "28d0126eaca643b1eabc81b7b9a0b034c5546ce2768d7935a97a66149070ed6f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.0/dh-darwin-amd64"
    sha256 "9b7e162817de4265f4ec3b45352d33dddbf647bd113d727c9fb60c3e4b34fc51"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
