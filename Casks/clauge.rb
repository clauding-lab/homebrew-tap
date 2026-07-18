cask "clauge" do
  version "1.3.5"
  sha256 "32b2b14f241e92457991313464b38807223185c41b9090c8b1ff0b50f7b51b01"

  url "https://github.com/clauding-lab/clauge/releases/download/v#{version}/Clauge_#{version}_universal.dmg"
  name "Clauge"
  desc "Token analytics and subscription ROI for Claude Code + claude.ai"
  homepage "https://github.com/clauding-lab/clauge"

  depends_on macos: ">= :monterey"

  app "Clauge.app"
  # The bundled CLI wrapper (working from v1.3.4 — earlier builds shipped it
  # broken; clauge PR #66). Tauri nests the resources dir, hence the double
  # Resources. The wrapper canonicalizes the symlink Homebrew creates here.
  binary "#{appdir}/Clauge.app/Contents/Resources/Resources/clauge-cli", target: "clauge"

  zap trash: [
    "~/Library/Application Support/Clauge",
    "~/Library/Caches/Clauge",
    "~/Library/Logs/Clauge",
    "~/Library/Preferences/com.clauding.clauge.plist",
    "~/Library/Saved Application State/com.clauding.clauge.savedState",
    "~/Library/WebKit/com.clauding.clauge",
  ]
end
