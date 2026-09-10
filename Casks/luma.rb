cask "luma" do
  version "0.3.0"

  arch arm: "arm64"

  url "https://github.com/mikkelrask/luma-app/releases/download/v#{version}/luma-darwin-#{arch}.zip"
  sha256 arm: "d93b55be957ad85ce3c78381ad4d207cc17cc072a1a24615631186ea55773519"

  name "luma"
  desc "DIT asset pipeline desktop app"
  homepage "https://github.com/mikkelrask/luma-app"

  app "luma.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/luma.app"]
  end

  caveats <<~EOS
    Luma is distributed unsigned, so macOS may flag it as "damaged" if the
    quarantine attribute is still present when you first launch it. Homebrew
    strips this on install; if you ever double-click a freshly downloaded
    copy and get the warning, clear the flag with:

      xattr -cr /Applications/luma.app
  EOS

  zap trash: "~/Library/Application Support/com.lumafilm.luma"
end