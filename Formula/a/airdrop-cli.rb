class AirdropCli < Formula
  desc "macOS CLI for AirDrop written in Swift"
  homepage "https://github.com/vldmrkl/airdrop-cli"
  url "https://github.com/vldmrkl/airdrop-cli/archive/refs/tags/1.0.1.tar.gz"
  sha256 "2e93796692fddb13e362bfd9c204bfc2f24ef22fadaf09efe97201d0bc9b54c3"
  license "MIT"
  head "https://github.com/vldmrkl/airdrop-cli.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/fnstruct/tap"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c7f79992ab498ad60c332be287ef8bd5e965b7fdabaaa9eca101dfa86884d851"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c8aaab940b64c3137b2cc80aa442563a6735fe6704b4fc50d0d8b697ea95fd84"
    sha256 cellar: :any_skip_relocation, ventura:       "c7cef4653415c607d0dfb4efeb906f4df151796ee0312ccad3733219fe1b28ba"
  end

  depends_on xcode: :build
  depends_on :macos

  patch do
    url "https://github.com/vldmrkl/airdrop-cli/commit/ee098ee129ee1127972bc6792be247fe1312b121.patch?full_index=1"
    sha256 "57941cbb767ce501b784ee093a83510a332543e2946eee10249daaf925b4ab5e"
  end

  def install
    system "make", "build"
    bin.install ".build/release/airdrop"
  end

  test do
    system "#{bin}/airdrop", "-h"
  end
end
