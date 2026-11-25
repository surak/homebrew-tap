cask "blablador" do
  version "3.13.1"
  sha256 "d72df77ffc9961f1a4dea4cf67c10babb4521832198c8b28af67d7f9a02c95f6"

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
