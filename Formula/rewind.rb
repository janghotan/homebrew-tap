class Rewind < Formula
  desc "Universal undo for destructive shell commands"
  homepage "https://github.com/janghotan/rewind"
  url "https://github.com/janghotan/rewind/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "cdb10dc3aeaf28a43d44a65754b24c354f2d2323844903e12c9a830d957848ff"
  license "MIT"
  head "https://github.com/janghotan/rewind.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "docs/rewind.1"

    generate_completions_from_executable(bin/"rewind", "completions")
  end

  test do
    assert_match "rewind #{version}", shell_output("#{bin}/rewind --version")
    assert_match "Usage: rewind <COMMAND>", shell_output("#{bin}/rewind --help")
    assert_match 'eval "$(rewind init bash)"', shell_output("#{bin}/rewind init bash")
    assert_match "eval \"$(rewind init zsh)\"", shell_output("#{bin}/rewind init zsh")
    assert_match "rewind init fish | source", shell_output("#{bin}/rewind init fish")
    assert_match "_rewind", shell_output("#{bin}/rewind completions bash")
    assert_match "_rewind", shell_output("#{bin}/rewind completions zsh")
    assert_match "__fish_rewind", shell_output("#{bin}/rewind completions fish")
  end
end
