cask "luma" do
  version "0.3.0"

  arch arm: "arm64"

  url "https://github.com/mikkelrask/luma-app/releases/download/v#{version}/luma-darwin-#{arch}.zip"
  sha256 arm: "d93b55be957ad85ce3c78381ad4d207cc17cc072a1a24615631186ea55773519"

  name "luma"
  desc "DIT asset pipeline desktop app"
  homepage "https://github.com/mikkelrask/luma-app"

  app "luma.app"

  caveats <<~EOS
    Luma is distributed unsigned. Homebrew installs are normally clean, but if
    macOS reports that the app is damaged (the quarantine flag), clear it once:

      xattr -cr /Applications/luma.app
  EOS

  zap trash: "~/Library/Application Support/com.lumafilm.luma"
end