cask "clauge" do
  version "0.8.2"
  sha256 "211af54158cdd61fb759034e92e9a0a37c3023e7fdae6cb95062eb37164d7822"

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
