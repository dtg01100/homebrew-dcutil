class Dcutil < Formula
  desc "Complete Devcontainer Specification Implementation"
  homepage "https://github.com/dtg01100/dcutil"
  url "https://github.com/dtg01100/dcutil/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "d7e08e7766d75cd2679ed85226f94f24fbc07689182bc7319aef9db9e1d8e91f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "dcutil"
    prefix.install "lib"

    # Install bash completion
    bash_completion.install "completion.bash" => "dcutil"

    # Install zsh completion
    zsh_completion.install "completion.zsh" => "_dcutil"

    # Install fish completion
    fish_completion.install "completion.fish" => "dcutil.fish"
  end

  test do
    system "#{bin}/dcutil", "--help"
  end
end