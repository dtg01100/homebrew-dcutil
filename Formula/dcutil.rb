class Dcutil < Formula
  desc "Complete Devcontainer Specification Implementation"
  homepage "https://github.com/dtg01100/dcutil"
  url "https://github.com/dtg01100/dcutil/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "5fdba221e3a0b9ee7433fc25a346810cfc3302a5624c8684adfcfca2625628f4"
  license "MIT"

  def install
    bin.install "dcutil"
    prefix.install "lib"
  end

  test do
    system "#{bin}/dcutil", "--help"
  end
end