cask "unlock" do
  version "1.15.0"
  sha256 "de502200b01df7d161febae7a531de10543eb0a7e8a23eff1f6d6d7822554226"

  url "https://github.com/bifrost-proxy/BLEUnlock/releases/download/v#{version}/BLEUnlock-v#{version}.dmg"
  name "BLEUnlock"
  desc "Lock and unlock a computer by proximity of a Bluetooth Low Energy device"
  homepage "https://github.com/bifrost-proxy/BLEUnlock"

  depends_on macos: ">= :high_sierra"

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
