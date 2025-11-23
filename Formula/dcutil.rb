class Dcutil < Formula
  desc "Complete Devcontainer Specification Implementation"
  homepage "https://github.com/dtg01100/dcutil"
  url "https://github.com/dtg01100/dcutil/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "53db7e1544361c17936c23f6bb55c74a891708993a9e560b069b2a358b3aff12"
  license "MIT"

  def install
    inreplace "dcutil", 'SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"', 'SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
LIB_DIR="$SCRIPT_DIR/../lib"'
    inreplace "dcutil", '"$SCRIPT_DIR/lib/', '"$LIB_DIR/'
    bin.install "dcutil"
    prefix.install "lib"
  end

  test do
    system "#{bin}/dcutil", "--help"
  end
end