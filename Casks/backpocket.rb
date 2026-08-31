cask "backpocket" do
  version "0.1.0"
  sha256 "c70e484ceef2922f62d8d7b06f37fb0a692860592fad1ad2478aec40d9fcb840"

  url "https://github.com/m2na7/backpocket/releases/download/v#{version}/Backpocket.zip",
      verified: "github.com/m2na7/backpocket/"
  name "Backpocket"
  desc "Clipboard history and quick notes, merged into a single keystroke"
  homepage "https://github.com/m2na7/backpocket"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through Sparkle. Without this Homebrew treats a
  # self-updated app as drifted and fights it on the next upgrade.
  auto_updates true

  depends_on macos: ">= :sonoma"

  app "Backpocket.app"

  uninstall quit: "dev.m2na.backpocket"

  zap trash: [
    "~/Library/Application Support/Backpocket",
    "~/Library/Caches/dev.m2na.backpocket",
    "~/Library/Preferences/dev.m2na.backpocket.plist",
  ]
end
