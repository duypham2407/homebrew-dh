class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.1.6"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.6/dh-darwin-arm64"
    sha256 "c7a4c9b8183b74132e22a3551e81fee5770cc31a48f921ba7dc139756d7cce47"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.1.6/dh-darwin-amd64"
    sha256 "26eaa78fc71bd10cbd0e5bcd93e385a94cced589fcb03aa6630a002c54686bb0"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
