cask "iterm2" do
  version "3.4.23"
  sha256 "82ee82369d14d452c2d3c8886d460e2466e46dc517eb3d96b2b04c97b0c23d49"

  url "https://iterm2.com/downloads/stable/iTerm2-#{version.dots_to_underscores}.zip"
  name "iTerm2"
  desc "Alternative terminal emulator to Apple's Terminal app"
  homepage "https://iterm2.com"

  conflicts_with cask: [
    "iterm2@beta",
    "iterm2@nightly",
  ]

  depends_on macos: ">= :catalina"

  app "iTerm.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.googlecode.iterm2.sfl*",
    "~/Library/Application Support/iTerm",
    "~/Library/Application Support/iTerm2",
    "~/Library/Caches/com.googlecode.iterm2",
    "~/Library/Cookies/com.googlecode.iterm2.binarycookies",
    "~/Library/Preferences/com.googlecode.iterm2.plist",
    "~/Library/Saved Application State/com.googlecode.iterm2.savedState",
  ]
end
