# The standalone Clauge CLI (`clauge config …`, `clauge status` — the Claude
# Code statusline widget), WITHOUT the menu-bar app. Exists for Mac App Store
# users: the MAS sandbox blocks terminal execution of the app's bundled CLI
# (com.apple.security.inherit needs a sandboxed parent), so this formula
# extracts the self-contained unsandboxed sidecar binary from the release's
# updater tarball and puts it on PATH. DMG/cask users don't need this — the
# `clauge` cask already links the bundled wrapper.
#
# auto-update.yml bumps the version/sha256/url lines below on every stable
# release, exactly like it bumps Casks/clauge.rb — keep those three lines
# sed-friendly (one value per line, double quotes).
class ClaugeCli < Formula
  desc "Standalone Clauge CLI and Claude Code statusline widget"
  homepage "https://github.com/clauding-lab/clauge"
  url "https://github.com/clauding-lab/clauge/releases/download/v1.3.6/Clauge_universal.app.tar.gz"
  version "1.3.6"
  sha256 "78c59b5f65793df256d8a60ec44b136a729f8efab3a819735d47b0f0c64bb90b"
  license "MIT"

  depends_on :macos

  conflicts_with cask: "clauge", because: "the clauge cask already links the app's bundled CLI as `clauge`"

  def install
    # The tarball is the auto-updater payload: Clauge.app with the universal
    # SEA sidecar at Contents/MacOS/clauge-server. That binary IS the CLI
    # (any argv routes through the dispatcher; bare invocation would start
    # the server, which is why we install the binary, not the app).
    bin.install "Contents/MacOS/clauge-server" => "clauge"
  end

  test do
    # Works from 1.3.5 (clauge#70 fixed --version under the SEA layout;
    # verified on the published 1.3.5 DMG). Pins version-string plumbing,
    # which --help alone never exercised.
    assert_match version.to_s, shell_output("#{bin}/clauge --version")
    assert_match "usage: clauge", shell_output("#{bin}/clauge --help")
  end
end
