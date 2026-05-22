# clauding-lab/homebrew-tap

Homebrew tap for [Clauge](https://github.com/clauding-lab/clauge) — token analytics and subscription ROI for Claude Code + claude.ai.

## Install

```bash
brew install --cask clauding-lab/tap/clauge
```

## Upgrade

```bash
brew upgrade --cask clauge
```

## Uninstall

```bash
brew uninstall --cask clauge
```

To remove all user data + cache + preferences as well:

```bash
brew uninstall --zap --cask clauge
```

## What's in this tap

- **`clauge`** — the macOS menu-bar app (Universal DMG, signed updater payload via Tauri's keypair). Auto-updates on launch when a new version is published; Homebrew is the install vector, not the update channel.

## How releases get into this tap

The cask version + SHA256 are updated automatically by `.github/workflows/auto-update.yml` whenever a new `v*` tag is released in [clauding-lab/clauge](https://github.com/clauding-lab/clauge). The workflow downloads the new DMG, computes its SHA256, edits `Casks/clauge.rb`, and pushes a commit directly to `main`.

## License

MIT — same as Clauge itself.
