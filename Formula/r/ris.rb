class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/fnstruct/ris"
  url "https://github.com/fnstruct/ris/archive/refs/tags/1.0.0.tar.gz"
  sha256 "dee446a3e3614d0ff900d399c52b6702ca25c3dec8648e9f01c0e6240b2e971b"
  license "BSD-3-Clause"
  head "https://github.com/fnstruct/ris.git", branch: "master"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "ris \"#{version}\"", shell_output("#{bin}/ris -version")
  end
end
