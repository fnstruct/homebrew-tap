class FMicro < Formula
  desc "Patched terminal-based text editor"
  homepage "https://micro-editor.github.io"
  url "https://github.com/zyedidia/micro.git",
      tag:      "v2.0.14",
      revision: "04c577049ca898f097cd6a2dae69af0b4d4493e1"
  license "MIT"
  head "https://github.com/zyedidia/micro.git", branch: "master"

  bottle do
    root_url "https://ghcr.io/v2/fnstruct/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "916f83ae37d19d95a7d1f19b65c8c77bc49e8aae45f5f86a225abbd33ab3e048"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "95b9fde80f09312cad54d4fad8f028daf56fb5920d7eff1edc6b34115e07ff94"
    sha256 cellar: :any_skip_relocation, ventura:       "e73f980542c287f77762b49e9996dd48af45967f5aefa0c00f57e2a479d42b12"
  end

  depends_on "go" => :build

  conflicts_with "micro", because: "micro installs a conflicting micro binary"

  patch do
    url "https://github.com/fnstruct/patches/raw/3d26061/micro/gitignore-syntax-highlighting.patch"
    sha256 "2ca4fbb467d9b3c98c75f62943e380585b6782ff011b868207812f10aebf3373"
  end

  patch do
    url "https://github.com/fnstruct/patches/raw/f29a3f0/micro/improve-micros-file-format-highlight.patch"
    sha256 "1e31552ebde550a6ba42dd4732a843b3b52a20807ac4161016cf2875d715ea70"
  end

  def install
    system "make", "build-tags"
    bin.install "micro"
    bin.install_symlink "micro" => "editor"
    man1.install "assets/packaging/micro.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/micro -version")
  end
end
