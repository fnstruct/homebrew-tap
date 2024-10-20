class Ris < Formula
  desc "Rename in sequence"
  homepage "https://github.com/fnstruct/ris"
  url "https://github.com/fnstruct/ris/archive/refs/tags/1.2.0.tar.gz"
  sha256 "e7a477ddc4304d0bbfbd21decb2a93e6fd6ebbb44793d7f2a67e588a6b4915f9"
  license "BSD-3-Clause"
  head "https://github.com/fnstruct/ris.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/fnstruct/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b514f17f90451fcdd7b2f158f67e466e9d536bff35bbb88649b7eeb8322635fa"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b514f17f90451fcdd7b2f158f67e466e9d536bff35bbb88649b7eeb8322635fa"
    sha256 cellar: :any_skip_relocation, ventura:       "5c4cb96a560ad19de07ab05dcd89d1dc0aff1888938b03caee27ba6dc34a440d"
  end

  depends_on "go" => :build

  def install
    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end

  test do
    assert_match "ris #{version}", shell_output("#{bin}/ris -version")
  end
end
