cask "unlock" do
  version "1.15.1"
  sha256 "e4ba9554205f73603d78e834e72722b079c65e8c15133f24346a62232037ce59"

  url "https://github.com/bifrost-proxy/BLEUnlock/releases/download/v#{version}/BLEUnlock-v#{version}.dmg"
  name "BLEUnlock"
  desc "Lock and unlock a computer by proximity of a Bluetooth Low Energy device"
  homepage "https://github.com/bifrost-proxy/BLEUnlock"

  app "BLEUnlock.app"

            # The release is SHA-256 verified and ad-hoc signed.
            postflight do
              system_command "/usr/bin/xattr",
                             args: ["-dr", "com.apple.quarantine", "#{appdir}/BLEUnlock.app"]
            end


  zap trash: [
    "~/Library/Application Scripts/com.bifrost-proxy.BLEUnlock",
    "~/Library/Application Scripts/com.github.Skyearn.BLEUnlock",
    "~/Library/Preferences/com.bifrost-proxy.BLEUnlock.plist",
    "~/Library/Preferences/com.github.Skyearn.BLEUnlock.plist",
  ]
end
