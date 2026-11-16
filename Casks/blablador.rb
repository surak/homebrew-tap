cask "blablador" do
  version "3.12.7"
  sha256 "0f9f4a521367962a8a8c8c37c11993913c3b7400a5bf9f2f69cdb265fd50afb3"

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
