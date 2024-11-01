class FMicro < Formula
  desc "Patched terminal-based text editor"
  homepage "https://micro-editor.github.io"
  url "https://github.com/zyedidia/micro.git",
      tag:      "v2.0.14",
      revision: "04c577049ca898f097cd6a2dae69af0b4d4493e1"
  license "MIT"
  head "https://github.com/zyedidia/micro.git", branch: "master"

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
