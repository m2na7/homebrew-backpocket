cask "backpocket" do
  version "0.1.1"
  sha256 "14af6f32a48134a414e6142ed557b7cbb601f5919977a77b32d19e6b31b5ea97"

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
