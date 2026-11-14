cask "blablador" do
  version "3.9.0"
  sha256 "4629f07869907b1043c598edd13c54559bddda7c3dc39e9d16708d208fbf5b94"

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
