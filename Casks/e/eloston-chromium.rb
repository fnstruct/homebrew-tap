cask "eloston-chromium" do
  arch arm: "arm64", intel: "x86-64"

  version "124.0.6367.207-1.1"
  sha256 arm:   "d20849984c3688fb5b83c3ef10d35d1bbb35a51201da964309f9f2b9cb2e866b",
         intel: "c965a96a91886cb9eaa8262a7d9408476cf423a7aa555cba2f3e8938eec0ec33"

  url "https://github.com/ungoogled-software/ungoogled-chromium-macos/releases/download/#{version}/ungoogled-chromium_#{version}_#{arch}-macos.dmg",
      verified: "github.com/ungoogled-software/ungoogled-chromium-macos/"
  name "Ungoogled Chromium"
  desc "Google Chromium, sans intergration with Google"
  homepage "https://ungoogled-software.github.io/"

  conflicts_with cask: [
    "chromium",
    "freesmug-chromium",
  ]
  depends_on macos: ">= :monterey"

  app "Chromium.app"

  zap trash: [
    "~/Library/Application Support/Chromium",
    "~/Library/Cache/Chromium",
    "~/Library/Preferences/org.chromium.Chromium.plist",
    "~/Library/Saved Application State/org.chromium.Chromium.savedState",
  ]
end
