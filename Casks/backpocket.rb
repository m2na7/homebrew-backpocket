cask "backpocket" do
  version "0.1.2"
  sha256 "2100ce9070efc99ec1800b03e70b1ff0c3bdce7d703a5e56f29e7098b0a08caa"

  url "https://github.com/m2na7/Backpocket/releases/download/v#{version}/Backpocket.zip",
      verified: "github.com/m2na7/Backpocket/"
  name "Backpocket"
  desc "Clipboard history and quick notes, merged into a single keystroke"
  homepage "https://github.com/m2na7/Backpocket"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself through Sparkle. Without this Homebrew treats a
  # self-updated app as drifted and fights it on the next upgrade.
  auto_updates true

  # A bare symbol already means "this version or newer"; the string form is
  # deprecated and prints a warning on every `brew` command that reads this.
  depends_on macos: :sonoma

  app "Backpocket.app"

  uninstall quit: "dev.m2na.backpocket"

  zap trash: [
    "~/Library/Application Support/Backpocket",
    "~/Library/Caches/dev.m2na.backpocket",
    "~/Library/Preferences/dev.m2na.backpocket.plist",
  ]
end
