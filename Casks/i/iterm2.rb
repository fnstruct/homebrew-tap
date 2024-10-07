cask "iterm2" do
  version "3.4.18"
  sha256 "76727347acb1f2856f9b6702c6ba486594da87f857afec3ee4cba48f7cac219c"

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
