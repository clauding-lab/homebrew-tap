cask "clauge" do
  version "0.9.7"
  sha256 "e7eff9065f8b43c2990eff114bbc57980a928a30c1f28d00ab3dc14fd59444f2"

  url "https://github.com/clauding-lab/clauge/releases/download/v#{version}/Clauge_#{version}_universal.dmg"
  name "Clauge"
  desc "Token analytics and subscription ROI for Claude Code + claude.ai"
  homepage "https://github.com/clauding-lab/clauge"

  depends_on macos: ">= :monterey"

  app "Clauge.app"

  zap trash: [
    "~/Library/Application Support/Clauge",
    "~/Library/Caches/Clauge",
    "~/Library/Logs/Clauge",
    "~/Library/Preferences/com.clauding.clauge.plist",
    "~/Library/Saved Application State/com.clauding.clauge.savedState",
    "~/Library/WebKit/com.clauding.clauge",
  ]
end
