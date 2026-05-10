class Dh < Formula
  desc "Local-first AI coding assistant for macOS and Linux"
  homepage "https://github.com/duypham2407/dh-kit"
  version "0.3.1-rc.7"
  license "MIT"

  depends_on "node@22"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.3.1-rc.7/dh-darwin-arm64"
    sha256 "659ada0b01f1b2d76b6a2611180979f5d4ee31a221eb8e079b4a11a481e99f3c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/duypham2407/dh-kit/releases/download/v0.3.1-rc.7/dh-darwin-amd64"
    sha256 "8aa0e16cf8ce2493a5771fdb19da439d304bfebe544d83c3c8d875975a8ad4ab"
  end

  def install
    binary_name = Dir["dh-*"].first || "dh"
    bin.install binary_name => "dh"
  end

  test do
    assert_match "dh", shell_output("#{bin}/dh --help")
  end
end
