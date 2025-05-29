class Tdp < Formula
  desc "Parse your downloaded TikTok data"
  homepage "https://github.com/commitmaniac/tdp"
  url "https://github.com/commitmaniac/tdp/archive/refs/tags/1.0.1.tar.gz"
  sha256 "03d129dac52b5c9b96467241b0f85d9b209ba130e0b5d74687e4af7893fb86ce"
  license "BSD-3-Clause"

  bottle do
    root_url "https://ghcr.io/v2/fnstruct/tap"
    sha256 cellar: :any, arm64_sequoia: "30001c46efc0f263a28f9992c55a27f25e010419a83400e6acb795f8e2bc35eb"
    sha256 cellar: :any, arm64_sonoma:  "af270e4acaf19acc7029bab9586674ffdddd777a33427e8b92b0d9ef61460d38"
    sha256 cellar: :any, ventura:       "88440fe860195310c683f0626a2abd7f6b4b137379024603806f767f8a5af1bb"
  end

  depends_on "pkgconf" => :build
  depends_on "cjson"

  def install
    system "make"
    bin.install "tdp"
  end

  test do
    msg = "Error: no input file provided"
    assert_match msg, shell_output(bin/"tdp -liked 2>&1", 1)
  end
end
