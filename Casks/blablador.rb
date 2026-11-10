cask "blablador" do
  version "3.6.2"
  sha256 "e0b325401e3cbf4105444fe6dc784fe93d3bc8f40719b2e9476187af2d8c63a9"

  url "https://github.com/surak/blablador-ios/releases/download/v#{version}/Blablador-#{version}-macOS.zip"
  name "Blablador"
  desc "Chat client for the Helmholtz Blablador LLM service"
  homepage "https://github.com/surak/blablador-ios"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Blablador.app"
  binary "#{appdir}/Blablador.app/Contents/Resources/bla"

  # The app is not notarized yet; without this, Gatekeeper blocks the first launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Blablador.app"]
  end

  zap trash: [
    "~/Library/Application Support/de.fz-juelich.blablador",
    "~/Library/Preferences/de.fz-juelich.blablador.plist",
  ]
end
