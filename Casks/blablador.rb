cask "blablador" do
  version "3.12.11"
  sha256 "fcc38764bbffcd26aae114b86ff5c1e8a8e3b869196e0c54552ef868221712c2"

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
