cask "luma" do
  version "0.3.0"

  arch arm: "arm64"

  url "https://github.com/mikkelrask/luma-app/releases/download/v#{version}/luma-darwin-#{arch}.zip"
  sha256 arm: "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  name "luma"
  desc "DIT asset pipeline desktop app"
  homepage "https://github.com/mikkelrask/luma-app"

  app "luma.app"

  caveats <<~EOS
    Luma is distributed unsigned, so a copy you download yourself can be
    blocked by Gatekeeper on first launch. Homebrew strips the quarantine
    attribute on install, but for direct downloads run:

      xattr -cr /Applications/luma.app
  EOS

  zap trash: "~/Library/Application Support/com.lumafilm.luma"
end