class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/fnstruct/ris"
  url "https://github.com/fnstruct/ris/archive/refs/tags/1.1.0.tar.gz"
  sha256 "0a1dba2efe534878c82fd3aba78e83e7efcec729f86c97be4f2f35144a3d42a9"
  license "BSD-3-Clause"
  head "https://github.com/fnstruct/ris.git", branch: "master"

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "ris #{version}", shell_output("#{bin}/ris -version")
  end
end
