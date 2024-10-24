class AirdropCli < Formula
  desc "macOS CLI for AirDrop written in Swift"
  homepage "https://github.com/vldmrkl/airdrop-cli"
  url "https://github.com/vldmrkl/airdrop-cli/archive/refs/tags/1.0.1.tar.gz"
  sha256 "2e93796692fddb13e362bfd9c204bfc2f24ef22fadaf09efe97201d0bc9b54c3"
  license "MIT"
  head "https://github.com/vldmrkl/airdrop-cli.git", branch: "main"

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
