class Dcutil < Formula
  desc "Complete Devcontainer Specification Implementation"
  homepage "https://github.com/dtg01100/dcutil"
  url "https://github.com/dtg01100/dcutil/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "3b70907440c36f97afafc7d840c62144705f5e86bf0522786655d561a6d23dd6"
  license "MIT"

  def install
    bin.install "dcutil"
    prefix.install "lib"
  end

  test do
    system "#{bin}/dcutil", "--help"
  end
end