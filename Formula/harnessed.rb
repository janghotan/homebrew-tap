class Harnessed < Formula
  include Language::Python::Virtualenv

  desc "Benchmark what your agent actually does, not just whether it worked"
  homepage "https://github.com/janghotan/harnessed"
  url "https://github.com/janghotan/harnessed/releases/download/v0.1.0/harnessed-0.1.0.tar.gz"
  sha256 "a5515bae33df158fefd073ccc20b12c3d8832a400f42ad9dab6185df7417cb46"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "Agent-behavior benchmarking CLI", shell_output("#{bin}/harnessed --help")
  end
end
