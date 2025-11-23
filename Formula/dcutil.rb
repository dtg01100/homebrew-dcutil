class Dcutil < Formula
  desc "Complete Devcontainer Specification Implementation"
  homepage "https://github.com/dtg01100/dcutil"
  url "https://github.com/dtg01100/dcutil/archive/refs/tags/v1.0.8.tar.gz"
  sha256 "8ac3cf2f8737e395f901a0267000191cb42d06a769c439b8a05e482bf428df02"
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